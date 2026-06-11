# ValveSpecs Pro - Creem 支付网关接入文档

## 目录结构
```
valve-query-site/
├── server/
│   └── server.js          # 后端 API（已改为 Creem）
├── src/
│   ├── lib/
│   │   └── SubscriptionContext.jsx  # 订阅管理
│   └── components/
│       └── PricingPage.jsx          # 定价页面
├── database/
│   └── init.sql                   # 数据库迁移
└── .env                           # 环境配置
```

---

## 一、Creem 账户配置

### 1. 获取 API 密钥

1. 登录 [Creem Dashboard](https://dashboard.creem.io)
2. 进入 **Settings → API Keys**
3. 复制你的密钥：
   - **测试环境**: `sk_test_xxxxxxxxxxxxx`
   - **生产环境**: `sk_live_xxxxxxxxxxxxx`

### 2. 配置环境变量

编辑 `server/.env` 文件：

```bash
# Creem API 配置
CREEM_API_KEY=sk_test_xxxxxxxxxxxxx
CREEM_WEBHOOK_SECRET=whsec_xxxxxxxxxxxxx
```

---

## 二、在产品创建

### 1. 创建订阅产品

在 Creem Dashboard → Products 创建以下产品：

#### B2C 用户套餐

| 产品名称 | 类型 | 价格 | 产品 ID (填写到代码中) |
|---------|------|------|---------------------|
| Pro 月付 | 订阅 | ¥6.99/月 | `prod_pro_monthly` |
| Pro 年付 | 订阅 | ¥49.99/年 | `prod_pro_yearly` |
| Enterprise 月付 | 订阅 | ¥199/月 | `prod_enterprise_monthly` |

#### B2B 供应商套餐

| 产品名称 | 类型 | 价格 | 产品 ID |
|---------|------|------|--------|
| 基础入驻 | 一次性 | ¥2,980/年 | `prod_supplier_basic` |
| 黄金展位 | 一次性 | ¥9,800/年 | `prod_supplier_gold` |
| 白金竞价 | 一次性 | ¥19,800/年 | `prod_supplier_platinum` |

### 2. 更新代码中的产品 ID

打开以下文件并替换产品 ID：

**`src/lib/SubscriptionContext.jsx`**
```javascript
export const PLANS = {
  pro: {
    id: 'pro',
    creem_product_id_monthly: 'prod_pro_monthly',   // ← 替换为真实 ID
    creem_product_id_yearly: 'prod_pro_yearly',     // ← 替换为真实 ID
  }
}
```

**`server/server.js`**
```javascript
const PLAN_MAP = {
  'prod_pro_monthly': { plan_id: 'pro', interval: 'month', type: 'user' },
  'prod_pro_yearly': { plan_id: 'pro', interval: 'year', type: 'user' },
  // ... 其他产品
}
```

---

## 三、Webhook 配置

### 1. 部署后端服务器

确保后端服务器可公网访问：

```bash
cd server
npm install
npm start
```

服务器会监听 `http://localhost:3001`

### 2. 设置 Webhook 端点

在 Creem Dashboard → Webhooks 配置：

- **Webhook URL**: `https://your-domain.com/api/webhook`
- **事件选择**:
  - `checkout.completed` - 支付完成
  - `subscription.active` - 订阅激活
  - `subscription.paid` - 扣款成功
  - `subscription.canceled` - 订阅取消
  - `subscription.past_due` - 扣款失败
  - `refund.created` - 退款

### 3. Webhook 签名验证

Webhook 使用 HMAC-SHA256 签名验证：

```javascript
const sig = req.headers['creem-signature']
const computed = crypto
  .createHmac('sha256', CREEM_WEBHOOK_SECRET)
  .update(payload)
  .digest('hex')

if (computed !== sig) {
  return res.status(400).send('Invalid signature')
}
```

---

## 四、测试支付流程

### 1. 测试模式

Creem 提供测试环境，使用测试密钥和测试卡号：

- **测试卡号**: `4242 4242 4242 4242`
- **过期时间**: 任意未来日期
- **CVC**: 任意 3 位数字

### 2. 本地测试

```bash
# 1. 启动后端
cd server
npm start

# 2. 启动前端
cd ..
npm run dev

# 3. 打开定价页面
# http://localhost:3000/pricing
```

### 3. 支付流程测试步骤

1. 选择套餐（Pro 月付/年付）
2. 点击 "升级 Pro" 按钮
3. 跳转到 Creem Checkout 页面
4. 使用测试卡号支付
5. 支付成功后跳转回 Dashboard
6. 检查用户订阅状态是否更新

### 4. 验证订阅状态

```bash
# 查询数据库
SELECT * FROM user_subscriptions WHERE user_id = 'your-user-id';

# 应该看到类似结果：
# plan_id: 'pro'
# status: 'active'
# creem_checkout_id: 'cs_xxxxxxxxx'
# creem_subscription_id: 'sub_xxxxxxxxx'
```

---

## 五、API 接口说明

### 1. 创建 Checkout

**请求**:
```http
POST /api/create-checkout
Content-Type: application/json

{
  "productId": "prod_pro_monthly",
  "userId": "user-uuid",
  "email": "user@example.com",
  "successUrl": "http://localhost:3000/dashboard",
  "cancelUrl": "http://localhost:3000/pricing"
}
```

**响应**:
```json
{
  "checkoutId": "cs_xxxxxxxxx",
  "url": "https://checkout.creem.io/xxx",
  "sessionId": "cs_xxxxxxxxx"
}
```

### 2. 查询用户订阅

**请求**:
```http
GET /api/subscription/:userId
```

**响应**:
```json
{
  "subscription": {
    "id": "uuid",
    "user_id": "uuid",
    "plan_id": "pro",
    "status": "active",
    "creem_customer_id": "cus_xxxxxxxxx",
    "creem_subscription_id": "sub_xxxxxxxxx",
    "started_at": "2024-01-01T00:00:00Z",
    "renews_at": "2024-02-01T00:00:00Z"
  }
}
```

### 3. Webhook 事件

**checkout.completed**:
```json
{
  "type": "checkout.completed",
  "data": {
    "id": "cs_xxxxxxxxx",
    "customer_id": "cus_xxxxxxxxx",
    "subscription_id": "sub_xxxxxxxxx",
    "metadata": {
      "userId": "user-uuid",
      "planId": "pro",
      "planType": "user"
    }
  }
}
```

---

## 六、数据库迁移

如果已有数据库，执行以下 SQL 添加 Creem 字段：

```sql
-- 添加 Creem 相关字段
ALTER TABLE user_subscriptions 
ADD COLUMN IF NOT EXISTS creem_customer_id VARCHAR(100),
ADD COLUMN IF NOT EXISTS creem_checkout_id VARCHAR(100),
ADD COLUMN IF NOT EXISTS creem_subscription_id VARCHAR(100);

ALTER TABLE lead_purchases
ADD COLUMN IF NOT EXISTS creem_transaction_id VARCHAR(100);
```

---

## 七、常见问题

### Q1: 支付成功后订阅状态未更新？

**检查**:
1. Webhook 是否正常接收事件
2. 服务器日志中是否有错误
3. Creem Dashboard → Webhooks 查看发送记录

### Q2: 如何切换回 Stripe？

**操作**:
1. 将 `PLAN_MAP` 改回 Stripe 格式
2. 使用 `stripe_price_id_monthly` 等字段
3. 修改 Webhook 处理逻辑

### Q3: Creem 支持哪些支付方式？

- 信用卡/借记卡 (Visa, Mastercard, UnionPay)
- 微信支付
- 支付宝
- 银行转账

---

## 八、生产部署清单

- [ ] 替换 `CREEM_API_KEY` 为 `sk_live_xxx`
- [ ] 替换 `CREEM_WEBHOOK_SECRET` 为真实值
- [ ] 配置 HTTPS (Webhook 需要)
- [ ] 更新 `PLAN_MAP` 中的产品 ID
- [ ] 测试完整支付流程
- [ ] 设置 Webhook 端点
- [ ] 配置监控和告警
- [ ] 备份数据库

---

## 联系支持

- Creem 文档: https://docs.creem.io
- Creem 支持: support@creem.io
- 项目 Issues: [GitHub Issues](https://github.com/your-repo/issues)
