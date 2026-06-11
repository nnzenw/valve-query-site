# Stripe → Creem 迁移完成清单

## 已完成工作

### 1. 后端 (`server/server.js`) ✅
- [x] 移除 Stripe SDK (`@stripe/stripe-js`)
- [x] 集成 Creem REST API (axios 调用)
- [x] 实现 `/api/create-checkout` - 创建支付页面
- [x] 实现 `/api/checkout/:checkoutId` - 查询支付状态
- [x] 实现 `/api/webhook` - 处理 Creem Webhook 事件
  - `checkout.completed` - 购买成功
  - `subscription.active` - 订阅激活
  - `subscription.paid` - 扣款成功
  - `subscription.canceled` - 订阅取消
  - `subscription.past_due` - 扣款失败
  - `refund.created` - 退款
- [x] 实现 `/api/buy-leads` - 一次性购买线索
- [x] 实现 `/api/subscription/:userId` - 查询用户订阅
- [x] Webhook 签名验证 (HMAC-SHA256)

### 2. 前端 (`src/components/PricingPage.jsx`) ✅
- [x] 移除 Stripe.js 集成
- [x] 更新 `handleSubscribe` 使用 `creem_product_id` 字段
- [x] 修复重复的 `export default` 问题
- [x] 通过后端 `/api/create-checkout` 跳转 Creem 支付页
- [x] 保留模拟模式 (无真实 Product ID 时降级)

### 3. 订阅上下文 (`src/lib/SubscriptionContext.jsx`) ✅
- [x] 更新套餐定义，使用 `creem_product_id` 字段
- [x] 支持 `creem_product_id_yearly` / `creem_product_id_monthly`
- [x] 供应商套餐支持 `creem_product_id`

### 4. 数据库 (`database/init.sql`) ✅
- [x] `user_subscriptions` 表添加 Creem 字段：
  - `creem_customer_id`
  - `creem_checkout_id`
  - `creem_subscription_id`
- [x] `lead_purchases` 表添加 `creem_transaction_id`

### 5. 环境变量 (`.env`) ✅
- [x] 添加 `CREEM_API_KEY` (测试环境)
- [x] 添加 `CREEM_WEBHOOK_SECRET`

### 6. 文档
- [x] 创建 `CREEM_INTEGRATION.md` 完整接入文档
- [x] 创建 `server/test-creem-payment.js` 测试脚本

## 待办事项 (用户需手动完成)

### 1. 在 Creem Dashboard 创建产品
登录 https://dashboard.creem.io 创建以下产品：

| 产品 | 类型 | 价格 | Product ID (填入代码) |
|------|------|------|----------------------|
| Pro 月付 | 订阅 | ¥6.99 | `prod_pro_monthly` |
| Pro 年付 | 订阅 | ¥49.99 | `prod_pro_yearly` |
| Enterprise | 订阅 | ¥199 | `prod_enterprise_monthly` |
| 基础入驻 | 订阅 | ¥2,980/年 | `prod_supplier_basic` |
| 黄金展位 | 订阅 | ¥9,800/年 | `prod_supplier_gold` |
| 白金竞价 | 订阅 | ¥19,800/年 | `prod_supplier_platinum` |
| 线索包 (10条) | 一次性 | ¥150 | `prod_leads_10` |

### 2. 更新环境变量
```bash
# 替换为真实值 (生产环境使用 sk_live_xxx)
CREEM_API_KEY=sk_live_your_real_key_here
CREEM_WEBHOOK_SECRET=whsec_your_real_secret_here
```

### 3. 配置 Webhook 端点
在 Creem Dashboard → Webhooks 添加：
- **Endpoint**: `https://your-domain.com/api/webhook`
- **事件**: 选择所有订阅和支付相关事件

### 4. 执行数据库迁移
```sql
-- 在 Supabase SQL Editor 执行
ALTER TABLE user_subscriptions 
  ADD COLUMN IF NOT EXISTS creem_customer_id VARCHAR(100),
  ADD COLUMN IF NOT EXISTS creem_checkout_id VARCHAR(100),
  ADD COLUMN IF NOT EXISTS creem_subscription_id VARCHAR(100);

ALTER TABLE lead_purchases 
  ADD COLUMN IF NOT EXISTS creem_transaction_id VARCHAR(100);
```

### 5. 测试支付流程
```bash
cd server
node test-creem-payment.js
```

## API 映射对照

| Stripe | Creem | 说明 |
|--------|-------|------|
| `stripe_price_id_*` | `creem_product_id` | 产品 ID |
| `stripe_subscription_id` | `creem_subscription_id` | 订阅 ID |
| `stripe_payment_intent` | `creem_transaction_id` | 交易 ID |
| `Bearer` 认证 | `x-api-key` 头 | API 认证 |
| `/create-payment-intent` | `/create-checkout` | 创建支付 |
| Stripe Webhook | Creem Webhook | 回调通知 |

## 注意事项

1. **认证方式变更**: Creem 使用 `x-api-key` 头，不是 `Bearer`
2. **Product ID**: 需要在 Creem Dashboard 创建产品后获取真实 ID
3. **Webhook Secret**: 必须正确配置才能验证签名
4. **HTTPS 要求**: Webhook 端点必须使用 HTTPS
5. **数据兼容**: 数据库保留 Stripe 字段，支持双网关过渡
