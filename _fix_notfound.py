with open("F:/opencodeprj/valvehub/ima1/valve-query-site/src/pages/NotFoundPage.jsx", 'r', encoding='utf-8') as f:
    content = f.read()

# Replace Link import with useNavigate
content = content.replace(
    "import { Link } from 'react-router-dom'",
    "import { useNavigate } from 'react-router-dom'"
)

# Replace component function to use navigate
old = """export default function NotFoundPage() {
  return (
    <div className=\"min-h-screen bg-gradient-to-br from-slate-50 to-blue-50 flex items-center justify-center p-4\">
      <div className=\"max-w-lg w-full bg-white rounded-lg shadow-lg p-8 text-center\">
        <h1 className=\"text-6xl font-bold text-blue-600 mb-4\">404</h1>
        <h2 className=\"text-2xl font-bold text-gray-900 mb-4\">Page Not Found</h2>
        <p className=\"text-gray-600 mb-6\">
          The page you are looking for doesn't exist or has been moved.
        </p>
        <Link
          to=\"/\"
          className=\"inline-block px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors\"
        >
          Back to Home
        </Link>
      </div>
    </div>
  )
}"""

new = """export default function NotFoundPage() {
  const navigate = useNavigate()
  return (
    <div className=\"min-h-screen bg-gradient-to-br from-slate-50 to-blue-50 flex items-center justify-center p-4\">
      <div className=\"max-w-lg w-full bg-white rounded-lg shadow-lg p-8 text-center\">
        <h1 className=\"text-6xl font-bold text-blue-600 mb-4\">404</h1>
        <h2 className=\"text-2xl font-bold text-gray-900 mb-4\">Page Not Found</h2>
        <p className=\"text-gray-600 mb-6\">
          The page you are looking for doesn't exist or has been moved.
        </p>
        <button
          onClick={() => navigate('/')}
          className=\"inline-block px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors cursor-pointer\"
        >
          Back to Home
        </button>
      </div>
    </div>
  )
}"""

content = content.replace(old, new)

with open("F:/opencodeprj/valvehub/ima1/valve-query-site/src/pages/NotFoundPage.jsx", 'w', encoding='utf-8') as f:
    f.write(content)

print("Fix 3 done")
