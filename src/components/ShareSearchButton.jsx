import { Share2, Check } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'react-hot-toast'

export default function ShareSearchButton({ searchParams }) {
  const [copied, setCopied] = useState(false)

  const hasSearchParams = Object.values(searchParams).some(v => v)

  if (!hasSearchParams) return null

  const handleShare = async () => {
    const url = new URL(window.location.href)
    const params = new URLSearchParams()

    if (searchParams.keyword) params.set('keyword', searchParams.keyword)
    if (searchParams.brand_id) params.set('brand_id', searchParams.brand_id)
    if (searchParams.valve_type_id) params.set('valve_type_id', searchParams.valve_type_id)
    if (searchParams.material) params.set('material', searchParams.material)
    if (searchParams.application) params.set('application', searchParams.application)

    const shareUrl = `${url.origin}?${params.toString()}`

    try {
      await navigator.clipboard.writeText(shareUrl)
      setCopied(true)
      toast.success('Search URL copied to clipboard')
      setTimeout(() => setCopied(false), 2000)
    } catch {
      // Fallback for older browsers
      const textArea = document.createElement('textarea')
      textArea.value = shareUrl
      document.body.appendChild(textArea)
      textArea.select()
      document.execCommand('copy')
      document.body.removeChild(textArea)
      setCopied(true)
      toast.success('Search URL copied to clipboard')
      setTimeout(() => setCopied(false), 2000)
    }
  }

  return (
    <button
      onClick={handleShare}
      className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm text-gray-600 bg-gray-100 rounded-lg hover:bg-gray-200 transition-colors"
      title="Copy search URL to share"
    >
      {copied ? (
        <Check className="w-4 h-4 text-green-600" />
      ) : (
        <Share2 className="w-4 h-4" />
      )}
      {copied ? 'Copied!' : 'Share'}
    </button>
  )
}