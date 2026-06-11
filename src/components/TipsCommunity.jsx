import { useState } from 'react'
import { Lightbulb, Search, ThumbsUp, MessageSquare, Clock, User, Filter, TrendingUp, Plus, X } from 'lucide-react'
import SubmitTipModal from './SubmitTipModal'
import { toast } from 'react-hot-toast'

// Demo data (shown when database not connected)
const ALL_TIPS = [
  { id: '1', title: 'Top 5 Valve Selection Mistakes for Procurement Engineers', content: '1. Price fixation: a 30% cheaper valve may last only 1/3 as long\n2. Be specific with materials: write SS304 or SS316, not just "stainless steel"\n3. Define all service parameters: temp, pressure, media, flow rate\n4. Confirm standard system: API, ASME, DIN, GB cannot be mixed\n5. Include warranty terms: at least 12 months, 24 months for critical valves', tags: ['Procurement', 'Gotchas', 'Newbie'], difficulty: 'beginner', author_name: 'Senior Buyer Lee', like_count: 67, view_count: 4300, comments_count: 12, created_at: '2026-05-30' },
  { id: '2', title: 'How to Judge Valve Quality? 5-Minute On-Site Inspection', content: '1. Visual: smooth casting surface, no blowholes, clear markings\n2. Sealing: pressure test and observe leakage\n3. Stem: smooth rotation, no binding or hesitation\n4. Flange: no scratches on sealing face\n5. Documentation: material cert, pressure test report, certificate of conformity', tags: ['Procurement', 'Inspection', 'Quality'], difficulty: 'intermediate', author_name: 'QC Zhao', like_count: 53, view_count: 2800, comments_count: 8, created_at: '2026-05-28' },
  { id: '3', title: '3 Common Ball Valve Selection Mistakes', content: '1. Particulate media with ball valve: use plug valve or V-port ball instead\n2. Ignoring seal material at high pressure drop: PTFE creeps at high temperature\n3. Fire-safe scenario without fire-safe design: must use API 607/6FA certified', tags: ['Selection', 'Ball Valve', 'Gotchas'], difficulty: 'intermediate', author_name: 'Valve Pro Notes', like_count: 42, view_count: 1580, comments_count: 7, created_at: '2026-05-26' },
  { id: '4', title: 'Butterfly vs Ball Valve: When Is Butterfly More Cost-Effective?', content: 'Butterfly advantage: large bore (DN200+) costs 1/3-1/2 of ball valve\nButterfly disadvantage: sealing not as tight as ball valve\nVerdict: water treatment & HVAC use butterfly; chemical & oil/gas use ball valve', tags: ['Compare', 'Selection', 'Butterfly'], difficulty: 'beginner', author_name: 'Chemical Engineer Zhao', like_count: 35, view_count: 2100, comments_count: 5, created_at: '2026-05-24' },
  { id: '5', title: 'Common Gate Valve Leak Causes and Fixes', content: '1. Stem packing leak: tighten or replace packing\n2. Gate seat wear: grind to repair\n3. Body blowholes: weld repair\nPrevention: fully open or fully closed only; never use as control valve', tags: ['Maintenance', 'Gate Valve', 'Troubleshooting'], difficulty: 'advanced', author_name: 'Master Tech Wang', like_count: 31, view_count: 1340, comments_count: 6, created_at: '2026-05-22' },
  { id: '6', title: 'Double vs Triple Offset Butterfly Valve: How to Choose?', content: 'Double offset: medium/low pressure, great value for money\nTriple offset: high pressure, high temp, bubble-tight shutoff\nKey indicator: temp > 200 deg C go triple offset; pressure > PN25 go triple offset', tags: ['Selection', 'Butterfly', 'Tech'], difficulty: 'intermediate', author_name: 'Butterfly Valve Pro', like_count: 19, view_count: 760, comments_count: 3, created_at: '2026-05-20' },
  { id: '7', title: 'Rising Stem vs Non-Rising Stem Gate Valve', content: 'Rising stem (OS&Y): stem moves up/down, visible status\nNon-rising: stem stays hidden, compact height\nRecommendation: petrochemical requires OS&Y; water treatment can use non-rising', tags: ['Selection', 'Gate Valve', 'Compare'], difficulty: 'beginner', author_name: 'Supply Chain Zhang', like_count: 24, view_count: 1120, comments_count: 4, created_at: '2026-05-18' },
  { id: '8', title: 'DN50 and Below Ball Valves: 2-Piece or 3-Piece?', content: '2-piece: lower cost, standard service\n3-piece: inline serviceable for maintenance\nRecommendation: limited space? Go 3-piece to avoid removing pipe for repairs', tags: ['Selection', 'Ball Valve', 'Installation'], difficulty: 'beginner', author_name: 'Field Engineer Lee', like_count: 28, view_count: 920, comments_count: 3, created_at: '2026-05-16' },
]

