# ValveSpecs Pro — Stripe → Creem 迁移总结

## 📦 本次更新的文件

| 文件 | 变更类型 | 说明 |
|------|----------|------|
| `server/server.js` | **重写** | 移除 Stripe SDK，集成 Creem REST API |
| `src/components/PricingPage.jsx` | **修改** | 移除 Stripe 依赖，使用 Creem 后端接口 |
| `src/lib/SubscriptionContext.jsx` | **修改** | 使用 `creem_product_id` 字段 |
| `database/init.sql` | **修改** | 添加 Creem 字段，保留 Stripe 字段兼容 |
| `.env` | **重写** | 配置 Creem API Key 和 Webhook Secret |
| `CREEM_INTEGRATION.md` | **新建** | 完整接入文档 |
| `server/test-creem-payment.js` | **新建** | 测试脚本 |
| `MIGRATION_COMPLETE.md` | **新建** | 迁移检查清单 |

## 🚀 后端 API 端点

| 方法 | 路径 | 说明 |
|------|------|------|
| POST | `/api/create-checkout` | 创建 Creem 支付页面 |
| GET | `/api/checkout/:checkoutId` | 查询支付状态 |
| POST | `/api/webhook` | 接收 Creem Webhook 回调 |
| POST | `/api/buy-leads` | 购买线索（一次性支付） |
| GET | `/api/subscription/:userId` | 查询用户订阅 |
| POST | `/api/verify-redirect` | 验证重定向签名 |

## 📋 待办清单

1. **在 Creem Dashboard 创建产品**
   - 登录: https://dashboard.creem.io
   - 创建 6 个套餐产品（见 `CREEM_INTEGRATION.md` 表格）

2. **更新 `.env` 环境变量**
   ```bash
   CREEM_API_KEY=sk_live_your_real_key_here
   CREEM_WEBHOOK_SECRET=whsec_your_real_secret_here
   ```

3. **配置 Webhook 端点**
   - Endpoint: `https://your-domain.com/api/webhook`
   - 选择所有订阅和支付事件

4. **执行数据库迁移**
   ```sql
   ALTER TABLE user_subscriptions 
     ADD COLUMN IF NOT EXISTS creem_customer_id VARCHAR(100),
     ADD COLUMN IF NOT EXISTS creem_checkout_id VARCHAR(100),
     ADD COLUMN IF NOT EXISTS creem_subscription_id VARCHAR(100);
   
   ALTER TABLE lead_purchases 
     ADD COLUMN IF NOT EXISTS creem_transaction_id VARCHAR(100);
   ```

5. **重新构建前端**
   ```bash
   npm run build
   ```

6. **测试支付流程**
   ```bash
   cd server
   node test-creem-payment.js
   ```

## ⚠️ 注意事项

1. **认证方式变更**: `x-api-key` 头 (不是 Bearer)
2. **Product ID**: 必须从 Creem Dashboard 获取真实 ID
3. **Webhook 必须 HTTPS**
4. **数据库保留 Stripe 字段**用于双网关过渡
5. **重新构建前端**以清除旧的 `dist` 缓存

## 📁 源码包

源码压缩包已生成，点击以下链接下载：

[下载 valve-query-src.tar.gz](https://sbx.ima-res.qq.com/10011/OepwM8YDe3kIDvef2pRfj9A/kpQgzYtceJ41Ex8Ok3lS2bipzg5p9wNDDeC5BpzruKP8HtT9B/Onp17ASM0lhz7dYszUkWS9f4BdCxUVwYzt5eiLoXgKnlYZ9SwKfsrzQBfVCfFPuznEuYAaJtn5qY9lKesDmnWybNiLFvzcIcYIWwfev23qrvfBixJrWjgpxPqcMx09uSedUeXPQOBIJx4dtBAnonkrUiOUzhPt8DMkgA.gz?t=6a1fa8a7&sign=ce2617d48646c54ab30fb8e4f71e7c4f228dec21&media_title=valve-query-src.tar.gz)
