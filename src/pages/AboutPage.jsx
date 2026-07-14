import SEO from '../components/seo/SEO'

export default function AboutPage() {
  return (
    <>
      <SEO
        title="About ValveSpecs Pro"
        description="ValveSpecs Pro is a global industrial valve specifications database covering 90+ brands. Learn about our mission to help engineers and procurement professionals find the right valves."
        canonical="https://valve.tradesxchange.com/about"
      />
      <div className="min-h-screen bg-gray-50">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
          <a href="/" className="text-blue-600 hover:underline text-sm">&larr; Back to Home</a>
          <h1 className="text-3xl font-bold text-gray-900 mt-6 mb-8">About ValveSpecs Pro</h1>

          <div className="prose prose-gray max-w-none space-y-6 text-gray-700">
            <h2 className="text-xl font-semibold text-gray-900">Our Mission</h2>
            <p>ValveSpecs Pro was built to solve a real problem in the industrial valve industry: finding accurate, comparable technical specifications across hundreds of brands and thousands of products. We serve engineers, procurement professionals, and valve suppliers worldwide.</p>

            <h2 className="text-xl font-semibold text-gray-900">What We Offer</h2>
            <ul className="list-disc pl-6 space-y-2">
              <li><strong>Comprehensive Database</strong> — Detailed specifications for ball valves, butterfly valves, gate valves, globe valves, check valves, control valves, and more from 90+ global brands.</li>
              <li><strong>Advanced Search</strong> — Filter by brand, valve type, material, pressure rating, size range, and application to quickly find what you need.</li>
              <li><strong>Side-by-Side Comparison</strong> — Compare specifications of up to 10 valves simultaneously to make data-driven decisions.</li>
              <li><strong>Supplier Inquiries</strong> — Connect directly with valve manufacturers and distributors through our inquiry system.</li>
              <li><strong>Technical Resources</strong> — Expert articles on valve selection, material compatibility, standards, and best practices.</li>
            </ul>

            <h2 className="text-xl font-semibold text-gray-900">Who We Serve</h2>
            <ul className="list-disc pl-6 space-y-2">
              <li><strong>Process Engineers</strong> — Selecting valves for new plants or retrofit projects</li>
              <li><strong>Procurement Professionals</strong> — Sourcing valves with specific technical requirements</li>
              <li><strong>Piping Designers</strong> — Specifying valve types and materials for P&amp;ID layouts</li>
              <li><strong>Valve Suppliers</strong> — Reaching qualified buyers with technical requirements</li>
              <li><strong>Students &amp; Researchers</strong> — Learning about industrial valve technology</li>
            </ul>

            <h2 className="text-xl font-semibold text-gray-900">Contact Us</h2>
            <p>For business inquiries, partnerships, or support, reach us at nnzenw@126.com.</p>
          </div>
        </div>
      </div>
    </>
  )
}
