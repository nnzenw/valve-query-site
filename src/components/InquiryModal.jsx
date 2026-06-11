import { useState, useEffect } from 'react'
import { X, Mail, Phone, Building, Globe, Calendar, DollarSign, MessageSquare, Check } from 'lucide-react'

const BACKEND_URL = import.meta.env.VITE_BACKEND_URL || ''

export default function InquiryModal({ isOpen, onClose, brandId, brandName, valveSpecId, valveModel, valveType }) {
  const [loading, setLoading] = useState(false)
  const [submitted, setSubmitted] = useState(false)
  const [formData, setFormData] = useState({
    buyer_name: '',
    buyer_email: '',
    buyer_company: '',
    buyer_phone: '',
    buyer_country: '',
    quantity: '',
    unit: 'pieces',
    required_by: '',
    target_price: '',
    inquiry_message: '',
    technical_requirements: ''
  })

  useEffect(() => {
    if (isOpen) {
      setFormData(prev => ({
        ...prev,
        buyer_name: localStorage.getItem('inquiry_buyer_name') || '',
        buyer_email: localStorage.getItem('inquiry_buyer_email') || '',
        buyer_company: localStorage.getItem('inquiry_buyer_company') || '',
        buyer_phone: localStorage.getItem('inquiry_buyer_phone') || '',
        buyer_country: localStorage.getItem('inquiry_buyer_country') || ''
      }))
    }
  }, [isOpen])

  const handleChange = (e) => {
    const { name, value } = e.target
    setFormData(prev => ({ ...prev, [name]: value }))
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    setLoading(true)

    try {
      // Save to localStorage for convenience
      Object.entries(formData).forEach(([key, value]) => {
        if (value && key.startsWith('buyer_')) {
          localStorage.setItem(`inquiry_${key}`, value)
        }
      })

      const payload = {
        ...formData,
        brand_id: brandId,
        valve_spec_id: valveSpecId,
        quantity: formData.quantity ? parseInt(formData.quantity) : null,
        required_by: formData.required_by || null
      }

      const response = await fetch(`${BACKEND_URL}/api/inquiries/submit`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      })

      if (!response.ok) {
        throw new Error('Submission failed')
      }

      setSubmitted(true)
      setTimeout(() => {
        onClose()
        setSubmitted(false)
        setFormData({
          buyer_name: '',
          buyer_email: '',
          buyer_company: '',
          buyer_phone: '',
          buyer_country: '',
          quantity: '',
          unit: 'pieces',
          required_by: '',
          target_price: '',
          inquiry_message: '',
          technical_requirements: ''
        })
      }, 2000)

    } catch (err) {
      alert('Failed to submit inquiry. Please try again.')
      console.error(err)
    } finally {
      setLoading(false)
    }
  }

  if (!isOpen) return null

  return (
    <div className="fixed inset-0 z-50 overflow-y-auto">
      <div className="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
        {/* Backdrop */}
        <div className="fixed inset-0 bg-gray-500/75 transition-opacity" onClick={onClose}></div>

        {/* Modal */}
        <div className="relative z-10 inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
          <div className="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-semibold text-gray-900">
                {submitted ? 'Inquiry Submitted!' : `Request Quote: ${brandName}`}
              </h3>
              <button onClick={onClose} className="text-gray-400 hover:text-gray-500">
                <X className="w-5 h-5" />
              </button>
            </div>

            {submitted ? (
              <div className="text-center py-8">
                <div className="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-green-100 mb-4">
                  <Check className="h-6 w-6 text-green-600" />
                </div>
                <h4 className="text-lg font-medium text-gray-900 mb-2">Thank You!</h4>
                <p className="text-gray-600">
                  Your inquiry has been submitted. Suppliers will contact you soon.
                </p>
              </div>
            ) : (
              <form onSubmit={handleSubmit}>
                <div className="space-y-4">
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        <Mail className="w-4 h-4 inline mr-1" />
                        Your Name *
                      </label>
                      <input
                        type="text"
                        name="buyer_name"
                        value={formData.buyer_name}
                        onChange={handleChange}
                        required
                        className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                        placeholder="John Smith"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        <Mail className="w-4 h-4 inline mr-1" />
                        Email *
                      </label>
                      <input
                        type="email"
                        name="buyer_email"
                        value={formData.buyer_email}
                        onChange={handleChange}
                        required
                        className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                        placeholder="john@company.com"
                      />
                    </div>
                  </div>

                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        <Building className="w-4 h-4 inline mr-1" />
                        Company
                      </label>
                      <input
                        type="text"
                        name="buyer_company"
                        value={formData.buyer_company}
                        onChange={handleChange}
                        className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                        placeholder="Your company name"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        <Phone className="w-4 h-4 inline mr-1" />
                        Phone
                      </label>
                      <input
                        type="tel"
                        name="buyer_phone"
                        value={formData.buyer_phone}
                        onChange={handleChange}
                        className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                        placeholder="+1 (555) 123-4567"
                      />
                    </div>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      <Globe className="w-4 h-4 inline mr-1" />
                      Country
                    </label>
                    <input
                      type="text"
                      name="buyer_country"
                      value={formData.buyer_country}
                      onChange={handleChange}
                      className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                      placeholder="United States"
                    />
                  </div>

                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Quantity
                      </label>
                      <input
                        type="number"
                        name="quantity"
                        value={formData.quantity}
                        onChange={handleChange}
                        min="1"
                        className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                        placeholder="100"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Unit
                      </label>
                      <select
                        name="unit"
                        value={formData.unit}
                        onChange={handleChange}
                        className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                      >
                        <option value="pieces">Pieces</option>
                        <option value="sets">Sets</option>
                        <option value="tons">Tons</option>
                        <option value="meters">Meters</option>
                      </select>
                    </div>
                  </div>

                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        <Calendar className="w-4 h-4 inline mr-1" />
                        Required By
                      </label>
                      <input
                        type="date"
                        name="required_by"
                        value={formData.required_by}
                        onChange={handleChange}
                        className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        <DollarSign className="w-4 h-4 inline mr-1" />
                        Target Price
                      </label>
                      <input
                        type="text"
                        name="target_price"
                        value={formData.target_price}
                        onChange={handleChange}
                        className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                        placeholder="e.g., $500-800 per piece"
                      />
                    </div>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      <MessageSquare className="w-4 h-4 inline mr-1" />
                      Inquiry Message
                    </label>
                    <textarea
                      name="inquiry_message"
                      value={formData.inquiry_message}
                      onChange={handleChange}
                      rows="3"
                      className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                      placeholder="Tell us about your project requirements..."
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Technical Requirements
                    </label>
                    <textarea
                      name="technical_requirements"
                      value={formData.technical_requirements}
                      onChange={handleChange}
                      rows="2"
                      className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                      placeholder="Special certifications, material grades, testing requirements..."
                    />
                  </div>
                </div>

                <div className="mt-6 flex justify-end gap-3">
                  <button
                    type="button"
                    onClick={onClose}
                    className="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-md"
                  >
                    Cancel
                  </button>
                  <button
                    type="submit"
                    disabled={loading}
                    className="px-4 py-2 text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 rounded-md disabled:opacity-50"
                  >
                    {loading ? 'Submitting...' : 'Submit Inquiry'}
                  </button>
                </div>
              </form>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}