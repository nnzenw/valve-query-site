import { Helmet } from 'react-helmet-async'
import SEO from '../components/seo/SEO'
import { ArrowLeft, Calendar, Tag } from 'lucide-react'
import { getPostBySlug } from '../data/blogPosts'

function goHome(e) {
  e.preventDefault()
  window.history.pushState(null, '', '/')
  window.dispatchEvent(new PopStateEvent('popstate'))
}

function goBlog(e) {
  e.preventDefault()
  window.history.pushState(null, '', '/blog')
  window.dispatchEvent(new PopStateEvent('popstate'))
}

function goBlogSlug(slug, e) {
  e.preventDefault()
  window.history.pushState(null, '', `/blog/${slug}`)
  window.dispatchEvent(new PopStateEvent('popstate'))
}

export default function BlogPostPage({ slug }) {
  const post = getPostBySlug(slug)

  if (!post) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-2">Article Not Found</h1>
          <p className="text-gray-500 mb-4">The requested blog post could not be found.</p>
          <a href="/blog" onClick={goBlog} className="text-blue-600 hover:underline">← Back to Blog</a>
        </div>
      </div>
    )
  }

  // Simple markdown to HTML renderer
  function renderContent(md) {
    let html = md
      .replace(/^### (.+)$/gm, '<h3 class="text-lg font-semibold text-gray-900 mt-6 mb-3">$1</h3>')
      .replace(/^## (.+)$/gm, '<h2 class="text-xl font-bold text-gray-900 mt-8 mb-4 pb-2 border-b border-gray-200">$1</h2>')
      .replace(/\*\*(.+?)\*\*/g, '<strong class="font-semibold text-gray-800">$1</strong>')
      .replace(/\n\n/g, '</p><p class="mb-4 leading-relaxed text-gray-700">')
      .replace(/^- (.+)$/gm, '<li class="ml-4 mb-1">$1</li>')

    // Handle tables
    const lines = html.split('\n')
    let inTable = false
    let tableHtml = ''
    const processed = []

    for (const line of lines) {
      if (line.trim().startsWith('|') && line.trim().endsWith('|')) {
        if (!inTable) {
          inTable = true
          tableHtml = '<div className="overflow-x-auto my-4"><table className="w-full text-sm border border-gray-200">'
        }
        const cells = line.split('|').filter(c => c.trim() !== '')
        if (cells.every(c => c.trim().replace(/:/g, '') === '---')) continue
        const tag = tableHtml.includes('<tbody>') ? 'td' : 'th'
        const rowTag = tableHtml.includes('<tbody>') ? 'tr' : 'tr'
        if (!tableHtml.includes('<thead>')) {
          tableHtml += '<thead><tr>'
          cells.forEach(c => { tableHtml += `<th class="px-3 py-2 text-left border-b border-gray-200 bg-gray-50 font-medium">${c.trim()}</th>` })
          tableHtml += '</tr></thead><tbody>'
        } else {
          tableHtml += '<tr>'
          cells.forEach(c => { tableHtml += `<td class="px-3 py-2 border-b border-gray-100">${c.trim()}</td>` })
          tableHtml += '</tr>'
        }
      } else {
        if (inTable) {
          tableHtml += '</tbody></table></div>'
          processed.push(tableHtml)
          inTable = false
          tableHtml = ''
        }
        processed.push(line)
      }
    }
    if (inTable) {
      tableHtml += '</tbody></table></div>'
      processed.push(tableHtml)
    }

    return processed.join('\n')
  }

  return (
    <>
      <SEO
        title={post.title}
        description={post.metaDescription}
        canonical={`https://valvespecs.pro/blog/${slug}`}
        schemaData={{
          "@context": "https://schema.org",
          "@type": "Article",
          "headline": post.title,
          "description": post.summary,
          "author": { "@type": "Person", "name": post.author },
          "datePublished": post.date,
          "url": `https://valvespecs.pro/blog/${slug}`,
          "publisher": {
            "@type": "Organization",
            "name": "ValveSpecs Pro"
          }
        }}
        breadcrumb={[
          { name: 'Home', url: 'https://valvespecs.pro' },
          { name: 'Blog', url: 'https://valvespecs.pro/blog' },
          { name: post.title, url: `https://valvespecs.pro/blog/${slug}` }
        ]}
      />

      <div className="min-h-screen bg-gray-50">
        <header className="bg-white shadow-sm">
          <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex items-center gap-4">
            <a href="/" onClick={goHome} className="text-blue-600 hover:underline text-sm flex items-center gap-1">
              <ArrowLeft className="w-4 h-4" /> Home
            </a>
            <span className="text-gray-300">/</span>
            <a href="/blog" onClick={goBlog} className="text-blue-600 hover:underline text-sm">Blog</a>
          </div>
        </header>

        <main className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <article className="bg-white rounded-xl shadow-sm p-8">
            {/* ArticleHeader */}
            <div className="mb-8 pb-6 border-b border-gray-200">
              <div className="flex items-center gap-3 mb-4">
                <Calendar className="w-4 h-4 text-gray-400" />
                <span className="text-sm text-gray-400">{post.date}</span>
                <span className="text-sm text-gray-400">·</span>
                <span className="text-sm text-gray-400">{post.author}</span>
              </div>
              <h1 className="text-3xl font-bold text-gray-900 mb-4">{post.title}</h1>
              <div className="flex flex-wrap gap-2">
                {post.tags.map((tag) => (
                  <span key={tag} className="px-3 py-1 bg-blue-50 text-blue-700 text-sm rounded-full">
                    {tag}
                  </span>
                ))}
              </div>
            </div>

            {/* ArticleBody */}
            <div
              className="prose prose-gray max-w-none"
              dangerouslySetInnerHTML={{ __html: renderContent(post.content) }}
            />

            {/* Related articles */}
            <div className="mt-12 pt-8 border-t border-gray-200">
              <h3 className="text-lg font-semibold text-gray-900 mb-4">More Articles</h3>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {blogPosts
                  .filter(p => p.slug !== slug)
                  .slice(0, 2)
                  .map(p => (
                    <a
                      key={p.slug}
                      href={`/blog/${p.slug}`}
                      onClick={(e) => goBlogSlug(p.slug, e)}
                      className="block p-4 bg-gray-50 rounded-lg hover:bg-blue-50 transition-colors"
                    >
                      <h4 className="font-medium text-gray-900 hover:text-blue-600">{p.title}</h4>
                      <p className="text-sm text-gray-500 mt-1 line-clamp-2">{p.summary}</p>
                    </a>
                  ))
                }
              </div>
            </div>
          </article>
        </main>
      </div>
    </>
  )
}
