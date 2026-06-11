import { useState, useMemo } from 'react'
import { X, Globe, Calendar, Tag, FileText, Layers, Zap, Star, Plus, Check, TrendingUp, Scale, Lightbulb } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { toast } from 'react-hot-toast'
import { useComparison } from '../lib/ComparisonContext'
import TipsSection from './TipsSection'

export default function ValveModal({ valve, onClose, allValves, onAddToComparison }) {
  const brand = valve.brands
  const valveType = valve.valve_types
  const [showRating, setShowRating] = useState(false)
  const [rating, setRating] = useState(0)
  const [feedbackType, setFeedbackType] = useState(null)
  const [correctionText, setCorrectionText] = useState('')
  const { addToComparison, removeFromComparison, isInComparison } = useComparison()
  const inComparison = isInComparison(valve.id)
  
  // Alternatives：matched based on similar products
  const alternatives = useMemo(() => {
    if (!allValves || allValves.length === 0) return []
    
    const currentTypeId = valve.valve_type_id
    const currentSize = valve.size_range
    const currentMaterial = valve.body_material
    
    return allValves
      .filter(v => {
        if (v.id === valve.id) return false  // exclude self
        if (v.valve_type_id !== currentTypeId) return false  // same type
        return true
      })
      .map(v => {
        // Calculate match score
        let score = 50
        if (v.size_range === currentSize) score += 20
        if (v.body_material === currentMaterial) score += 15
        if (v.pressure_range === valve.pressure_range) score += 10
        if (v.standard === valve.standard) score += 5
        return { ...v, matchScore: score }
      })
      .sort((a, b) => b.matchScore - a.matchScore)
      .slice(0, 3)
  }, [valve, allValves])
  
  // Handle rating submission
  const handleSubmitRating = async () => {
    if (rating === 0) {
      toast.error('Please selectRating')
      return
    }
    
    try {
      const { error } = await supabase.from('valve_feedback').insert({
        valve_spec_id: valve.id,
        type: 'rating',
        rating: rating
      })
      
      if (error) throw error
      
      toast.success('Rating submitted!')
      setShowRating(false)
      setRating(0)
    } catch (err) {
      console.error('Rating submission failed:', err)
      toast.error('Rating submission failed')
    }
  }
  
  // Handle correction submission
  const handleSubmitCorrection = async () => {
    if (!correctionText.trim()) {
      toast.error('Please describe what needs correction')
      return
    }
    
    try {
      const { error } = await supabase.from('valve_feedback').insert({
        valve_spec_id: valve.id,
        type: 'correction',
        correction_content: correctionText
      })
      
      if (error) throw error
      
      toast.success('Report submitted, we will review ASAP')
      setFeedbackType(null)
      setCorrectionText('')
    } catch (err) {
      console.error('Report submission failed:', err)
      toast.error('Report submission failed')
    }
  }

  return (
    <>
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div 
        className="bg-white rounded-xl shadow-2xl max-w-3xl w-full max-h-[90vh] overflow-y-auto"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="sticky top-0 bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between rounded-t-xl">
          <div>
            <h2 className="text-2xl font-bold text-gray-900">
              {valveType?.name || valve.type}
            </h2>
            <p className="text-sm text-gray-600 mt-1">{brand?.name}</p>
          </div>
          <button 
            onClick={onClose}
            className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
            aria-label="Close valve details"
          >
            <X className="w-6 h-6" />
          </button>
        </div>

        <div className="p-6 space-y-6">
          {/* Basic Info */}
          <div className="grid grid-cols-2 gap-4">
            {brand?.country && (
              <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg">
                <Globe className="w-5 h-5 text-blue-600" />
                <div>
                  <p className="text-xs text-gray-500">Country</p>
                  <p className="font-medium text-gray-900">{brand.country}</p>
                </div>
              </div>
            )}
            {brand?.established && (
              <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg">
                <Calendar className="w-5 h-5 text-blue-600" />
                <div>
                  <p className="text-xs text-gray-500">Est.</p>
                  <p className="font-medium text-gray-900">{brand.established}</p>
                </div>
              </div>
            )}
          </div>

          {/* Key Specs */}
          <div>
            <h3 className="text-lg font-semibold text-gray-900 mb-3 flex items-center gap-2">
              <Layers className="w-5 h-5" />
              Key Specs
            </h3>
            <div className="bg-gray-50 rounded-lg p-4 space-y-3">
              {valve.size_range && (
                <div className="flex justify-between">
                  <span className="text-gray-600">Size Range</span>
                  <span className="font-medium">{valve.size_range}</span>
                </div>
              )}
              {valve.pressure_range && (
                <div className="flex justify-between">
                  <span className="text-gray-600">Pressure Range</span>
                  <span className="font-medium">{valve.pressure_range}</span>
                </div>
              )}
              {valve.temperature_range && (
                <div className="flex justify-between">
                  <span className="text-gray-600">Temp Range</span>
                  <span className="font-medium">{valve.temperature_range}</span>
                </div>
              )}
              {valve.body_material && (
                <div className="flex justify-between">
                  <span className="text-gray-600">Body Material</span>
                  <span className="font-medium">{valve.body_material}</span>
                </div>
              )}
              {valve.seal_material && (
                <div className="flex justify-between">
                  <span className="text-gray-600">Seal Material</span>
                  <span className="font-medium">{valve.seal_material}</span>
                </div>
              )}
              {valve.standard && (
                <div className="flex justify-between">
                  <span className="text-gray-600">Standards</span>
                  <span className="font-medium">{valve.standard}</span>
                </div>
              )}
            </div>
          </div>

          {/* Alternatives */}
          {alternatives.length > 0 && (
            <div>
              <h3 className="text-lg font-semibold text-gray-900 mb-3 flex items-center gap-2">
                <TrendingUp className="w-5 h-5 text-green-600" />
                Alternatives
              </h3>
              <div className="space-y-3">
                {alternatives.map((alt) => {
                  const altBrand = alt.brands
                  return (
                    <div key={alt.id} className="bg-green-50 border border-green-200 rounded-lg p-4 hover:bg-green-100 transition-colors">
                      <div>
                        <div className="flex items-center gap-2">
                          <span className="font-semibold text-gray-900">{altBrand?.name}</span>
                          {alt.matchScore >= 80 && (
                            <span className="px-2 py-0.5 bg-green-200 text-green-800 text-xs rounded-full">High Match</span>
                          )}
                        </div>
                        <p className="text-sm text-gray-600 mt-1">
                          {alt.size_range} ｜ {alt.pressure_range} ｜ {alt.body_material}
                        </p>
                      </div>
                      <button
                        onClick={() => addToComparison(alt)}
                        className="mt-2 text-xs text-green-700 hover:text-green-800 flex items-center gap-1"
                      >
                        <Plus className="w-3 h-3" />
                        Add toCompare List
                      </button>
                    </div>
                  )
                })}
              </div>
            </div>
          )}
          
          {/* TipsCommunity */}
          <div>
            <TipsSection 
              valveType={valveType?.name} 
              brandName={brand?.name} 
            />
          </div>

          {/* Applications */}
          {(valve.applications || valveType?.common_applications) && (
            <div>
              <h3 className="text-lg font-semibold text-gray-900 mb-3 flex items-center gap-2">
                <Tag className="w-5 h-5" />
                Applications
              </h3>
              <div className="flex flex-wrap gap-2">
                {(valve.applications || valveType.common_applications).map((app, idx) => (
                  <span key={idx} className="px-3 py-1 bg-blue-50 text-blue-700 rounded-full text-sm">
                    {app}
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* Brand info */}
          {brand?.description && (
            <div>
              <h3 className="text-lg font-semibold text-gray-900 mb-3">About Brand</h3>
              <p className="text-gray-700 leading-relaxed">{brand.description}</p>
            </div>
          )}

          {/* Official Website */}
          {brand?.website && (
            <div>
              <a 
                href={brand.website}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
              >
                <Zap className="w-4 h-4" />
                Visit Website
              </a>
            </div>
          )}
          
          {/* Interaction Buttons */}
          <div className="border-t border-gray-200 pt-4">
            <h3 className="text-sm font-medium text-gray-700 mb-3">Actions</h3>
            <div className="flex gap-2">
              <button 
                onClick={() => {
                  inComparison ? removeFromComparison(valve.id) : addToComparison(valve)
                }}
                className={`flex-1 flex items-center justify-center gap-2 px-4 py-2 rounded-lg transition-colors text-sm ${
                  inComparison
                    ? 'bg-blue-100 text-blue-700'
                    : 'bg-blue-600 text-white hover:bg-blue-700'
                }`}
              >
                {inComparison ? <Check className="w-4 h-4" /> : <Scale className="w-4 h-4" />}
                {inComparison ? 'Already inCompare List' : 'Add toCompare List'}
              </button>
              <button 
                onClick={() => setShowRating(true)}
                className="flex-1 flex items-center justify-center gap-2 px-4 py-2 bg-yellow-50 text-yellow-700 rounded-lg hover:bg-yellow-100 transition-colors text-sm"
              >
                <Star className="w-4 h-4" />
                Rating
              </button>
              <button 
                onClick={() => setFeedbackType('correction')}
                className="flex-1 flex items-center justify-center gap-2 px-4 py-2 bg-red-50 text-red-700 rounded-lg hover:bg-red-100 transition-colors text-sm"
              >
                <Tag className="w-4 h-4" />
                Report
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    {/* RatingModal */}
    {showRating && (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-[60] p-4" onClick={() => { setShowRating(false); setRating(0) }}>
        <div className="bg-white rounded-xl shadow-2xl max-w-md w-full p-6" onClick={e => e.stopPropagation()}>
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Rate this valve</h3>
          <p className="text-sm text-gray-600 mb-4">
            {valve.brands?.name} - {valve.valve_types?.name}
          </p>
          
          <div className="flex gap-2 mb-4">
            {[1, 2, 3, 4, 5].map(star => (
              <button
                key={star}
                onClick={() => setRating(star)}
                className="text-3xl focus:outline-none hover:scale-110 transition-transform"
              >
                {star <= rating ? '⭐' : '☆'}
              </button>
            ))}
          </div>
          
          <div className="flex gap-2">
            <button 
              onClick={handleSubmitRating}
              className="flex-1 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
            >
              Submit Rating
            </button>
            <button 
              onClick={() => { setShowRating(false); setRating(0) }}
              className="flex-1 px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition-colors"
            >
              Cancel
            </button>
          </div>
        </div>
      </div>
    )}
    
    {/* ReportModal */}
    {feedbackType === 'correction' && (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-[60] p-4" onClick={() => { setFeedbackType(null); setCorrectionText('') }}>
        <div className="bg-white rounded-xl shadow-2xl max-w-md w-full p-6" onClick={e => e.stopPropagation()}>
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Report Data Error</h3>
          <p className="text-sm text-gray-600 mb-4">
            {valve.brands?.name} - {valve.valve_types?.name}
          </p>
          
          <label htmlFor="correction-textarea" className="block text-sm font-medium text-gray-700 mb-2">Describe the issue</label>
          <textarea
            id="correction-textarea"
            value={correctionText}
            onChange={(e) => setCorrectionText(e.target.value)}
            placeholder="Please describe what needs correction, e.g. incorrect pressure range, wrong material..."
            className="w-full border border-gray-300 rounded-lg p-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            rows={4}
          />
          
          <div className="flex gap-2 mt-4">
            <button 
              onClick={handleSubmitCorrection}
              className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
            >
              Submit Report
            </button>
            <button 
              onClick={() => { setFeedbackType(null); setCorrectionText('') }}
              className="flex-1 px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition-colors"
            >
              Cancel
            </button>
          </div>
        </div>
      </div>
    )}
  </>
  )
}
