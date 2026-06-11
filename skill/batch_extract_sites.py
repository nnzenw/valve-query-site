import json, time, os, sys, re
from pathlib import Path
from urllib.parse import urljoin

os.chdir(Path(__file__).parent)

try:
    import requests
    from bs4 import BeautifulSoup
except ImportError:
    os.system(f'{sys.executable} -m pip install requests beautifulsoup4 -q')
    import requests
    from bs4 import BeautifulSoup

BRANDS = [
    {"name":"GEMU",     "country":"DE","url":"https://www.gemu-group.com/en/products/","focus":["Diaphragm Valve","Ball Valve"]},
    {"name":"ARI",      "country":"DE","url":"https://www.ari.de/en/products/","focus":["Control Valve","Steam Trap"]},
    {"name":"KSB",      "country":"DE","url":"https://www.ksb.com/en-us/catalog","focus":["Pumps","Valves"]},
    {"name":"Fisher",   "country":"US","url":"https://www.emerson.com/brands/fisher","focus":["Control Valve"]},
    {"name":"Belimo",   "country":"CH","url":"https://www.belimo.com/mam/mybelimo/products","focus":["Actuators","HVAC Valves"]},
    {"name":"Flowserve","country":"US","url":"https://www.flowserve.com/en-us/products/","focus":["Control Valve","Isolation Valve"]},
    {"name":"Cameron",  "country":"US","url":"https://www.slb.com/cameron","focus":["High Pressure Ball Valve"]},
    {"name":"Velan",    "country":"CA","url":"https://www.velan.com/products/","focus":["Butterfly Valve"]},
    {"name":"Watts",    "country":"US","url":"https://www.watts.com/products","focus":["Steam Trap","Check Valve"]},
    {"name":"KITZ",     "country":"JP","url":"https://www.kitz.co.jp/en/products/","focus":["Ball Valve","Gate Valve"]},
    {"name":"Yoshitake","country":"JP","url":"https://www.yoshitake.co.jp/english/products/","focus":["Steam Trap"]},
    {"name":"Bürkert",  "country":"DE","url":"https://www.burkert.com/en/US/products/","focus":["Solenoid Valve","Process Valve"]},
    {"name":"Samson",   "country":"DE","url":"https://www.samson.de/en/products/","focus":["Control Valve","Actuator"]},
    {"name":"Armstrong","country":"US","url":"https://www.armstronginternational.com/en/products","focus":["Steam Trap"]},
    {"name":"SpiraxSarco","country":"UK","url":"https://www.spiraxsarco.com/en-gb/products","focus":["Steam System Valve"]},
    {"name":"Neway",    "country":"CN","url":"https://www.newayvalve.com/en/products","focus":["Ball Valve","Gate Valve"]},
    {"name":"AVK",      "country":"DK","url":"https://www.avk-avk.dk/products","focus":["Water Valve"]},
    {"name":"Parker",   "country":"US","url":"https://www.parker.com/us/en/products/hydraulic-valves.html","focus":["Hydraulic Valve"]},
    {"name":"Weir",     "country":"GB","url":"https://www.weir/products/","focus":["Mining Valve"]},
    {"name":"Mankenberg","country":"DE","url":"https://www.mankenberg.com/en/products","focus":["Steam Trap","Safety Valve"]},
]

H = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','Accept-Language':'en-US,en;q=0.9'}
DELAY = 5

def get(url):
    for i in range(3):
        try:
            r = requests.get(url, headers=H, timeout=20)
            r.raise_for_status()
            time.sleep(DELAY)
            return r
        except Exception as e:
            print(f"    retry {i+1}/3: {e}")
            time.sleep(10*(i+1))
    return None

def parse_brand(html, url):
    soup = BeautifulSoup(html, 'html.parser')
    title = soup.title.string.strip() if soup.title and soup.title.string else ""
    meta = soup.find('meta', attrs={'name':'description'})
    desc = meta['content'].strip() if meta else ""
    return {"name": title, "description": desc, "source": url}

def find_product_pages(html, base):
    soup = BeautifulSoup(html, 'html.parser')
    links = set()
    valve_kw = ['ball-valve','gate-valve','butterfly-valve','globe-valve','check-valve',
                'control-valve','diaphragm-valve','needle-valve','safety-valve','steam-trap',
                'relief-valve','actuator','valve']
    for a in soup.find_all('a', href=True):
        h = a['href'].lower()
        for kw in valve_kw:
            if kw in h:
                full = urljoin(base, a['href'])
                if 'javascript' not in full and '#' != full:
                    links.add(full)
                break
    return list(links)[:8]

