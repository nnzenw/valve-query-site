import { HelpCircle } from 'lucide-react'
import Footer from './components/Footer';
import { useState, useEffect, useCallback, Suspense, lazy } from 'react'
import { BrowserRouter, Routes, Route, useNavigate, useParams, useSearchParams } from 'react-router-dom'
import { HelmetProvider } from 'react-helmet-async'
import SEO from './components/seo/SEO'
import { supabase } from './lib/supabase'
import { toast } from 'react-hot-toast'
import { useComparison } from './lib/ComparisonContext'

const BACKEND_URL: string = import.meta.env.VITE_BACKEND_URL || ''
import Header from './components/Header'
import SearchBar from './components/SearchBar'
import FilterPanel from './components/FilterPanel'
import ValveCard from './components/ValveCard'
import EmptyState from './components/EmptyState'
import ErrorBoundary from './components/ErrorBoundary'
import ShareSearchButton from './components/ShareSearchButton'
import { useSubscription } from './lib/SubscriptionContext'
import { useAuth } from './contexts/AuthContext'

// Lazy-loaded page components (code splitting)
const ComparisonPage = lazy(() => import('./components/ComparisonPage'))
const TipsCommunity = lazy(() => import('./components/TipsCommunity'))
const PricingPage = lazy(() => import('./components/PricingPage'))
const ValveDetailPage = lazy(() => import('./pages/ValveDetailPage'))
const BrandsPage = lazy(() => import('./pages/BrandsPage'))
const BrandDetailPage = lazy(() => import('./pages/BrandDetailPage'))
const BlogListPage = lazy(() => import('./pages/BlogListPage'))
const BlogPostPage = lazy(() => import('./pages/BlogPostPage'))
const NotFoundPage = lazy(() => import('./pages/NotFoundPage'))
const LoginPage = lazy(() => import('./pages/LoginPage'))
const RegisterPage = lazy(() => import('./pages/RegisterPage'))

// TypeScript interfaces
interface SearchParams {
  keyword: string
  brand_id: string
  valve_type_id: string
  material: string
  application: string
}

interface ValveItem {
  id: number
  name?: string
  type?: string
  size_range?: string
  pressure_range?: string
  body_material?: string
  standard?: string
  health_score?: number
  average_rating?: number
  like_count?: number
  applications?: string[]
  brands?: { id: number; name: string; logo_url?: string; country?: string; established?: number }
  valve_types?: { id: number; name: string }
}

interface FilterOption {
  id: number
  name: string
}

interface ValveTypeOption extends FilterOption {}

interface BrandOption extends FilterOption {}

// Loading fallback for lazy-loaded components
function PageLoader() {
  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center">
      <div className="text-center">
        <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-blue-600 mx-auto mb-3"></div>
        <p className="text-gray-500 text-sm">Loading...</p>
      </div>
    </div>
  )
}


// Home page FAQ data for SEO
const HOME_FAQS = [
  {
    q: 'What is ValveSpecs Pro?',
    a: 'ValveSpecs Pro is a global industrial valve specifications database covering 100+ brands including KITZ, KSB, Fisher, and GEMU. Search and compare valve technical data for ball valves, butterfly valves, gate valves, globe valves, and more.',
  },
  {
    q: 'How do I search for valve specifications?',
    a: 'Use the search bar above to filter by keyword, brand, valve type, material, or application. You can also click Popular tags for quick access to common valve categories.',
  },
  {
    q: 'What valve types are covered in the database?',
    a: 'The database includes Ball Valve, Globe Valve, Butterfly Valve, Gate Valve, Check Valve, Control Valve, Diaphragm Valve, Needle Valve, Steam Trap, and Pressure Relief Valve.',
  },
  {
    q: 'Can I compare valves from different brands?',
    a: 'Yes. Click "Compare" on any valve card to add it to your comparison list. You can compare up to 10 valves side-by-side and export the comparison as TXT or CSV.',
  },
  {
    q: 'What standards are included in the specifications?',
    a: 'Specifications reference API (API 6D, API 600, API 602, API 607), ASME (B16.34, B16.10, B16.5), ISO (ISO 5208), DIN, and JIS standards.',
  },
]

