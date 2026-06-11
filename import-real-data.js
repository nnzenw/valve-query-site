import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'
import { createClient } from '@supabase/supabase-js'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const SUPABASE_URL = process.env.SUPABASE_URL
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
  console.error('❌ 缺少环境变量:')
  console.error('   SUPABASE_URL=https://xxx.supabase.co SUPABASE_SERVICE_KEY=eyJxxx node import-real-data.js')
  process.exit(1)
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY)
const DATA_FILE = path.join(__dirname, 'valve_database_real_final.json')

// Valve type mapping (product_type key -> valve_types.type_key)
const TYPE_MAP = {
  butterfly_valve: 'butterfly_valve',
  ball_valve: 'ball_valve',
  gate_valve: 'gate_valve',
  globe_valve: 'globe_valve',
  check_valve: 'check_valve',
  control_valve: 'control_valve',
  diaphragm_valve: 'diaphragm_valve',
  needle_valve: 'needle_valve',
  steam_trap: 'steam_trap',
  pressure_relief_valve: 'pressure_relief_valve',
  safety_valve: 'pressure_relief_valve',
  prv: 'pressure_relief_valve',
  regulating_valve: 'control_valve',
  shut_off_valve: 'ball_valve',
  knife_gate_valve: 'gate_valve',
  pinch_valve: 'diaphragm_valve',
  plug_valve: 'ball_valve',
}

function inferTypeKey(productType) {
  if (!productType) return 'ball_valve'
  const lower = productType.toLowerCase().replace(/[\s-]/g, '_')
  if (TYPE_MAP[lower]) return TYPE_MAP[lower]
  // fuzzy match
  for (const [k, v] of Object.entries(TYPE_MAP)) {
    if (lower.includes(k)) return v
  }
  return 'ball_valve'
}

function spec(obj, ...keys) {
  for (const k of keys) {
    if (obj?.[k] != null && obj[k] !== '') return obj[k]
  }
  return null
}

function toArray(val) {
  if (!val) return []
  if (Array.isArray(val)) return val
  return [String(val)]
}

function parseProduct(item) {
  const s = item.specifications || {}
  return {
    model: item.product_name || item.product_id || null,
    size_range: spec(s, 'size', 'size_mm') || null,
    pressure_range: spec(s, 'pressure_class', 'pressure', 'pn_rating'),
    temperature_range: spec(s, 'operating_temp', 'temperature'),
    body_material: spec(s, 'body_material', 'body'),
    trim_material: spec(s, 'trim_material', 'trim'),
    seal_material: spec(s, 'seal_material', 'liner_material', 'seal'),
    stem_material: spec(s, 'stem_material'),
    end_connection: spec(s, 'end_connection'),
    standard: toArray(item.standards || spec(s, 'standards')).join(', ') || null,
    operation_method: spec(s, 'operation_method', 'actuation'),
    flow_coefficient: spec(s, 'kvs', 'cv_value', 'flow_coefficient'),
    leak_rate: spec(s, 'leak_rate'),
    fire_safe: Boolean(spec(s, 'fire_safe')),
    anti_static: Boolean(spec(s, 'anti_static')),
    applicable_media: toArray(spec(s, 'medium', 'media', 'fluid')),
    applications: toArray(item.application),
    industry_tags: toArray(spec(s, 'industry_tags')),
    specs_json: item,
  }
}

async function main() {
  console.log('🚀 导入 valve_database_real_final.json...\n')

  if (!fs.existsSync(DATA_FILE)) {
    console.error(`❌ 文件不存在: ${DATA_FILE}`)
    process.exit(1)
  }

  const raw = JSON.parse(fs.readFileSync(DATA_FILE, 'utf-8'))
  console.log(`📊 原始记录: ${raw.length}`)

  // 1. 提取品牌（去重）
  const brandMap = new Map()
  raw.forEach(item => {
    const name = item.brand_name?.trim()
    if (name && !brandMap.has(name)) {
      brandMap.set(name, { name })
    }
  })
  console.log(`📈 品牌: ${brandMap.size}`)

  // 2. 提取类型（去重）
  const typeMap = new Map()
  raw.forEach(item => {
    const typeKey = inferTypeKey(item.product_type)
    const typeName = item.product_type?.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) || 'Ball Valve'
    if (!typeMap.has(typeKey)) {
      typeMap.set(typeKey, { name: typeName, type_key: typeKey })
    }
  })
  console.log(`📈 类型: ${typeMap.size}`)

  // 3. 插入品牌
  console.log('\n1️⃣  插入品牌...')
  let brandInsertCount = 0
  for (const [name, brand] of brandMap) {
    const { error } = await supabase
      .from('brands')
      .upsert(brand, { onConflict: 'name' })
      .select()
    if (error) {
      console.error(`   ❌ ${name}:`, error.message)
    } else {
      brandInsertCount++
    }
  }
  console.log(`   ✅ 成功: ${brandInsertCount}/${brandMap.size}\n`)

  // 4. 插入类型
  console.log('2️⃣  插入阀门类型...')
  let typeInsertCount = 0
  for (const [key, type] of typeMap) {
    const { error } = await supabase
      .from('valve_types')
      .upsert(type, { onConflict: 'type_key' })
      .select()
    if (error) {
      console.error(`   ❌ ${key}:`, error.message)
    } else {
      typeInsertCount++
    }
  }
  console.log(`   ✅ 成功: ${typeInsertCount}/${typeMap.size}\n`)

  // 5. 获取 ID 映射
  console.log('3️⃣  获取 ID 映射...')
  const brandsRes = await supabase.from('brands').select('id, name')
  const typesRes = await supabase.from('valve_types').select('id, type_key')

  const brandIdMap = new Map(brandsRes.data.map(b => [b.name, b.id]))
  const typeIdMap = new Map(typesRes.data.map(t => [t.type_key, t.id]))
  console.log(`   品牌 ID: ${brandIdMap.size}, 类型 ID: ${typeIdMap.size}\n`)

  // 6. 批量插入规格
  console.log('4️⃣  插入规格记录...')
  const batchSize = 50
  let success = 0
  let fail = 0

  for (let i = 0; i < raw.length; i += batchSize) {
    const batch = raw.slice(i, i + batchSize)

    const specs = batch.map(item => {
      const brandId = brandIdMap.get(item.brand_name?.trim())
      const typeKey = inferTypeKey(item.product_type)
      const typeId = typeIdMap.get(typeKey)
      const parsed = parseProduct(item)
      return {
        brand_id: brandId || null,
        valve_type_id: typeId || null,
        ...parsed,
      }
    }).filter(s => s.brand_id || s.valve_type_id)

    const { error } = await supabase
      .from('valve_specs')
      .upsert(specs, { onConflict: 'id' })

    if (error) {
      console.error(`   ❌ 批次 ${i}-${i + batch.length}:`, error.message)
      fail += batch.length
    } else {
      success += specs.length
      console.log(`   ✅ ${Math.min(i + batchSize, raw.length)}/${raw.length}`)
    }
  }

  console.log(`\n✅ 导入完成!`)
  console.log(`   成功: ${success}`)
  console.log(`   失败: ${fail}`)
}

main().catch(err => {
  console.error('❌', err)
  process.exit(1)
})
