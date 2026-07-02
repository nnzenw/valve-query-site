# ValveSpecs Pro 网站整改实施指南

**日期：** 2026-06-17  
**状态：** P0 完成，P1 URL 语义化完成，P1 预渲染待本机执行

---

## 一、已完成的代码修改

### ✅ P0 - 致命问题修复（已全部完成）

| # | 文件 | 修改内容 |
|---|------|---------|
| 1 | `index.html` | canonical / OG URL 从 `valvespecs.pro` → `valve.tradesxchange.com` |
| 2 | `public/sitemap.xml` | 所有 `valve.mytoolshub.cc.cd` → `valve.tradesxchange.com` |
| 3 | `public/robots.txt` | sitemap 地址修复 |
| 4 | `src/App.tsx` | canonical URL 修复 |
| 5 | `src/pages/*.jsx/*.tsx` | 6 个页面文件中的 URL 全部修复 |
| 6 | `functions/api/create-checkout.ts` | fallback URL 修复 |
| 7 | `generate-sitemap.js` | `BASE_URL` 更新为新域名 |
| 8 | `server/server.js` | **CORS 收紧**（不再允许 `*`）|
| 9 | `server/server.js` | **添加 7 个安全响应头** |
| 10 | `vite.config.js` | 添加构建优化（code splitting, terser 压缩）|
| 11 | `public/_headers`（新建）| Cloudflare Pages 安全头配置 |
| 12 | `public/_redirects`（新建）| SPA 路由回退规则 |

### ✅ P1 - URL 语义化改造（已完成）

| # | 文件 | 修改内容 |
|---|------|---------|
| 1 | `database/migrate_add_brand_slug.sql` | **新建**：数据库迁移 SQL（添加 slug 字段） |
| 2 | `server/server.js` | 搜索 API 支持 UUID 和 slug 两种查询方式 |
| 3 | `server/server.js` | 过滤器 API 返回 slug 字段 |
| 4 | `src/App.tsx` | 路由从 `/brand/:id` 改为 `/brand/:slug` |
| 5 | `src/pages/BrandsPage.jsx` | 导航链接改用 slug |
| 6 | `src/pages/BrandDetailPage.jsx` | 添加通过 slug 查询品牌信息的逻辑 |
| 7 | `generate-sitemap.js` | 生成 sitemap 时使用 slug URL |

---

## 二、需要在本机执行的步骤

### 步骤 1：数据库迁移（添加 slug 字段）

```bash
# 方法 A：在 Supabase Dashboard 中执行 SQL
# 1. 打开 Supabase Dashboard → SQL Editor
# 2. 复制 database/migrate_add_brand_slug.sql 的内容
# 3. 执行 SQL

# 方法 B：使用 Supabase CLI（如果已配置）
cd F:\opencodeprj\valvehub\ima1\valve-query-site
supabase db execute database/migrate_add_brand_slug.sql
```

**验证迁移是否成功：**

```sql
-- 在 Supabase SQL Editor 中执行
SELECT id, name, slug FROM brands LIMIT 5;

-- 应该看到类似：
-- id: uuid, name: KITZ, slug: kitz
```

**如果 slug 字段为 NULL 或为空：**

手动为每个品牌设置 slug：

```sql
UPDATE brands SET slug = lower(
  regexp_replace(
    regexp_replace(
      regexp_replace(name, '\(.*?\)', '', 'g'),
      '[^a-zA-Z0-9]+', '-', 'g'
    ),
    '^-+|-+$', '', 'g'
  )
)
WHERE slug IS NULL;

-- 设置为 NOT NULL
ALTER TABLE brands ALTER COLUMN slug SET NOT NULL;
```

---

### 步骤 2：重新生成 sitemap

```bash
cd F:\opencodeprj\valvehub\ima1\valve-query-site
node generate-sitemap.js
```

**验证 sitemap 是否正确：**

```bash
# 查看生成的 sitemap
type public\sitemap.xml | findstr "loc"
```

应该看到类似：
```xml
<loc>https://valve.tradesxchange.com/brand/kitz</loc>
<loc>https://valve.tradesxchange.com/brand/ksb</loc>
```

---

### 步骤 3：安装预渲染插件（P1 - 可选但推荐）

```bash
cd F:\opencodeprj\valvehub\ima1\valve-query-site
npm install --save-dev vite-plugin-prerender puppeteer
```

**配置 `vite.config.js`：**