const ALL_TAGS = ['Selection', 'Procurement', 'Maintenance', 'Ball Valve', 'Butterfly', 'Gate Valve', 'Gotchas', 'Compare', 'Installation', 'Inspection', 'Troubleshooting', 'Tech', 'Quality', 'Newbie']

export default function TipsCommunity({ onClose }) {
  const [tips, setTips] = useState(ALL_TIPS)
  const [keyword, setKeyword] = useState('')
  const [activeTag, setActiveTag] = useState('')
  const [activeDifficulty, setActiveDifficulty] = useState('')
  const [likedTips, setLikedTips] = useState(new Set())
  const [showSubmit, setShowSubmit] = useState(false)
  const [sortBy, setSortBy] = useState('latest')

  const filteredTips = tips
    .filter(tip => {
      if (keyword) {
        const kw = keyword.toLowerCase()
        return tip.title.toLowerCase().includes(kw) || 
               tip.content.toLowerCase().includes(kw) ||
               tip.tags.some(t => t.includes(kw))
      }
      return true
    })
    .filter(tip => activeTag ? tip.tags.includes(activeTag) : true)
    .filter(tip => activeDifficulty ? tip.difficulty === activeDifficulty : true)
    .sort((a, b) => {
      if (sortBy === 'popular') return (b.like_count + b.view_count / 10) - (a.like_count + a.view_count / 10)
      if (sortBy === 'latest') return new Date(b.created_at) - new Date(a.created_at)
      return 0
    })

  const handleLike = (tipId) => {
    if (likedTips.has(tipId)) { toast('Already liked'); return }
    setTips(prev => prev.map(t => t.id === tipId ? { ...t, like_count: t.like_count + 1 } : t))
    setLikedTips(prev => new Set([...prev, tipId]))
    toast('Liked! 👍')
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

  const diffColor = (d) => {
    if (d === 'beginner') return 'text-green-600 bg-green-50'
    if (d === 'intermediate') return 'text-yellow-600 bg-yellow-50'
    return 'text-red-600 bg-red-50'
  }
  const diffLabel = (d) => {
    if (d === 'beginner') return 'Beginner'
    if (d === 'intermediate') return 'Intermediate'
    return 'Expert'
  }

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-white rounded-xl shadow-2xl max-w-6xl w-full max-h-[95vh] flex flex-col" onClick={e => e.stopPropagation()}>
        {/* Header */}
        <div className="sticky top-0 bg-white border-b border-gray-200 px-6 py-4 rounded-t-xl">
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center gap-3">
              <Lightbulb className="w-6 h-6 text-yellow-500" />
              <div>
                <h2 className="text-xl font-bold text-gray-900">Community</h2>
                <p className="text-xs text-gray-500">{tips.length}  tips shared by engineers</p>
              </div>
            </div>
            <div className="flex items-center gap-2">
              <button 
                onClick={() => setShowSubmit(true)}
                className="flex items-center gap-1.5 px-4 py-2 bg-gradient-to-r from-yellow-500 to-orange-500 text-white rounded-lg text-sm font-medium hover:from-yellow-600 hover:to-orange-600"
              >
                <Plus className="w-4 h-4" />
                Share Tip
              </button>
              <button onClick={onClose} className="p-2 hover:bg-gray-100 rounded-lg" aria-label="Close tips community">
                <X className="w-5 h-5" />
              </button>
            </div>
          </div>

          {/* Search + sort */}
          <div className="flex gap-3">
            <div className="flex-1 relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
              <input
                type="text"
                value={keyword}
                onChange={e => setKeyword(e.target.value)}
                placeholder="Search tips..."
                aria-label="Search tips"
                className="w-full pl-9 pr-4 py-2 border border-gray-200 rounded-lg text-sm focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <select 
              value={sortBy}
              onChange={e => setSortBy(e.target.value)}
              className="px-3 py-2 border border-gray-200 rounded-lg text-sm bg-white"
              aria-label="Sort tips by"
            >
              <option value="latest">Latest</option>
              <option value="popular">Hottest</option>
            </select>
          </div>
        </div>

        {/* TagsFilter */}
        <div className="px-6 py-3 border-b border-gray-100 flex flex-wrap gap-1.5">
          <button
            onClick={() => setActiveTag('')}
            className={`px-3 py-1 text-xs rounded-full ${!activeTag ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}
          >
            All
          </button>
          {ALL_TAGS.map(tag => (
            <button
              key={tag}
              onClick={() => setActiveTag(activeTag === tag ? '' : tag)}
              className={`px-3 py-1 text-xs rounded-full ${activeTag === tag ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}
            >
              #{tag}
            </button>
          ))}
        </div>

        {/* Content List */}
        <div className="flex-1 overflow-auto p-6">
          {filteredTips.length === 0 ? (
            <div className="text-center py-16">
              <Lightbulb className="w-16 h-16 mx-auto text-gray-200 mb-4" />
              <p className="text-gray-500">No matching tips found</p>
              <button onClick={() => setShowSubmit(true)} className="mt-4 text-blue-600 text-sm hover:underline">
                Be the first to share
              </button>
            </div>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {filteredTips.map(tip => (
                <div key={tip.id} className="bg-gray-50 rounded-lg p-4 hover:bg-blue-50 transition-colors border border-gray-100 hover:border-blue-200">
                  <div className="flex items-start justify-between mb-2">
                    <h3 className="text-sm font-semibold text-gray-900 leading-snug">{tip.title}</h3>
                    <span className={`text-[10px] px-1.5 py-0.5 rounded shrink-0 ml-2 ${diffColor(tip.difficulty)}`}>
                      {diffLabel(tip.difficulty)}
                    </span>
                  </div>
                  
                  <p className="text-xs text-gray-600 mb-2 line-clamp-2 whitespace-pre-line">{tip.content}</p>
                  
                  <div className="flex flex-wrap gap-1 mb-3">
                    {tip.tags.map((t, i) => (
                      <span key={i} className="text-[10px] px-1.5 py-0.5 bg-white text-gray-500 rounded border border-gray-200">#{t}</span>
                    ))}
                  </div>
                  
                  <div className="flex items-center justify-between text-[11px] text-gray-400 border-t border-gray-200 pt-2">
                    <div className="flex items-center gap-2">
                      <span className="flex items-center gap-1"><User className="w-3 h-3" />{tip.author_name}</span>
                      <span className="flex items-center gap-1"><Clock className="w-3 h-3" />{tip.created_at}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <button onClick={() => handleLike(tip.id)} className="flex items-center gap-1 hover:text-blue-500">
                        <ThumbsUp className="w-3 h-3" />{tip.like_count}
                      </button>
                      <span className="flex items-center gap-1"><MessageSquare className="w-3 h-3" />{tip.comments_count}</span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
      
      {showSubmit && <SubmitTipModal onClose={() => setShowSubmit(false)} onSubmit={handleNewTip} />}
    </div>
  )
}