const homeFaqSchema = {
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": HOME_FAQS.map(faq => ({
    "@type": "Question",
    "name": faq.q,
    "acceptedAnswer": {
      "@type": "Answer",
      "text": faq.a,
    },
  })),
}

function HomePage() {
  const navigate = useNavigate()
  const { user } = useAuth()
  const [urlSearchParams, setUrlSearchParams] = useSearchParams()
  const [valves, setValves] = useState<ValveItem[]>([])
  const [brands, setBrands] = useState<BrandOption[]>([])
  const [valveTypes, setValveTypes] = useState<ValveTypeOption[]>([])
  const [loading, setLoading] = useState<boolean>(true)
  const [totalCount, setTotalCount] = useState<number>(0)
  const [page, setPage] = useState<number>(1)
  const PAGE_SIZE = 20

  // Initialize search params from URL
  const [searchParams, setSearchParams] = useState<SearchParams>({
    keyword: urlSearchParams.get('keyword') || '',
    brand_id: urlSearchParams.get('brand_id') || '',
    valve_type_id: urlSearchParams.get('valve_type_id') || '',
    material: urlSearchParams.get('material') || '',
    application: urlSearchParams.get('application') || ''
  })

  const [showFilters, setShowFilters] = useState<boolean>(false)
  const [showComparison, setShowComparison] = useState<boolean>(false)
  const [showTipsCommunity, setShowTipsCommunity] = useState<boolean>(false)
  const [showPricing, setShowPricing] = useState<boolean>(false)
  const { isPro, canAccess, isQuotaExceeded, incrementUsage, dailyUsage } = useSubscription()

  const handleFeedback = async (valveId: number, type: 'like' | 'dislike'): Promise<void> => {
    try {
      const { error } = await supabase.from('valve_feedback').insert({
        valve_spec_id: valveId,
        type: type
      })

      if (error) throw error

      setValves(prev => prev.map(v =>
        v.id === valveId
          ? { ...v, like_count: (v.like_count || 0) + (type === 'like' ? 1 : 0) }
          : v
      ))

      toast.success(type === 'like' ? 'Thanks for your feedback' : 'Marked for review')
    } catch (err) {
      console.error('Feedback submission failed:', err)
      toast.error('Feedback submission failed, please retry')
    }
  }

  useEffect(() => {
    async function loadFilters() {
      try {
        const res = await fetch(`${BACKEND_URL}/api/valves/filters`)
        if (res.ok) {
          const data = await res.json()
          setBrands(data.brands || [])
          setValveTypes(data.valveTypes || [])
        }
      } catch (err) {
        console.error('Failed to load filters:', err)
      }
    }
    loadFilters()
  }, [])

  const searchValves = useCallback(async (params: SearchParams, pageNum: number = 1): Promise<void> => {
    try {
      setLoading(true)
      const searchParams = new URLSearchParams()
      if (params.keyword) searchParams.set('keyword', params.keyword)
      if (params.brand_id) searchParams.set('brand_id', params.brand_id)
      if (params.valve_type_id) searchParams.set('valve_type_id', params.valve_type_id)
      if (params.material) searchParams.set('material', params.material)
      if (params.application) searchParams.set('application', params.application)
      searchParams.set('limit', String(PAGE_SIZE))
      searchParams.set('offset', String((pageNum - 1) * PAGE_SIZE))

      const res = await fetch(`${BACKEND_URL}/api/valves/search?${searchParams}`)
      if (res.ok) {
        const data = await res.json()
        setValves(data.data || [])
        setTotalCount(data.count || 0)
      } else {
        console.error('Search failed')
        setValves([])
        setTotalCount(0)
      }
    } catch (err) {
      console.error('Search error:', err)
      setValves([])
      setTotalCount(0)
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => {
    searchValves({}, 1)
  }, [searchValves])

  const handleSearch = (params: SearchParams): void => {
    setSearchParams(params)
    setPage(1)
    searchValves(params, 1)

    // Sync to URL
    const newUrlParams = new URLSearchParams()
    if (params.keyword) newUrlParams.set('keyword', params.keyword)
    if (params.brand_id) newUrlParams.set('brand_id', params.brand_id)
    if (params.valve_type_id) newUrlParams.set('valve_type_id', params.valve_type_id)
    if (params.material) newUrlParams.set('material', params.material)
    if (params.application) newUrlParams.set('application', params.application)
    setUrlSearchParams(newUrlParams, { replace: true })
  }

  const handlePageChange = (newPage: number): void => {
    setPage(newPage)
    searchValves(searchParams, newPage)
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  const totalPages = Math.ceil(totalCount / PAGE_SIZE)


  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-blue-50">
      <SEO
        title={searchParams.valve_type_id
          ? `${valveTypes.find(t => t.id === Number(searchParams.valve_type_id))?.name || 'Valve'} Specs`
          : searchParams.keyword
            ? `Search: ${searchParams.keyword}`
            : 'Global Industrial Valve Specifications Database'}
        description="Search and compare global industrial valve specifications covering 100+ brands including KITZ, KSB, Fisher. Complete technical data for ball valves, butterfly valves, gate valves, globe valves."
        canonical={`https://valvespecs.pro${window.location.search}`}
        schemaData={homeFaqSchema}
      />

      <Header 
        onOpenComparison={() => setShowComparison(true)} 
        onOpenTips={() => setShowTipsCommunity(true)} 
        onOpenPricing={() => setShowPricing(true)} 
      />
      
      <SearchBar
        onSearch={handleSearch}
        brands={brands}
        valveTypes={valveTypes}
        onToggleFilters={() => setShowFilters(!showFilters)}
        showFilters={showFilters}
        initialParams={searchParams}
      />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-4">
        <div className="flex flex-wrap items-center gap-2">
          <span className="text-sm text-gray-600 mr-1">Popular:</span>
          {valveTypes.slice(0, 6).map((type) => (
            <button
              key={type.id}
              onClick={() => {
                const params = { keyword: '', brand_id: '', valve_type_id: type.id, material: '', application: '' }
                handleSearch(params)
              }}
              className="px-3 py-1 bg-blue-50 text-blue-700 text-sm rounded-full hover:bg-blue-100 transition-colors"
            >
              {type.name}
            </button>
          ))}
        </div>
      </div>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* First-screen guiding hint */}
        {!loading && !Object.values(searchParams).some(v => v) && (
          <div className="text-center mb-6">
            <p className="text-sm text-gray-600">
              Browse the full catalog below or use the search bar to find specific valve specifications.
            </p>
          </div>
        )}
        {loading ? (
          <div className="flex items-center justify-center py-20">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
          </div>
        ) : valves.length > 0 ? (
          <>
            {Object.values(searchParams).some(v => v) && (
              <div className="flex items-center justify-between mb-4">
                <p className="text-sm text-gray-600">
                  <span className="font-semibold text-gray-800">{totalCount}</span> results found
                  {totalCount > PAGE_SIZE && (
                    <span>, Page {page}/{totalPages}</span>
                  )}
                </p>
                <ShareSearchButton searchParams={searchParams} />
              </div>
            )}

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-x-6 gap-y-8">
              {valves.map((valve) => (
                <ValveCard
                  key={valve.id}
                  valve={valve}
                  onClick={() => navigate(`/valve/${valve.id}`)}
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
                >
                  Previous
                </button>
                {Array.from({ length: Math.min(totalPages, 7) }, (_, i) => {
                  let pageNum
                  if (totalPages <= 7) {
                    pageNum = i + 1
                  } else if (page <= 4) {
                    pageNum = i + 1
                  } else if (page >= totalPages - 3) {
                    pageNum = totalPages - 6 + i
                  } else {
                    pageNum = page - 3 + i
                  }
                  return (
                    <button
                      key={pageNum}
                      onClick={() => handlePageChange(pageNum)}
                      className={`px-3 py-2 text-sm rounded-lg border transition-colors ${
                        pageNum === page
                          ? 'bg-blue-600 text-white border-blue-600'
                          : 'border-gray-300 hover:bg-gray-100'
                      }`}
                    >
                      {pageNum}
                    </button>
                  )
                })}
                <button
                  onClick={() => handlePageChange(page + 1)}
                  disabled={page === totalPages}
                  className="px-3 py-2 text-sm rounded-lg border border-gray-300 hover:bg-gray-100 disabled:opacity-40 disabled:cursor-not-allowed"
                >
                  Next
                </button>
              </div>
            )}
          </>
        ) : (
          <EmptyState
            hasFilters={Object.values(searchParams).some(v => v)}
            onClearFilters={() => {
              const empty = { keyword: '', brand_id: '', valve_type_id: '', material: '', application: '' }
              setSearchParams(empty)
              searchValves(empty)
            }}
          />
        )}

        {!isPro && !loading && valves.length > 0 && (
          <div className="mt-6 text-center">
            <div className="inline-flex items-center gap-2 px-4 py-2 bg-gray-100 rounded-full text-xs text-gray-600">
              Searched {dailyUsage} times today
              {dailyUsage >= 15 && dailyUsage < 20 && (
                <span className="text-yellow-600">(approaching Free limit)</span>
              )}
              {dailyUsage >= 20 && (
                <span className="text-orange-600">(limit exceeded, some features restricted)</span>
              )}
              <button
                onClick={() => setShowPricing(true)}
                className="text-blue-600 hover:underline ml-1"
              >Upgrade to Pro for Unlimited</button>
            </div>
          </div>
        )}

        {!isPro && valves.length > 0 && (
          <div className="mt-4 bg-gradient-to-r from-blue-50 to-indigo-50 border border-blue-200 rounded-lg p-4 flex items-center justify-between">
            <div className="text-sm text-blue-800">
              <span className="font-semibold">Pro Member Features:</span>
              Full specs, Est. Price, data export, unlimited Compare
            </div>
            <button
              onClick={() => setShowPricing(true)}
              className="px-4 py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700"
            >Upgrade to Pro $49/mo</button>
          </div>
        )}

      {/* FAQ Section for SEO */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-12 pb-8">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">Frequently Asked Questions</h2>
        <div className="space-y-4">
          {HOME_FAQS.map((faq, idx) => (
            <details
              key={idx}
              className="bg-white rounded-xl shadow-sm border border-gray-200 p-5 group hover:shadow-md hover:border-blue-200 transition-all cursor-pointer"
            >
              <summary className="font-medium text-gray-900 cursor-pointer list-none flex items-center justify-between">
                <span className="flex items-center gap-3">
                  <HelpCircle className="w-5 h-5 text-blue-500 flex-shrink-0" />
                  {faq.q}
                </span>
                <span className="text-gray-400 group-open:rotate-180 transition-transform duration-200 ml-2">{'\u25BE'}</span>
              </summary>
              <p className="mt-3 text-gray-600 leading-relaxed">{faq.a}</p>
            </details>
          ))}
        </div>
      </section>

      </main>{showComparison && (
        <Suspense fallback={null}>
          <ComparisonPage 
            onClose={() => setShowComparison(false)}
            valves={valves}
          />
        </Suspense>
      )}
      
      {showTipsCommunity && (
        <Suspense fallback={null}>
          <TipsCommunity 
            onClose={() => setShowTipsCommunity(false)}
          />
        </Suspense>
      )}
      
      {showPricing && (
        <Suspense fallback={null}>
          <PricingPage onClose={() => setShowPricing(false)} user={user} />
        </Suspense>
      )}
    </div>
  )
}

// Wrapper components for pages that need route params
function ValveDetailWrapper() {
  const { id } = useParams()
  return <ValveDetailPage valveId={id} />
}

function BrandDetailWrapper() {
  const { id } = useParams()
  return <BrandDetailPage brandId={id} />
}

function BlogPostWrapper() {
  const { slug } = useParams()
  return <BlogPostPage slug={slug} />
}

export default function App() {
  return (
    <ErrorBoundary>
      <BrowserRouter>
        <HelmetProvider>
          <Suspense fallback={<PageLoader />}>
            <Routes>
              <Route path="/" element={<HomePage />} />
              <Route path="/valve/:id" element={<ValveDetailWrapper />} />
              <Route path="/brand/:id" element={<BrandDetailWrapper />} />
              <Route path="/brands" element={<BrandsPage />} />
              <Route path="/blog" element={<BlogListPage />} />
              <Route path="/blog/:slug" element={<BlogPostWrapper />} />
              <Route path="/login" element={<LoginPage />} />
              <Route path="/register" element={<RegisterPage />} />
              <Route path="*" element={<NotFoundPage />} />
            </Routes>
          </Suspense>
        </HelmetProvider>
      </BrowserRouter>
    </ErrorBoundary>
  )
}