```javascript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import prerender from 'vite-plugin-prerender'

// 需要预渲染的路由（根据品牌数据动态生成）
const prerenderRoutes = [
  '/',
  '/brands',
  '/blog',
  // 添加品牌页（需要从数据库或 API 获取）
  // '/brand/kitz',
  // '/brand/ksb',
]

export default defineConfig({
  plugins: [
    react(),
    prerender({
      routes: prerenderRoutes,
      renderer: '@prerenderer/renderer-puppeteer',
      rendererOptions: {
        maxConcurrentRoutes: 4,
        renderAfterTime: 2000,
      }
    })
  ],
  // ... 其他配置
})
```

---

### 步骤 4：构建并部署

```bash
cd F:\opencodeprj\valvehub\ima1\valve-query-site

# 构建前端
npm run build

# 部署（根据你的部署方式）
# 方法 A：如果用的是 Cloudflare Pages，推送到 git 即可自动部署
git add .
git commit -m "fix: 域名统一 + URL 语义化改造"
git push origin main

# 方法 B：手动部署（如果有的话）
# 将 dist/ 的内容同步到部署目录
```

---

### 步骤 5：Cloudflare Dashboard 配置

| 操作 | 位置 | 说明 |
|------|------|---------|
| **301 重定向** | Cloudflare → Page Rules 或 Transform Rules | `valvespecs.pro/*` → `valve.tradesxchange.com/*`（301，如果以后想用）；`valve.mytoolshub.cc.cd/*` → 同上 |
| **SSL/TLS** | Cloudflare → SSL/TLS | 确认设为 `Full (Strict)` |
| **Purge Cache** | Cloudflare → Caching | 部署后清除所有缓存，让新 `_headers` 生效 |

---

## 三、SEO 验证清单

部署后，在 Google Search Console 中执行：

```bash
# 1. 提交新的 sitemap
# Google Search Console → Sitemaps → 添加 sitemap.xml

# 2. 使用"地址更改"工具（如果旧域名有收录）
# Google Search Console → Settings → Change of Address

# 3. 验证 canonical 标签是否正确
# 用 URL Inspection 工具检查任意品牌页

# 4. 提交 URL 重新索引
# 在 URL Inspection 中请求索引
```

---

## 四、剩余 P1/P2 问题（后续迭代）

| # | 问题 | 优先级 | 建议 |
|---|------|--------|------|
| 1 | 纯 SPA 无 SSR，Bing/百度抓不到 | P1 | **已完成预渲染配置方案**（见步骤 3） |
| 2 | 首屏加载慢（~1.85s）| P2 | 已加 code splitting，还需图片 WebP、字体 `font-display: swap` |
| 3 | 产品详情页也是 UUID | P2 | 类似品牌页改造，给 valve_specs 表加 slug 字段 |
| 4 | 多语言支持 | P3 | 添加 hreflang 标签，至少支持英文 + 中文 |

---

## 五、验收标准（更新）

| 指标 | 整改前 | 整改后目标 | 状态 |
|------|---------|------------|------|
| 域名统一 | ❌ 3 个域名 | ✅ 1 个主域名 | ✅ 已完成 |
| canonical 正确 | ❌ 指向不存在域名 | ✅ 指向主域名 | ✅ 已完成 |
| sitemap 域名一致 | ❌ 混用域名 | ✅ 统一域名 + slug URL | ⚠️ 需本机执行 |
| URL 可读性 | ❌ UUID | ✅ 语义化 slug | ⚠️ 需数据库迁移 |
| CORS 策略 | ❌ `*` 全开 | ✅ 白名单 | ✅ 已完成 |
| 安全头 | 3/7 | 7/7 | ✅ 已完成 |
| 搜索引擎可索引 | 仅 Google | 全部主流引擎 | ⚠️ 需预渲染 |

---

## 六、常见问题排查

### Q1：执行数据库迁移时提示 "column slug already exists"

**A：** 说明 `slug` 字段已存在，直接执行数据更新部分即可：

```sql
UPDATE brands SET slug = lower(...) WHERE slug IS NULL;
```

### Q2：构建时报错 "puppeteer: Could not find Chrome"

**A：** 预渲染是可选步骤，如果不需要可以跳过。或者安装 Chromium：

```bash
npm install --save-dev puppeteer
# puppeteer 会自动下载 Chromium，如果失败，设置环境变量：
# PUPPETEER_SKIP_DOWNLOAD=true npm install --save-dev puppeteer
```

### Q3：部署后品牌页 404

**A：** 检查 `public/_redirects` 文件是否存在（已创建），内容应为：

```
# SPA fallback for Cloudflare Pages
/*  /index.html  200
```

### Q4：Google Search Console 中 sitemap 报错

**A：** 检查 sitemap 中的 URL 是否都能访问。可以在浏览器中直接访问几个品牌页，确认没有 404。

---

**整改完成度：** 85%（代码修改完成，需本机执行数据库迁移和构建部署）
