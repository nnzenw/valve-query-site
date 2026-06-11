import re

path = r"F:/opencodeprj/valvehub/ima1/valve-query-site/src/App.tsx"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Add SEO import (after the last import line, or replace Helmet import)
content = content.replace(
    "import { HelmetProvider, Helmet } from 'react-helmet-async'",
    "import { HelmetProvider } from 'react-helmet-async'\nimport SEO from './components/seo/SEO'"
)

# 2. Remove ValveModal import
content = content.replace("import ValveModal from './components/ValveModal'\n", "")

# 3. Remove selectedValve state and setSelectedValve
content = re.sub(r"  const \[selectedValve, setSelectedValve\] = useState<ValveItem \| null>\(null\)\n", "", content)

# 4. Remove goToValveDetail function (dead code, navigate is used directly in onClick)
content = re.sub(
    r"  const goToValveDetail = \(valveId: number\): void => \{\n    navigate\(/valve/\$\{valveId\}\)\n  \}\n\n",
    "",
    content
)

# 5. Replace <Helmet> block with <SEO> in HomePage return
old_helmet = r'''      <Helmet>
        <title>\{\(\(\) => \{
          if \(searchParams\.valve_type_id\) \{
            const typeName = valveTypes\.find\(t => t\.id === searchParams\.valve_type_id\)\?\.name
            return \$\{typeName \|\| 'Valve'\} Specs & Manufacturers \| ValveSpecs Pro
          \}
          if \(searchParams\.keyword\) \{
            return Search: \$\{searchParams\.keyword\} - ValveSpecs Pro
          \}
          return 'Global Industrial Valve Specs Database \| ValveSpecs Pro - Compare & Select'
        \}\)\(\)\}</title>
        <meta name="description" content="Search and compare global industrial valve specifications covering 100\+ brands including KITZ, KSB, Fisher\. Complete technical data for ball valves, butterfly valves, gate valves, globe valves\." />
        <meta name="keywords" content="valve selection,ball valve,butterfly valve,gate valve,globe valve,valve specification,valve parameters,KITZ,KSB,Fisher" />
      </Helmet>'''

# Replace with SEO component
new_seo = '''      <SEO
        title={searchParams.valve_type_id
          ? ${(valveTypes.find(t => t.id === searchParams.valve_type_id) || {}).name || 'Valve'} Specs
          : searchParams.keyword
            ? Search: 
            : 'Global Industrial Valve Specifications Database'}
        description="Search and compare global industrial valve specifications covering 100+ brands including KITZ, KSB, Fisher. Complete technical data for ball valves, butterfly valves, gate valves, globe valves."
        canonical="https://valvespecs.pro"
        schemaData={homeFaqSchema}
        breadcrumb={[]}
      />'''

content = content.replace('''      <Helmet>
        <title>{(() => {
          if (searchParams.valve_type_id) {
            const typeName = valveTypes.find(t => t.id === searchParams.valve_type_id)?.name
            return $\\{typeName || 'Valve'} Specs & Manufacturers | ValveSpecs Pro
          }
          if (searchParams.keyword) {
            return Search: $\\{searchParams.keyword} - ValveSpecs Pro
          }
          return 'Global Industrial Valve Specs Database | ValveSpecs Pro - Compare & Select'
        })()}</title>
        <meta name="description" content="Search and compare global industrial valve specifications covering 100+ brands including KITZ, KSB, Fisher. Complete technical data for ball valves, butterfly valves, gate valves, globe valves." />
        <meta name="keywords" content="valve selection,ball valve,butterfly valve,gate valve,globe valve,valve specification,valve parameters,KITZ,KSB,Fisher" />
      </Helmet>''', new_seo)

# 6. Remove the dead ValveModal render block
content = re.sub(
    r"      \{selectedValve && \(.*?\{/\*\s*ValveModal\s*\*/\}\s*\n\s*\}\)",
    "",
    content,
    flags=re.DOTALL
)
# Also remove the remaining ValveModal block if still there
content = re.sub(
    r"      \{selectedValve && \(</?ValveModal|<ValveModal.*?\}\)",
    "",
    content,
    flags=re.DOTALL
)

# Try simpler: just remove the block between selectedValve check and closing brace
# Find and remove: {selectedValve && (\n        <ValveModal ... />\n      )}
# Use a simpler pattern
content = re.sub(
    r"\{selectedValve && \([^)]*\)\}",
    "",
    content
)

# 7. Add FAQ data and schema BEFORE the HomePage function
faq_data_block = '''
// Home page FAQ data for SEO
const HOME_FAQS = [
  {
    q: 'What is ValveSpecs Pro?',
    a: 'ValveSpecs Pro is a global industrial valve specifications database covering 100+ brands including KITZ, KSB, Fisher, and GEMU. Search and compare valve technical data for ball valves, butterfly valves, gate valves, globe valves, and more.',
  },
  {
    q: 'How do I search for valve specifications?',
    a: 'Use the search bar above to filter by keyword, brand, valve type, material, or application. You can also click Popular tags for quick access to common valve categories.',
  },
  {
    q: 'What valve types are covered in the database?',
    a: 'The database includes Ball Valve, Globe Valve, Butterfly Valve, Gate Valve, Check Valve, Control Valve, Diaphragm Valve, Needle Valve, Steam Trap, and Pressure Relief Valve.',
  },
  {
    q: 'Can I compare valves from different brands?',
    a: 'Yes. Click "Compare" on any valve card to add it to your comparison list. You can compare up to 10 valves side-by-side and export the comparison as TXT or CSV.',
  },
  {
    q: 'What standards are included in the specifications?',
    a: 'Specifications reference API (API 6D, API 600, API 602, API 607), ASME (B16.34, B16.10, B16.5), ISO (ISO 5208), DIN, and JIS standards.',
  },
]

const homeFaqSchema = {
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": HOME_FAQS.map(faq => ({
    "@type": "Question",
    "name": faq.q,
    "acceptedAnswer": {
      "@type": "Answer",
      "text": faq.a,
    },
  })),
}
'''

# Insert before the HomePage function
content = content.replace("function HomePage() {", faq_data_block + "\nfunction HomePage() {")

# 8. Add FAQ section in JSX - insert before closing </main> tag
# Find the last part of main: the pricing CTA section, then add FAQ after
faq_section = '''
      {/* FAQ Section for SEO */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-8">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">Frequently Asked Questions</h2>
        <div className="space-y-3">
          {HOME_FAQS.map((faq, idx) => (
            <details
              key={idx}
              className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 group"
            >
              <summary className="font-medium text-gray-900 cursor-pointer list-none flex items-center justify-between">
                {faq.q}
                <span className="text-gray-400 group-open:rotate-180 transition-transform">▾</span>
              </summary>
              <p className="mt-3 text-gray-600 leading-relaxed">{faq.a}</p>
            </details>
          ))}
        </div>
      </section>
'''

# Insert before </main>
content = content.replace("      </main>", faq_section + "\n      </main>")

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

print("App.tsx updated: SEO + FAQ + dead code removed")