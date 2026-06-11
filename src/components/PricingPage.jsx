import { useState } from 'react'
import { X, Check, Zap, ShoppingCart, Loader, ExternalLink, Building } from 'lucide-react'
import { toast } from 'react-hot-toast'
import { PLANS, SUPPLIER_PLANS, useSubscription } from '../lib/SubscriptionContext'

const BACKEND_URL = import.meta.env.VITE_BACKEND_URL || ''

export default function PricingPage({ onClose, user }) {
  const [billing, setBilling] = useState('monthly') // 'monthly' | 'yearly'
  const [loadingPlan, setLoadingPlan] = useState(null)
  const { mockUpgrade } = useSubscription()

  // User plans
  const userPlans = [
    {
      ...PLANS.free,
      popular: false,
      cta: 'Current Plan',
      ctaClass: 'bg-gray-100 text-gray-600 cursor-default'
    },
    {
      ...PLANS.pro,
      popular: true,
      cta: 'Upgrade to Pro',
      ctaClass: 'bg-blue-600 text-white hover:bg-blue-700'
    }
  ]

  const handleSubscribe = async (plan) => {
    if (plan.id === 'free') {
      toast('You are already on the Free plan')
      return
    }
    
    if (!user?.id) {
      toast.error('Please log in before subscribing')
      return
    }

    setLoadingPlan(plan.id)
    
    try {
      // ========================================
      // Production: use Creem Checkout
      // ========================================
      const productId = billing === 'yearly' 
        ? (plan.creem_product_id_yearly || plan.creem_product_id)
        : (plan.creem_product_id_monthly || plan.creem_product_id)
      
      // 如果没有配置 Creem product ID，则使用模拟模式
      if (!productId || productId.startsWith('placeholder')) {
        toast.info('Demo mode: use real Creem product IDs to activate payments')
        await new Promise(resolve => setTimeout(resolve, 1000))
        mockUpgrade(plan.id)
        toast.success(`Upgraded to ${plan.name}!`)
        onClose()
        return
      }

      const res = await fetch(`${BACKEND_URL}/api/create-checkout`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          productId,
          userId: user.id,
          email: user.email,
          successUrl: `${window.location.origin}/dashboard`,
          cancelUrl: `${window.location.origin}/pricing`
        })
      })

      if (!res.ok) {
        const error = await res.json()
        throw new Error(error.error || 'Payment creation failed')
      }

      const data = await res.json()
      
      // 跳转到 Creem Checkout 页面
      if (data.url) {
        toast.success('Redirecting to payment page...')
        window.location.href = data.url
      } else {
        throw new Error('No payment link received')
      }
      
      // ========================================
      // 开发环境：模拟订阅成功（注释掉以使用真实支付）
      // ========================================
      /*
      await new Promise(resolve => setTimeout(resolve, 1000))
      mockUpgrade(plan.id)
      toast.success(`Upgraded to ${plan.name}!`)
      onClose()
      */
    } catch (err) {
      console.error('Subscription failed:', err)
      toast.error(err.message || 'Subscription processing failed, please retry')
    } finally {
      setLoadingPlan(null)
    }
  }

  const priceDisplay = (plan) => {
    if (plan.price_monthly === 0) return 'Free'
    if (billing === 'monthly') {
      if (plan.id === 'enterprise') return 'Custom'
      return `¥${(plan.price_monthly / 100).toFixed(2)}`
    }
    if (plan.id === 'enterprise') return 'Custom'
    return `¥${(plan.price_yearly / 100).toFixed(2)}`
  }

  const perUnit = (plan) => {
    if (plan.price_monthly === 0) return ''
    if (plan.id === 'enterprise') return ''
    return billing === 'monthly' ? '//mo' : '/yr'
  }

  const FeatureRow = ({ text, included }) => (
    <div className="flex items-center gap-2 text-sm py-2">
      {included ? (
        <Check className="w-4 h-4 text-green-500 shrink-0" />
      ) : (
        <span className="w-4 h-4 shrink-0" />
      )}
      <span className={included ? 'text-gray-700' : 'text-gray-400 line-through'}>{text}</span>
    </div>
  )

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div 
        className="bg-white rounded-2xl shadow-2xl max-w-5xl w-full max-h-[95vh] overflow-y-auto"
        onClick={e => e.stopPropagation()}
      >
        {/* Header */}
        <div className="px-8 py-6 border-b border-gray-100 flex items-center justify-between">
          <div>
            <h2 className="text-2xl font-bold text-gray-900">Choose Plan</h2>
            <p className="text-sm text-gray-500 mt-1">
              {tab === 'user' ? 'Subscribe as needed, cancel anytime' : 'Get found by more buyers'}
            </p>
          </div>
          <button onClick={onClose} className="p-2 hover:bg-gray-100 rounded-lg" aria-label="Close pricing">
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Billing Cycle Switch */}
        <div className="px-8 pt-6 flex items-center justify-center gap-3">
          <button
            onClick={() => setBilling('monthly')}
            className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
              billing === 'monthly' ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600'
            }`}
          >
            /month
          </button>
          <button
            onClick={() => setBilling('yearly')}
            className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors flex items-center gap-2 ${
              billing === 'yearly' ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600'
            }`}
          >
            /year
            <span className="text-[10px] bg-green-500 text-white px-1.5 py-0.5 rounded-full">Save 2 months</span>
          </button>
        </div>

        {/* Plan Cards */}
        <div className="p-8">
          <div className="grid gap-6 grid-cols-1 md:grid-cols-2">
            {userPlans.map((plan) => (
              <div
                key={plan.id}
                className={`relative border-2 rounded-xl p-6 transition-all hover:shadow-lg ${
                  plan.popular ? 'border-blue-500 shadow-md' : 'border-gray-200'
                }`}
              >
                {plan.popular && (
                  <div className="absolute -top-3 left-1/2 -translate-x-1/2 bg-blue-600 text-white text-xs px-4 py-1 rounded-full font-medium">
                    Most Popular
                  </div>
                )}

                <div className="mb-4">
                  <h3 className="text-lg font-bold text-gray-900">{plan.name}</h3>
                  <div className="mt-2">
                    <span className="text-3xl font-extrabold text-gray-900">{priceDisplay(plan)}</span>
                    <span className="text-sm text-gray-500 ml-1">{perUnit(plan)}</span>
                  </div>
                  {plan.id === 'pro' && billing === 'yearly' && (
                    <p className="text-xs text-green-600 mt-1">≈ ${(PLANS.pro.price_yearly / 12 / 100).toFixed(2)}/mo</p>
                  )}
                </div>

                <div className="space-y-0.5 mb-6">
                  <FeatureRow text="Full-text search + Multi-filter" included={true} />
                  <FeatureRow text="Full Parameter Details" included={plan.features.full_detail_view} />
                  <FeatureRow text="Est. Price Display" included={plan.features.can_see_price} />
                  <FeatureRow text="Data Export (Excel/PDF)" included={plan.features.can_export} />
                  <FeatureRow text={`Compare List (${plan.features.max_comparisons} items)`} included={plan.features.max_comparisons > 3} />
                  <FeatureRow text={`Daily Search: ${plan.features.daily_search_limit === -1 ? 'Unlimited' : plan.features.daily_search_limit + ' times'}`} included={true} />
                  <FeatureRow text="UGC Community Posting" included={plan.features.can_submit_tips} />
                </div>

                <button
                  onClick={() => handleSubscribe(plan)}
                  disabled={loadingPlan === plan.id}
                  className={`w-full py-3 rounded-xl font-medium text-sm transition-all flex items-center justify-center gap-2 ${plan.ctaClass}`}
                >
                  {loadingPlan === plan.id ? (
                    <><Loader className="w-4 h-4 animate-spin" />Processing...</>
                  ) : (
                    plan.cta
                  )}
                </button>

                {plan.id === 'pro' && (
                  <p className="text-[10px] text-gray-400 text-center mt-3">
                    7-day refund · Cancel anytime
                  </p>
                )}
              </div>
            ))}
          </div>

        </div>

        {/* Footer */}
        <div className="px-8 py-4 border-t border-gray-100 text-center text-xs text-gray-400">
          Payment secured by Creem · Credit Card / Apple Pay / Google Pay supported
        </div>
      </div>
    </div>
  )
}
