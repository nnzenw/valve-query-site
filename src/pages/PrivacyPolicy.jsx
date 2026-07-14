import SEO from '../components/seo/SEO'

export default function PrivacyPolicy() {
  return (
    <>
      <SEO
        title="Privacy Policy"
        description="Privacy Policy for ValveSpecs Pro - Global Industrial Valve Specifications Database"
        canonical="https://valve.tradesxchange.com/privacy"
      />
      <div className="min-h-screen bg-gray-50">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
          <a href="/" className="text-blue-600 hover:underline text-sm">&larr; Back to Home</a>
          <h1 className="text-3xl font-bold text-gray-900 mt-6 mb-8">Privacy Policy</h1>
          <div className="prose prose-gray max-w-none space-y-6 text-gray-700">
            <p><strong>Last updated:</strong> June 18, 2026</p>

            <h2 className="text-xl font-semibold text-gray-900">1. Introduction</h2>
            <p>ValveSpecs Pro ("we", "our", "us") operates the valve.tradesxchange.com website. This Privacy Policy explains how we collect, use, and protect your personal information.</p>

            <h2 className="text-xl font-semibold text-gray-900">2. Information We Collect</h2>
            <ul className="list-disc pl-6 space-y-2">
              <li><strong>Account Information:</strong> Name, email address, and password when you register.</li>
              <li><strong>Usage Data:</strong> Search queries, pages visited, and interaction patterns.</li>
              <li><strong>Inquiry Data:</strong> Information submitted through the Request Quote form, including company name, phone, and project requirements.</li>
              <li><strong>Payment Information:</strong> Processed securely through our payment provider (Creem). We do not store credit card details.</li>
            </ul>

            <h2 className="text-xl font-semibold text-gray-900">3. How We Use Your Information</h2>
            <ul className="list-disc pl-6 space-y-2">
              <li>To provide and improve our services.</li>
              <li>To process your subscription and payments.</li>
              <li>To send inquiry responses from suppliers.</li>
              <li>To send service-related notifications.</li>
            </ul>

            <h2 className="text-xl font-semibold text-gray-900">4. Data Sharing</h2>
            <p>We do not sell your personal data. We may share information with:</p>
            <ul className="list-disc pl-6 space-y-2">
              <li>Suppliers, when you submit an inquiry through our platform.</li>
              <li>Service providers (hosting, payment processing) necessary to operate the service.</li>
            </ul>

            <h2 className="text-xl font-semibold text-gray-900">5. Data Security</h2>
            <p>We use industry-standard security measures including HTTPS encryption, row-level security in our database, and secure authentication via Supabase.</p>

            <h2 className="text-xl font-semibold text-gray-900">6. Your Rights</h2>
            <p>You can access, update, or delete your account at any time by contacting us or through your account settings.</p>

            <h2 className="text-xl font-semibold text-gray-900">7. Contact</h2>
            <p>For privacy-related inquiries, contact us at nnzenw@126.com.</p>
          </div>
        </div>
      </div>
    </>
  )
}
