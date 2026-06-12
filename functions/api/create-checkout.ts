interface Env {
  CREEM_API_KEY: string
  CREEM_WEBHOOK_SECRET: string
  FRONTEND_URL: string
}

// Plan map: Creem Product ID -> plan config
const PLAN_MAP: Record<string, { plan_id: string; interval: string; type: string }> = {
  'prod_6Ty5aiWQZ2TRXS8b1dvHVu': { plan_id: 'pro', interval: 'month', type: 'user' },
  'prod_3rh3lkbGWGWvgF8IqAOdDU': { plan_id: 'pro', interval: 'year', type: 'user' },
}

export async function onRequest(context: { request: Request; env: Env }) {
  const { request, env } = context

  if (request.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  const CREEM_API_KEY = env.CREEM_API_KEY?.trim()
  const CREEM_BASE_URL = 'https://api.creem.io/v1'

  try {
    const body = await request.json()
    const { productId, userId, email, successUrl, cancelUrl } = body

    if (!productId || !userId) {
      return new Response(JSON.stringify({ error: 'Missing required parameters: productId, userId' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const planInfo = PLAN_MAP[productId]
    if (!planInfo) {
      return new Response(JSON.stringify({ error: 'Invalid productId' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const frontendUrl = env.FRONTEND_URL || 'https://valve.mytoolshub.cc.cd'

    const checkoutResponse = await fetch(`${CREEM_BASE_URL}/checkouts`, {
      method: 'POST',
      headers: {
        'x-api-key': CREEM_API_KEY,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        product_id: productId,
        success_url: successUrl || `${frontendUrl}/dashboard`,
        cancel_url: cancelUrl || `${frontendUrl}/pricing`,
        customer: email ? { email } : undefined,
        metadata: {
          userId,
          planId: planInfo.plan_id,
          planType: planInfo.type,
        },
      }),
    })

    if (!checkoutResponse.ok) {
      const err = await checkoutResponse.json()
      return new Response(JSON.stringify({ error: err.message || 'Checkout creation failed' }), {
        status: checkoutResponse.status,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const checkout = await checkoutResponse.json()

    return new Response(JSON.stringify({
      checkoutId: checkout.id,
      url: checkout.checkout_url,
      sessionId: checkout.id,
    }), {
      headers: { 'Content-Type': 'application/json' },
    })
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }
}