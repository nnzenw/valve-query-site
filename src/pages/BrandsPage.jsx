import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import SEO from '../components/seo/SEO'
import { Globe, ArrowRight } from 'lucide-react'

const BACKEND_URL = import.meta.env.VITE_BACKEND_URL || ''

function goHome(e) {
  e.preventDefault()
  window.history.pushState(null, '', '/')
  window.dispatchEvent(new PopStateEvent('popstate'))
}

export default function BrandsPage() {
  const navigate = useNavigate()
  const [brands, setBrands] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const res = await fetch(`${BACKEND_URL}/api/valves/filters`)
        if (res.ok) {
          const data = await res.json()
          setBrands(data.brands || [])
        }
      } catch (err) {
        console.error('Failed to load brands:', err)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  function goBrand(brandId, e) {
    e.preventDefault()
    navigate(`/brand/${brandId}`)
  }

  return (
    <>
      <SEO
        title="All Valve Brands"
        description="Browse global valve brand directory, featuring KITZ, KSB, Fisher, GEMU and other leading brands. View product lines and technical specifications."
        canonical="https://valvespecs.pro/brands"
        schemaData={{
          "@context": "https://schema.org",
          "@type": "CollectionPage",
          "name": "All Valve Brands",
          "description": "Comprehensive directory of industrial valve brands including KITZ, KSB, Fisher, GEMU and more. Browse by brand, country, and product category.",
          "url": "https://valvespecs.pro/brands"
        }}
        breadcrumb={[
          { name: 'Home', url: 'https://valvespecs.pro' },
          { name: 'Brands', url: 'https://valvespecs.pro/brands' }
        ]}
      />

      <div className="min-h-screen bg-gray-50">
        <header className="bg-white shadow-sm">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
            <a href="/" onClick={goHome} className="text-blue-600 hover:underline text-sm">
              &larr; Back to Home
            </a>
          </div>
        </header>

        <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">Valve Brand Directory</h1>
          <p className="text-gray-500 mb-8">Browse global valve brand directory</p>

          {loading ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
              {[1, 2, 3, 4, 5, 6].map(i => (
                <div key={i} className="bg-white rounded-lg p-5 border border-gray-200 animate-pulse">
                  <div className="h-5 w-32 bg-gray-200 rounded mb-2"></div>
                  <div className="h-4 w-20 bg-gray-200 rounded"></div>
                </div>
              ))}
            </div>
          ) : (
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
              {brands.map((brand) => (
                <button
                  key={brand.id}
                  onClick={(e) => goBrand(brand.id, e)}
                  className="bg-white rounded-lg p-5 border border-gray-200 hover:shadow-md hover:border-blue-300 transition-all group text-left cursor-pointer"
                >
                  <div className="flex items-center gap-3 mb-3">
                    <div className="w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center text-blue-600 font-bold text-sm">
                      {brand.name?.[0]}
                    </div>
                    <div>
                      <h3 className="font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">
                        {brand.name}
                      </h3>
                      {brand.country && (
                        <p className="text-xs text-gray-500 flex items-center gap-1">
                          <Globe className="w-3 h-3" />
                          {brand.country}
                        </p>
                      )}
                    </div>
                  </div>
                  <div className="flex items-center justify-end text-xs text-gray-400 group-hover:text-blue-500">
                    View Products <ArrowRight className="w-3 h-3 ml-1" />
                  </div>
                </button>
              ))}
            </div>
          )}
        </main>
      </div>
    </>
  )
}
