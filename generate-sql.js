// 生成 SQL 导入文件
import fs from 'fs'

const data = JSON.parse(fs.readFileSync('valve_database_real_final.json','utf8'))

function esc(v) {
  if (v === null || v === undefined || v === '') return 'NULL'
  if (typeof v === 'boolean') return v ? 'TRUE' : 'FALSE'
  if (typeof v === 'number') return v.toString()
  return "'" + String(v).replace(/'/g, "''") + "'"
}

// Collect unique brands and types
const brandMap = new Map()
const typeMap = new Map()

const TYPE_KEYS = {
  'Ball Valve': 'ball_valve',
  'Butterfly Valve': 'butterfly_valve',
  'Gate Valve': 'gate_valve',
  'Globe Valve': 'globe_valve',
  'Check Valve': 'check_valve',
  'Control Valve': 'control_valve',
  'Diaphragm Valve': 'diaphragm_valve',
  'Needle Valve': 'needle_valve',
  'Steam Trap': 'steam_trap',
  'Pressure Relief Valve': 'pressure_relief_valve'
}

// Process data
data.forEach(d => {
  if (d.brand_name && !brandMap.has(d.brand_name)) {
    brandMap.set(d.brand_name, { name: d.brand_name, country: d.country || null })
  }
  if (d.product_type && !typeMap.has(d.product_type)) {
    const key = TYPE_KEYS[d.product_type] || d.product_type.toLowerCase().replace(/\s+/g, '_')
    typeMap.set(d.product_type, { name: d.product_type, type_key: key })
  }
})

let sql = '-- Valve Database Import (from valve_database_real_final.json)\n'
sql += '-- Generated: ' + new Date().toISOString() + '\n\n'

// Brands
sql += '-- Brands\n'
sql += 'INSERT INTO brands (name, country) VALUES\n'
const brandValues = []
brandMap.forEach(b => {
  brandValues.push(`(${esc(b.name)}, ${esc(b.country)})`)
})
sql += brandValues.join(',\n') + '\n'
sql += 'ON CONFLICT (name) DO NOTHING;\n\n'

// Types
sql += '-- Valve Types\n'
sql += 'INSERT INTO valve_types (name, type_key, description, common_applications) VALUES\n'
const typeValues = []
typeMap.forEach(t => {
  typeValues.push(`(${esc(t.name)}, ${esc(t.type_key)}, ${esc('Industrial ' + t.name)}, ARRAY['Industrial'])`)
})
sql += typeValues.join(',\n') + '\n'
sql += 'ON CONFLICT (type_key) DO NOTHING;\n\n'

// Specs using PL/pgSQL block
sql += '-- Valve Specs (using PL/pgSQL for FK resolution)\n'
sql += 'DO $$\nDECLARE\n  brand_id UUID;\n  type_id UUID;\n  d RECORD;\nBEGIN\n'

data.forEach(d => {
  const bn = d.brand_name || ''
  const tn = d.product_type || ''
  const specs = d.specifications || {}

  sql += `  SELECT id INTO brand_id FROM brands WHERE name = ${esc(bn)};\n`
  sql += `  SELECT id INTO type_id FROM valve_types WHERE name = ${esc(tn)};\n`
  sql += `  IF brand_id IS NOT NULL THEN\n`
  sql += `    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)\n`
  sql += `    VALUES (\n`
  sql += `      brand_id, type_id,\n`
  sql += `      ${esc(d.product_id || d.model)},\n`
  sql += `      ${esc(specs.size || null)},\n`
  sql += `      ${esc(specs.pressure || null)},\n`
  sql += `      ${esc(specs.temperature || null)},\n`
  sql += `      ${esc(specs.material || null)},\n`
  sql += `      ${esc(specs.seal || null)},\n`
  sql += `      ${esc(specs.connection || null)},\n`
  sql += `      ${esc(specs.standard || null)},\n`
  sql += `      ${esc(specs.operation || null)},\n`
  sql += `      '${JSON.stringify(d).replace(/'/g, "''")}'::jsonb\n`
  sql += `    ) ON CONFLICT DO NOTHING;\n`
  sql += `  END IF;\n`
})

sql += 'END\n$$;\n'

fs.writeFileSync('data-import.sql', sql, 'utf-8')
console.log(`Generated data-import.sql (${(Buffer.byteLength(sql) / 1024).toFixed(1)} KB)`)
console.log(`Brands: ${brandMap.size}, Types: ${typeMap.size}, Records: ${data.length}`)
