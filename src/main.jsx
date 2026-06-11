import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import ErrorBoundary from './components/ErrorBoundary'
import './index.css'
import { Toaster } from 'react-hot-toast'
import { ComparisonProvider } from './lib/ComparisonContext'
import { AuthProvider } from './contexts/AuthContext'
import { SubscriptionProvider } from './lib/SubscriptionContext'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <ErrorBoundary>
      <Toaster position="top-center" toastOptions={{ duration: 3000 }} />
      <AuthProvider>
        <SubscriptionProvider>
          <ComparisonProvider>
            <App />
          </ComparisonProvider>
        </SubscriptionProvider>
      </AuthProvider>
    </ErrorBoundary>
  </React.StrictMode>,
)
