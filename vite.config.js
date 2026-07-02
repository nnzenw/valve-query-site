import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000,
    host: '0.0.0.0'
  },
  // Build optimizations
  build: {
    target: 'es2015',
    cssTarget: 'chrome61',
    rollupOptions: {
      output: {
        // Chunk splitting for better caching
        manualChunks: {
          vendor: ['react', 'react-router-dom', 'react-helmet-async'],
          ui: ['tailwindcss'],
        }
      }
    },
    // Minify with terser for smaller output
    minify: 'terser',
    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true,
      }
    }
  },
  // Preview (for local `vite preview`)
  preview: {
    port: 4173,
    host: '0.0.0.0'
  }
})
