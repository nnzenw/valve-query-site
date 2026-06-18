import 'dotenv/config'
import express from 'express'
import axios from 'axios'
import { createClient } from '@supabase/supabase-js'
import cors from 'cors'
import crypto from 'crypto'

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_KEY)
const app = express()
const PORT = process.env.PORT || 3001

// Creem API config
const CREEM_API_KEY = process.env.CREEM_API_KEY || ''
const CREEM_WEBHOOK_SECRET = process.env.CREEM_WEBHOOK_SECRET || ''
const CREEM_BASE_URL = 'https://api.creem.io/v1'

// Middleware – CORS: tighten to specific frontend URL, never allow all (*)
const allowedOrigins = process.env.FRONTEND_URL
  ? process.env.FRONTEND_URL.split(',')
  : ['https://valve.tradesxchange.com']
app.use(cors({
  origin: (origin, callback) => {
    // Allow requests with no origin (same-site, curl, etc.) or explicit allowlist
    if (!origin || allowedOrigins.some(o => o === origin || o === '*')) {
      return callback(null, true)
    }
    return callback(new Error('CORS policy: origin not allowed'))
  },
  credentials: true
}))

// Security headers middleware
app.use((req, res, next) => {
  res.setHeader('X-Content-Type-Options', 'nosniff')
  res.setHeader('X-Frame-Options', 'DENY')
  res.setHeader('X-XSS-Protection', '1; mode=block')
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin')
  res.setHeader(
    'Content-Security-Policy',
    "default-src 'self'; script-src 'self' https://cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com; img-src 'self' data: https:; connect-src 'self' https://*.supabase.co"
  )
  res.setHeader('Permissions-Policy', 'camera=(), microphone=(), geolocation=()')
  next()
})
app.use(express.json())
app.use(express.raw({ type: 'application/json' }))

// ========================================
// Plan map: Creem Product ID -> plan config
// ========================================
const PLAN_MAP = {
  'prod_pro_monthly': { plan_id: 'pro', interval: 'month', type: 'user' },
  'prod_pro_yearly': { plan_id: 'pro', interval: 'year', type: 'user' },
  'prod_enterprise_monthly': { plan_id: 'enterprise', interval: 'month', type: 'user' },
  'prod_supplier_basic': { plan_id: 'supplier_basic', interval: 'year', type: 'supplier' },
  'prod_supplier_gold': { plan_id: 'supplier_gold', interval: 'year', type: 'supplier' },
  'prod_supplier_platinum': { plan_id: 'supplier_platinum', interval: 'year', type: 'supplier' },
}

// ========================================
// 1. Create Checkout (redirect to Creem payment page)
// ========================================
app.post('/api/create-checkout', async (req, res) => {
  try {
    const { productId, userId, email, successUrl, cancelUrl } = req.body

    if (!productId || !userId) {
      return res.status(400).json({ error: 'Missing required parameters: productId, userId' })
    }

    const planInfo = PLAN_MAP[productId]
    if (!planInfo) {
      return res.status(400).json({ error: 'Invalid productId' })
    }

    const checkoutResponse = await axios.post(
      `${CREEM_BASE_URL}/checkouts`,
      {
        product_id: productId,
        success_url: successUrl || `${process.env.FRONTEND_URL || 'http://localhost:3000'}/dashboard`,
        cancel_url: cancelUrl || `${process.env.FRONTEND_URL || 'http://localhost:3000'}/pricing`,
        customer: email ? { email } : undefined,
        metadata: {
          userId,
          planId: planInfo.plan_id,
          planType: planInfo.type
        },
      },
      {
        headers: {
          'x-api-key': CREEM_API_KEY,
          'Content-Type': 'application/json'
        }
      }
    )

    const checkout = checkoutResponse.data
    console.log(`Checkout created: ${checkout.id}`)

    res.json({
      checkoutId: checkout.id,
      url: checkout.checkout_url,
      sessionId: checkout.id
    })
  } catch (err) {
    console.error('Create checkout failed:', err.response?.data || err.message)
    res.status(500).json({
      error: err.response?.data?.message || err.message,
      trace_id: err.response?.data?.trace_id
    })
  }
})

// ========================================
// 2. Get Checkout status
// ========================================
app.get('/api/checkout/:checkoutId', async (req, res) => {
  try {
    const { checkoutId } = req.params
    const response = await axios.get(
      `${CREEM_BASE_URL}/checkouts/${checkoutId}`,
      { headers: { 'x-api-key': CREEM_API_KEY } }
    )
    res.json(response.data)
  } catch (err) {
    console.error('Get checkout failed:', err.message)
    res.status(500).json({ error: err.message })
  }
})

