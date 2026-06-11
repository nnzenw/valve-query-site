import { useState, useEffect } from 'react'
import { ArrowLeft, Check, Star, ExternalLink, ChevronDown, ChevronUp, Send } from 'lucide-react'
import SEO from '../components/seo/SEO'
import InquiryModal from '../components/InquiryModal'

const BACKEND_URL = import.meta.env.VITE_BACKEND_URL || ''

function goHome(e) {
  e.preventDefault()
  window.history.pushState(null, '', '/')
  window.dispatchEvent(new PopStateEvent('popstate'))
}

export default function ValveDetailPage({ valveId }) {
  const [valve, setValve] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [expandedFaq, setExpandedFaq] = useState(null)
  const [showInquiry, setShowInquiry] = useState(false)

  useEffect(() => {
    loadValve()
  }, [valveId])

  async function loadValve() {
    try {
      setLoading(true)
      const res = await fetch(`${BACKEND_URL}/api/valves/${valveId}`)
      if (!res.ok) {
        throw new Error('Valve not found')
      }
      const data = await res.json()
      setValve(data)
    } catch (err) {
      console.error('Load valve error:', err)
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  // Generate Schema.org JSON-LD
  const generateSchema = () => {
    if (!valve) return null

    const productSchema = {
      "@context": "https://schema.org",
      "@type": "Product",
      "name": `${valve.brands?.name || ''} ${valve.model || ''} ${valve.valve_types?.name || ''}`,
      "description": valve.body_material 
        ? `${valve.body_material} ${valve.valve_types?.name || 'Valve'}. ${valve.pressure_range || ''} ${valve.temperature_range || ''}`
        : `${valve.valve_types?.name || 'Valve'} specifications and parameters`,
      "brand": {
        "@type": "Brand",
        "name": valve.brands?.name,
        "countryOfOrigin": valve.brands?.country
      },
      "category": valve.valve_types?.name,
      "sku": valve.model || undefined,
      "material": valve.body_material,
      "additionalProperty": [
        { "@type": "PropertyValue", "name": "Face-to-Face Dimension", "value": valve.size_range },
        { "@type": "PropertyValue", "name": "Pressure Range", "value": valve.pressure_range },
        { "@type": "PropertyValue", "name": "Temperature Range", "value": valve.temperature_range },
        { "@type": "PropertyValue", "name": "Standard", "value": valve.standard },
        { "@type": "PropertyValue", "name": "Trim Material", "value": valve.trim_material },
        { "@type": "PropertyValue", "name": "Seal Material", "value": valve.seal_material }
      ],
      "image": valve.image_url || undefined,
      "offers": {
        "@type": "Offer",
        "availability": "https://schema.org/InStock",
        "priceCurrency": "USD",
        "price": undefined
      }
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": `What is the temperature range of ${valve.brands?.name || ''} ${valve.valve_types?.name || 'valve'}?`,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": valve.temperature_range || "Temperature range information not available for this model."
          }
        },
        {
          "@type": "Question",
          "name": `Does this ${valve.valve_types?.name || 'valve'} comply with API standards?`,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": `This valve complies with ${valve.standard || 'standard specifications'}.`
          }
        }
      ]
    }

    return [productSchema, faqSchema]
  }

  // Loading state
  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50">
        <header className="bg-white shadow-sm">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
            <div className="h-4 w-32 bg-gray-200 rounded animate-pulse"></div>
          </div>
        </header>
        <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          {/* Header skeleton */}
          <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
            <div className="h-8 w-64 bg-gray-200 rounded animate-pulse mb-2"></div>
            <div className="h-4 w-48 bg-gray-200 rounded animate-pulse mb-4"></div>
            <div className="h-4 w-24 bg-gray-200 rounded animate-pulse"></div>
          </div>
          {/* Specs skeleton */}
          <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
            <div className="h-6 w-32 bg-gray-200 rounded animate-pulse mb-4"></div>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              {[1, 2, 3, 4, 5, 6].map(i => (
                <div key={i} className="border border-gray-100 rounded-lg p-3">
                  <div className="h-3 w-20 bg-gray-200 rounded animate-pulse mb-2"></div>
                  <div className="h-4 w-32 bg-gray-200 rounded animate-pulse"></div>
                </div>
              ))}
            </div>
          </div>
        </main>
      </div>
    )
  }

  // Error state
  if (error || !valve) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-2">Valve Not Found</h1>
          <p className="text-gray-500 mb-4">{error || 'The valve you are looking for does not exist.'}</p>
          <a 
            href="/" 
            onClick={goHome}
            className="text-blue-600 hover:underline flex items-center gap-2 justify-center"
          >
            <ArrowLeft className="w-4 h-4" />
            Back to Search
          </a>
        </div>
      </div>
    )
  }

  const schema = generateSchema()
  const pageTitle = `${valve.brands?.name || ''} ${valve.model || ''} ${valve.valve_types?.name || ''} Specifications`
  const description = valve.body_material 
    ? `${valve.body_material} ${valve.valve_types?.name}. ${valve.pressure_range || ''} ${valve.temperature_range || ''}. Specifications for industrial applications.`
    : `${valve.valve_types?.name || 'Valve'} specifications and parameters for industrial applications.`

  return (
    <>
      <SEO
        title={pageTitle}
        description={description}
        canonical={`https://valvespecs.pro/valve/${valve.id}`}
        schemaData={schema}
        breadcrumb={[
          { name: 'Home', url: 'https://valvespecs.pro' },
          { name: valve.brands?.name || 'Brand', url: `https://valvespecs.pro/brand/${valve.brands?.name || ''}` },
          { name: valve.valve_types?.name || 'Type', url: `https://valvespecs.pro/type/${valve.valve_types?.type_key || ''}` },
          { name: `${valve.model || 'Model'}`, url: `https://valvespecs.pro/valve/${valve.id}` }
        ]}
      />

      <div className="min-h-screen bg-gray-50">
        {/* Breadcrumb Navigation */}
        <header className="bg-white border-b border-gray-200 shadow-sm">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
            <nav className="flex items-center text-sm text-gray-500">
              <a href="/" onClick={goHome} className="hover:text-blue-600">Home</a>
              <span className="mx-2">/</span>
              <a href={`/brand/${valve.brands?.name || ''}`} className="hover:text-blue-600">
                {valve.brands?.name || 'Brand'}
              </a>
              <span className="mx-2">/</span>
              <a href={`/type/${valve.valve_types?.type_key || ''}`} className="hover:text-blue-600">
                {valve.valve_types?.name || 'Type'}
              </a>
              <span className="mx-2">/</span>
              <span className="text-gray-900 font-medium">
                {valve.model || 'Model'}
              </span>
            </nav>
          </div>
        </header>

        <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          {/* Header */}
          <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
            <div className="flex items-start justify-between">
              <div>
                <h1 className="text-2xl font-bold text-gray-900">
                  {valve.brands?.name} {valve.model || ''}
                </h1>
                <p className="text-gray-500 mt-1">{valve.valve_types?.name}</p>
                {valve.brands?.country && (
                  <p className="text-sm text-gray-400 mt-1">Made in {valve.brands.country}</p>
                )}
              </div>
              <div className="flex items-center gap-3">
                <button
                  onClick={() => setShowInquiry(true)}
                  className="flex items-center gap-2 px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded-lg transition-colors"
                >
                  <Send className="w-4 h-4" />
                  Request Quote
                </button>
                {valve.brands?.website && (
                  <a 
                    href={valve.brands.website} 
                    target="_blank" 
                    rel="noopener noreferrer"
                    className="flex items-center gap-2 text-blue-600 hover:underline text-sm"
                  >
                    Official Website <ExternalLink className="w-4 h-4" />
                  </a>
                )}
              </div>
            </div>

            {/* Health Score */}
            {valve.health_scores?.average_rating > 0 && (
              <div className="mt-4 flex items-center gap-4">
                <div className="flex items-center gap-1">
                  {[...Array(5)].map((_, i) => (
                    <Star 
                      key={i} 
                      className={`w-5 h-5 ${
                        i < Math.round(valve.health_scores.average_rating) 
                          ? 'text-yellow-400 fill-current' 
                          : 'text-gray-300'
                      }`} 
                    />
                  ))}
                </div>
                <span className="text-sm text-gray-500">
                  {valve.health_scores.average_rating.toFixed(1)} 
                  ({valve.health_scores.feedback_count} ratings)
                </span>
              </div>
            )}
          </div>

          {/* Specifications Grid - Organized by Category */}
          <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h2 className="text-lg font-semibold text-gray-900 mb-4">Technical Specifications</h2>
            
            {/* Basic Info */}
            <div className="mb-6">
              <h3 className="text-sm font-medium text-gray-500 mb-3 uppercase tracking-wide">Basic Information</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {[
                  { label: 'Brand', value: valve.brands?.name },
                  { label: 'Model', value: valve.model },
                  { label: 'Valve Type', value: valve.valve_types?.name },
                  { label: 'Country of Origin', value: valve.brands?.country }
                ].filter(item => item.value).map((item) => (
                  <div key={item.label} className="border border-gray-100 rounded-lg p-3">
                    <dt className="text-sm text-gray-500">{item.label}</dt>
                    <dd className="text-gray-900 font-medium mt-1">{item.value}</dd>
                  </div>
                ))}
              </div>
            </div>

            {/* Material Specifications */}
            <div className="mb-6">
              <h3 className="text-sm font-medium text-gray-500 mb-3 uppercase tracking-wide">Material Specifications</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {[
                  { label: 'Body Material', value: valve.body_material },
                  { label: 'Trim Material', value: valve.trim_material },
                  { label: 'Seal Material', value: valve.seal_material },
                  { label: 'Stem Material', value: valve.stem_material }
                ].filter(item => item.value).map((item) => (
                  <div key={item.label} className="border border-gray-100 rounded-lg p-3">
                    <dt className="text-sm text-gray-500">{item.label}</dt>
                    <dd className="text-gray-900 font-medium mt-1 font-mono">{item.value}</dd>
                  </div>
                ))}
              </div>
            </div>

            {/* Performance Specifications */}
            <div className="mb-6">
              <h3 className="text-sm font-medium text-gray-500 mb-3 uppercase tracking-wide">Performance Specifications</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {[
                  { label: 'Face-to-Face Dimension', value: valve.size_range },
                  { label: 'Pressure Range', value: valve.pressure_range },
                  { label: 'Temperature Range', value: valve.temperature_range },
                  { label: 'End Connection', value: valve.end_connection },
                  { label: 'Flow Coefficient (Cv/Kv)', value: valve.flow_coefficient },
                  { label: 'Leakage Class', value: valve.leak_rate },
                  { label: 'Operation Method', value: valve.operation_method }
                ].filter(item => item.value).map((item) => (
                  <div key={item.label} className="border border-gray-100 rounded-lg p-3">
                    <dt className="text-sm text-gray-500">{item.label}</dt>
                    <dd className="text-gray-900 font-medium mt-1 font-mono">{item.value}</dd>
                  </div>
                ))}
              </div>
            </div>

            {/* Certifications & Standards */}
            <div>
              <h3 className="text-sm font-medium text-gray-500 mb-3 uppercase tracking-wide">Certifications & Standards</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {[
                  { label: 'Standard Compliance', value: valve.standard },
                  { label: 'Fire Safe', value: valve.fire_safe ? 'Yes' : 'No' },
                  { label: 'Anti Static', value: valve.anti_static ? 'Yes' : 'No' }
                ].filter(item => item.value !== undefined).map((item) => (
                  <div key={item.label} className="border border-gray-100 rounded-lg p-3">
                    <dt className="text-sm text-gray-500">{item.label}</dt>
                    <dd className={`font-medium mt-1 ${item.value === 'Yes' ? 'text-green-600' : item.value === 'No' ? 'text-gray-400' : 'text-gray-900 font-mono'}`}>
                      {item.value}
                    </dd>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Applications & Media */}
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
            {valve.applicable_media?.length > 0 && (
              <div className="bg-white rounded-xl shadow-sm p-6">
                <h2 className="text-lg font-semibold text-gray-900 mb-4">Applicable Media</h2>
                <div className="flex flex-wrap gap-2">
                  {valve.applicable_media.map((media) => (
                    <span key={media} className="px-3 py-1 bg-blue-100 text-blue-800 rounded-full text-sm">
                      {media}
                    </span>
                  ))}
                </div>
              </div>
            )}

            {valve.applications?.length > 0 && (
              <div className="bg-white rounded-xl shadow-sm p-6">
                <h2 className="text-lg font-semibold text-gray-900 mb-4">Applications</h2>
                <div className="flex flex-wrap gap-2">
                  {valve.applications.map((app) => (
                    <span key={app} className="px-3 py-1 bg-purple-100 text-purple-800 rounded-full text-sm">
                      {app}
                    </span>
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* Industry Tags */}
          {valve.industry_tags?.length > 0 && (
            <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
              <h2 className="text-lg font-semibold text-gray-900 mb-4">Industry Tags</h2>
              <div className="flex flex-wrap gap-2">
                {valve.industry_tags.map((tag) => (
                  <span key={tag} className="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm">
                    {tag}
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* FAQ Section - Critical for SEO */}
          <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h2 className="text-lg font-semibold text-gray-900 mb-4">Frequently Asked Questions</h2>
            <div className="space-y-3">
              {[
                {
                  question: `What is the temperature range of ${valve.brands?.name || 'this'} ${valve.valve_types?.name || 'valve'}?`,
                  answer: valve.temperature_range || "Temperature range information is not available for this model. Please contact the manufacturer for specific temperature ratings."
                },
                {
                  question: `Does this ${valve.valve_types?.name || 'valve'} comply with API standards?`,
                  answer: `This valve complies with ${valve.standard || 'standard specifications'}. For detailed certification information, please refer to the technical documentation.`
                },
                {
                  question: `What materials are used in the construction of this ${valve.valve_types?.name || 'valve'}?`,
                  answer: `The body material is ${valve.body_material || 'not specified'}, with ${valve.trim_material || 'standard'} trim and ${valve.seal_material || 'standard'} seals.`
                },
                {
                  question: `What applications is this ${valve.valve_types?.name || 'valve'} suitable for?`,
                  answer: `This valve is recommended for ${(valve.applications || valve.valve_types?.common_applications || ['industrial applications']).join(', ')}.`
                }
              ].map((faq, index) => (
                <div key={index} className="border border-gray-200 rounded-lg">
                  <button
                    onClick={() => setExpandedFaq(expandedFaq === index ? null : index)}
                    className="w-full flex items-center justify-between p-4 text-left"
                  >
                    <span className="font-medium text-gray-900">{faq.question}</span>
                    {expandedFaq === index ? (
                      <ChevronUp className="w-5 h-5 text-gray-500" />
                    ) : (
                      <ChevronDown className="w-5 h-5 text-gray-500" />
                    )}
                  </button>
                  {expandedFaq === index && (
                    <div className="px-4 pb-4 text-gray-600">
                      {faq.answer}
                    </div>
                  )}
                </div>
              ))}
            </div>
          </div>

          {/* Brand Info */}
          {valve.brands?.description && (
            <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
              <h2 className="text-lg font-semibold text-gray-900 mb-4">About {valve.brands.name}</h2>
              <div className="flex items-start gap-4">
                <div className="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center text-gray-400 font-bold">
                  {valve.brands.name?.[0]}
                </div>
                <div>
                  <h3 className="font-semibold text-gray-900">{valve.brands.name}</h3>
                  {valve.brands.established && (
                    <p className="text-sm text-gray-500">Established: {valve.brands.established}</p>
                  )}
                  <p className="text-gray-600 mt-2">{valve.brands.description}</p>
                  {valve.brands.website && (
                    <a 
                      href={valve.brands.website} 
                      target="_blank" 
                      rel="noopener noreferrer"
                      className="text-blue-600 hover:underline mt-2 inline-block"
                    >
                      Visit Official Website
                    </a>
                  )}
                </div>
              </div>
            </div>
          )}

          {/* Similar Valves (Placeholder for cross-links) */}
          <div className="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h2 className="text-lg font-semibold text-gray-900 mb-4">Similar Valves</h2>
            <p className="text-gray-500 text-sm">
              Explore other {valve.valve_types?.name || 'valve'} specifications from different manufacturers.
            </p>
            <div className="mt-4">
              <button className="px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition-colors">
                View All {valve.valve_types?.name || 'Valves'}
              </button>
            </div>
          </div>

          {/* Related Guides (Placeholder for cross-links) */}
          <div className="bg-white rounded-xl shadow-sm p-6">
            <h2 className="text-lg font-semibold text-gray-900 mb-4">Related Technical Guides</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <a href="/blog/valve-selection-guide" className="p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
                <h3 className="font-medium text-blue-600">Complete Valve Selection Guide</h3>
                <p className="text-sm text-gray-500 mt-1">How to choose the right valve for your application.</p>
              </a>
              <a href="/blog/valve-material-selection" className="p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
                <h3 className="font-medium text-blue-600">Valve Material Selection Guide</h3>
                <p className="text-sm text-gray-500 mt-1">Understanding material compatibility for different media.</p>
              </a>
            </div>
          </div>
        </main>
      </div>

      <InquiryModal
        isOpen={showInquiry}
        onClose={() => setShowInquiry(false)}
        brandId={valve.brand_id}
        brandName={valve.brands?.name || ''}
        valveSpecId={valve.id}
        valveModel={valve.model}
        valveType={valve.valve_types?.name || ''}
      />
    </>
  )
}