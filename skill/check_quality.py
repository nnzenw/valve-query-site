"""
检查爬取数据的质量
用法: python3 check_quality.py --input all_valve_data.json
"""

import json
import argparse
from pathlib import Path
from typing import Dict, Any


REQUIRED_BRAND_FIELDS = ['brand_id', 'name', 'website', 'data_quality', 'crawl_date']
REQUIRED_PRODUCT_FIELDS = ['product_id', 'type', 'specifications']


def check_brand(brand: Dict[str, Any]) -> Dict[str, Any]:
    """检查单个品牌数据质量"""
    issues = []

    for field in REQUIRED_BRAND_FIELDS:
        if not brand.get(field):
            issues.append(f"Missing brand field: {field}")

    products = brand.get('products', [])
    product_issues = []

    for p in products:
        for field in REQUIRED_PRODUCT_FIELDS:
            if not p.get(field):
                product_issues.append(f"Product '{p.get('product_id', 'unknown')}' missing: {field}")

    if not products:
        issues.append("No products extracted")
    elif len(products) < 3:
        issues.append(f"Only {len(products)} products (recommended ≥3)")

    # 估算质量等级
    if len(product_issues) == 0 and len(issues) == 0:
        quality = 'high'
    elif len(product_issues) <= 2 and not any('Missing' in i for i in issues):
        quality = 'medium'
    else:
        quality = 'low'

    return {
        "brand_id": brand.get('brand_id'),
        "quality": quality,
        "product_count": len(products),
        "issues": issues + product_issues,
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', required=True, help='合并后的数据文件')
    parser.add_argument('--json-output', help='JSON 格式结果输出')
    args = parser.parse_args()

    with open(args.input, 'r', encoding='utf-8') as f:
        data = json.load(f)

    brands = data.get('brands', [])
    results = []
    summary = {'total': 0, 'high': 0, 'medium': 0, 'low': 0}

    for b in brands:
        brand_data = b.get('brand', {})
        check = check_brand(brand_data)
        results.append(check)
        summary['total'] += 1
        summary[check['quality']] += 1

    # 打印摘要
    print("=" * 60)
    print(f"Data Quality Report: {args.input}")
    print("=" * 60)
    print(f"Total brands: {summary['total']}")
    print(f"  High quality:   {summary['high']}")
    print(f"  Medium quality: {summary['medium']}")
    print(f"  Low quality:    {summary['low']}")
    print()

    for r in results:
        status = "✓" if r['quality'] != 'low' else "✗"
        print(f"{status} {r['brand_id']}: {r['product_count']} products ({r['quality']})")
        for issue in r['issues'][:3]:
            print(f"  - {issue}")

    # 可选 JSON 输出
    if args.json_output:
        with open(args.json_output, 'w', encoding='utf-8') as f:
            json.dump(summary, f, indent=2)
        print(f"\nSummary saved to {args.json_output}")


if __name__ == '__main__':
    main()
