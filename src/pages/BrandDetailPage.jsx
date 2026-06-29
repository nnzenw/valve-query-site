import { useState, useEffect } from 'react'
import { Helmet } from 'react-helmet-async'
import SEO from '../components/seo/SEO'
import { ArrowLeft, Globe, Send } from 'lucide-react'
import ValveCard from '../components/ValveCard'
import InquiryModal from '../components/InquiryModal'
import { supabase } from '../lib/supabase'

const BACKEND_URL = import.meta.env.VITE_BACKEND_URL || ''

function goHome(e) {
  e.preventDefault()
  window.history.pushState(null, '', '/')
  window.dispatchEvent(new PopStateEvent('popstate'))
}

function goBrands(e) {
  e.preventDefault()
  window.history.pushState(null, '', '/brands')
  window.dispatchEvent(new PopStateEvent('popstate'))
}

const PAGE_SIZE = 20

export default function BrandDetailPage({ brandId }) {
  const [valves, setValves] = useState([])
  const [brandInfo, setBrandInfo] = useState(null)
  const [totalCount, setTotalCount] = useState(0)
  const [page, setPage] = useState(1)
  const [initialLoading, setInitialLoading] = useState(true)
  const [pageLoading, setPageLoading] = useState(false)
  const [showInquiry, setShowInquiry] = useState(false)

  const loadProducts = async (pageNum = 1, isPageChange = false) => {
    // 必须用 brandInfo.id (UUID) 查 API，不能用 slug
    const brandUuid = brandInfo?.id || brandId
    try {
      if (isPageChange) setPageLoading(true)
      else setInitialLoading(true)
      const offset = (pageNum - 1) * PAGE_SIZE
      const res = await fetch(`${BACKEND_URL}/api/valves/search?brand_id=${brandUuid}&limit=${PAGE_SIZE}&offset=${offset}`)
      if (res.ok) {
        const data = await res.json()
        setValves(data.data || [])
        setTotalCount(data.count || 0)
      }
    } catch (err) {
      console.error('Failed to load brand products:', err)
    } finally {
      setInitialLoading(false)
      setPageLoading(false)
    }
  }

  // Load brand info by slug (for SEO and display, even if no products yet)
  useEffect(() => {
    async function loadBrandInfo() {
      // Try to get brand info from the current brandInfo state or from API
      if (brandInfo) return
      
      // Query by slug via Supabase client (public read access)
      const { data, error } = await supabase
        .from('brands')
        .select('*')
        .eq('slug', brandId)
        .maybeSingle()
      
      if (data) {
        setBrandInfo(data)
      } else {
        // Fallback: try as UUID (backward compatibility)
        const { data: data2, error: error2 } = await supabase
          .from('brands')
          .select('*')
          .eq('id', brandId)
          .maybeSingle()
        if (data2) setBrandInfo(data2)
      }
    }
    loadBrandInfo()
  }, [brandId])

  // 等 brandInfo 加载完成后再查产品（需要 UUID 查 API）
  useEffect(() => {
    if (brandInfo?.id) {
      setPage(1)
      loadProducts(1, false)
    }
  }, [brandId, brandInfo?.id])

  const handlePageChange = (newPage) => {
    setPage(newPage)
    loadProducts(newPage, true)
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  const totalPages = Math.ceil(totalCount / PAGE_SIZE)

  const handleFeedback = async () => {}

  if (initialLoading) {
    return (
      <div className="min-h-screen bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
        </div>
      </div>
    )
  }

  return (
    <>
      <SEO
        title={brandInfo ? `${brandInfo.name} Valve Product Catalog` : 'Brand Valve Products'}
        description={brandInfo?.description || 'Browse valve product catalog by brand. View technical specifications and parameters.'}
        canonical={`https://valve.tradesxchange.com/brand/${brandId}`}
        schemaData={brandInfo ? {
          "@context": "https://schema.org",
          "@type": "Brand",
          "name": brandInfo.name,
          "description": brandInfo.description || '',
          "url": `https://valve.tradesxchange.com/brand/${brandId}`,
          "countryOfOrigin": brandInfo.country || undefined
        } : undefined}
        breadcrumb={[
          { name: 'Home', url: 'https://valve.tradesxchange.com' },
          { name: 'Brands', url: 'https://valve.tradesxchange.com/brands' },
          { name: brandInfo?.name || 'Brand', url: `https://valve.tradesxchange.com/brand/${brandId}` }
        ]}
      />

      <div className="min-h-screen bg-gray-50">
        <header className="bg-white shadow-sm">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex items-center gap-4">
            <a href="/" onClick={goHome} className="text-blue-600 hover:underline text-sm flex items-center gap-1">
              <ArrowLeft className="w-4 h-4" /> Home
            </a>
            <span className="text-gray-300">/</span>
            <a href="/brands" onClick={goBrands} className="text-blue-600 hover:underline text-sm">Brand List</a>
          </div>
        </header>

        <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          {/* Brand info header */}
          {brandInfo && (
            <div className="bg-white rounded-xl shadow-sm p-6 mb-8">
              <div className="flex items-center gap-4">
                <div className="w-16 h-16 rounded-xl bg-blue-50 flex items-center justify-center text-blue-600 font-bold text-2xl">
                  {brandInfo.name?.[0]}
                </div>
                <div>
                  <h1 className="text-3xl font-bold text-gray-900">{brandInfo.name}</h1>
                  {brandInfo.country && (
                    <p className="text-sm text-gray-500 flex items-center gap-1 mt-1">
                      <Globe className="w-4 h-4" /> {brandInfo.country}
                    </p>
                  )}
                </div>
              </div>
              {brandInfo.description && (
                <p className="text-gray-600 mt-4 leading-relaxed">{brandInfo.description}</p>
              )}
              <div className="flex flex-wrap items-center gap-4 mt-6">
                <p className="text-sm text-gray-400">{totalCount} products</p>
                <button
                  onClick={() => setShowInquiry(true)}
                  className="inline-flex items-center gap-2 px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded-lg transition-colors"
                >
                  <Send className="w-4 h-4" />
                  Request Quote from {brandInfo.name}
                </button>
              </div>
            </div>
          )}

          {/* Product list */}
          <div className="relative">
            {/* Page loading overlay */}
            {pageLoading && (
              <div className="absolute inset-0 bg-white bg-opacity-60 z-10 flex items-center justify-center rounded-xl">
                <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
              </div>
            )}
          {valves.length > 0 ? (
            <>
              {totalCount > PAGE_SIZE && (
                <p className="text-sm text-gray-500 mb-4">Page {page}/{totalPages}</p>
              )}
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {valves.map((valve) => (
                  <ValveCard
                    key={valve.id}
                    valve={valve}
                    onClick={() => {
                      window.history.pushState(null, '', `/valve/${valve.id}`)
                      window.dispatchEvent(new PopStateEvent('popstate'))
                    }}
                    onFeedback={handleFeedback}
                  />
                ))}
              </div>
              {totalPages > 1 && (
                <div className="mt-8 flex items-center justify-center gap-2">
                  <button
                    onClick={() => handlePageChange(page - 1)}
                    disabled={page === 1}
                    className="px-3 py-2 text-sm rounded-lg border border-gray-300 hover:bg-gray-100 disabled:opacity-40 disabled:cursor-not-allowed"
                  >Previous</button>
                  {Array.from({ length: Math.min(totalPages, 7) }, (_, i) => {
                    let n
                    if (totalPages <= 7) n = i + 1
                    else if (page <= 4) n = i + 1
                    else if (page >= totalPages - 3) n = totalPages - 6 + i
                    else n = page - 3 + i
                    return (
                      <button key={n} onClick={() => handlePageChange(n)}
                        className={`px-3 py-2 text-sm rounded-lg border transition-colors ${n === page ? 'bg-blue-600 text-white border-blue-600' : 'border-gray-300 hover:bg-gray-100'}`}
                      >{n}</button>
                    )
                  })}
                  <button
                    onClick={() => handlePageChange(page + 1)}
                    disabled={page === totalPages}
                    className="px-3 py-2 text-sm rounded-lg border border-gray-300 hover:bg-gray-100 disabled:opacity-40 disabled:cursor-not-allowed"
                  >Next</button>
                </div>
              )}
            </>
          ) : (
            <div className="text-center py-12 text-gray-500">
              No products from this brand yet
            </div>
          )}
          </div>
        </main>
      </div>

      <InquiryModal
        isOpen={showInquiry}
        onClose={() => setShowInquiry(false)}
        brandId={brandId}
        brandName={brandInfo?.name || ''}
      />
    </>
  )
}
