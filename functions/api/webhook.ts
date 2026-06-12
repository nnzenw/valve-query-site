interface Env {
  SUPABASE_URL: string
  SUPABASE_SERVICE_KEY: string
  CREEM_WEBHOOK_SECRET: string
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
    console.log(`Received Creem event: ${event.type}`)

    switch (event.type) {
      case 'checkout.completed': {
        const checkout = event.data
        const customerEmail = checkout.customer_email || checkout.email
        const subscriptionId = checkout.subscription_id

        let userId: string | null = null
        if (customerEmail) {
          const userRes = await fetch(
            `${supabaseUrl}/auth/v1/admin/users?email=${encodeURIComponent(customerEmail)}`,
            { headers: { ...headers, 'Authorization': `Bearer ${supabaseKey}` } }
          )
          if (userRes.ok) {
            const users = await userRes.json()
            if (users.length > 0) {
              userId = users[0].id
            }
          }
        }

        if (userId) {
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
              creem_customer_id: checkout.customer_id,
              creem_checkout_id: checkout.id,
              creem_subscription_id: subscriptionId,
              started_at: new Date().toISOString(),
              updated_at: new Date().toISOString(),
            }),
          })
          console.log(`User ${userId} (${customerEmail}) subscribed to pro`)
        } else {
          console.error(`Could not find user for email: ${customerEmail}`)
        }
        break
      }

      case 'subscription.active': {
        const sub = event.data
        await fetch(`${supabaseUrl}/rest/v1/user_subscriptions?creem_subscription_id=eq.${sub.id}`, {
          method: 'PATCH',
          headers,
          body: JSON.stringify({
            status: 'active',
            creem_subscription_id: sub.id,
            renews_at: new Date(sub.current_period_end * 1000).toISOString(),
          }),
        })
        console.log(`Subscription ${sub.id} activated`)
        break
      }

      case 'subscription.paid': {
        const sub = event.data
        console.log(`Subscription ${sub.id} payment succeeded`)
        break
      }

      case 'subscription.canceled': {
        const sub = event.data
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
        const sub = event.data
        await fetch(`${supabaseUrl}/rest/v1/user_subscriptions?creem_subscription_id=eq.${sub.id}`, {
          method: 'PATCH',
          headers,
          body: JSON.stringify({ status: 'past_due' }),
        })
        console.log(`Subscription ${sub.id} payment failed (past due)`)
        break
      }

      case 'refund.created': {
        const refund = event.data
        console.log(`Refund created: ${refund.id}`)
        break
      }

      default:
        console.log(`Unhandled event type: ${event.type}`)
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