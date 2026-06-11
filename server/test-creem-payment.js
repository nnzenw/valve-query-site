/**
 * ValveSpecs Pro - Creem 支付测试脚本
 * 
 * 使用方法:
 * node test-creem-payment.js
 */

const BACKEND_URL = 'http://localhost:3001'
const TEST_USER_ID = 'test-user-123' // 替换为真实用户 ID
const TEST_EMAIL = 'test@example.com'

async function testCreateCheckout() {
  console.log('\n🧪 测试 1: 创建 Checkout Session')
  console.log('================================')
  
  try {
    const response = await fetch(`${BACKEND_URL}/api/create-checkout`, {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json',
        'Origin': 'http://localhost:3000'
      },
      body: JSON.stringify({
        productId: 'prod_pro_monthly',
        userId: TEST_USER_ID,
        email: TEST_EMAIL,
        successUrl: 'http://localhost:3000/dashboard',
        cancelUrl: 'http://localhost:3000/pricing'
      })
    })

    if (!response.ok) {
      const error = await response.json()
      console.error('❌ 创建 Checkout 失败:', error)
      return null
    }

    const data = await response.json()
    console.log('✅ Checkout 创建成功!')
    console.log('   Checkout ID:', data.checkoutId)
    console.log('   支付链接:', data.url)
    
    return data.checkoutId
  } catch (err) {
    console.error('❌ 测试失败:', err.message)
    return null
  }
}

async function testGetSubscription(userId) {
  console.log('\n🧪 测试 2: 查询用户订阅状态')
  console.log('================================')
  
  try {
    const response = await fetch(`${BACKEND_URL}/api/subscription/${userId}`)
    
    if (!response.ok) {
      console.error('❌ 查询失败')
      return
    }

    const data = await response.json()
    console.log('✅ 查询成功!')
    console.log('订阅信息:', JSON.stringify(data.subscription, null, 2))
  } catch (err) {
    console.error('❌ 测试失败:', err.message)
  }
}

async function testWebhook() {
  console.log('\n🧪 测试 3: 模拟 Webhook 事件')
  console.log('================================')
  
  // 注意：实际测试需要 Creem 发送真实 Webhook
  // 这里仅验证接口是否可达
  
  try {
    const mockEvent = {
      type: 'checkout.completed',
      data: {
        id: 'cs_test_xxx',
        customer_id: 'cus_test_xxx',
        subscription_id: 'sub_test_xxx',
        metadata: {
          userId: TEST_USER_ID,
          planId: 'pro',
          planType: 'user'
        }
      }
    }

    console.log('⏭️  Webhook 需要 Creem 服务器发送真实事件')
    console.log('   请在 Creem Dashboard 配置 Webhook 后测试')
    console.log('   Webhook URL:', `${BACKEND_URL}/api/webhook`)
  } catch (err) {
    console.error('❌ 测试失败:', err.message)
  }
}

async function runAllTests() {
  console.log('\n🚀 开始 Creem 支付流程测试')
  console.log('================================\n')
  
  // 测试 1: 创建 Checkout
  const checkoutId = await testCreateCheckout()
  
  // 测试 2: 查询订阅
  if (checkoutId) {
    await testGetSubscription(TEST_USER_ID)
  }
  
  // 测试 3: Webhook
  await testWebhook()
  
  console.log('\n✅ 测试完成!')
  console.log('\n📝 下一步操作:')
  console.log('1. 将 Creem 产品 ID 填入代码 (见 docs/CREEM_INTEGRATION.md)')
  console.log('2. 在 Creem Dashboard 配置 Webhook 端点')
  console.log('3. 使用测试卡号完成真实支付流程')
  console.log('4. 验证数据库 user_subscriptions 表记录')
  console.log('\n')
}

// 运行测试
runAllTests()
