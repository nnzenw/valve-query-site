"""
将爬取的品牌和产品数据导入到 Supabase
用法: python3 import_to_supabase.py --brands outputs/all_brands.json --products outputs/all_products.json
"""

import json, sys, os, uuid
from pathlib import Path
from typing import Dict, Any, List

# 添加项目根目录到路径
ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(ROOT / 'src'))

try:
    from supabase import create_client
except ImportError:
    print("安装 supabase 客户端...")
    os.system(f'{sys.executable} -m pip install @supabase/supabase-py -q')
    from supabase import create_client

# 从环境变量读取配置
from dotenv import load_dotenv
load_dotenv(ROOT / '.env')

SUPABASE_URL = os.getenv('VITE_SUPABASE_URL') or os.getenv('SUPABASE_URL')
SUPABASE_SERVICE_KEY = os.getenv('SUPABASE_SERVICE_KEY') or os.getenv('SUPABASE_SERVICE_ROLE_KEY')

if not SUPABASE_URL or not SUPABASE_SERVICE_KEY:
    print("错误: 缺少 Supabase 环境变量")
    print("请在 .env 文件中设置 SUPABASE_URL 和 SUPABASE_SERVICE_KEY")
    sys.exit(1)

supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)


def ensure_valve_type(type_key: str, type_name: str) -> str:
    """确保阀门类型存在，返回其 UUID"""
    # 查询是否存在
    res = supabase.table('valve_types').select('id').eq('type_key', type_key).execute()
    if res.data:
        return res.data[0]['id']
    
    # 创建新类型
    insert = supabase.table('valve_types').insert({
        'name': type_name,
        'type_key': type_key,
        'description': f'Auto-imported type: {type_name}'
    }).execute()
    
    if insert.data:
        return insert.data[0]['id']
    raise Exception(f"Failed to create valve_type: {type_key}")


def ensure_brand(brand_name: str, country: str, website: str = '', description: str = '') -> str:
    """确保品牌存在，返回其 UUID"""
    # 标准化名称
    normalized = brand_name.strip().upper()
    
    # 查询
    res = supabase.table('brands').select('id').eq('name', normalized).execute()
    if res.data:
        return res.data[0]['id']
    
    # 创建
    insert = supabase.table('brands').insert({
        'name': normalized,
        'country': country,
        'website': website,
        'description': description[:500] if description else '',
        'established': None,
        'certifications': [],
    }).execute()
    
    if insert.data:
        return insert.data[0]['id']
    raise Exception(f"Failed to create brand: {brand_name}")


def import_brands(brands_file: Path):
    with open(brands_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    brand_records = data if isinstance(data, list) else [d['brand'] for d in data.get('brands', [])]
    
    inserted = 0
    for b in brand_records:
        try:
            brand_id = ensure_brand(
                brand_name=b.get('name', 'Unknown'),
                country=b.get('country', 'XX'),
                website=b.get('website', ''),
                description=b.get('description', '')
            )
            print(f"✓ Brand: {b.get('name')} (ID: {brand_id})")
            inserted += 1
        except Exception as e:
            print(f"✗ Brand: {b.get('name')} failed: {e}")
    
    print(f"\nBrand import complete: {inserted}/{len(brand_records)} inserted/updated.")


def import_products(products_file: Path):
    with open(products_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    if not isinstance(data, list):
        print("Error: products file should be a JSON array")
        return
    
    inserted = 0
    for p in data:
        try:
            brand_name = p.get('brand', 'Unknown')
            brand_country = p.get('brand_country', 'XX')
            
            # 1. 确保品牌存在
            brand_id = ensure_brand(brand_name, brand_country)
            
            # 2. 确定阀门类型
            valve_type = p.get('valve_type', 'general_products')
            # 简单映射：如果 valve_type 是 'ball_valve', 'gate_valve' 等，直接作为 type_key
            type_key = valve_type.lower().replace(' ', '_')
            # 映射到标准类型名称（可扩展）
            type_name_map = {
                'ball_valve': 'Ball Valve',
                'gate_valve': 'Gate Valve',
                'globe_valve': 'Globe Valve',
                'check_valve': 'Check Valve',
                'butterfly_valve': 'Butterfly Valve',
                'control_valve': 'Control Valve',
                'diaphragm_valve': 'Diaphragm Valve',
                'needle_valve': 'Needle Valve',
                'safety_valve': 'Safety Valve',
                'relief_valve': 'Pressure Relief Valve',
                'steam_trap': 'Steam Trap',
                'actuator': 'Actuator',
                'general_products': 'General Valve Products'
            }
            type_name = type_name_map.get(type_key, valve_type.title())
            
            type_id = ensure_valve_type(type_key, type_name)
            
            # 3. 构造规格字段
            specs = p.get('specs', {})
            
            # 映射常见字段
            def get_spec(key):
                for k in specs:
                    if key.lower() in k.lower():
                        return str(specs[k])[:500]
                return None
            
            model = p.get('model', '')[:100]
            size_range = get_spec('size') or get_spec('DN') or get_spec('NPS')
            pressure_range = get_spec('pressure') or get_spec('PN') or get_spec('Class')
            temp_range = get_spec('temperature') or get_spec('temp')
            body_material = get_spec('body') or get_spec('material')
            trim_material = get_spec('trim')
            seal_material = get_spec('seal') or get_spec('gasket')
            stem_material = get_spec('stem')
            end_connection = get_spec('connection') or get_spec('flange') or get_spec('welded')
            standard = get_spec('standard') or get_spec('API') or get_spec('ISO') or get_spec('DIN')
            operation = get_spec('operation') or get_spec('actuator') or get_spec('manual')
            
            # 4. 插入产品
            product_insert = supabase.table('valve_specs').insert({
                'brand_id': brand_id,
                'valve_type_id': type_id,
                'model': model,
                'size_range': size_range or '',
                'pressure_range': pressure_range or '',
                'temperature_range': temp_range or '',
                'body_material': body_material or '',
                'trim_material': trim_material or '',
                'seal_material': seal_material or '',
                'stem_material': stem_material or '',
                'end_connection': end_connection or '',
                'standard': standard or '',
                'operation_method': operation or '',
                'flow_coefficient': get_spec('Cv') or get_spec('Kv'),
                'leak_rate': get_spec('leak') or get_spec('tightness'),
                'fire_safe': False,
                'anti_static': False,
                'applicable_media': [],
                'applications': [],
                'industry_tags': [brand_name],
                'specs_json': specs,
                'is_active': True,
            }).execute()
            
            if product_insert.data:
                inserted += 1
                print(f"✓ Product: {p.get('model', 'unknown')} (brand: {brand_name})")
            else:
                print(f"✗ Product: {p.get('model', 'unknown')} failed")
        
        except Exception as e:
            print(f"✗ Error processing product: {e}")
    
    print(f"\nProduct import complete: {inserted}/{len(data)} inserted.")


def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--brands', default='outputs/all_brands.json', help='品牌数据 JSON')
    parser.add_argument('--products', default='outputs/all_products.json', help='产品数据 JSON')
    args = parser.parse_args()

    print("Importing brands...")
    import_brands(Path(args.brands))

    print("\nImporting products...")
    import_products(Path(args.products))

    print("\n✅ Import complete.")


if __name__ == '__main__':
    main()
