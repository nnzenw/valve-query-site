import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import SEO from '../components/seo/SEO'
import { Globe, ArrowRight, Search, Mail, Phone, MapPin, Building2, Star, Filter } from 'lucide-react'

const BACKEND_URL = import.meta.env.VITE_BACKEND_URL || ''

export default function SuppliersPage() {
  const navigate = useNavigate()
  const [suppliers, setSuppliers] = useState([])
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCountry, setSelectedCountry] = useState('')
  const [selectedType, setSelectedType] = useState('')
  const [valveTypes, setValveTypes] = useState([])

  useEffect(() => {
    async function load() {
      try {
        const res = await fetch(`${BACKEND_URL}/api/valves/filters`)
        if (res.ok) {
          const data = await res.json()
          setSuppliers(data.brands || [])
          setValveTypes(data.valveTypes || [])
        }
      } catch (err) {
        console.error('Failed to load suppliers:', err)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  const countries = [...new Set(suppliers.map(s => s.country).filter(Boolean))].sort()

  const filteredSuppliers = suppliers.filter(supplier => {
    const matchesSearch = !searchTerm || 
      supplier.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      supplier.country?.toLowerCase().includes(searchTerm.toLowerCase())
    const matchesCountry = !selectedCountry || supplier.country === selectedCountry
    return matchesSearch && matchesCountry
  })

  function goSupplier(supplierId, e) {
    e.preventDefault()
    navigate(`/brand/${supplierId}`)
  }

  return (
    <>
      <SEO
        title="Industrial Valve Suppliers Directory | Yellow Pages"
        description="Find global industrial valve suppliers, manufacturers and distributors. Browse supplier directory with contact information, product range and certifications."
        canonical="https://valve.tradesxchange.com/suppliers"
        schemaData={{
          "@context": "https://schema.org",
          "@type": "CollectionPage",
          "name": "Industrial Valve Suppliers Directory",
          "description": "Comprehensive directory of industrial valve suppliers and manufacturers worldwide.",
          "url": "https://valve.tradesxchange.com/suppliers"
        }}
        breadcrumb={[
          { name: 'Home', url: 'https://valve.tradesxchange.com' },
          { name: 'Suppliers', url: 'https://valve.tradesxchange.com/suppliers' }
        ]}
      />

      <div className="min-h-screen bg-gray-50">
        <header className="bg-white shadow-sm">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
            <a href="/" className="text-blue-600 hover:underline text-sm">
              &larr; Back to Home
            </a>
          </div>
        </header>

        <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <div className="mb-8">
            <h1 className="text-3xl font-bold text-gray-900 mb-2">Valve Supplier Directory</h1>
            <p className="text-gray-500">Find manufacturers, distributors and suppliers of industrial valves worldwide</p>
          </div>

          {/* Search and Filter */}
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 mb-6">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-5 h-5 text-gray-400" />
                <input
                  type="text"
                  placeholder="Search suppliers by name or country..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
              </div>
              <div className="flex gap-4">
                <select
                  value={selectedCountry}
                  onChange={(e) => setSelectedCountry(e.target.value)}
                  className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value="">All Countries</option>
                  {countries.map(country => (
                    <option key={country} value={country}>{country}</option>
                  ))}
                </select>
              </div>
            </div>
          </div>

          {/* Results count */}
          <div className="mb-4 text-sm text-gray-600">
            Showing {filteredSuppliers.length} suppliers
          </div>

          {/* Suppliers Grid */}
          {loading ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              {[1, 2, 3, 4, 5, 6].map(i => (
                <div key={i} className="bg-white rounded-xl p-6 border border-gray-200 animate-pulse">
                  <div className="flex items-center gap-4 mb-4">
                    <div className="w-16 h-16 bg-gray-200 rounded-lg"></div>
                    <div className="flex-1">
                      <div className="h-5 w-32 bg-gray-200 rounded mb-2"></div>
                      <div className="h-4 w-24 bg-gray-200 rounded"></div>
                    </div>
                  </div>
                  <div className="space-y-2">
                    <div className="h-4 w-full bg-gray-200 rounded"></div>
                    <div className="h-4 w-3/4 bg-gray-200 rounded"></div>
                  </div>
                </div>
              ))}
            </div>
          ) : filteredSuppliers.length === 0 ? (
            <div className="text-center py-16 bg-white rounded-xl border border-gray-200">
              <Building2 className="w-16 h-16 mx-auto text-gray-300 mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No suppliers found</h3>
              <p className="text-gray-500">Try adjusting your search criteria</p>
            </div>
          ) : (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              {filteredSuppliers.map((supplier) => (
                <button
                  key={supplier.id}
                  onClick={(e) => goSupplier(supplier.id, e)}
                  className="bg-white rounded-xl p-6 border border-gray-200 hover:shadow-lg hover:border-blue-300 transition-all group text-left cursor-pointer"
                >
                  <div className="flex items-start gap-4 mb-4">
                    <div className="w-16 h-16 rounded-lg bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center text-white font-bold text-xl flex-shrink-0">
                      {supplier.logo_url ? (
                        <img src={supplier.logo_url} alt={supplier.name} className="w-16 h-16 rounded-lg object-cover" />
                      ) : (
                        supplier.name?.[0]
                      )}
                    </div>
                    <div className="flex-1 min-w-0">
                      <h3 className="font-bold text-gray-900 group-hover:text-blue-600 transition-colors text-lg truncate">
                        {supplier.name}
                      </h3>
                      {supplier.country && (
                        <p className="text-sm text-gray-500 flex items-center gap-1">
                          <Globe className="w-4 h-4 flex-shrink-0" />
                          {supplier.country}
                        </p>
                      )}
                      {supplier.established && (
                        <p className="text-xs text-gray-400 mt-1">
                          Est. {supplier.established}
                        </p>
                      )}
                    </div>
                  </div>

                  {supplier.description && (
                    <p className="text-sm text-gray-600 mb-4 line-clamp-2">
                      {supplier.description}
                    </p>
                  )}

                  {supplier.certifications && supplier.certifications.length > 0 && (
                    <div className="flex flex-wrap gap-2 mb-4">
                      {supplier.certifications.slice(0, 3).map((cert, idx) => (
                        <span key={idx} className="px-2 py-1 bg-blue-50 text-blue-700 text-xs rounded-full">
                          {cert}
                        </span>
                      ))}
                      {supplier.certifications.length > 3 && (
                        <span className="px-2 py-1 bg-gray-100 text-gray-600 text-xs rounded-full">
                          +{supplier.certifications.length - 3}
                        </span>
                      )}
                    </div>
                  )}

                  <div className="flex items-center justify-between pt-4 border-t border-gray-100">
                    <div className="flex items-center gap-1 text-sm text-gray-500">
                      <Star className="w-4 h-4 text-yellow-400" />
                      <span>View Profile</span>
                    </div>
                    <ArrowRight className="w-5 h-5 text-gray-400 group-hover:text-blue-500 group-hover:translate-x-1 transition-all" />
                  </div>
                </button>
              ))}
            </div>
          )}

          {/* CTA Section */}
          <div className="mt-12 bg-gradient-to-r from-blue-600 to-indigo-600 rounded-xl p-8 text-white">
            <div className="text-center">
              <h2 className="text-2xl font-bold mb-2">Are you a valve supplier?</h2>
              <p className="text-blue-100 mb-6">List your company in our directory and reach thousands of buyers worldwide</p>
              <button
                onClick={() => navigate('/register')}
                className="px-6 py-3 bg-white text-blue-600 font-semibold rounded-lg hover:bg-blue-50 transition-colors"
              >
                Register as Supplier
              </button>
            </div>
          </div>
        </main>
      </div>
    </>
  )
}