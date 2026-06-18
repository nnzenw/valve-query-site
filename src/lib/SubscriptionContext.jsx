import { createContext, useContext, useState, useEffect, useCallback } from 'react'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from './supabase'

const BACKEND_URL = import.meta.env.VITE_BACKEND_URL || ''

// Plan definitions
export const PLANS = {
  free: {
    id: 'free',
    name: 'Free',
    price_monthly: 0,
    price_yearly: 0,
    creem_product_id_monthly: '',
    creem_product_id_yearly: '',
    features: {
      max_comparisons: 3,
      can_export: false,
      can_see_price: false,
      can_submit_tips: true,
      daily_search_limit: 5,
      full_detail_view: false
    }
  },
  pro: {
    id: 'pro',
    name: 'Pro',
    price_monthly: 999,
    price_yearly: 7999,
    creem_product_id_monthly: 'prod_1l8LO5O0WveOMuAIF1ybDu',
    creem_product_id_yearly: 'prod_bjLZnzAr8f2p9IqQHbofW',
    features: {
      max_comparisons: 10,
      can_export: true,
      can_see_price: true,
      can_submit_tips: true,
      daily_search_limit: -1,
      full_detail_view: true
    }
  }
}

// Supplier plans (placeholder for future)
export const SUPPLIER_PLANS = {}

const SubscriptionContext = createContext()

const STORAGE_KEY = 'valvespecs_subscription'

export function SubscriptionProvider({ children }) {
  const [subscription, setSubscription] = useState(null)
  const [loading, setLoading] = useState(true)
  const { user, signOut: authSignOut } = useAuth()

  // Restore subscription from localStorage cache
  useEffect(() => {
    try {
      const saved = localStorage.getItem(STORAGE_KEY)
      if (saved) {
        const parsed = JSON.parse(saved)
        setSubscription(parsed.subscription)
      }
    } catch (e) {
      console.error('Failed to read subscription cache:', e)
    } finally {
      setLoading(false)
    }
  }, [])

  // Sync subscription from backend when user changes
  useEffect(() => {
    if (!user?.id) return

    const fetchSubscription = async () => {
      try {
        const { data: sessionData } = await supabase.auth.getSession()
        const token = sessionData.session?.access_token
        const headers = token ? { 'Authorization': `Bearer ${token}` } : {}
        const res = await fetch(`${BACKEND_URL}/api/subscription/${user.id}`, { headers })
        if (res.ok) {
          const data = await res.json()
          if (data.subscription) {
            setSubscription(data.subscription)
          }
        }
      } catch (err) {
        console.error('Failed to sync subscription status:', err)
      }
    }

    fetchSubscription()

    const interval = setInterval(fetchSubscription, 5 * 60 * 1000)
    return () => clearInterval(interval)
  }, [user?.id])

  const saveState = useCallback((sub) => {
    setSubscription(sub)
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify({
        subscription: sub,
        cached_at: Date.now()
      }))
    } catch (e) {}
  }, [])

  const canAccess = useCallback((feature) => {
    if (!subscription) return false
    const plan = PLANS[subscription.plan_id]
    if (!plan) return false
    const featureValue = plan.features[feature]
    return featureValue !== undefined ? featureValue : false
  }, [subscription])

  const getQuota = useCallback((quotaName) => {
    if (!subscription) return 0
    const plan = PLANS[subscription.plan_id]
    if (!plan) return 0
    const quota = plan.features[quotaName]
    if (quota === -1) return Infinity
    return quota || 0
  }, [subscription])

  const [dailyUsage, setDailyUsage] = useState(() => {
    try {
      const today = new Date().toISOString().split('T')[0]
      const saved = localStorage.getItem(`valvespecs_usage_${today}`)
      return saved ? parseInt(saved, 10) : 0
    } catch { return 0 }
  })

  const incrementUsage = useCallback(() => {
    const today = new Date().toISOString().split('T')[0]
    const newCount = dailyUsage + 1
    setDailyUsage(newCount)
    try {
      localStorage.setItem(`valvespecs_usage_${today}`, String(newCount))
    } catch (e) {}
  }, [dailyUsage])

  const isQuotaExceeded = useCallback(() => {
    const limit = getQuota('daily_search_limit')
    if (limit === Infinity) return false
    return dailyUsage >= limit
  }, [dailyUsage, getQuota])

  // Upgrade subscription (placeholder until real billing integration)
  const upgradePlan = useCallback((planId) => {
    saveState({
      plan_id: planId,
      status: 'active',
      started_at: new Date().toISOString(),
      renews_at: new Date(Date.now() + 30 * 86400000).toISOString()
    })
  }, [saveState])

  // Logout via Supabase Auth
  const logout = useCallback(async () => {
    try {
      await authSignOut()
    } catch (err) {
      console.error('Logout failed:', err)
    }
    setSubscription(null)
    localStorage.removeItem(STORAGE_KEY)
  }, [authSignOut])

  const isActive = subscription?.status === 'active' && (
    !subscription?.renews_at || new Date(subscription.renews_at).getTime() > Date.now()
  )

  return (
    <SubscriptionContext.Provider value={{
      subscription,
      user,
      loading,
      canAccess,
      getQuota,
      dailyUsage,
      incrementUsage,
      isQuotaExceeded,
      upgradePlan,
      logout,
      isPro: isActive && (subscription?.plan_id === 'pro' || subscription?.plan_id === 'enterprise'),
      isEnterprise: isActive && subscription?.plan_id === 'enterprise',
      billingInterval: subscription?.billing_interval || null,
      daysRemaining: subscription?.renews_at
        ? Math.max(0, Math.ceil((new Date(subscription.renews_at).getTime() - Date.now()) / 86400000))
        : null,
      renewsAt: subscription?.renews_at || null,
    }}>
      {children}
    </SubscriptionContext.Provider>
  )
}

export function useSubscription() {
  const ctx = useContext(SubscriptionContext)
  if (!ctx) throw new Error('useSubscription must be used within SubscriptionProvider')
  return ctx
}
