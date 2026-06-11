interface Env {
  SUPABASE_URL: string
  SUPABASE_SERVICE_KEY: string
}

export async function onRequest(context: { request: Request; env: Env }) {
  const { env } = context
  const supabaseUrl = env.SUPABASE_URL?.trim()
  const supabaseKey = env.SUPABASE_SERVICE_KEY?.trim()

  const headers: Record<string, string> = {
    'apikey': supabaseKey,
    'Authorization': `Bearer ${supabaseKey}`,
  }

  try {
    const [brandsRes, typesRes] = await Promise.all([
      fetch(`${supabaseUrl}/rest/v1/brands?select=id,name,country&order=name`, { headers }),
      fetch(`${supabaseUrl}/rest/v1/valve_types?select=id,name,type_key&order=name`, { headers }),
    ])

    const brands = brandsRes.ok ? await brandsRes.json() : []
    const valveTypes = typesRes.ok ? await typesRes.json() : []

    return new Response(JSON.stringify({ brands, valveTypes }), {
      headers: { 'Content-Type': 'application/json' },
    })
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }
}