def extract_specs(html, base):
    soup = BeautifulSoup(html, 'html.parser')
    specs = {}
    
    # 方法1: table表格
    for table in soup.find_all('table'):
        for tr in table.find_all('tr'):
            tds = tr.find_all(['td','th'])
            if len(tds) >= 2:
                k = tds[0].get_text(strip=True).rstrip(':').strip()
                v = tds[1].get_text(strip=True)
                if k and v:
                    specs[k] = v
    
    # 方法2: dl列表
    for dl in soup.find_all('dl'):
        dts = dl.find_all('dt')
        dds = dl.find_all('dd')
        for dt, dd in zip(dts, dds):
            specs[dt.get_text(strip=True).rstrip(':')] = dd.get_text(strip=True)
    
    # 方法3: spec类/属性列表
    for el in soup.select('[class*="spec"],[class*="detail"],[class*="attribute"],[class*="property"]'):
        text = el.get_text('|', strip=True)
        parts = [p.strip() for p in text.split('|') if p.strip()]
        for p in parts:
            if ':' in p:
                k, v = p.split(':', 1)
                specs[k.strip()] = v.strip()
    
    # 提取图片
    images = []
    for img in soup.find_all('img', src=True):
        src = img['src']
        if src.startswith('//'):
            src = 'https:' + src
        elif src.startswith('/'):
            src = base.rstrip('/') + src
        if src.startswith('http'):
            images.append(src)
    images = images[:3]
    
    # 提取PDF
    pdf = None
    for a in soup.find_all('a', href=True):
        if '.pdf' in a['href'].lower():
            pdf = urljoin(base, a['href'])
            break
    
    return {"specs": specs, "images": images, "pdf": pdf}

def main():
    out_dir = Path("outputs")
    out_dir.mkdir(exist_ok=True)
    
    all_brands = []
    all_products = []
    
    for i, b in enumerate(BRANDS):
        print(f"\n[{i+1}/{len(BRANDS)}] {b['name']} ({b['country']})")
        
        # 1. 获取品牌主页
        home_domain = b['url'].split('/')[2]
        home_url = f"https://{home_domain}"
        resp = get(home_url)
        
        brand_info = {"name": b['name'], "country": b['country'], "website": home_url, 
                       "product_focus": b['focus'], "description": ""}
        
        if resp:
            parsed = parse_brand(resp.text, home_url)
            brand_info["description"] = parsed.get("description", "")[:200]
            print(f"  ✓ 品牌主页获取成功")
        else:
            print(f"  ✗ 品牌主页获取失败")
        
        # 2. 获取产品页
        resp2 = get(b['url'])
        product_count = 0
        if resp2:
            prod_links = find_product_pages(resp2.text, b['url'])
            print(f"  发现 {len(prod_links)} 个产品相关页面")
            
            for j, plink in enumerate(prod_links[:5]):
                print(f"    [{j+1}/{min(5,len(prod_links))}] {plink.split('/')[-1][:30]}...")
                resp3 = get(plink)
                if resp3:
                    data = extract_specs(resp3.text, b['url'])
                    product_count += 1
                    product_record = {
                        "brand": b['name'],
                        "brand_country": b['country'],
                        "source_url": plink,
                        "valve_type": next((ft for ft in b['focus'] if ft.lower().replace(' ','-') in plink.lower()), b['focus'][0]),
                        "model": plink.split('/')[-2] if len(plink.split('/'))>2 else plink.split('/')[-1],
                        "specs": data["specs"],
                        "images": data["images"],
                        "pdf": data["pdf"],
                    }
                    all_products.append(product_record)
                    spec_count = len(data["specs"])
                    print(f"      ✓ {spec_count} 条规格数据")
                else:
                    print(f"      ✗ 获取失败")
        
        brand_info["product_count"] = product_count
        all_brands.append(brand_info)
        print(f"  完成: {product_count} 个产品")
    
    # 保存结果
    with open(out_dir / "all_brands.json", 'w', encoding='utf-8') as f:
        json.dump(all_brands, f, indent=2, ensure_ascii=False)
    with open(out_dir / "all_products.json", 'w', encoding='utf-8') as f:
        json.dump(all_products, f, indent=2, ensure_ascii=False)
    
    print(f"\n{'='*60}")
    print(f"完成! 品牌: {len(all_brands)}, 产品: {len(all_products)}")
    print(f"输出: outputs/all_brands.json, outputs/all_products.json")

if __name__ == "__main__":
    main()
