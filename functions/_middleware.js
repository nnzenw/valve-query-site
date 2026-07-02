/**
 * Cloudflare Pages Function: SEO 预渲染代理
 * 
 * 功能：
 * - 检测 User-Agent，如果是搜索引擎爬虫，返回 Astro 预渲染的静态 HTML
 * - 普通用户访问原 React SPA
 */

const CRAWLER_KEYWORDS = [
  'googlebot',
  'bingbot',
  'slurp',
  'duckduckbot',
  'baiduspider',
  'yandexbot',
  'facebookexternalhit',
  'twitterbot',
  'gptbot',
  'chatgpt',
  'claude-web',
  'perplexity',
]

const ASTRO_PAGES_URL = 'https://main.valvehub-astro-poc.pages.dev'

function isCrawler(userAgent) {
  if (!userAgent) return false
  const ua = userAgent.toLowerCase()
  return CRAWLER_KEYWORDS.some(keyword => ua.includes(keyword))
}

function hasPrerenderedPage(pathname) {
  if (pathname === '/') return true
  if (pathname.startsWith('/brand/')) return true
  if (pathname.startsWith('/valve/')) return true
  if (pathname === '/community' || pathname === '/community/') return true
  return false
}

export async function onRequest(context) {
  const { request, next } = context
  const url = new URL(request.url)
  const userAgent = request.headers.get('User-Agent') || ''
  
  const crawler = isCrawler(userAgent)
  const prerendered = hasPrerenderedPage(url.pathname)
  
  // 如果是爬虫 + 有预渲染页面 → 返回静态 HTML
  if (crawler && prerendered) {
    const astroUrl = ASTRO_PAGES_URL + url.pathname
    try {
      const response = await fetch(astroUrl, {
        headers: {
          'User-Agent': 'Cloudflare-Pages-Function',
        },
      })
      
      if (response.ok) {
        const html = await response.text()
        return new Response(html, {
          status: 200,
          headers: {
            'Content-Type': 'text/html; charset=UTF-8',
            'Cache-Control': 'public, max-age=3600',
            'X-Robots-Tag': 'all',
            'X-SEO-Renderer': 'prerendered',
          },
        })
      }
    } catch (e) {
      console.error('Failed to fetch prerendered page:', e)
      // 失败则继续，返回原 SPA
    }
  }
  
  // 普通用户或没有预渲染页面 → 继续正常流程
  return next()
}
