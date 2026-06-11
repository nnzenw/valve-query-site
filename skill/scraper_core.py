"""
阀门数据标准爬取框架
用法: python3 scraper_core.py --brand GEMU --output outputs/gemu_data.json
"""

import json
import time
import argparse
import logging
from pathlib import Path
from datetime import datetime, timezone
from typing import Dict, List, Optional, Any

import requests
from bs4 import BeautifulSoup

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# 标准 headers
HEADERS = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    'Accept-Language': 'en-US,en;q=0.9',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
}

REQUEST_DELAY = 3  # 请求间隔(秒)
MAX_RETRIES = 3
RETRY_DELAY = 10  # 重试等待(秒)


class ValveScraper:
    """阀门品牌数据爬虫基类"""

    def __init__(self, brand_name: str, website: str, product_url: str):
        self.brand_name = brand_name
        self.website = website
        self.product_url = product_url
        self.session = requests.Session()
        self.session.headers.update(HEADERS)

    def fetch(self, url: str, retries: int = MAX_RETRIES) -> Optional[requests.Response]:
        """带重试机制的 HTTP 请求"""
        for attempt in range(1, retries + 1):
            try:
                logger.info(f"Fetching {url} (attempt {attempt}/{retries})")
                resp = self.session.get(url, timeout=30)
                resp.raise_for_status()
                time.sleep(REQUEST_DELAY)  # 反爬：请求间隔
                return resp
            except requests.RequestException as e:
                logger.warning(f"Request failed: {e}")
                if attempt < retries:
                    time.sleep(RETRY_DELAY)
                else:
                    logger.error(f"Failed after {retries} retries: {url}")
                    return None

    def get_brand_info(self, homepage_url: str) -> Optional[Dict[str, Any]]:
        """从首页提取品牌信息"""
        resp = self.fetch(homepage_url)
        if not resp:
            return None

        soup = BeautifulSoup(resp.text, 'html.parser')
        brand_info = {
            "name": {
                "en": soup.title.string.strip() if soup.title else self.brand_name,
            },
            "website": homepage_url,
            "description": self._extract_description(soup),
            "product_focus": self._extract_product_focus(soup),
        }
        return brand_info

    def get_product_pages(self, product_url: str) -> List[Dict[str, str]]:
        """从产品页提取产品列表"""
        resp = self.fetch(product_url)
        if not resp:
            return []

        soup = BeautifulSoup(resp.text, 'html.parser')
        products = []
        # 示例：查找所有产品链接
        for link in soup.find_all('a', href=True):
            href = link['href']
            text = link.get_text(strip=True)
            if text and '/products/' in href:
                full_url = self._resolve_url(href, product_url)
                products.append({
                    "title": text,
                    "url": full_url,
                })
        return products

    def get_product_spec(self, product_url: str) -> Optional[Dict[str, Any]]:
        """提取单个产品的详细规格"""
        resp = self.fetch(product_url)
        if not resp:
            return None

        soup = BeautifulSoup(resp.text, 'html.parser')
        spec = {
            "url": product_url,
            "name": {"en": soup.title.string.strip() if soup.title else "Unknown"},
            "specifications": self._extract_specs(soup),
            "images": self._extract_images(soup),
            "datasheet_pdf": self._find_datasheet(soup),
        }
        return spec

    # ---- 以下为需要子类覆写的抽象方法 ----

    def _extract_description(self, soup: BeautifulSoup) -> str:
        """提取品牌描述（各品牌不同，子类覆写）"""
        meta_desc = soup.find('meta', attrs={'name': 'description'})
        return meta_desc['content'].strip() if meta_desc else ""

    def _extract_product_focus(self, soup: BeautifulSoup) -> List[str]:
        """提取产品聚焦领域（各品牌不同，子类覆写）"""
        # 示例：从导航栏提取
        nav = soup.find('nav')
        if nav:
            return [a.get_text(strip=True) for a in nav.find_all('a')[:10]]
        return []

    def _extract_specs(self, soup: BeautifulSoup) -> Dict[str, Any]:
        """提取产品规格表（多策略提取）"""
        specs = {}
        
        # 策略1: 表格 (最常见的规格表格式)
        for table in soup.find_all('table'):
            for tr in table.find_all('tr'):
                tds = tr.find_all(['td', 'th'])
                if len(tds) >= 2:
                    key = tds[0].get_text(strip=True).rstrip(':').strip()
                    val = tds[1].get_text(strip=True)
                    if key and val:
                        specs[key] = val
        
        # 策略2: dl 定义列表
        for dl in soup.find_all('dl'):
            dts = dl.find_all('dt')
            dds = dl.find_all('dd')
            for dt, dd in zip(dts, dds):
                specs[dt.get_text(strip=True).rstrip(':')] = dd.get_text(strip=True)
        
        # 策略3: class包含 spec/technical/detail 的div
        for el in soup.select('[class*="spec"],[class*="detail"],[class*="technical"],[class*="attribute"]'):
            text = el.get_text('|', strip=True)
            parts = [p.strip() for p in text.split('|') if p.strip()]
            for p in parts:
                if ':' in p:
                    k, v = p.split(':', 1)
                    if k.strip() and v.strip():
                        specs[k.strip()] = v.strip()
        
        # 策略4: 查找包含规格关键词的文本块
        keywords = ['Size', 'Pressure', 'Temperature', 'Material', 'Standard', 'Connection', 
                     'Cv', 'Kv', 'Class', 'Rating', 'Media', 'Drive']
        for el in soup.find_all(['p', 'div', 'span', 'li']):
            text = el.get_text(strip=True)
            if ':' in text:
                # 尝试拆分键值对
                for kw in keywords:
                    if kw.lower() in text.lower():
                        parts = text.split(':', 1)
                        if len(parts) == 2:
                            specs[parts[0].strip()[:60]] = parts[1].strip()[:200]
                        break
        
        return specs

    def _extract_images(self, soup: BeautifulSoup) -> List[str]:
        """提取产品图片"""
        images = []
        for img in soup.find_all('img', src=True):
            src = img['src']
            if src.startswith('//'):
                src = 'https:' + src
            elif src.startswith('/'):
                from urllib.parse import urljoin
                src = urljoin(self.website, src)
            if src.startswith('http'):
                images.append(src)
        return images[:3]

    def _find_datasheet(self, soup: BeautifulSoup) -> Optional[str]:
        """查找 PDF 数据表链接"""
        for a in soup.find_all('a', href=True):
            href = a['href']
            if href.endswith('.pdf') and ('data' in href.lower() or 'spec' in href.lower()):
                return self._resolve_url(href, self.website)
        return None

    def _resolve_url(self, href: str, base: str) -> str:
        """将相对 URL 转为绝对 URL"""
        from urllib.parse import urljoin
        return urljoin(base, href)


