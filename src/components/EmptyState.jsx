import { Search, RefreshCw } from 'lucide-react'

export default function EmptyState({ hasFilters, onClearFilters }) {
  return (
    <div className="text-center py-20">
      <div className="w-24 h-24 mx-auto mb-6 bg-gray-100 rounded-full flex items-center justify-center">
        <Search className="w-12 h-12 text-gray-400" />
      </div>
      <h3 className="text-xl font-semibold text-gray-900 mb-2">
        {hasFilters ? 'No matching valves found' : 'No data available'}
      </h3>
      <p className="text-gray-700 mb-6 max-w-md mx-auto">
        {hasFilters 
          ? 'Try adjusting filters or keywords' 
          : 'Database initializing, please try again later'}
      </p>
      {hasFilters && (
        <button
          onClick={onClearFilters}
          className="inline-flex items-center gap-2 px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
        >
          <RefreshCw className="w-4 h-4" />
          Clear Filters
        </button>
      )}
    </div>
  )
}
