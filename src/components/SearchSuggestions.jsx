import { Clock, TrendingUp, X } from 'lucide-react'
import { getSearchHistory, clearSearchHistory, getSearchHistoryDisplay } from '../lib/searchHistory'

export default function SearchSuggestions({
  keyword,
  onSelect,
  onClose,
  brands,
  valveTypes,
  showHistory,
  onClearHistory
}) {
  const history = getSearchHistory()

  // Generate suggestions based on keyword
  const brandSuggestions = keyword
    ? brands.filter(b => b.name.toLowerCase().includes(keyword.toLowerCase())).slice(0, 3)
    : []

  const typeSuggestions = keyword
    ? valveTypes.filter(t => t.name.toLowerCase().includes(keyword.toLowerCase())).slice(0, 3)
    : []

  const hasSuggestions = brandSuggestions.length > 0 || typeSuggestions.length > 0
  const showHistorySection = showHistory && history.length > 0 && !keyword

  if (!hasSuggestions && !showHistorySection) return null

  return (
    <div className="absolute top-full left-0 right-0 mt-1 bg-white border border-gray-200 rounded-lg shadow-lg z-50 max-h-96 overflow-y-auto">
      {/* Search History */}
      {showHistorySection && (
        <div className="p-2">
          <div className="flex items-center justify-between px-2 py-1">
            <span className="text-xs font-medium text-gray-500 uppercase">Recent Searches</span>
            <button
              onClick={(e) => {
                e.stopPropagation()
                onClearHistory()
              }}
              className="text-xs text-gray-400 hover:text-red-500"
            >
              Clear
            </button>
          </div>
          {history.map((item, idx) => (
            <button
              key={idx}
              onClick={() => onSelect(item)}
              className="w-full text-left px-3 py-2 rounded-md hover:bg-gray-50 flex items-center gap-2 text-sm"
            >
              <Clock className="w-4 h-4 text-gray-400 flex-shrink-0" />
              <span className="text-gray-700 truncate">{getSearchHistoryDisplay(item)}</span>
            </button>
          ))}
        </div>
      )}

      {/* Brand Suggestions */}
      {brandSuggestions.length > 0 && (
        <div className="p-2 border-t border-gray-100">
          <span className="text-xs font-medium text-gray-500 uppercase px-2">Brands</span>
          {brandSuggestions.map(brand => (
            <button
              key={brand.id}
              onClick={() => onSelect({ keyword: brand.name, brand_id: brand.id })}
              className="w-full text-left px-3 py-2 rounded-md hover:bg-blue-50 flex items-center gap-2 text-sm"
            >
              <TrendingUp className="w-4 h-4 text-blue-500 flex-shrink-0" />
              <span className="text-gray-700">{brand.name}</span>
              {brand.country && (
                <span className="text-gray-400 text-xs ml-auto">{brand.country}</span>
              )}
            </button>
          ))}
        </div>
      )}

      {/* Valve Type Suggestions */}
      {typeSuggestions.length > 0 && (
        <div className="p-2 border-t border-gray-100">
          <span className="text-xs font-medium text-gray-500 uppercase px-2">Valve Types</span>
          {typeSuggestions.map(type => (
            <button
              key={type.id}
              onClick={() => onSelect({ keyword: type.name, valve_type_id: type.id })}
              className="w-full text-left px-3 py-2 rounded-md hover:bg-blue-50 flex items-center gap-2 text-sm"
            >
              <TrendingUp className="w-4 h-4 text-blue-500 flex-shrink-0" />
              <span className="text-gray-700">{type.name}</span>
            </button>
          ))}
        </div>
      )}

      {/* Close button */}
      <div className="p-2 border-t border-gray-100">
        <button
          onClick={onClose}
          className="w-full text-center text-xs text-gray-400 hover:text-gray-600 py-1"
        >
          Press ESC to close
        </button>
      </div>
    </div>
  )
}