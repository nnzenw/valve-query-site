interface Env {
  SUPABASE_URL: string
  SUPABASE_SERVICE_KEY: string
}

export async function onRequest(context: { request: Request; env: Env; params: { userId: string } }) {
  const { request, env, params } = context
  const userId = params.userId

  if (!userId) {
    return new Response(JSON.stringify({ error: 'User ID is required' }), {
      status: 400,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  const supabaseUrl = env.SUPABASE_URL?.trim()
  const supabaseKey = env.SUPABASE_SERVICE_KEY?.trim()

  if (!supabaseUrl || !supabaseKey) {
    return new Response(JSON.stringify({ error: 'Supabase configuration missing' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  const headers: Record<string, string> = {
    'apikey': supabaseKey,
    'Authorization': `Bearer ${supabaseKey}`,
  }

  try {
    const url = `${supabaseUrl}/rest/v1/user_subscriptions?user_id=eq.${userId}&status=eq.active&order=started_at.desc&limit=1`
    const response = await fetch(url, { headers })

    if (!response.ok) {
      const errText = await response.text()
      return new Response(JSON.stringify({ error: errText }), {
        status: response.status,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const data = await response.json()

    return new Response(JSON.stringify({
      subscription: data && data.length > 0 ? data[0] : null,
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