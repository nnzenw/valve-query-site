# ValveSpecs Pro - Cloudflare Pages 部署指南

## 部署步骤

### 1. 准备代码
确保代码已推送到 GitHub 仓库：
```bash
cd valve-query-site
git add .
git commit -m "feat: add SEO routes and history routing"
git push origin main
```

### 2. Cloudflare Pages 设置

1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com)
2. 进入 **Workers & Pages** → **Create application** → **Pages**
3. 连接 GitHub 仓库
4. 配置构建设置：
   - **Framework preset**: Vite
   - **Build command**: `npm run build`
   - **Build output directory**: `dist`
   - **Environment variables**:
     - `VITE_SUPABASE_URL`: 你的 Supabase 项目 URL
     - `VITE_SUPABASE_ANON_KEY`: 你的 Supabase 匿名密钥
     - `VITE_BACKEND_URL`: 后端 API 地址（如 `https://api.yourdomain.com`）

### 3. SPA 路由支持

Cloudflare Pages 自动支持 SPA 路由，无需额外配置。构建脚本已自动生成 `_redirects` 文件：
```
/*    /index.html   200
```

这确保所有路径（如 `/valve/:id`）都返回 `index.html`，由前端路由处理。

### 4. 自定义域名

1. 在 Cloudflare Pages 设置中添加自定义域名
2. 配置 DNS 记录（CNAME 指向 Cloudflare 提供的域名）
3. 启用 HTTPS（Cloudflare 自动处理）

### 5. 后端部署

后端服务器（server/）需要单独部署：
- 推荐：Vercel、Railway、或 VPS
- 环境变量：
  - `CREEM_API_KEY`: Creem API 密钥
  - `CREEM_WEBHOOK_SECRET`: Webhook 密钥
  - `SUPABASE_URL`: Supabase URL
  - `SUPABASE_SERVICE_KEY`: Supabase 服务密钥
  - `FRONTEND_URL`: 前端域名

## SEO 特性

- **独立产品页 URL**: `/valve/:id`
- **动态 Meta 标签**: 每个产品页有独立 title 和 description
- **Open Graph**: 社交媒体分享支持
- **Schema.org JSON-LD**: 结构化数据标记，提升搜索引擎展示效果
- **History 路由**: 真实 URL，对搜索引擎友好

## 验证

部署后验证 SEO：
1. 访问 Google Search Console
2. 提交站点地图（可选）
3. 使用 "Rich Results Test" 验证 Schema 标记
4. 检查页面标题和描述是否正确
