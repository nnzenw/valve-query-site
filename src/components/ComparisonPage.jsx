import { useState } from 'react'
import { X, Trash2, Download, FileText, ClipboardList, AlertCircle } from 'lucide-react'
import { useComparison } from '../lib/ComparisonContext'
import { toast } from 'react-hot-toast'
import { getHealthScoreColor } from '../lib/utils'

export default function ComparisonPage({ onClose, valves }) {
  const { comparisonList, removeFromComparison, clearComparison } = useComparison()
  const [showReport, setShowReport] = useState(false)

  if (comparisonList.length === 0) {
    return (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4" onClick={onClose}>
        <div className="bg-white rounded-xl shadow-2xl max-w-lg w-full p-8" onClick={e => e.stopPropagation()}>
          <div className="text-center">
            <ClipboardList className="w-16 h-16 mx-auto text-gray-300 mb-4" />
            <h3 className="text-xl font-semibold text-gray-900 mb-2">Compare list is empty</h3>
            <p className="text-gray-500 mb-6">Click "Compare" on valve cards, up to 10 valves</p>
            <button onClick={onClose} className="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
              Continue Browsing
            </button>
          </div>
        </div>
      </div>
    )
  }

  function generateReportText() {
    const now = new Date().toLocaleDateString('zh-CN')
    let report = `========================================\n`
    report += `  ValveSpecs Pro - Valve Compare Report\n`
    report += `  Date: ${now}\n`
    report += `  Items: ${comparisonList.length}\n`
    report += `========================================\n\n`
    
    comparisonList.forEach((v, i) => {
      const brand = v.brands?.name || '-'
      const type = v.valve_types?.name || v.type || '-'
      report += `[Item ${i + 1}]\n`
      report += `  Brands：${brand}\n`
      report += `  Type: ${type}\n`
      report += `  Model: ${v.model || '-'}\n`
      report += `  Size: ${v.size_range || '-'}\n`
      report += `  Pressure: ${v.pressure_range || '-'}\n`
      report += `  Material: ${v.body_material || '-'}\n`
      report += `  Standard: ${v.standard || '-'}\n`
      report += `\n`
    })
    
    return report
  }

  function exportAsTxt() {
    const report = generateReportText()
    const blob = new Blob([report], { type: 'text/plain;charset=utf-8' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `ValveCompareReport_${Date.now()}.txt`
    a.click()
    URL.revokeObjectURL(url)
    toast.success('Report downloaded')
  }

  function exportAsCsv() {
    const headers = ['Brand', 'Type', 'Model', 'Size', 'Pressure', 'Material', 'Standard']
    const rows = comparisonList.map(v => [
      v.brands?.name || '',
      v.valve_types?.name || v.type || '',
      v.model || '',
      v.size_range || '',
      v.pressure_range || '',
      v.body_material || '',
      v.standard || '',
    ])
    
    let csv = '\uFEFF' + headers.join(',') + '\n'
    rows.forEach(row => {
      csv += row.map(cell => `"${cell}"`).join(',') + '\n'
    })
    
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `ValveQuote_${Date.now()}.csv`
    a.click()
    URL.revokeObjectURL(url)
    toast.success('CSV exported')
  }

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div 
        className="bg-white rounded-xl shadow-2xl max-w-5xl w-full max-h-[95vh] flex flex-col"
        onClick={e => e.stopPropagation()}
      >
        {/* Header */}
        <div className="sticky top-0 bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between rounded-t-xl">
          <div className="flex items-center gap-3">
            <ClipboardList className="w-6 h-6 text-blue-600" />
            <div>
              <h2 className="text-xl font-bold text-gray-900">
                Compare List
              </h2>
              <p className="text-xs text-gray-500">{comparisonList.length}  products</p>
            </div>
          </div>
          <div className="flex items-center gap-2">
            <button 
              onClick={exportAsTxt}
              className="flex items-center gap-1 px-3 py-2 text-sm bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
              title="Export TXT Report"
            >
              <FileText className="w-4 h-4" />
              TXT
            </button>
            <button 
              onClick={exportAsCsv}
              className="flex items-center gap-1 px-3 py-2 text-sm bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
              title="Export CSV Quote"
            >
              <Download className="w-4 h-4" />
              CSV
            </button>
            <button 
              onClick={clearComparison}
              className="flex items-center gap-1 px-3 py-2 text-sm text-red-600 hover:bg-red-50 rounded-lg"
            >
              <Trash2 className="w-4 h-4" />
              Clear All
            </button>
            <button onClick={onClose} className="p-2 hover:bg-gray-100 rounded-lg" aria-label="Close comparison">
              <X className="w-5 h-5" />
            </button>
          </div>
        </div>

        {/* Content: Comparison Table */}
        <div className="flex-1 overflow-auto p-6">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-gray-200">
                  <th className="text-left py-3 px-2 font-semibold text-gray-700 sticky left-0 bg-white" style={{minWidth: 80}}>Brands</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-700">Type</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-700">Size</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-700">Pressure</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-700">Material</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-700">Standard</th>
                  <th className="text-center py-3 px-4 font-semibold text-gray-700">Rating</th>
                  <th className="w-10 py-3 px-2"></th>
                </tr>
              </thead>
              <tbody>
                {comparisonList.map((valve, idx) => {
                  return (
                    <tr key={valve.id} className={`border-b border-gray-100 hover:bg-blue-50 transition-colors ${idx % 2 === 0 ? 'bg-white' : 'bg-gray-50'}`}>
                      <td className="py-4 px-2 sticky left-0 bg-inherit">
                        <div>
                          <span className="font-medium text-gray-900">{valve.brands?.name}</span>
                          {valve.brands?.country && (
                            <span className="text-xs text-gray-400 ml-1">({valve.brands.country})</span>
                          )}
                        </div>
                      </td>
                      <td className="py-4 px-2">
                        <span className="text-gray-800">{valve.valve_types?.name || valve.type}</span>
                        {valve.model && <span className="text-xs text-gray-400 block">{valve.model}</span>}
                      </td>
                      <td className="py-4 px-2 text-gray-700">{valve.size_range || '-'}</td>
                      <td className="py-4 px-2 text-gray-700">{valve.pressure_range || '-'}</td>
                      <td className="py-4 px-2 text-gray-700">{valve.body_material || '-'}</td>
                      <td className="py-4 px-2 text-gray-700">{valve.standard || '-'}</td>
                      <td className="py-4 px-2 text-center">
                        {valve.average_rating ? (
                          <span className="text-yellow-500">{'⭐'.repeat(Math.round(valve.average_rating))}</span>
                        ) : (
                          <span className="text-xs text-gray-400">N/A</span>
                        )}
                      </td>
                      <td className="py-4 px-2">
                        <button 
                          onClick={() => removeFromComparison(valve.id)}
                          className="text-gray-400 hover:text-red-500 transition-colors"
                          aria-label={`Remove ${valve.name || 'item'} from comparison`}
                        >
                          <X className="w-4 h-4" />
                        </button>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>

          {/* Summary */}
          <div className="mt-6 bg-gray-50 rounded-lg p-4">
            <div className="flex items-center justify-between text-sm">
              <div className="text-gray-600">
                {comparisonList.length} products
                <span className="mx-2">·</span>
                Click headers to sort
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
