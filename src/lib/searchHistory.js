const STORAGE_KEY = 'valvespecs_search_history'
const MAX_HISTORY = 10

export function getSearchHistory() {
  try {
    const saved = localStorage.getItem(STORAGE_KEY)
    return saved ? JSON.parse(saved) : []
  } catch {
    return []
  }
}

export function addToSearchHistory(params) {
  if (!params.keyword && !Object.values(params).some(v => v)) return

  const history = getSearchHistory()
  const entry = {
    ...params,
    timestamp: Date.now()
  }

  // Remove duplicate (same search params)
  const filtered = history.filter(h =>
    h.keyword !== entry.keyword ||
    h.brand_id !== entry.brand_id ||
    h.valve_type_id !== entry.valve_type_id ||
    h.material !== entry.material ||
    h.application !== entry.application
  )

  // Add to front, limit size
  const updated = [entry, ...filtered].slice(0, MAX_HISTORY)

  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(updated))
  } catch {}
}

export function clearSearchHistory() {
  try {
    localStorage.removeItem(STORAGE_KEY)
  } catch {}
}

export function getSearchHistoryDisplay(item) {
  const parts = []
  if (item.keyword) parts.push(`"${item.keyword}"`)
  if (item.brand_id) parts.push(`Brand: ${item.brand_id}`)
  if (item.valve_type_id) parts.push(`Type: ${item.valve_type_id}`)
  if (item.material) parts.push(`Material: ${item.material}`)
  if (item.application) parts.push(`App: ${item.application}`)
  return parts.join(' · ') || 'All valves'
}