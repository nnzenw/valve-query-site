interface Env {}

const ALLOWED_ORIGINS = [
  'https://valve.tradesxchange.com',
  'https://tradesxchange.com',
]

export async function onRequest(context: { request: Request; env: Env; next: () => Promise<Response> }) {
  const origin = context.request.headers.get('Origin') || ''

  // CORS preflight
  if (context.request.method === 'OPTIONS') {
    const allowedOrigin = ALLOWED_ORIGINS.includes(origin) ? origin : ALLOWED_ORIGINS[0]
    return new Response(null, {
      status: 204,
      headers: {
        'Access-Control-Allow-Origin': allowedOrigin,
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization, apikey',
        'Access-Control-Max-Age': '86400',
      },
    })
  }

  // Add CORS headers to all responses
  const response = await context.next()
  const newResponse = new Response(response.body, response)
  const allowedOrigin = ALLOWED_ORIGINS.includes(origin) ? origin : ALLOWED_ORIGINS[0]
  newResponse.headers.set('Access-Control-Allow-Origin', allowedOrigin)
  newResponse.headers.set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
  newResponse.headers.set('Access-Control-Allow-Headers', 'Content-Type, Authorization, apikey')

  return newResponse
}