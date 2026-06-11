import { useState } from 'react'
import { Lightbulb, ThumbsUp, MessageSquare, Tag, ChevronDown, ChevronUp, Clock, User } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { toast } from 'react-hot-toast'
import SubmitTipModal from './SubmitTipModal'

// Demo data (shown when database not connected)
const DEMO_TIPS = [
  {
    id: 'demo-1',
    title: '3 Common Ball Valve Selection Mistakes',
    content: '1. Particulate media with ball valve: use plug valve or V-port ball instead\n2. High pressure drop ignoring seal material: PTFE creeps at high temp\n3. Fire-safe scenario without fire-safe design: API 607/6FA certification required',
    tags: ['Selection', 'Ball Valve', 'Gotchas'],
    difficulty: 'intermediate',
    author_name: 'Valve Pro Notes',
    like_count: 42,
    view_count: 1580,
    comments_count: 7,
    created_at: '2026-05-28'
  },
  {
    id: 'demo-2',
    title: 'DN50 Ball Valves: 2-Piece or 3-Piece?',
    content: '2-piece: lower cost for standard service\n3-piece: inline serviceable for frequent maintenance\n\nTip: limited installation space? Go 3-piece to avoid removing pipework for repair.',
    tags: ['Selection', 'Ball Valve', 'Installation'],
    difficulty: 'beginner',
    author_name: 'Field Engineer Lee',
    like_count: 28,
    view_count: 920,
    comments_count: 3,
    created_at: '2026-05-25'
  }
]

export default function TipsSection({ valveType, brandName }) {
  const [tips, setTips] = useState(DEMO_TIPS)
  const [showAll, setShowAll] = useState(false)
  const [showSubmit, setShowSubmit] = useState(false)
  const [likedTips, setLikedTips] = useState(new Set())
  
  const displayedTips = showAll ? tips : tips.slice(0, 2)
  
  // 根据当前Valve Type和Brands过滤
  const relevantTips = displayedTips.filter(tip => {
    const kw = (valveType || brandName || '').toLowerCase()
    if (!kw) return true
    return tip.title.toLowerCase().includes(kw) || 
           tip.tags.some(t => t.includes(kw)) ||
           tip.content.toLowerCase().includes(kw)
  })
  
  const handleLike = async (tipId) => {
    if (likedTips.has(tipId)) {
      toast('You have already liked this')
      return
    }
    setTips(prev => prev.map(t => 
      t.id === tipId ? { ...t, like_count: t.like_count + 1 } : t
    ))
    setLikedTips(prev => new Set([...prev, tipId]))
    toast('Thanks for the like! 👍')
  }
  
  const handleNewTip = (newTip) => {
    setTips(prev => [{
      ...newTip,
      id: 'tip-' + Date.now(),
      like_count: 0,
      view_count: 0,
      comments_count: 0,
      created_at: new Date().toISOString().split('T')[0]
    }, ...prev])
  }
  
  const diffLabel = (d) => {
    if (d === 'beginner') return { text: 'Beginner', color: 'text-green-600 bg-green-50' }
    if (d === 'intermediate') return { text: 'Intermediate', color: 'text-yellow-600 bg-yellow-50' }
    return { text: 'Expert', color: 'text-red-600 bg-red-50' }
  }
  
  if (tips.length === 0 && !showSubmit) {
    return (
      <div className="bg-white rounded-lg border border-gray-200 p-6 text-center">
        <Lightbulb className="w-10 h-10 mx-auto text-gray-300 mb-3" />
        <h3 className="text-sm font-medium text-gray-700 mb-2">No tips yet</h3>
        <p className="text-xs text-gray-500 mb-4">Share the first tip!</p>
        <button 
          onClick={() => setShowSubmit(true)}
          className="px-4 py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700"
        >
          Share Tip
        </button>
        {showSubmit && <SubmitTipModal onClose={() => setShowSubmit(false)} onSubmit={handleNewTip} />}
      </div>
    )
  }
  
  return (
    <div className="bg-white rounded-lg border border-gray-200 overflow-hidden">
      <div className="px-4 py-3 border-b border-gray-100 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <Lightbulb className="w-4 h-4 text-yellow-500" />
          <h3 className="text-sm font-semibold text-gray-900">Tips</h3>
          {tips.length > 0 && (
            <span className="text-xs text-gray-400">({tips.length})</span>
          )}
        </div>
        <button 
          onClick={() => setShowSubmit(true)}
          className="text-xs text-blue-600 hover:text-blue-700 font-medium"
        >
          + Share Tip
        </button>
      </div>
      
      <div className="divide-y divide-gray-100">
        {relevantTips.map(tip => {
          const diff = diffLabel(tip.difficulty)
          return (
            <div key={tip.id} className="px-4 py-3 hover:bg-gray-50 transition-colors">
              <div className="flex items-start gap-2 mb-1">
                <h4 className="text-sm font-medium text-gray-900 flex-1">{tip.title}</h4>
                <span className={`text-[10px] px-1.5 py-0.5 rounded ${diff.color}`}>{diff.text}</span>
              </div>
              
              <p className="text-xs text-gray-600 mb-2 line-clamp-2 whitespace-pre-line">{tip.content}</p>
              
              <div className="flex flex-wrap gap-1 mb-2">
                {tip.tags.map((tag, i) => (
                  <span key={i} className="text-[10px] px-1.5 py-0.5 bg-gray-100 text-gray-500 rounded">
                    #{tag}
                  </span>
                ))}
              </div>
              
              <div className="flex items-center justify-between text-xs text-gray-400">
                <div className="flex items-center gap-3">
                  <span className="flex items-center gap-1">
                    <User className="w-3 h-3" />
                    {tip.author_name}
                  </span>
                  <span className="flex items-center gap-1">
                    <Clock className="w-3 h-3" />
                    {tip.created_at}
                  </span>
                </div>
                <div className="flex items-center gap-3">
                  <button 
                    onClick={() => handleLike(tip.id)}
                    className="flex items-center gap-1 hover:text-blue-500"
                  >
                    <ThumbsUp className="w-3 h-3" />
                    {tip.like_count}
                  </button>
                  <span className="flex items-center gap-1">
                    <MessageSquare className="w-3 h-3" />
                    {tip.comments_count}
                  </span>
                </div>
              </div>
            </div>
          )
        })}
      </div>
      
      {tips.length > 2 && (
        <button 
          onClick={() => setShowAll(!showAll)}
          className="w-full px-4 py-2 text-xs text-blue-600 hover:bg-blue-50 flex items-center justify-center gap-1 border-t border-gray-100"
        >
          {showAll ? 'Collapse' : `View All ${tips.length} Tips`}
          {showAll ? <ChevronUp className="w-3 h-3" /> : <ChevronDown className="w-3 h-3" />}
        </button>
      )}
      
      {showSubmit && <SubmitTipModal onClose={() => setShowSubmit(false)} onSubmit={handleNewTip} />}
    </div>
  )
}
