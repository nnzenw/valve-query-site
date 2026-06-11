# ValveSpecs Pro - 改进记录

## 已完成修复

### P0 - 紧急
| 问题 | 文件 | 修复内容 |
|------|------|----------|
| 价格函数重复 | `src/lib/utils.js` | 提取 `getEstimatedPrice`/`getHealthScoreColor`/`debounce` |
| Building 未导入 | `src/components/PricingPage.jsx` | 添加 Building icon import + 底部 Creem 文字 |
| import-data.js 路径错误 | `import-data.js` | ESM 兼容 + DATA_DIR 拼接 + 环境变量校验 |

### P1 - 高
| 问题 | 文件 | 修复内容 |
|------|------|----------|
| 前端全量 filter | `server/server.js` + `src/App.jsx` | 添加后端搜索 API `/api/valves/search` 和 `/api/valves/filters` |
| 无 debounce | `src/components/SearchBar.jsx` | 搜索输入 300ms 防抖 |
| FilterPanel 状态冗余 | `src/components/FilterPanel.jsx` | 移除无用 isOpen 状态 |
| 无 Error Boundary | `src/components/ErrorBoundary.jsx` + `main.jsx` | 全局错误边界防止白屏 |
| Webhook 签名 bug | `server/server.js:133-142` | Buffer → string 转换 |
| CORS 过于宽松 | `server/server.js:20` | 生产环境限制允许域名 |

### P2 - 中
| 问题 | 文件 | 修复内容 |
|------|------|----------|
| 无骨架屏 | `src/pages/ValveDetailPage.jsx` | spinner → skeleton 加载动画 |
| RLS 策略宽松 | `database/init.sql` | valve_feedback/tip_comments 改为 auth 用户可提交 |
| 内容无长度限制 | `database/init.sql` | 添加 CHECK (length <= 2000) |

### P3 - 低
| 问题 | 文件 | 修复内容 |
|------|------|----------|
| 首页无类型导航 | `src/App.jsx` | 添加"热门类型"快速导航栏 |
| 品牌页缺失 | `src/pages/BrandsPage.jsx` + `BrandDetailPage.jsx` | 新增 /brands 和 /brand/:id 页面 |
| Helmet meta 太通用 | `src/App.jsx` | 首页 meta 改为中文 SEO 优化 |
| ValveCard 缺 logo/评分 | `src/components/ValveCard.jsx` | 添加品牌 logo 和评分显示 |

## 待实现建议

### 4. Blog/知识库页面 (SEO 最大缺口)
这是 SEO 流量的核心来源，建议添加：

- `/blog/ball-valve-selection-guide` — 球阀选型指南
- `/blog/butterfly-valve-vs-ball-valve` — 蝶阀 vs 球阀对比
- `/blog/how-to-read-valve-specifications` — 如何看懂阀门参数
- `/blog/valve-material-selection` — 阀门材质选择
- `/blog/control-valve-sizing-guide` — 控制阀选型

技术方案：
1. 在 `database/init.sql` 添加 `blog_posts` 表
2. 后端添加 `/api/blog` 和 `/api/blog/:slug` 端点
3. 前端添加 `BlogListPage.jsx` 和 `BlogPostPage.jsx`
4. 路由支持 `/blog` 和 `/blog/:slug`

### 5. 搜索结果计数
`/api/valves/search` 返回总匹配数，前端显示"共找到 XX 条结果"。

### 6. 测试框架
添加 Vitest 单测覆盖：
- `src/lib/utils.js` 的 getEstimatedPrice/getHealthScoreColor
- 搜索参数构造逻辑
- 路由解析逻辑

### 7. PWA
Service Worker 缓存静态资源，支持离线访问比价数据。
