import re

path = r"F:/opencodeprj/valvehub/ima1/valve-query-site/src/pages/BrandsPage.jsx"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

# Step 1: Add useNavigate import
content = content.replace(
    "import { useState, useEffect } from 'react'",
    "import { useState, useEffect } from 'react'\nimport { useNavigate } from 'react-router-dom'"
)

# Step 2: Insert navigate hook
content = content.replace(
    "export default function BrandsPage() {",
    "export default function BrandsPage() {\n  const navigate = useNavigate();"
)

# Step 3: Remove goBrand function
content = re.sub(r"(?s)function goBrand\(brandId, e\) \{.*?\}", "", content)

# Step 4: Replace <a> opening tag with <button>
pattern = r"(?ms)^(\s*)<a\s+key=\{brand\.id\}.*?>"
replacement = r"\1<button key={brand.id} onClick={() => navigate(/brand/)} className=\"bg-white rounded-lg p-5 border border-gray-200 hover:shadow-md hover:border-blue-300 transition-all group text-left cursor-pointer\">"
content = re.sub(pattern, replacement, content)

# Step 5: Replace closing </a> with </button>
content = content.replace("</a>", "</button>")

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

print("BrandsPage navigation updated successfully")