# ============================================================
# 具体品牌爬虫实现（继承基类，覆写提取方法）
# ============================================================

class GemuScraper(ValveScraper):
    """GEMU 阀门爬取器"""

    def _extract_product_focus(self, soup: BeautifulSoup) -> List[str]:
        # GEMU 特色产品线
        return ["Diaphragm Valve", "Ball Valve", "Butterfly Valve", "Control Valve"]

    def _extract_specs(self, soup: BeautifulSoup) -> Dict[str, Any]:
        """从 GEMU 产品页提取规格"""
        specs = {}
        # 示例：查找规格表格
        table = soup.find('table', class_='specifications')
        if table:
            for row in table.find_all('tr'):
                cols = row.find_all(['td', 'th'])
                if len(cols) >= 2:
                    key = cols[0].get_text(strip=True)
                    value = cols[1].get_text(strip=True)
                    specs[key] = value
        return specs


class KitzScraper(ValveScraper):
    """KITZ 阀门爬取器"""

    def _extract_product_focus(self, soup: BeautifulSoup) -> List[str]:
        return ["Ball Valve", "Gate Valve", "Globe Valve", "Check Valve"]

    def _extract_specs(self, soup: BeautifulSoup) -> Dict[str, Any]:
        # KITZ 规格提取逻辑
        return {}


# ============================================================
# 数据组装 & 输出
# ============================================================

def build_output(
    brand_info: Dict[str, Any],
    products: List[Dict[str, Any]],
    brand_slug: str,
    country_code: str = "XX",
) -> Dict[str, Any]:
    """组装标准 JSON 输出"""
    ts = datetime.now(timezone.utc).isoformat()

    output = {
        "brand": {
            **brand_info,
            "brand_id": f"{brand_slug}-{country_code}-001",
            "data_quality": "high" if len(products) >= 3 else "medium",
            "crawl_date": ts,
            "crawl_status": "success",
            "products": products,
        }
    }
    return output


def main():
    parser = argparse.ArgumentParser(description="阀门品牌数据爬取")
    parser.add_argument('--brand', required=True, help='品牌名称 (e.g., GEMU)')
    parser.add_argument('--output', required=True, help='输出文件路径')
    parser.add_argument('--website', help='品牌官网')
    parser.add_argument('--product-url', help='产品目录页 URL')
    args = parser.parse_args()

    # 创建爬取器（根据品牌名选择）
    brand_map = {
        'GEMU': ('https://www.gemu-group.com', 'https://www.gemu-group.com/en/products/', GemuScraper),
        'KITZ': ('https://www.kitz.co.jp', 'https://www.kitz.co.jp/en/products/', KitzScraper),
    }

    if args.brand not in brand_map:
        # 使用基类爬取器
        scraper = ValveScraper(
            brand_name=args.brand,
            website=args.website or f"https://www.{args.brand.lower()}.com",
            product_url=args.product_url or "",
        )
    else:
        site, prod, cls = brand_map[args.brand]
        scraper = cls(args.brand, site, prod)

    # 1. 获取品牌信息
    logger.info(f"Extracting brand info for {args.brand}")
    brand_info = scraper.get_brand_info(scraper.website) or {"name": {"en": args.brand}, "website": scraper.website}

    # 2. 获取产品列表
    logger.info(f"Fetching product pages for {args.brand}")
    raw_products = scraper.get_product_pages(scraper.product_url)

    # 3. 提取每个产品的详细规格
    products = []
    for i, p in enumerate(raw_products[:5]):  # 每个品牌最多取5个产品
        logger.info(f"Extracting product {i+1}/{min(len(raw_products), 5)}: {p['title']}")
        spec = scraper.get_product_spec(p['url'])
        if spec:
            products.append(spec)

    # 4. 组装输出
    brand_slug = args.brand.lower().replace(' ', '-')
    output = build_output(brand_info, products, brand_slug)

    # 5. 写入文件
    Path(args.output).parent.mkdir(parents=True, exist_ok=True)
    with open(args.output, 'w', encoding='utf-8') as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    logger.info(f"Done! Output saved to {args.output}")


if __name__ == '__main__':
    main()