import { createContext, useContext, useState, useEffect, useCallback } from 'react'
import { toast } from 'react-hot-toast'

const ComparisonContext = createContext()

const STORAGE_KEY = 'valvespecs_comparison'

export function ComparisonProvider({ children }) {
  const [comparisonList, setComparisonList] = useState([])

  // from localStorage restored
  useEffect(() => {
    try {
      const saved = localStorage.getItem(STORAGE_KEY)
      if (saved) {
        setComparisonList(JSON.parse(saved))
      }
    } catch (e) {
      console.error('Failed to read comparison list from localStorage:', e)
    }
  }, [])

  // saved to localStorage
  const saveToList = useCallback((list) => {
    setComparisonList(list)
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(list))
    } catch (e) {
      console.error('Failed to save comparison list:', e)
    }
  }, [])

  const addToComparison = useCallback((valve) => {
    setComparisonList(prev => {
      if (prev.some(v => v.id === valve.id)) {
        toast('Already inCompare Listin')
        return prev
      }
      if (prev.length >= 10) {
        toast.error('Compare List max 10 items')
        return prev
      }
      const newList = [...prev, valve]
      localStorage.setItem(STORAGE_KEY, JSON.stringify(newList))
      toast.success('AddedCompare List')
      return newList
    })
  }, [])

  const removeFromComparison = useCallback((valveId) => {
    setComparisonList(prev => {
      const newList = prev.filter(v => v.id !== valveId)
      localStorage.setItem(STORAGE_KEY, JSON.stringify(newList))
      toast('Removed from comparison list')
      return newList
    })
  }, [])

  const clearComparison = useCallback(() => {
    setComparisonList([])
    localStorage.removeItem(STORAGE_KEY)
    toast('Compare ListComparison listClear All')
  }, [])

  const isInComparison = useCallback((valveId) => {
    return comparisonList.some(v => v.id === valveId)
  }, [comparisonList])

  return (
    <ComparisonContext.Provider value={{
      comparisonList,
      addToComparison,
      removeFromComparison,
      clearComparison,
      isInComparison,
      comparisonCount: comparisonList.length
    }}>
      {children}
    </ComparisonContext.Provider>
  )
}

export function useComparison() {
  const ctx = useContext(ComparisonContext)
  if (!ctx) throw new Error('useComparison must be used within ComparisonProvider')
  return ctx
}