// ========================================
// 3. Webhook (subscription status change callback)
// ========================================
app.post('/api/webhook', async (req, res) => {
  const sig = req.headers['creem-signature']
  const payload = req.body

  try {
    // Verify webhook signature (HMAC-SHA256)
    const rawBody = typeof payload === 'string' ? payload : payload.toString()
    const computed = crypto
      .createHmac('sha256', CREEM_WEBHOOK_SECRET)
      .update(rawBody)
      .digest('hex')

    if (computed !== sig) {
      console.error('Webhook signature verification failed')
      return res.status(400).send('Webhook Error: Invalid signature')
    }

    const event = typeof rawBody === 'string' ? JSON.parse(rawBody) : rawBody
    console.log(`Received Creem event: ${event.type}`)

    switch (event.type) {
      case 'checkout.completed': {
        const checkout = event.data
        const userId = checkout.metadata?.userId
        const planId = checkout.metadata?.planId
        const customerId = checkout.customer_id
        const subscriptionId = checkout.subscription_id

        if (userId && planId) {
          await supabase.from('user_subscriptions').upsert({
            user_id: userId,
            plan_id: planId,
            status: 'active',
            creem_customer_id: customerId,
            creem_checkout_id: checkout.id,
            creem_subscription_id: subscriptionId,
            started_at: new Date().toISOString(),
            updated_at: new Date().toISOString()
          })
          console.log(`User ${userId} subscribed to ${planId}`)
        }
        break
      }

      case 'subscription.active': {
        const sub = event.data
        await supabase.from('user_subscriptions')
          .update({
            status: 'active',
            creem_subscription_id: sub.id,
            renews_at: new Date(sub.current_period_end * 1000).toISOString()
          })
          .eq('creem_subscription_id', sub.id)
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
        await supabase.from('user_subscriptions')
          .update({ status: 'canceled', canceled_at: new Date().toISOString() })
          .eq('creem_subscription_id', sub.id)
        console.log(`Subscription ${sub.id} canceled`)
        break
      }

      case 'subscription.past_due': {
        const sub = event.data
        await supabase.from('user_subscriptions')
          .update({ status: 'past_due' })
          .eq('creem_subscription_id', sub.id)
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

    res.json({ received: true })
  } catch (err) {
    console.error('Webhook processing failed:', err.message)
    res.status(500).json({ error: err.message })
  }
})

// ========================================
// 4. Buy leads (supplier one-time purchase via Creem)
// ========================================
app.post('/api/buy-leads', async (req, res) => {
  try {
    const { supplierId, quantity, amount, productId } = req.body

    if (!productId) {
      return res.status(400).json({ error: 'Missing productId' })
    }

    const checkoutResponse = await axios.post(
      `${CREEM_BASE_URL}/checkouts`,
      {
        product_id: productId,
        metadata: {
          supplierId,
          quantity,
          type: 'leads_purchase'
        },
      },
      {
        headers: {
          'x-api-key': CREEM_API_KEY,
          'Content-Type': 'application/json'
        }
      }
    )

    const checkout = checkoutResponse.data
    res.json({
      checkoutId: checkout.id,
      url: checkout.checkout_url
    })
  } catch (err) {
    console.error('Create purchase failed:', err.message)
    res.status(500).json({ error: err.message })
  }
})

// ========================================
// 5. Get user subscription status
// ========================================
app.get('/api/subscription/:userId', async (req, res) => {
  try {
    const { userId } = req.params
    const { data } = await supabase
      .from('user_subscriptions')
      .select('*')
      .eq('user_id', userId)
      .eq('status', 'active')
      .order('started_at', { ascending: false })
      .limit(1)
      .single()

    res.json({ subscription: data || null })
  } catch (err) {
    res.status(500).json({ error: err.message })
  }
})

// ========================================
// 6. Verify payment redirect signature (frontend callback)
// ========================================
app.post('/api/verify-redirect', (req, res) => {
  try {
    const { signature, ...params } = req.body

    const dataString = Object.entries(params)
      .filter(([, value]) => value !== null && value !== undefined && value !== '')
      .map(([key, value]) => `${key}=${value}`)
      .concat(`salt=${CREEM_API_KEY}`)
      .join('|')

    const expectedSignature = crypto.createHash('sha256').update(dataString).digest('hex')

    if (signature === expectedSignature) {
      res.json({ valid: true })
    } else {
      res.status(400).json({ valid: false, error: 'Signature verification failed' })
    }
  } catch (err) {
    res.status(500).json({ error: err.message })
  }
})

app.listen(PORT, () => {
  console.log(`ValveSpecs Server running on port ${PORT}`)
  console.log(`Creem API: ${CREEM_BASE_URL}`)
  console.log(`Webhook URL: ${process.env.FRONTEND_URL || 'http://localhost:3000'}/api/webhook`)
})

// ========================================
// 7. Search valve specs (multi-filter + full-text search)
// ========================================
app.get('/api/valves/search', async (req, res) => {
  try {
    const { keyword, brand_id, valve_type_id, material, application, limit = 20, offset = 0 } = req.query

    let query = supabase
      .from('valve_specs')
      .select(`
        *,
        brands (id, name, country),
        valve_types (id, name, type_key)
      `, { count: 'exact' })
      .eq('is_active', true)

    // Full-text search: try search_vector first, fallback to ilike
    let useTextSearch = false
    if (keyword) {
      try {
        const { data: testData, error: testError } = await supabase
          .from('valve_specs')
          .select('id')
          .textSearch('search_vector', keyword, { type: 'plain', config: 'english' })
          .limit(1)

        if (!testError && testData) {
          useTextSearch = true
          query = query.textSearch('search_vector', keyword, { type: 'plain', config: 'english' })
        }
      } catch {
        const kw = keyword.toLowerCase()
        query = query.or(
          `model.ilike.%${kw}%,body_material.ilike.%${kw}%,standard.ilike.%${kw}%,size_range.ilike.%${kw}%,end_connection.ilike.%${kw}%`
        )
      }
    }

    // Brand filter: support both UUID and slug
    if (brand_id) {
      // Check if brand_id looks like a UUID
      const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
      if (uuidRegex.test(brand_id)) {
        query = query.eq('brand_id', brand_id)
      } else {
        // Treat as slug: lookup the brand UUID first
        const { data: brandData, error: brandError } = await supabase
          .from('brands')
          .select('id')
          .eq('slug', brand_id)
          .single()
        if (brandError || !brandData) {
          // Brand not found: return empty result
          return res.json({ data: [], count: 0, pageTotal: 0 })
        }
        query = query.eq('brand_id', brandData.id)
      }
    }

    // Valve type filter
    if (valve_type_id) {
      query = query.eq('valve_type_id', valve_type_id)
    }

    // Material filter
    if (material) {
      query = query.ilike('body_material', `%${material}%`)
    }

    // Application filter
    if (application) {
      query = query.contains('applications', [application])
    }

    // Pagination: fulltext uses exact pagination; ilike fallback fetches extra for post-filter
    const needPostFilter = !!keyword && !useTextSearch
    const fetchLimit = needPostFilter ? limit * 3 : limit
    const { data, error, count: dbCount } = await query
      .order('created_at', { ascending: false })
      .range(offset, offset + Number(fetchLimit) - 1)

    if (error) throw error

    // Post-filter: only when using ilike fallback, filter by brand/type name in memory
    let filteredData = data || []
    let totalCount = dbCount || filteredData.length

    if (needPostFilter) {
      const kw = keyword.toLowerCase()
      filteredData = data.filter(v =>
        v.brands?.name?.toLowerCase().includes(kw) ||
        v.valve_types?.name?.toLowerCase().includes(kw)
      )
      totalCount = filteredData.length
    }

    const pageData = filteredData.slice(0, limit)

    res.json({ data: pageData, count: totalCount, pageTotal: pageData.length, searchMode: useTextSearch ? 'fulltext' : 'ilike' })
  } catch (err) {
    console.error('Search failed:', err.message)
    res.status(500).json({ error: err.message })
  }
})

// ========================================
// 8. Get brand and type lists (for filters)
// ========================================
app.get('/api/valves/filters', async (req, res) => {
  try {
    const [brandsRes, typesRes] = await Promise.all([
      supabase.from('brands').select('id, name, country, slug').order('name'),
      supabase.from('valve_types').select('id, name, type_key').order('name')
    ])

    res.json({
      brands: brandsRes.data || [],
      valveTypes: typesRes.data || []
    })
  } catch (err) {
    console.error('Get filters failed:', err.message)
    res.status(500).json({ error: err.message })
  }
})
