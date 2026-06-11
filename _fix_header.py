import re

path = "F:/opencodeprj/valvehub/ima1/valve-query-site/src/components/Header.jsx"
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Add useNavigate import
content = content.replace(
    "import { Wrench, ClipboardList, Lightbulb, Zap, User } from 'lucide-react'",
    "import { Wrench, ClipboardList, Lightbulb, Zap, User } from 'lucide-react'\nimport { useNavigate } from 'react-router-dom'"
)

# 2. Add navigate() inside component
content = content.replace(
    "const { isPro, user, mockLogout } = useSubscription()",
    "const { isPro, user, mockLogout } = useSubscription()\n  const navigate = useNavigate()"
)

# 3. Replace Blog link with button
old = '<a\n              href="/blog"\n              onClick={(e) => { e.preventDefault(); window.history.pushState(null, "", "/blog"); window.dispatchEvent(new PopStateEvent("popstate")) }}\n              className="text-sm text-gray-600 hover:text-blue-600 transition-colors"\n            >\n              Blog\n            </a>'
new = '<button\n              onClick={() => navigate("/blog")}\n              className="text-sm text-gray-600 hover:text-blue-600 transition-colors cursor-pointer"\n            >\n              Blog\n            </button>'
content = content.replace(old, new)

# 4. Replace Brands link with button
old = '<a\n              href="/brands"\n              onClick={(e) => { e.preventDefault(); window.history.pushState(null, "", "/brands"); window.dispatchEvent(new PopStateEvent("popstate")) }}\n              className="text-sm text-gray-600 hover:text-blue-600 transition-colors"\n            >\n              Brands\n            </a>'
new = '<button\n              onClick={() => navigate("/brands")}\n              className="text-sm text-gray-600 hover:text-blue-600 transition-colors cursor-pointer"\n            >\n              Brands\n            </button>'
content = content.replace(old, new)

with open(path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Fix 2 done")
