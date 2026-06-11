import { Search, Filter, ChevronDown, X } from 'lucide-react'
import { useState, useMemo, useCallback, useRef, useEffect } from 'react'
import FilterPanel from './FilterPanel'
import SearchSuggestions from './SearchSuggestions'
import { debounce } from '../lib/utils'
import { addToSearchHistory, clearSearchHistory } from '../lib/searchHistory'

export default function SearchBar({ onSearch, brands, valveTypes, onToggleFilters, showFilters, initialParams }) {
  const [keyword, setKeyword] = useState(initialParams?.keyword || '')
  const [filters, setFilters] = useState({
    brand_id: initialParams?.brand_id || '',
    valve_type_id: initialParams?.valve_type_id || '',
    material: initialParams?.material || '',
    application: initialParams?.application || ''
  })
  const [showSuggestions, setShowSuggestions] = useState(false)
  const [showHistory, setShowHistory] = useState(false)
  const inputRef = useRef(null)
  const suggestionsRef = useRef(null)

  const hasActiveFilters = keyword || Object.values(filters).some(v => v)

  // Sync initial params
  useEffect(() => {
    if (initialParams) {
      setKeyword(initialParams.keyword || '')
      setFilters({
        brand_id: initialParams.brand_id || '',
        valve_type_id: initialParams.valve_type_id || '',
        material: initialParams.material || '',
        application: initialParams.application || ''
      })
    }
  }, [initialParams])

  const handleKeywordChange = (e) => {
    const value = e.target.value
    setKeyword(value)
    setShowSuggestions(true)
    setShowHistory(false)
    debouncedSearch({ ...filters, keyword: value })
  }

  const debouncedSearch = useMemo(
    () => debounce((params) => onSearch(params), 300),
    [onSearch]
  )

  const handleFilterChange = useCallback((key, value) => {
    const newFilters = { ...filters, [key]: value }
    setFilters(newFilters)
    const params = { ...newFilters, keyword }
    debouncedSearch(params)
    addToSearchHistory(params)
  }, [filters, keyword, debouncedSearch])

  const handleClear = useCallback(() => {
    setKeyword('')
    setFilters({ brand_id: '', valve_type_id: '', material: '', application: '' })
    onSearch({ keyword: '', brand_id: '', valve_type_id: '', material: '', application: '' })
  }, [onSearch])

  const handleSuggestionSelect = useCallback((params) => {
    setKeyword(params.keyword || '')
    setFilters({
      brand_id: params.brand_id || '',
      valve_type_id: params.valve_type_id || '',
      material: params.material || '',
      application: params.application || ''
    })
    const searchParams = {
      keyword: params.keyword || '',
      brand_id: params.brand_id || '',
      valve_type_id: params.valve_type_id || '',
      material: params.material || '',
      application: params.application || ''
    }
    onSearch(searchParams)
    addToSearchHistory(searchParams)
    setShowSuggestions(false)
    setShowHistory(false)
  }, [onSearch])

  const handleKeyDown = (e) => {
    if (e.key === 'Escape') {
      setShowSuggestions(false)
      setShowHistory(false)
      inputRef.current?.blur()
    }
    if (e.key === 'Enter') {
      const params = { ...filters, keyword }
      addToSearchHistory(params)
      setShowSuggestions(false)
    }
  }

  // Close suggestions when clicking outside
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (suggestionsRef.current && !suggestionsRef.current.contains(e.target)) {
        setShowSuggestions(false)
        setShowHistory(false)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  return (
    <div className="bg-white shadow-sm border-b border-gray-200">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <p className="text-center text-sm text-gray-600 mb-5">
          Search and compare specifications across 100+ global industrial valve brands
        </p>
        <div className="flex flex-col md:flex-row gap-4">
          <div className="flex-1 relative" ref={suggestionsRef}>
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-5 h-5 text-gray-400" />
            <input
              ref={inputRef}
              type="text"
              value={keyword}
              onChange={handleKeywordChange}
              onFocus={() => {
                setShowSuggestions(true)
                setShowHistory(!keyword)
              }}
              onKeyDown={handleKeyDown}
              placeholder="Search brands, models, materials, standards..."
              aria-label="Search valves"
              className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 text-lg placeholder:text-gray-500"
            />
            <SearchSuggestions
              keyword={keyword}
              onSelect={handleSuggestionSelect}
              onClose={() => {
                setShowSuggestions(false)
                setShowHistory(false)
              }}
              brands={brands}
              valveTypes={valveTypes}
              showHistory={showHistory}
              onClearHistory={() => {
                clearSearchHistory()
                setShowHistory(false)
              }}
            />
          </div>
          <div className="flex gap-2 items-center">
            <button
              onClick={onToggleFilters}
              className={`px-6 py-3 rounded-lg font-medium flex items-center gap-2 transition-colors ${
                showFilters
                  ? 'bg-blue-600 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              <Filter className="w-5 h-5" />
              Filter
              <ChevronDown className={`w-4 h-4 transition-transform ${showFilters ? 'rotate-180' : ''}`} />
            </button>
            {hasActiveFilters && (
              <button
                onClick={handleClear}
                className="px-4 py-3 rounded-lg font-medium flex items-center gap-2 border border-red-200 text-red-600 hover:bg-red-50 transition-colors"
                aria-label="Clear all filters"
              >
                <X className="w-4 h-4" />
                Clear All
              </button>
            )}
          </div>
        </div>

        {showFilters && (
          <div className="mt-4">
            <FilterPanel 
              brands={brands}
              valveTypes={valveTypes}
              filters={filters}
              onFilterChange={handleFilterChange}
            />
          </div>
        )}
      </div>
    </div>
  )
}