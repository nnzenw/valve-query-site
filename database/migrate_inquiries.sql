-- ============================================================
-- 阀门询价线索表 - 平台中转模式
-- 买方提交询价 → 平台留存 → 供应商购买后查看
-- ============================================================

CREATE TABLE valve_inquiries (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    
    -- 关联产品
    valve_spec_id UUID REFERENCES valve_specs(id) ON DELETE SET NULL,
    brand_id UUID REFERENCES brands(id) ON DELETE SET NULL,
    
    -- 买方信息
    buyer_name VARCHAR(255) NOT NULL,
    buyer_email VARCHAR(255) NOT NULL,
    buyer_company VARCHAR(255),
    buyer_phone VARCHAR(50),
    buyer_country VARCHAR(100),
    
    -- 询价详情
    quantity INTEGER,
    unit VARCHAR(50),                            -- pieces / sets / tons
    required_by DATE,                            -- 期望交货日期
    target_price VARCHAR(100),                   -- 目标价格 (文本，因为不同货币)
    inquiry_message TEXT,                        -- 买方留言
    technical_requirements TEXT,                 -- 技术要求 (如特殊材质、认证等)
    
    -- 线索状态
    status VARCHAR(20) DEFAULT 'new' CHECK (status IN ('new', 'viewed', 'contacted', 'converted', 'closed', 'invalid')),
    -- new: 新线索，供应商未查看
    -- viewed: 供应商已查看
    -- contacted: 供应商已联系买方
    -- converted: 成交
    -- closed: 买方取消/过期
    -- invalid: 无效线索(机器人/测试)
    
    -- 线索可见性 (被某个供应商购买后才对该供应商可见)
    is_public BOOLEAN DEFAULT FALSE,
    
    -- 审计
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS: 所有人可提交（匿名也可），但查看需要认证
ALTER TABLE valve_inquiries ENABLE ROW LEVEL SECURITY;

-- 任何人都可以提交询价
CREATE POLICY "Anyone can submit inquiry" ON valve_inquiries 
    FOR INSERT WITH CHECK (true);

-- 只有认证用户可以查看（后续通过 business logic 控制：只能看自己购买过的）
CREATE POLICY "Authenticated users can read inquiries" ON valve_inquiries 
    FOR SELECT USING (auth.uid() IS NOT NULL);

-- 线索-供应商关联表 (记录哪个供应商购买了哪条线索)
CREATE TABLE inquiry_purchases (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    inquiry_id UUID REFERENCES valve_inquiries(id) ON DELETE CASCADE,
    supplier_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    amount_paid INTEGER NOT NULL,                -- 单位：分
    purchase_type VARCHAR(20) DEFAULT 'single',  -- single / bundle
    lead_purchase_id UUID REFERENCES lead_purchases(id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(inquiry_id, supplier_id)
);

ALTER TABLE inquiry_purchases ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Suppliers view own purchases" ON inquiry_purchases 
    FOR SELECT USING (auth.uid() = supplier_id);

-- 索引
CREATE INDEX idx_valve_inquiries_brand ON valve_inquiries(brand_id);
CREATE INDEX idx_valve_inquiries_status ON valve_inquiries(status);
CREATE INDEX idx_valve_inquiries_created ON valve_inquiries(created_at DESC);
CREATE INDEX idx_inquiry_purchases_supplier ON inquiry_purchases(supplier_id);
CREATE INDEX idx_inquiry_purchases_inquiry ON inquiry_purchases(inquiry_id);

-- 触发器: 更新 updated_at
CREATE TRIGGER update_inquiries_updated_at BEFORE UPDATE ON valve_inquiries
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();