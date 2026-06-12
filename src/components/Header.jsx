import { Wrench, ClipboardList, Lightbulb, Zap, User, LogOut } from 'lucide-react'
import { Link, useNavigate } from 'react-router-dom'
import { useSubscription } from '../lib/SubscriptionContext'

export default function Header({ onOpenComparison, onOpenTips, onOpenPricing, comparisonCount }) {
  const { isPro, user, logout, billingInterval, daysRemaining } = useSubscription()
  const navigate = useNavigate()

  const handleLogout = async () => {
    await logout()
    navigate('/')
  }

  return (
    <header className="bg-white border-b border-gray-200 shadow-sm">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <Link to="/" className="flex items-center gap-3">
              <div className="w-10 h-10 bg-gradient-to-br from-blue-600 to-indigo-600 rounded-lg flex items-center justify-center">
                <Wrench className="w-6 h-6 text-white" />
              </div>
              <div>
                <h1 className="text-2xl font-bold text-gray-900">
                  ValveSpecs <span className="text-blue-600">Pro</span>
                </h1>
                <p className="text-xs text-gray-500">Global Valve Specifications Database</p>
              </div>
            </Link>
          </div>
          <div className="flex items-center gap-4">
            <button
              onClick={onOpenTips}
              className="px-4 py-2 text-sm text-gray-600 hover:text-yellow-600 hover:bg-yellow-50 transition-colors rounded-lg flex items-center gap-2"
            >
              <Lightbulb className="w-4 h-4" />
              Community
            </button>
            <button
              onClick={onOpenPricing}
              className={`px-4 py-2 text-sm rounded-lg transition-colors flex items-center gap-2 ${
                isPro
                  ? 'bg-gradient-to-r from-yellow-400 to-orange-400 text-white hover:from-yellow-500 hover:to-orange-500'
                  : 'text-gray-600 hover:text-blue-600 hover:bg-blue-50'
              }`}
            >
              <Zap className="w-4 h-4" />
              {isPro ? (
                <span className="flex flex-col items-start leading-tight">
                  <span>Pro</span>
                  {daysRemaining !== null && (
                    <span className={`text-[10px] font-normal ${daysRemaining <= 3 ? 'text-red-200' : 'opacity-80'}`}>
                      {billingInterval === 'year' ? 'Yearly' : 'Monthly'} · {daysRemaining}d left
                    </span>
                  )}
                </span>
              ) : 'Upgrade'}
            </button>
            <button
              onClick={onOpenComparison}
              className="relative px-4 py-2 text-sm text-gray-600 hover:text-blue-600 hover:bg-blue-50 transition-colors rounded-lg flex items-center gap-2"
            >
              <ClipboardList className="w-4 h-4" />
              Compare List
              {comparisonCount > 0 && (
                <span className="absolute -top-1 -right-1 w-5 h-5 bg-blue-600 text-white text-xs rounded-full flex items-center justify-center">
                  {comparisonCount}
                </span>
              )}
            </button>
            <Link
              to="/blog"
              className="text-sm text-gray-600 hover:text-blue-600 transition-colors"
            >
              Blog
            </Link>
            <Link
              to="/brands"
              className="text-sm text-gray-600 hover:text-blue-600 transition-colors"
            >
              Brands
            </Link>
            {user ? (
              <div className="flex items-center gap-2">
                <span className="px-3 py-2 bg-blue-50 text-blue-700 text-sm font-medium rounded-lg flex items-center gap-2">
                  <User className="w-4 h-4" />
                  {user.user_metadata?.name || user.email?.split('@')[0] || 'User'}
                </span>
                <button
                  onClick={handleLogout}
                  className="px-3 py-2 text-sm text-gray-500 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors flex items-center gap-1"
                  title="Sign out"
                >
                  <LogOut className="w-4 h-4" />
                </button>
              </div>
            ) : (
              <div className="flex items-center gap-2">
                <Link
                  to="/login"
                  className="px-3 py-2 text-sm text-gray-600 hover:text-blue-600 transition-colors"
                >
                  Sign In
                </Link>
                <Link
                  to="/register"
                  className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors flex items-center gap-2"
                >
                  <Zap className="w-4 h-4" />
                  Sign Up
                </Link>
              </div>
            )}
          </div>
        </div>
      </div>
    </header>
  )
}
