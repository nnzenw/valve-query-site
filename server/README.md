# ValveSpecs Pro - Stripe 支付服务
# 独立 Node.js 服务，处理 Stripe 支付和 Webhook

## 安装

```bash
cd server
npm install
```

## 配置环境变量

创建 `.env` 文件：
```env
STRIPE_SECRET_KEY=sk_live_xxxxxxxxxxxxx
STRIPE_WEBHOOK_SECRET=whsec_xxxxxxxxxxxxx
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_KEY=your-service-role-key
PORT=3001
FRONTEND_URL=http://localhost:3000
```

## 启动

```bash
npm run dev
```

## API 接口

| 方法 | 路径 | 说明 |
|------|------|------|
| POST | `/api/create-checkout` | 创建 Stripe Checkout Session |
| POST | `/api/create-portal` | 创建客户门户（管理订阅） |
| POST | `/api/webhook` | Stripe Webhook（更新订阅状态） |
| POST | `/api/buy-leads` | 购买线索 |
| GET  | `/api/subscription/:userId` | 查询用户订阅状态 |