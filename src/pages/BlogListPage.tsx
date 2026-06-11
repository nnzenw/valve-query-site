import { useNavigate } from 'react-router-dom'
import { Helmet } from 'react-helmet-async'
import SEO from '../components/seo/SEO'
import { Calendar, Tag, ArrowRight } from 'lucide-react'
import { blogPosts } from '../data/blogPosts'

import type { MouseEvent } from 'react'

interface BlogPost {
  slug: string
  title: string
  metaTitle: string
  metaDescription: string
  date: string
  author: string
  tags: string[]
  summary: string
  content: string
}

interface BreadcrumbItem {
  name: string
  url: string
}

interface SchemaData {
  "@context": string
  "@type": string
  name: string
  description: string
  url: string
  blogPost?: Array<{
    "@type": string
    headline: string
    url: string
    datePublished: string
    author: { "@type": string; name: string }
  }>
}

export default function BlogListPage(): JSX.Element {
  const navigate = useNavigate()

  const goBlog = (slug: string, e: MouseEvent<HTMLAnchorElement>): void => {
    e.preventDefault()
    navigate(`/blog/${slug}`)
  }

  const goHome = (e: MouseEvent<HTMLAnchorElement>): void => {
    e.preventDefault()
    navigate('/')
  }

  const schemaData: SchemaData = {
    "@context": "https://schema.org",
    "@type": "Blog",
    "name": "Valve Tech Blog",
    "description": "Valve selection guides, technical comparisons, and industry knowledge for engineers and procurement professionals.",
    "url": "https://valvespecs.pro/blog",
    "blogPost": (blogPosts as BlogPost[]).map((post) => ({
      "@type": "BlogPosting",
      "headline": post.title,
      "url": `https://valvespecs.pro/blog/${post.slug}`,
      "datePublished": post.date,
      "author": { "@type": "Person", "name": post.author }
    }))
  }

  const breadcrumb: BreadcrumbItem[] = [
    { name: 'Home', url: 'https://valvespecs.pro' },
    { name: 'Blog', url: 'https://valvespecs.pro/blog' }
  ]

  return (
    <>
      <SEO
        title="Valve Tech Blog"
        description="Valve selection guides, butterfly vs ball valve comparisons, material selection, parameter interpretation. Practical technical articles to help engineers master valve knowledge."
        canonical="https://valvespecs.pro/blog"
        schemaData={schemaData}
        breadcrumb={breadcrumb}
      />

      <div className="min-h-screen bg-gray-50">
        <header className="bg-white shadow-sm">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex items-center gap-4">
            <a href="/" onClick={goHome} className="text-blue-600 hover:underline text-sm">← Home</a>
          </div>
        </header>

        <main className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">Valve Tech Blog</h1>
          <p className="text-gray-500 mb-8">Practical guides, comparisons, and parameter analysis</p>

          <div className="space-y-6">
            {(blogPosts as BlogPost[]).map((post) => (
              <a
                key={post.slug}
                href={`/blog/${post.slug}`}
                onClick={(e) => goBlog(post.slug, e)}
                className="block bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md hover:border-blue-300 transition-all group"
              >
                <div className="flex items-center gap-3 mb-3">
                  <Calendar className="w-4 h-4 text-gray-400" />
                  <span className="text-sm text-gray-400">{post.date}</span>
                  <span className="text-sm text-gray-400">·</span>
                  <span className="text-sm text-gray-400">{post.author}</span>
                </div>
                <h2 className="text-xl font-semibold text-gray-900 group-hover:text-blue-600 transition-colors mb-2">
                  {post.title}
                </h2>
                <p className="text-gray-600 mb-4 leading-relaxed">{post.summary}</p>
                <div className="flex items-center justify-between">
                  <div className="flex flex-wrap gap-2">
                    {post.tags.map((tag) => (
                      <span key={tag} className="px-2 py-1 bg-blue-50 text-blue-700 text-xs rounded-full">
                        {tag}
                      </span>
                    ))}
                  </div>
                  <span className="text-sm text-blue-600 group-hover:text-blue-700 flex items-center gap-1">
                    Read More <ArrowRight className="w-4 h-4" />
                  </span>
                </div>
              </a>
            ))}
          </div>
        </main>
      </div>
    </>
  )
}