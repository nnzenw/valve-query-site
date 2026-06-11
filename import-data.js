import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'
import { createClient } from '@supabase/supabase-js'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

// 加载 Supabase 配置
const SUPABASE_URL = process.env.SUPABASE_URL
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
  console.error('❌ 缺少环境变量，请设置 SUPABASE_URL 和 SUPABASE_SERVICE_KEY')
  console.error('   示例: SUPABASE_URL=https://xxx.supabase.co SUPABASE_SERVICE_KEY=xxx node import-data.js')
  process.exit(1)
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY)

// 数据文件路径：从项目根目录下的 data/ 文件夹读取
const DATA_DIR = path.join(__dirname, 'data')
const DATA_FILES = [
  'valve_specs_v2.json',
  'valve_specs_final.json'
]

// 阀门类型映射表 (中文 -> 英文 key)
const VALVE_TYPE_MAP = {
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

/**
 * 清理尺寸范围文本，提取标准格式
 */
function cleanSizeRange(size) {
  if (!size) return null
  return String(size).replace(/\[|\]/g, '')
}

/**
 * 清理压力范围文本
 */
function cleanPressureRange(pressure) {
  if (!pressure) return null
  return String(pressure).replace(/\[|\]/g, '')
}

/**
 * 从综合规格中提取数组字段
 */
function extractArrayValue(obj, key) {
  const val = obj[key]
  if (Array.isArray(val)) return val
  if (typeof val === 'string') return [val]
  return []
}

/**
 * 解析单个阀门类型数据
 */
function parseValveType(typeName, typeData) {
  const records = []
  const comprehensive = typeData['综合规格'] || {}
  const details = typeData['详细数据'] || []

  // 确定阀门类型 key
  const typeKey = typeData.type_key || VALVE_TYPE_MAP[typeName] || typeName.toLowerCase().replace(/\s+/g, '_')

  // 准备阀门类型数据
  const valveTypeRecord = {
    name: typeName,
    type_key: typeKey,
    description: typeData['阀门类型'] || typeName,
    common_applications: extractArrayValue(comprehensive, '应用场景')
  }

  // 准备品牌记录（去重）
  const brandMap = new Map()
  const brandList = typeData['厂家列表'] || []

  details.forEach(detail => {
    const manufacturer = detail.manufacturer
    if (!manufacturer) return

    // 收集品牌信息
    if (!brandMap.has(manufacturer)) {
      brandMap.set(manufacturer, {
        name: manufacturer,
        country: detail.country || null,
        established: detail.established || null,
        description: detail.description || null,
        website: null
      })
    }

    // 构建阀门规格记录
    const spec = {
      model: detail.model || null,
      size_range: cleanSizeRange(detail.size || comprehensive['尺寸范围']),
      pressure_range: cleanPressureRange(detail.pressure || comprehensive['压力等级']),
      temperature_range: detail.temperature || null,
      body_material: detail.material || comprehensive['阀体材质'] || null,
      trim_material: detail.trim || null,
      seal_material: detail.seal || comprehensive['密封材质'] || null,
      stem_material: detail.stem || null,
      end_connection: detail.end_connection || null,
      standard: detail.standard || comprehensive['主要标准'] || null,
      operation_method: detail.operation_method || null,
      flow_coefficient: detail.flow_coefficient || null,
      leak_rate: detail.leak_rate || null,
      fire_safe: detail.fire_safe || false,
      anti_static: detail.anti_static || false,
      applicable_media: extractArrayValue(detail, '适用介质'),
      applications: extractArrayValue(comprehensive, '应用场景'),
      industry_tags: extractArrayValue(detail, '行业标签'),
      specs_json: detail
    }

    records.push({
      valveType: valveTypeRecord,
      brand: brandMap.get(manufacturer),
      spec
    })
  })

  return {
    valveType: valveTypeRecord,
    brands: Array.from(brandMap.values()),
    specs: records.map(r => r.spec)
  }
}

/**
 * 加载并解析数据文件
 */
function loadDataFiles() {
  const allData = []

  DATA_FILES.forEach(file => {
    const filePath = path.join(DATA_DIR, file)
    if (!fs.existsSync(filePath)) {
      console.warn(`⚠️  文件不存在: ${filePath}`)
      return
    }

    const content = fs.readFileSync(filePath, 'utf-8')
    const data = JSON.parse(content)

    if (data.by_type) {
      Object.entries(data.by_type).forEach(([typeName, typeData]) => {
        allData.push(parseValveType(typeName, typeData))
      })
    }
  })

  return allData
}

/**
 * 导入数据到 Supabase
 */
async function importToSupabase() {
  console.log('🚀 开始导入阀门数据到 Supabase...\n')

  // 加载数据
  const allData = loadDataFiles()
  console.log(`📊 解析到 ${allData.length} 个阀门类型数据\n`)

  // 收集所有品牌和阀门类型（去重）
  const brandSet = new Map()
  const valveTypeSet = new Map()
  const allSpecs = []

  allData.forEach(data => {
    // 收集阀门类型
    if (data.valveType && !valveTypeSet.has(data.valveType.type_key)) {
      valveTypeSet.set(data.valveType.type_key, data.valveType)
    }

    // 收集品牌
    data.brands?.forEach(brand => {
      if (brand && !brandSet.has(brand.name)) {
        brandSet.set(brand.name, brand)
      }
    })

    // 收集规格
    allSpecs.push(...(data.specs || []))
  })

  console.log(`📈 统计:`)
  console.log(`   - 阀门类型: ${valveTypeSet.size}`)
  console.log(`   - 品牌: ${brandSet.size}`)
  console.log(`   - 规格记录: ${allSpecs.length}\n`)

  // 1. 插入阀门类型
  console.log('1️⃣  插入阀门类型...')
  for (const [key, type] of valveTypeSet) {
    const { data, error } = await supabase
      .from('valve_types')
      .upsert(type, { onConflict: 'type_key' })
      .select()
    
    if (error) {
      console.error(`   ❌ 插入阀门类型失败: ${key}`, error)
    }
  }
  console.log(`   ✅ 完成\n`)

  // 2. 插入品牌
  console.log('2️⃣  插入品牌...')
  for (const [name, brand] of brandSet) {
    const { data, error } = await supabase
      .from('brands')
      .upsert(brand, { onConflict: 'name' })
      .select()
    
    if (error) {
      console.error(`   ❌ 插入品牌失败: ${name}`, error)
    }
  }
  console.log(`   ✅ 完成\n`)

  // 3. 获取品牌和类型 ID 映射
  console.log('3️⃣  获取 ID 映射...')
  const brandsRes = await supabase.from('brands').select('id, name')
  const typesRes = await supabase.from('valve_types').select('id, type_key')

  const brandIdMap = new Map(brandsRes.data.map(b => [b.name, b.id]))
  const typeIdMap = new Map(typesRes.data.map(t => [t.type_key, t.id]))

  // 4. 插入规格记录
  console.log('4️⃣  插入规格记录...')
  const batchSize = 50
  let successCount = 0
  let errorCount = 0

  for (let i = 0; i < allSpecs.length; i += batchSize) {
    const batch = allSpecs.slice(i, i + batchSize)
    
    const specsToInsert = batch.map(spec => {
      // 找到对应的品牌和类型 ID
      const manufacturer = spec.specs_json?.manufacturer
      const brandId = brandIdMap.get(manufacturer)
      const typeId = typeIdMap.get(spec.type_key || VALVE_TYPE_MAP[spec.type] || '')

      return {
        brand_id: brandId || null,
        valve_type_id: typeId || null,
        ...spec
      }
    }).filter(spec => spec.brand_id || spec.valve_type_id)

    const { data, error } = await supabase
      .from('valve_specs')
      .upsert(specsToInsert, { onConflict: 'id' })

    if (error) {
      console.error(`   ❌ 批量插入失败 (${i}-${i + batch.length}):`, error)
      errorCount += batch.length
    } else {
      successCount += batch.length
      console.log(`   ✅ 已导入 ${i + batch.length}/${allSpecs.length}`)
    }
  }

  console.log(`\n✅ 导入完成!`)
  console.log(`   - 成功: ${successCount}`)
  console.log(`   - 失败: ${errorCount}`)
}

// 执行导入
importToSupabase().catch(err => {
  console.error('❌ 导入失败:', err)
  process.exit(1)
})
