interface Env {
  SUPABASE_URL: string
  SUPABASE_SERVICE_KEY: string
}

export async function onRequest(context: { request: Request; env: Env }) {
  const { request, env } = context
  const url = new URL(request.url)
  const params = url.searchParams

  const keyword = params.get('keyword') || ''
  const brand_id = params.get('brand_id') || ''
  const valve_type_id = params.get('valve_type_id') || ''
  const material = params.get('material') || ''
  const application = params.get('application') || ''
  const limit = parseInt(params.get('limit') || '20')
  const offset = parseInt(params.get('offset') || '0')

  const supabaseUrl = env.SUPABASE_URL
  const supabaseKey = env.SUPABASE_SERVICE_KEY

  const headers: Record<string, string> = {
    'apikey': supabaseKey,
    'Authorization': `Bearer ${supabaseKey}`,
    'Content-Type': 'application/json',
  }

  // Build query URL
  const baseUrl = `${supabaseUrl}/rest/v1/valve_specs`
  const queryParts: string[] = [
    'select=*,brands(id,name,country),valve_types(id,name,type_key)',
    'is_active=eq.true',
  ]

  if (brand_id) queryParts.push(`brand_id=eq.${brand_id}`)
  if (valve_type_id) queryParts.push(`valve_type_id=eq.${valve_type_id}`)
  if (material) queryParts.push(`body_material=ilike.*${encodeURIComponent(material)}*`)

  // keyword search via ilike on multiple fields
  if (keyword) {
    const kw = encodeURIComponent(keyword)
    queryParts.push(`or=(model.ilike.*${kw}*,body_material.ilike.*${kw}*,standard.ilike.*${kw}*,size_range.ilike.*${kw}*,end_connection.ilike.*${kw}*)`)
  }

  // application filter
  if (application) {
    queryParts.push(`applications=cs.{${encodeURIComponent(application)}}`)
  }

  // order and pagination
  queryParts.push('order=created_at.desc')
  queryParts.push(`limit=${limit}`)
  queryParts.push(`offset=${offset}`)

  // Also get count
  const countHeaders: Record<string, string> = {
    ...headers,
    'Prefer': 'count=exact',
  }

  const queryString = queryParts.join('&')
  const fullUrl = `${baseUrl}?${queryString}`

  try {
    const response = await fetch(fullUrl, { headers: countHeaders })

    if (!response.ok) {
      const errText = await response.text()
      return new Response(JSON.stringify({ error: errText }), {
        status: response.status,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const data = await response.json()
    // Get count from Content-Range header
    const contentRange = response.headers.get('content-range')
    let count = 0
    if (contentRange) {
      const match = contentRange.match(/\d+\/(\d+)/)
      if (match) count = parseInt(match[1])
    }

    // Post-filter for brand/type name keyword match (REST API limitation)
    let filteredData = data || []
    if (keyword) {
      const kw = keyword.toLowerCase()
      filteredData = data.filter((v: any) =>
        v.brands?.name?.toLowerCase().includes(kw) ||
        v.valve_types?.name?.toLowerCase().includes(kw)
      )
      count = filteredData.length
      filteredData = filteredData.slice(0, limit)
    }

    return new Response(JSON.stringify({
      data: filteredData,
      count: count || filteredData.length,
      pageTotal: filteredData.length,
      searchMode: 'ilike',
    }), {
      headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' },
    })
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' },
    })
  }
}