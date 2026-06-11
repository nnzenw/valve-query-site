import re

path = r"F:/opencodeprj/valvehub/ima1/valve-query-site/src/App.tsx"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Remove selectedValve state line
content = re.sub(r"  const \[selectedValve, setSelectedValve\] = useState.*?\n", "", content)

# 2. Remove goToValveDetail function
content = re.sub(r"  const goToValveDetail.*?\n    navigate.*?\n  \}\n", "", content)

# 3. Remove the ValveModal render block (selectedValve && ... ValveModal)
# Match from {selectedValve && ( to the closing )}
content = re.sub(r"\{selectedValve && \(.*?\}\)", "", content, flags=re.DOTALL)

# 4. Replace Helmet block with SEO
# Find the <Helmet>...</Helmet> block and replace
old_helmet = re.search(r"<Helmet>.*?</Helmet>", content, re.DOTALL)
if old_helmet:
    new_seo = '''<SEO
        title={searchParams.valve_type_id
          ? ${(valveTypes.find(t => t.id === searchParams.valve_type_id) || {}).name || 'Valve'} Specs
          : searchParams.keyword
            ? Search: 
            : 'Global Industrial Valve Specifications Database'}
        description="Search and compare global industrial valve specifications covering 100+ brands including KITZ, KSB, Fisher. Complete technical data for ball valves, butterfly valves, gate valves, globe valves."
        canonical="https://valvespecs.pro"
        schemaData={homeFaqSchema}
      />'''
    content = content[:old_helmet.start()] + new_seo + content[old_helmet.end():]

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

print("App.tsx cleaned up")
