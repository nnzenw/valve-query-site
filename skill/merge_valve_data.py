"""
合并所有品牌数据到统一文件
用法: python3 merge_valve_data.py --input-dir outputs/ --output all_valve_data.json
"""

import json
import argparse
from pathlib import Path
from typing import List, Dict, Any


def merge_data(input_dir: str, output_file: str) -> None:
    """合并所有 {brand}_data.json 到单一文件"""
    output_path = Path(input_dir)
    json_files = sorted(output_path.glob('*_data.json'))

    if not json_files:
        print(f"No data files found in {input_dir}")
        return

    all_brands: List[Dict[str, Any]] = []
    total_products = 0

    for fpath in json_files:
        with open(fpath, 'r', encoding='utf-8') as f:
            data = json.load(f)

        brand = data.get('brand', {})
        products = brand.get('products', [])
        total_products += len(products)

        all_brands.append({
            "brand": brand,
            "file_source": str(fpath.name),
        })

        print(f"✓ {fpath.stem}: {len(products)} products")

    merged = {
        "meta": {
            "version": "1.0",
            "generated": str(json),
            "total_brands": len(all_brands),
            "total_products": total_products,
            "source_files": [f.name for f in json_files],
        },
        "brands": all_brands,
    }

    out = Path(output_file)
    out.parent.mkdir(parents=True, exist_ok=True)
    with open(out, 'w', encoding='utf-8') as f:
        json.dump(merged, f, indent=2, ensure_ascii=False)

    print(f"\nMerged {len(all_brands)} brands, {total_products} products → {output_file}")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--input-dir', required=True, help='含品牌数据 JSON 的目录')
    parser.add_argument('--output', default='all_valve_data.json', help='合并输出文件')
    args = parser.parse_args()
    merge_data(args.input_dir, args.output)
