interface Env {
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

export async function onRequest(context: { request: Request; env: Env }) {
  const { request, env } = context

  if (request.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  try {
    const body = await request.json()
    const { name, email, subject, message, page_url } = body

    if (!name || !email || !message) {
      return new Response(JSON.stringify({ error: 'Name, email, and message are required' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    if (!emailRegex.test(email)) {
      return new Response(JSON.stringify({ error: 'Invalid email address' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      })
    }

    await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${env.RESEND_API_KEY}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: 'ValveSpecs Pro <noreply@tradesxchange.com>',
        to: ['nnzenw@126.com'],
        subject: `[Feedback] ${escapeHtml(subject || 'New Feedback from Website')}`,
        html: `
          <h2>New Website Feedback</h2>
          <table cellpadding="6" cellspacing="0" style="border-collapse:collapse;font-family:sans-serif;">
            <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Name</td><td style="border:1px solid #ddd;">${escapeHtml(name)}</td></tr>
            <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Email</td><td style="border:1px solid #ddd;">${escapeHtml(email)}</td></tr>
            <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Subject</td><td style="border:1px solid #ddd;">${escapeHtml(subject || 'N/A')}</td></tr>
            <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Page URL</td><td style="border:1px solid #ddd;">${escapeHtml(page_url || 'N/A')}</td></tr>
            <tr><td style="font-weight:bold;border:1px solid #ddd;background:#f5f5f5;">Message</td><td style="border:1px solid #ddd;">${escapeHtml(message)}</td></tr>
          </table>
          <p style="margin-top:20px;color:#666;font-size:12px;">This feedback was submitted from the ValveSpecs Pro website.</p>
        `,
      }),
    })

    return new Response(JSON.stringify({ success: true }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' },
    })
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }
}