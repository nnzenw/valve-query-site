import { createClient } from '@supabase/supabase-js'
import fs from 'fs'
import path from 'path'

// Load environment variables from .env or process.env
let env = { ...process.env }

try {
  const envPath = path.join(process.cwd(), '.env')
  if (fs.existsSync(envPath)) {
    const envContent = fs.readFileSync(envPath, 'utf8')
    envContent.split('\n').forEach(line => {
      const match = line.match(/^([^#=]+)=(.*)$/)
      if (match) env[match[1].trim()] = match[2].trim()
    })
  }
} catch {}

const supabaseUrl = env.VITE_SUPABASE_URL
const supabaseAnonKey = env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseAnonKey) {
  console.warn('⚠️ Missing Supabase config, using static sitemap')
}

const BASE_URL = 'https://valve.tradesxchange.com'

// If no Supabase config, generate static sitemap
if (!supabaseUrl || !supabaseAnonKey) {
  console.log('📝 Generating static sitemap (no Supabase config)...')
  
  const blogPostsPath = path.join(process.cwd(), 'src', 'data', 'blogPosts.js')
  const blogPostsContent = fs.readFileSync(blogPostsPath, 'utf8')
  const slugMatches = [...blogPostsContent.matchAll(/slug:\s*["']([^"']+)["']/g)]
  const blogSlugs = slugMatches.map(m => m[1])

  let sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>${BASE_URL}/</loc>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>${BASE_URL}/brands</loc>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>${BASE_URL}/blog</loc>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>
`

  blogSlugs.forEach(slug => {
    sitemap += `  <url>
    <loc>${BASE_URL}/blog/${slug}</loc>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
`
  })

  sitemap += `
</urlset>`

  const outputPath = path.join('public', 'sitemap.xml')
  fs.writeFileSync(outputPath, sitemap, 'utf8')
  console.log(`✅ Static sitemap generated: ${outputPath}`)
  console.log(`   - Blog posts: ${blogSlugs.length}`)
  process.exit(0)
}

const supabase = createClient(supabaseUrl, supabaseAnonKey)

async function generateSitemap() {
  console.log('🔄 Fetching data from Supabase...')

  // Fetch all brands
  const { data: brands, error: brandsError } = await supabase
    .from('brands')
    .select('id, name, slug')
    .order('name')

  if (brandsError) {
    console.error('❌ Failed to fetch brands:', brandsError.message)
    process.exit(1)
  }
  console.log(`   Found ${brands.length} brands`)

  // Fetch all active valve specs (with pagination)
  let valves = []
  let offset = 0
  const batchSize = 1000
  let hasMore = true

  while (hasMore) {
    const { data: batch, error: valvesError } = await supabase
      .from('valve_specs')
      .select('id')
      .eq('is_active', true)
      .range(offset, offset + batchSize - 1)

    if (valvesError) {
      console.error('❌ Failed to fetch valve specs:', valvesError.message)
      process.exit(1)
    }

    valves = valves.concat(batch || [])
    offset += batchSize
    hasMore = batch && batch.length === batchSize
  }
  console.log(`   Found ${valves.length} active valve specs`)

  // Fetch all blog posts (from static file)
  const blogPostsPath = path.join(process.cwd(), 'src', 'data', 'blogPosts.js')
  const blogPostsContent = fs.readFileSync(blogPostsPath, 'utf8')
  const slugMatches = [...blogPostsContent.matchAll(/slug:\s*["']([^"']+)["']/g)]
  const blogSlugs = slugMatches.map(m => m[1])
  console.log(`   Found ${blogSlugs.length} blog posts`)

  // Generate sitemap XML
  let sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

  <!-- Static Pages -->
  <url>
    <loc>${BASE_URL}/</loc>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>${BASE_URL}/brands</loc>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>${BASE_URL}/blog</loc>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>

  <!-- Brand Pages -->
`

  // Add brand pages (use slug if available, fallback to id)
  brands.forEach(brand => {
    const brandUrl = brand.slug ? `/brand/${brand.slug}` : `/brand/${brand.id}`
    sitemap += `  <url>
    <loc>${BASE_URL}${brandUrl}</loc>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
`
  })

  sitemap += `
  <!-- Valve Specification Pages -->
`

  // Add valve pages
  valves.forEach(valve => {
    sitemap += `  <url>
    <loc>${BASE_URL}/valve/${valve.id}</loc>
    <changefreq>monthly</changefreq>
    <priority>0.5</priority>
  </url>
`
  })

  sitemap += `
  <!-- Blog Posts -->
`

  // Add blog posts
  blogSlugs.forEach(slug => {
    sitemap += `  <url>
    <loc>${BASE_URL}/blog/${slug}</loc>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
`
  })

  sitemap += `
</urlset>`

  // Write sitemap.xml
  const outputPath = path.join('public', 'sitemap.xml')
  fs.writeFileSync(outputPath, sitemap, 'utf8')

  const totalUrls = 3 + brands.length + valves.length + blogSlugs.length
  console.log(`\n✅ Sitemap generated: ${outputPath}`)
  console.log(`   - Static pages: 3`)
  console.log(`   - Brand pages: ${brands.length}`)
  console.log(`   - Valve pages: ${valves.length}`)
  console.log(`   - Blog posts: ${blogSlugs.length}`)
  console.log(`   - Total URLs: ${totalUrls}`)
}

generateSitemap().catch(err => {
  console.error('❌ Error:', err.message)
  process.exit(1)
})