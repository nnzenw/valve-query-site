interface Env {
  SUPABASE_URL: string
  SUPABASE_SERVICE_KEY: string
}

export async function onRequest(context: { request: Request; env: Env; params: { id: string } }) {
  const { env, params } = context
  const valveId = params.id

  if (!valveId) {
    return new Response(JSON.stringify({ error: 'Valve ID is required' }), {
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
    const url = `${supabaseUrl}/rest/v1/valve_specs?id=eq.${valveId}&select=*,brands(name,country,website,description,established),valve_types(name,type_key,description,common_applications)&is_active=eq.true`
    const response = await fetch(url, { headers })

    if (!response.ok) {
      const errText = await response.text()
      return new Response(JSON.stringify({ error: errText }), {
        status: response.status,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const data = await response.json()

    if (!data || data.length === 0) {
      return new Response(JSON.stringify({ error: 'Valve not found' }), {
        status: 404,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    return new Response(JSON.stringify(data[0]), {
      headers: { 'Content-Type': 'application/json' },
    })
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }
}