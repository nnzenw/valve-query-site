import json
import re
import time
import logging
from datetime import datetime, timezone
from urllib.parse import urljoin, urlparse
from pathlib import Path

import requests
from bs4 import BeautifulSoup

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

HEADERS = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}
DELAY = 0.02
MAX_RETRIES = 2

class DeepValveScraper:
    def __init__(self, brand, website, seed, max_prod=50):
        self.brand = brand
        self.website = website
        self.seed = seed
        self.max = max_prod
        self.visited = set()
        self.products = []
        self.session = requests.Session()
        self.session.headers.update(HEADERS)

    def fetch(self, url):
        for a in range(1, MAX_RETRIES+1):
            try:
                logger.info(f"GET {url}")
                r = self.session.get(url, timeout=30)
                if r.status_code == 200:
                    time.sleep(DELAY)
                    return r.text
                logger.warning(f"Status {r.status_code}")
                return None
            except Exception as e:
                logger.warning(f"Fail: {e}")
                if a < MAX_RETRIES:
                    time.sleep(5)
                else:
                    return None

    def same_site(self, url):
        p = urlparse(url)
        s = urlparse(self.website)
        p_net = p.netloc.lstrip('www.')
        s_net = s.netloc.lstrip('www.')
        return p_net == s_net


    def is_candidate_path(self, url):
        p = urlparse(url).path
        # Exclude pagination, language variants, and generic pages
        if '/page/' in p or '/fr/' in p or '/en/' in p or p.endswith('/products/') or p.endswith('/catalog/'):
            return False
        # Must have at least 3 path segments (brand/product/category/name)
        segments = [s for s in p.split('/') if s]
        if len(segments) < 2:
            return False
        return any(tok in p for tok in ['/products/', '/product/', '/catalog/', '/valve', '/product-'])

    def looks_like_product_page(self, html, url):
        if not html:
            return False
        depth = len([s for s in urlparse(url).path.split('/') if s])
        has_table = '<table' in html.lower() and ('<th' in html.lower() or '<td' in html.lower())
        has_dl = '<dl' in html.lower() and '<dt' in html.lower() and '<dd' in html.lower()
        return depth >= 2 and (has_table or has_dl)

    def extract_specs(self, soup):
        specs = {}
        for table in soup.find_all('table'):
            for tr in table.find_all('tr'):
                tds = tr.find_all(['td','th'])
                if len(tds)>=2:
                    k = tds[0].get_text(strip=True).rstrip(':').strip()
                    v = tds[1].get_text(strip=True).strip()
                    if k and v: specs[k] = v
        for dl in soup.find_all('dl'):
            dts = dl.find_all('dt'); dds = dl.find_all('dd')
            for dt, dd in zip(dts, dds):
                k = dt.get_text(strip=True).rstrip(':').strip()
                v = dd.get_text(strip=True).strip()
                if k and v: specs[k] = v
        return specs

    def extract_links(self, html, base):
        soup = BeautifulSoup(html, 'html.parser')
        out = []
        for a in soup.find_all('a', href=True):
            href = a['href']
            abs_url = urljoin(base, href).split('#')[0]  # strip fragment
            if not self.same_site(abs_url):
                continue
            if abs_url in self.visited:
                continue
            # Filter: only English pages
            if '/zh-tw/' in abs_url or '/zh-cn/' in abs_url:
                continue
            if self.is_candidate_path(abs_url):
                out.append(abs_url)
        return list(set(out))

    def crawl(self):
        q = [self.seed]
        self.visited.add(self.seed.split('#')[0])
        while q and len(self.products) < self.max:
            url = q.pop(0)
            html = self.fetch(url)
            if not html:
                continue
            if self.looks_like_product_page(html, url):
                soup = BeautifulSoup(html, 'html.parser')
                spec = self.extract_specs(soup)
                if spec:
                    title = soup.title.string.strip() if soup.title else urlparse(url).path
                    self.products.append(dict(url=url, name={'en': title}, specifications=spec))
            new = self.extract_links(html, url)
            for l in new[:20]:
                if l not in self.visited:
                    self.visited.add(l)
                    q.append(l)
            logger.info(f"queue={len(q)} visited={len(self.visited)} products={len(self.products)}")
        logger.info(f"Finish. total products={len(self.products)}")

    def output(self):
        ts = datetime.now(timezone.utc).isoformat()
        return {"brand": {
            "name": {"en": self.brand},
            "website": self.website,
            "description": "",
            "product_focus": [],
            "brand_id": f"{self.brand.lower().replace(' ','-')}-XX-001",
            "data_quality": "high" if len(self.products)>=3 else "medium",
            "crawl_date": ts,
            "crawl_status": "success",
            "products": self.products
        }}

def main():
    import argparse
    p = argparse.ArgumentParser()
    p.add_argument('--brand', required=True)
    p.add_argument('--website', required=True)
    p.add_argument('--product-url', required=True)
    p.add_argument('--output', required=True)
    p.add_argument('--max-products', type=int, default=50)
    ns = p.parse_args()
    scraper = DeepValveScraper(ns.brand, ns.website, ns.product_url, ns.max_products)
    scraper.crawl()
    out = scraper.output()
    Path(ns.output).parent.mkdir(parents=True, exist_ok=True)
    Path(ns.output).write_text(json.dumps(out, indent=2, ensure_ascii=False), encoding='utf-8')
    logger.info(f"Saved {len(scraper.products)} to {ns.output}")

if __name__ == '__main__':
    main()
