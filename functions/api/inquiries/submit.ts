interface Env {
  SUPABASE_URL: string
  SUPABASE_SERVICE_KEY: string
  RESEND_API_KEY: string
}

function escapeHtml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
}

async function verifyJWT(token: string, env: Env): Promise<{ valid: boolean; userId?: string }> {
  try {
    const supabaseUrl = env.SUPABASE_URL?.trim()
    const supabaseKey = env.SUPABASE_SERVICE_KEY?.trim()

    const res = await fetch(`${supabaseUrl}/auth/v1/user`, {
      headers: {
        'apikey': supabaseKey,
        'Authorization': `Bearer ${token}`,
      },
    })

    if (!res.ok) return { valid: false }

    const user = await res.json()
    return { valid: true, userId: user.id }
  } catch {
    return { valid: false }
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

  // Bearer token authentication (optional: allow unauthenticated submissions)
  const authHeader = request.headers.get('Authorization') || ''
  let authenticatedUserId: string | null = null

  if (authHeader.startsWith('Bearer ')) {
    const token = authHeader.slice(7)
    const result = await verifyJWT(token, env)
    if (result.valid) {
      authenticatedUserId = result.userId || null
    }
  }

  try {
    const body = await request.json()
    const {
      valve_spec_id,
      brand_id,
      brandName,
      valveModel,
      valveType,
      buyer_name,
      buyer_email,
      buyer_company,
      buyer_phone,
      buyer_country,
      quantity,
      unit,
      required_by,
      target_price,
      inquiry_message,
      technical_requirements,
    } = body

    if (!buyer_name || !buyer_email) {
      return new Response(JSON.stringify({ error: 'Name and email are required' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const supabaseUrl = env.SUPABASE_URL?.trim()
    const supabaseKey = env.SUPABASE_SERVICE_KEY?.trim()

    const response = await fetch(`${supabaseUrl}/rest/v1/valve_inquiries`, {
      method: 'POST',
      headers: {
        'apikey': supabaseKey,
        'Authorization': `Bearer ${supabaseKey}`,
        'Content-Type': 'application/json',
        'Prefer': 'return=representation',
      },
      body: JSON.stringify({
        valve_spec_id,
        brand_id,
        buyer_name,
        buyer_email,
        buyer_company,
        buyer_phone,
        buyer_country,
        quantity,
        unit,
        required_by,
        target_price,
        inquiry_message,
        technical_requirements,
        status: 'new',
        is_public: false,
        user_id: authenticatedUserId || null,
      }),
    })

    if (!response.ok) {
      const err = await response.text()
      return new Response(JSON.stringify({ error: err }), {
        status: response.status,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const data = await response.json()

    try {
      const { buyer_name, buyer_email, buyer_company, buyer_phone, buyer_country, inquiry_message, technical_requirements, brandName, valveModel, valveType } = body

      await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${env.RESEND_API_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          from: 'ValveSpecs Pro <noreply@tradesxchange.com>',
          to: ['nnzw@qq.com'],
          subject: `New Inquiry: ${escapeHtml(brandName || 'Unknown Brand')} - ${escapeHtml(valveType || 'N/A')}`,
          html: `
            <h2>New Valve Inquiry Received</h2>
            <table cellpadding="6" cellspacing="0" style="border-collapse:collapse;font-family:sans-serif;">
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Buyer Name</td><td style="border:1px solid #ddd;">${escapeHtml(buyer_name)}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Email</td><td style="border:1px solid #ddd;">${escapeHtml(buyer_email)}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Company</td><td style="border:1px solid #ddd;">${escapeHtml(buyer_company || '-')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Phone</td><td style="border:1px solid #ddd;">${escapeHtml(buyer_phone || '-')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Country</td><td style="border:1px solid #ddd;">${escapeHtml(buyer_country || '-')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Brand</td><td style="border:1px solid #ddd;">${escapeHtml(brandName || '-')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Model</td><td style="border:1px solid #ddd;">${escapeHtml(valveModel || 'N/A')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Type</td><td style="border:1px solid #ddd;">${escapeHtml(valveType || 'N/A')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Quantity</td><td style="border:1px solid #ddd;">${escapeHtml(body.quantity || 'N/A')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Target Price</td><td style="border:1px solid #ddd;">${escapeHtml(body.target_price || 'N/A')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Message</td><td style="border:1px solid #ddd;">${escapeHtml(inquiry_message || '-')}</td></tr>
              <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Technical Requirements</td><td style="border:1px solid #ddd;">${escapeHtml(technical_requirements || '-')}</td></tr>
            </table>
          `,
        }),
      }).catch(err => {
        console.error('Failed to send email notification:', err)
      })
    } catch (e) {
      console.error('Email preparation error:', e)
    }

    return new Response(JSON.stringify({ success: true, inquiry_id: data[0]?.id }), {
      status: 201,
      headers: { 'Content-Type': 'application/json' },
    })
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }
}
