interface Env {
  SUPABASE_URL: string
  SUPABASE_SERVICE_KEY: string
  CREEM_WEBHOOK_SECRET: string
}

const PRODUCT_INTERVAL_MAP: Record<string, string> = {
  'prod_6Ty5aiWQZ2TRXS8b1dvHVu': 'month',
  'prod_3rh3lkbGWGWvgF8IqAOdDU': 'year',
}

async function verifyWebhookSignature(
  payload: string,
  signature: string | null,
  secret: string
): Promise<boolean> {
  if (!signature || !secret) return false

  try {
    // Use Web Crypto API for HMAC-SHA256
    const encoder = new TextEncoder()
    const keyData = encoder.encode(secret)
    const data = encoder.encode(payload)

    const key = await crypto.subtle.importKey(
      'raw',
      keyData,
      { name: 'HMAC', hash: 'SHA-256' },
      false,
      ['sign']
    )

    const signatureBuffer = await crypto.subtle.sign('HMAC', key, data)
    const computedSignature = Array.from(new Uint8Array(signatureBuffer))
      .map(b => b.toString(16).padStart(2, '0'))
      .join('')

    return computedSignature === signature
  } catch {
    return false
  }
}

export async function onRequest(context: { request: Request; env: Env }) {
  const { request, env } = context

  if (request.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  const CREEM_WEBHOOK_SECRET = env.CREEM_WEBHOOK_SECRET?.trim()
  const supabaseUrl = env.SUPABASE_URL?.trim()
  const supabaseKey = env.SUPABASE_SERVICE_KEY?.trim()

  const headers: Record<string, string> = {
    'apikey': supabaseKey,
    'Authorization': `Bearer ${supabaseKey}`,
    'Content-Type': 'application/json',
  }

  try {
    const rawBody = await request.text()
    const sig = request.headers.get('creem-signature')

    // Verify webhook signature
    if (CREEM_WEBHOOK_SECRET) {
      const isValid = await verifyWebhookSignature(rawBody, sig, CREEM_WEBHOOK_SECRET)
      if (!isValid) {
        console.error('Webhook signature verification failed')
        return new Response(JSON.stringify({ error: 'Invalid signature' }), {
          status: 401,
          headers: { 'Content-Type': 'application/json' },
        })
      }
    }

    const event = JSON.parse(rawBody)
    const eventType = event.type || event.eventType
    const eventData = event.data || event.object || {}
    console.log(`Received Creem event: ${eventType}`)

    // Log event for debugging
    try {
      await fetch(`${supabaseUrl}/rest/v1/webhook_logs`, {
        method: 'POST',
        headers: {
          'apikey': supabaseKey,
          'Authorization': `Bearer ${supabaseKey}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          event_type: eventType,
          payload: JSON.stringify(eventData).substring(0, 2000),
        }),
      })
    } catch {}

    switch (eventType) {
      case 'checkout.completed': {
        const checkout = eventData
        const order = checkout.order || checkout
        const customerEmail = checkout.customer_email || checkout.email || order.customer_email
        const subscriptionId = checkout.subscription_id || order.subscription_id
        const productId = checkout.product_id || order.product
        const billingInterval = PRODUCT_INTERVAL_MAP[productId] || 'month'
        const customerId = checkout.customer_id || order.customer

        let userId: string | null = null
        if (checkout.id) {
          const pendingRes = await fetch(
            `${supabaseUrl}/rest/v1/pending_checkouts?checkout_id=eq.${checkout.id}&select=user_id&limit=1`,
            { headers }
          )
          if (pendingRes.ok) {
            const pending = await pendingRes.json()
            if (pending.length > 0) {
              userId = pending[0].user_id
            }
          }
        }

        if (!userId && customerEmail) {
          const adminRes = await fetch(
            `${supabaseUrl}/auth/v1/admin/users`,
            { headers: { 'apikey': supabaseKey, 'Authorization': `Bearer ${supabaseKey}` } }
          )
          if (adminRes.ok) {
            const data = await adminRes.json()
            const users = data.users || []
            const found = users.find((u: any) => u.email === customerEmail)
            if (found) {
              userId = found.id
            }
          }
        }

        if (userId) {
          console.log(`Found userId: ${userId} for checkout: ${checkout.id}`)
          const now = new Date()
          const renewDate = billingInterval === 'year'
            ? new Date(now.getTime() + 365 * 86400000)
            : new Date(now.getTime() + 30 * 86400000)

          await fetch(`${supabaseUrl}/rest/v1/user_subscriptions`, {
            method: 'POST',
            headers: {
              ...headers,
              'Prefer': 'resolution=merge-duplicates',
            },
            body: JSON.stringify({
              user_id: userId,
              plan_id: 'pro',
              status: 'active',
              billing_interval: billingInterval,
              creem_customer_id: customerId,
              creem_checkout_id: checkout.id,
              creem_subscription_id: subscriptionId,
              started_at: now.toISOString(),
              renews_at: renewDate.toISOString(),
              updated_at: now.toISOString(),
            }),
          })
          console.log(`User ${userId} (${customerEmail}) subscribed to pro (${billingInterval})`)
        } else {
          console.error(`Could not find userId. checkout_id: ${checkout.id}, email: ${customerEmail}`)
        }
        break
      }

      case 'subscription.active': {
        const sub = eventData
        const existingRes = await fetch(
          `${supabaseUrl}/rest/v1/user_subscriptions?creem_subscription_id=eq.${sub.id}&select=billing_interval,started_at`,
          { headers }
        )
        let renewDate = new Date()
        if (existingRes.ok) {
          const existing = await existingRes.json()
          if (existing.length > 0) {
            const { billing_interval, started_at } = existing[0]
            const base = new Date(started_at)
            renewDate = billing_interval === 'year'
              ? new Date(base.getTime() + 365 * 86400000)
              : new Date(base.getTime() + 30 * 86400000)
          }
        }

        await fetch(`${supabaseUrl}/rest/v1/user_subscriptions?creem_subscription_id=eq.${sub.id}`, {
          method: 'PATCH',
          headers,
          body: JSON.stringify({
            status: 'active',
            renews_at: renewDate.toISOString(),
          }),
        })
        console.log(`Subscription ${sub.id} activated`)
        break
      }

      case 'subscription.paid': {
        const sub = eventData
        console.log(`Subscription ${sub.id} payment succeeded`)
        break
      }

      case 'subscription.canceled': {
        const sub = eventData
        await fetch(`${supabaseUrl}/rest/v1/user_subscriptions?creem_subscription_id=eq.${sub.id}`, {
          method: 'PATCH',
          headers,
          body: JSON.stringify({
            status: 'canceled',
            canceled_at: new Date().toISOString(),
          }),
        })
        console.log(`Subscription ${sub.id} canceled`)
        break
      }

      case 'subscription.past_due': {
        const sub = eventData
        await fetch(`${supabaseUrl}/rest/v1/user_subscriptions?creem_subscription_id=eq.${sub.id}`, {
          method: 'PATCH',
          headers,
          body: JSON.stringify({ status: 'past_due' }),
        })
        console.log(`Subscription ${sub.id} payment failed (past due)`)
        break
      }

      case 'refund.created': {
        const refund = eventData
        console.log(`Refund created: ${refund.id}`)
        break
      }

      default:
        console.log(`Unhandled event type: ${eventType}`)
    }

    return new Response(JSON.stringify({ received: true }), {
      headers: { 'Content-Type': 'application/json' },
    })
  } catch (err: any) {
    console.error('Webhook processing failed:', err.message)
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }
}