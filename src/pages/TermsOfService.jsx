import SEO from '../components/seo/SEO'

export default function TermsOfService() {
  return (
    <>
      <SEO
        title="Terms of Service"
        description="Terms of Service for ValveSpecs Pro - Global Industrial Valve Specifications Database"
        canonical="https://valve.tradesxchange.com/terms"
      />
      <div className="min-h-screen bg-gray-50">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
          <a href="/" className="text-blue-600 hover:underline text-sm">&larr; Back to Home</a>
          <h1 className="text-3xl font-bold text-gray-900 mt-6 mb-8">Terms of Service</h1>
          <div className="prose prose-gray max-w-none space-y-6 text-gray-700">
            <p><strong>Last updated:</strong> June 18, 2026</p>

            <h2 className="text-xl font-semibold text-gray-900">1. Acceptance of Terms</h2>
            <p>By accessing or using ValveSpecs Pro (valve.tradesxchange.com), you agree to be bound by these Terms of Service.</p>

            <h2 className="text-xl font-semibold text-gray-900">2. Description of Service</h2>
            <p>ValveSpecs Pro is a global industrial valve specifications database that allows users to search, compare, and inquire about valve products from various brands and suppliers.</p>

            <h2 className="text-xl font-semibold text-gray-900">3. User Accounts</h2>
            <ul className="list-disc pl-6 space-y-2">
              <li>You must provide accurate information when creating an account.</li>
              <li>You are responsible for maintaining the security of your account credentials.</li>
              <li>You may not share your account with others.</li>
            </ul>

            <h2 className="text-xl font-semibold text-gray-900">4. Subscriptions and Payments</h2>
            <ul className="list-disc pl-6 space-y-2">
              <li>Free tier provides limited access to valve specifications.</li>
              <li>Pro subscriptions are billed monthly or annually through Creem.</li>
              <li>You may cancel your subscription at any time. Cancellation takes effect at the end of the current billing period.</li>
            </ul>

            <h2 className="text-xl font-semibold text-gray-900">5. User Content</h2>
            <p>When you submit inquiries, feedback, or tips, you grant us a non-exclusive license to use, display, and share that content on our platform.</p>

            <h2 className="text-xl font-semibold text-gray-900">6. Prohibited Conduct</h2>
            <ul className="list-disc pl-6 space-y-2">
              <li>Scraping or harvesting data from the platform.</li>
              <li>Using the service for any illegal purpose.</li>
              <li>Attempting to gain unauthorized access to other accounts or systems.</li>
            </ul>

            <h2 className="text-xl font-semibold text-gray-900">7. Limitation of Liability</h2>
            <p>Valve specifications are provided for reference purposes. We are not liable for any decisions made based on the data provided on this platform.</p>

            <h2 className="text-xl font-semibold text-gray-900">8. Changes to Terms</h2>
            <p>We may update these terms from time to time. Continued use of the service constitutes acceptance of any changes.</p>

            <h2 className="text-xl font-semibold text-gray-900">9. Contact</h2>
            <p>For questions about these Terms, contact us at nnzenw@126.com.</p>
          </div>
        </div>
      </div>
    </>
  )
}
