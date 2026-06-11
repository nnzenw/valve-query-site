# ValveSpecs Pro - 全球阀门规格参数查询

一个面向工程师、采购、销售的工业级阀门选型与参数查询平台。

## 🚀 快速开始

### 1. 创建 Supabase 项目

1. 访问 [supabase.com](https://supabase.com) 创建账号
2. 新建项目（选择免费套餐即可）
3. 记录项目 URL 和 API Key

### 2. 初始化数据库

在 Supabase Dashboard 中：
1. 进入 **SQL Editor**
2. 复制 `database/init.sql` 中的全部内容
3. 点击 **Run** 执行

### 3. 配置前端环境变量

```bash
cd valve-query-site
npm install
```

创建 `.env` 文件：

```env
VITE_SUPABASE_URL=https://your-project-id.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
```

获取 Key：Supabase Dashboard → Settings → API

### 4. 导入数据（可选）

将本地 JSON 数据导入 Supabase：

```bash
# 配置环境变量
export SUPABASE_URL=https://your-project-id.supabase.co
export SUPABASE_SERVICE_KEY=your-service-key-here

# 运行导入脚本
node import-data.js
```

> 注意：需要 `@supabase/supabase-js` 依赖，已包含在 package.json 中

### 5. 启动开发服务器

```bash
npm run dev
```

访问 http://localhost:3000

### 6. 部署到生产环境

```bash
npm run build
```

将 `dist/` 目录部署到：
- **Cloudflare Pages**（推荐）
- **Vercel**
- **Netlify**

## 📁 项目结构

```
valve-query-site/
├── database/
│   └── init.sql              # 数据库初始化脚本
├── src/
│   ├── components/
│   │   ├── Header.jsx        # 头部导航
│   │   ├── SearchBar.jsx     # 搜索栏
│   │   ├── FilterPanel.jsx   # 高级筛选面板
│   │   ├── ValveCard.jsx     # 阀门卡片组件
│   │   ├── ValveModal.jsx    # 详情弹窗
│   │   └── EmptyState.jsx    # 空状态
│   ├── lib/
│   │   └── supabase.js       # Supabase 客户端配置
│   ├── App.jsx               # 主应用组件
│   ├── main.jsx              # 入口文件
│   └── index.css             # 全局样式
├── import-data.js            # 数据导入脚本
├── package.json
├── vite.config.js
└── index.html
```

## 🎯 核心功能

### 已实现
- ✅ 多条件组合筛选（品牌、类型、材质、应用场景）
- ✅ 全文搜索（关键词搜索品牌、型号、材质、标准）
- ✅ 响应式布局（支持移动端）
- ✅ 阀门详情弹窗（完整参数展示）
- ✅ 品牌信息展示（国家、成立年份、官网链接）
- ✅ **互动反馈系统**（点赞/纠错/评分）
- ✅ **健康度评分模型**（基于材质、工况、标准自动计算）
- ✅ **用户反馈聚合**（反馈数据自动更新健康度评分）

### 后续可添加
- ⏳ 用户登录/注册（Supabase Auth）
- ⏳ 收藏功能（Pro 用户）
- ⏳ 查询历史（Pro 用户）
- ⏳ 参数对比（多品牌并列对比）
- ⏳ 数据导出（Excel/PDF）
- ⏳ 供应商黄页

## 🛠 技术栈

- **前端**: React 18 + Vite
- **UI**: Tailwind CSS
- **数据库**: Supabase (PostgreSQL)
- **图标**: Lucide React

## 📊 数据库设计

### 核心表

| 表名 | 说明 |
|------|------|
| `brands` | 阀门品牌信息 |
| `valve_types` | 阀门类型定义 |
| `valve_specs` | 阀门规格参数（核心表） |
| `user_favorites` | 用户收藏 |
| `user_query_history` | 查询历史 |
| `valve_feedback` | 用户反馈（点赞/纠错/评分） |
| `valve_health_scores` | 健康度评分表 |

详细表结构见 `database/init.sql`

## 💰 商业模式

### B2C 个人会员
- **免费用户**: 基础参数查看、每日查询限制
- **Pro 会员** (¥50-100/月): 完整参数、无限对比、数据导出

### B2B 企业版
- **小型供应商** (¥500-1000/月): API 接入、批量查询
- **大型工程公司** (¥2000-5000/月): 定制报告、私有化部署

## 🌍 部署建议

- **前端**: Cloudflare Pages（免费、全球 CDN）
- **数据库**: Supabase（免费额度足够 MVP 阶段）
- **域名**: 绑定自定义域名
- **CDN**: Cloudflare（免费）

## 📝 开发说明

### 添加新阀门类型

编辑 `database/init.sql` 中的示例数据部分，添加新的阀门类型和品牌。

### 数据更新

1. 更新本地 JSON 数据文件
2. 运行 `node import-data.js` 重新导入
3. 或使用 Supabase Dashboard 直接编辑

### 互动反馈功能说明

用户可以对阀门数据进行：
1. **点赞**：标记数据准确有用
2. **纠错**：标记数据有误并描述修正内容
3. **评分**：1-5 星评分，帮助其他用户参考

所有反馈数据会自动汇总，更新阀门的"健康度评分"，帮助采购工程师快速识别高质量数据。

## 📄 License

MIT
