import re

path = "F:/opencodeprj/valvehub/ima1/valve-query-site/src/App.tsx"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. replace function call
content = content.replace("onClick={() => goToValveDetail(valve.id)}", "onClick={() => navigate(`/valve/${valve.id}`)}")

# 2. remove state declaration
content = re.sub(r"const \[selectedValve, setSelectedValve\] = useState<ValveItem \| null>\(null\);\s*\n", "", content)

# 3. remove function definition
content = re.sub(r"\s+const goToValveDetail = \(valveId: number\): void => \{\s*\n\s+navigate\(`/valve/\$\{valveId\}`\);\s*\n\s+\}\s*\n", "", content, flags=re.DOTALL)

# 4. remove modal block
content = re.sub(r"\s*\{selectedValve && \(\s*<ValveModal\s+valve=\{selectedValve\}\s+onClose=\{\(\) => setSelectedValve\(null\)\}\s+allValves=\{valves\}\s*\/>\s*\)\}\s*", "", content, flags=re.DOTALL)

# 5. remove import
content = content.replace("import ValveModal from './components/ValveModal'\n", "")

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

print("Cleanup done")
