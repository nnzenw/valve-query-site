import { Globe, Calendar, Tag, ArrowRight, ThumbsUp, AlertCircle, Star, Plus, Check } from 'lucide-react'
import { useComparison } from '../lib/ComparisonContext'
import { getHealthScoreColor } from '../lib/utils'

export default function ValveCard({ valve, onClick, onFeedback }) {
  const brand = valve.brands
  const valveType = valve.valve_types
  const { addToComparison, removeFromComparison, isInComparison } = useComparison()
  const inComparison = isInComparison(valve.id)

  const handleLike = (e) => {
    e.stopPropagation()
    onFeedback?.(valve.id, 'like')
  }
  
  const handleDislike = (e) => {
    e.stopPropagation()
    onFeedback?.(valve.id, 'dislike')
  }
  
  return (
    <div 
      onClick={onClick}
      className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-lg hover:border-blue-300 transition-all cursor-pointer group min-h-[340px] flex flex-col"
    >
      <div className="flex items-start justify-between mb-4">
        <div className="flex items-center gap-3">
          {brand?.logo_url ? (
            <img src={brand.logo_url} alt={brand.name} loading="lazy" className="w-10 h-10 rounded-lg object-contain bg-gray-50" />
          ) : (
            <div className="w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center text-blue-600 font-bold text-sm">
              {brand?.name?.[0] || '?'}
            </div>
          )}
          <div>
            <h3 className="text-lg font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">
              {valveType?.name || valve.type || 'Unknown'}
            </h3>
            <p className="text-sm text-gray-600 mt-1">{brand?.name}</p>
          </div>
        </div>
        <Tag className="w-5 h-5 text-gray-400 group-hover:text-blue-500" />
      </div>

      <div className="space-y-2 text-sm text-gray-600">
        {valve.size_range && (
          <div className="flex items-center gap-2">
            <span className="font-medium text-gray-700">Size:</span>
            <span>{valve.size_range}</span>
          </div>
        )}
        {valve.pressure_range && (
          <div className="flex items-center gap-2">
            <span className="font-medium text-gray-700">Pressure:</span>
            <span>{valve.pressure_range}</span>
          </div>
        )}
        {valve.body_material && (
          <div className="flex items-center gap-2">
            <span className="font-medium text-gray-700">Material:</span>
            <span>{valve.body_material}</span>
          </div>
        )}
        {valve.standard && (
          <div className="flex items-center gap-2">
            <span className="font-medium text-gray-700">Standard:</span>
            <span>{valve.standard}</span>
          </div>
        )}
      </div>

      {/* Rating display */}
      {(valve.health_score !== undefined || valve.average_rating) && (
        <div className="mt-3 flex items-center gap-2">
          {valve.average_rating ? (
            <span className="inline-flex items-center gap-1 text-xs text-yellow-600">
              <Star className="w-3 h-3 fill-current" />
              {valve.average_rating.toFixed(1)}
            </span>
          ) : null}
          {valve.health_score !== undefined && (
            <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium ${getHealthScoreColor(valve.health_score)}`}>
              Health: {valve.health_score}
            </span>
          )}
        </div>
      )}

      {brand?.country && (
        <div className="mt-4 pt-4 border-t border-gray-100 flex items-center gap-2 text-xs text-gray-500">
          <Globe className="w-4 h-4" />
          {brand.country}
          {brand.established && (
            <>
              <span className="mx-1">·</span>
              <Calendar className="w-4 h-4" />
              Est. {brand.established}
            </>
          )}
        </div>
      )}

      <div className="mt-4 flex items-center justify-between">
        <div className="flex flex-wrap gap-1">
          {valve.applications?.slice(0, 2).map((app, idx) => (
            <span key={idx} className="px-2 py-1 bg-blue-50 text-blue-700 text-xs rounded-full">
              {app}
            </span>
          ))}
        </div>
        <ArrowRight className="w-4 h-4 text-gray-400 group-hover:text-blue-500 transition-colors" />
      </div>
      
      {/* Interaction Buttons */}
      <div className="mt-3 pt-3 border-t border-gray-100 flex items-center gap-3">
        <button 
          onClick={handleLike}
          className="flex items-center gap-1 text-xs text-gray-500 hover:text-green-600 hover:bg-green-50 px-2 py-1 rounded transition-colors"
          title="Helpful"
        >
          <ThumbsUp className="w-3 h-3" />
          <span>{valve.like_count || 0}</span>
        </button>
        <button 
          onClick={handleDislike}
          className="flex items-center gap-1 text-xs text-gray-500 hover:text-red-600 hover:bg-red-50 px-2 py-1 rounded transition-colors"
          title="Report Error"
        >
          <AlertCircle className="w-3 h-3" />
          <span>Report</span>
        </button>
        <div className="flex-1"></div>
        <button
          onClick={(e) => {
            e.stopPropagation()
            inComparison ? removeFromComparison(valve.id) : addToComparison(valve)
          }}
          className={`flex items-center gap-1 text-xs px-2 py-1 rounded transition-colors ${
            inComparison 
              ? 'bg-blue-100 text-blue-700' 
              : 'text-gray-500 hover:text-blue-600 hover:bg-blue-50'
          }`}
        >
          {inComparison ? <Check className="w-3 h-3" /> : <Plus className="w-3 h-3" />}
          <span>{inComparison ? 'Added' : 'Compare'}</span>
        </button>
      </div>
    </div>
  )
}
