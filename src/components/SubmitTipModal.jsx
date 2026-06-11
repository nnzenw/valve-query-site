import { useState } from 'react'
import { X, Lightbulb } from 'lucide-react'
import { toast } from 'react-hot-toast'

export default function SubmitTipModal({ onClose, onSubmit, prefillType }) {
  const [title, setTitle] = useState('')
  const [content, setContent] = useState('')
  const [tags, setTags] = useState('')
  const [difficulty, setDifficulty] = useState('intermediate')
  const [authorName, setAuthorName] = useState('')
  const [submitting, setSubmitting] = useState(false)

  const handleSubmit = async () => {
    if (!title.trim()) return toast.error('Please enter a title')
    if (!content.trim()) return toast.error('Please enter content')
    if (content.trim().length < 20) return toast.error('Content must be at least 20 characters')

    setSubmitting(true)
    
    // 模拟Submit（后续接 Supabase 真实存储）
    setTimeout(() => {
      onSubmit({
        title: title.trim(),
        content: content.trim(),
        tags: tags.split(/[,，]/).map(t => t.trim()).filter(Boolean),
        difficulty,
        author_name: authorName.trim() || 'Anonymous Engineer'
      })
      toast.success('Thanks! Will show after review')
      setSubmitting(false)
      onClose()
    }, 800)
  }

  const difficultyOptions = [
    { value: 'beginner', label: 'Beginner', desc: 'Fundamentals, new to valves' },
    { value: 'intermediate', label: 'Intermediate', desc: 'Some experience, practical cases' },
    { value: 'advanced', label: 'Expert', desc: 'Deep tech, troubleshooting' }
  ]

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-[70] p-4" onClick={onClose}>
      <div className="bg-white rounded-xl shadow-2xl max-w-lg w-full max-h-[90vh] overflow-y-auto" onClick={e => e.stopPropagation()}>
        <div className="sticky top-0 bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between rounded-t-xl">
          <div className="flex items-center gap-2">
            <Lightbulb className="w-5 h-5 text-yellow-500" />
            <h2 className="text-lg font-bold text-gray-900">Share Selection Tip</h2>
          </div>
          <button onClick={onClose} className="p-1 hover:bg-gray-100 rounded-lg" aria-label="Close">
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="p-6 space-y-5">
          {/* Title */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Title *</label>
            <input
              type="text"
              value={title}
              onChange={e => setTitle(e.target.value)}
              placeholder="e.g. Top 3 ball valve selection mistakes"
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-sm"
            />
          </div>

          {/* Body */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Tips *(min. 20 chars)</label>
            <textarea
              value={content}
              onChange={e => setContent(e.target.value)}
              placeholder="Share your valve selection, installation, maintenance tips...&#10;Multi-line supported. Include specific scenarios and solutions"
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-sm"
              rows={6}
            />
            <p className="text-xs text-gray-400 mt-1">{content.length} characters</p>
          </div>

          {/* Difficulty */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">Difficulty Level</label>
            <div className="grid grid-cols-3 gap-2">
              {difficultyOptions.map(opt => (
                <button
                  key={opt.value}
                  onClick={() => setDifficulty(opt.value)}
                  className={`p-3 rounded-lg text-xs text-left border transition-colors ${
                    difficulty === opt.value
                      ? 'border-blue-500 bg-blue-50 text-blue-700'
                      : 'border-gray-200 hover:border-gray-300'
                  }`}
                >
                  <div className="font-medium">{opt.label}</div>
                  <div className="text-[10px] text-gray-500 mt-0.5">{opt.desc}</div>
                </button>
              ))}
            </div>
          </div>

          {/* Tags */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Tags (comma separated)</label>
            <input
              type="text"
              value={tags}
              onChange={e => setTags(e.target.value)}
              placeholder="e.g. Selection, ball valve, Gotchas"
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-sm"
            />
          </div>

          {/* Author Name */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Name (optional)</label>
            <input
              type="text"
              value={authorName}
              onChange={e => setAuthorName(e.target.value)}
              placeholder='Your name, leave blank for "Anonymous Engineer"'
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-sm"
            />
          </div>

          {/* Submit */}
          <button
            onClick={handleSubmit}
            disabled={submitting}
            className="w-full py-3 bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-lg font-medium hover:from-blue-700 hover:to-indigo-700 transition-colors disabled:opacity-50"
          >
            {submitting ? 'Submitting...' : 'Publish Tip'}
          </button>

          <p className="text-xs text-gray-400 text-center">
            Will show after review. Content must be factual and non-confidential.
          </p>
        </div>
      </div>
    </div>
  )
}
