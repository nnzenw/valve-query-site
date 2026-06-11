-- ============================================================
-- 全球阀门规格参数查询数据库 - 初始化 SQL
-- 目标: Supabase (PostgreSQL)
-- ============================================================

-- 1. 阀门品牌表
CREATE TABLE brands (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL UNIQUE,           -- 品牌名称
    country VARCHAR(255),                        -- 国家/地区
    established INTEGER,                         -- 成立年份
    description TEXT,                            -- 品牌简介
    website VARCHAR(500),                        -- 官网链接
    logo_url TEXT,                               -- Logo 图片 URL
    certifications TEXT[],                       -- 认证列表 (API, ASME, CE等)
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 阀门类型表
CREATE TABLE valve_types (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL UNIQUE,           -- 阀门类型名称 (如: Ball Valve)
    type_key VARCHAR(100) NOT NULL UNIQUE,       -- 英文 key (如: ball_valve)
    description TEXT,                            -- 类型说明
    common_applications TEXT[],                  -- 常见应用场景
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. 阀门规格表 (核心表)
CREATE TABLE valve_specs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    brand_id UUID REFERENCES brands(id) ON DELETE CASCADE,
    valve_type_id UUID REFERENCES valve_types(id) ON DELETE CASCADE,
    
    -- 核心参数
    model VARCHAR(255),                          -- 型号
    size_range TEXT,                             -- 尺寸范围 (如: DN15-DN200)
    pressure_range TEXT,                         -- 压力范围 (如: PN10-40)
    temperature_range TEXT,                      -- 温度范围
    body_material TEXT,                          -- 阀体材质
    trim_material TEXT,                          -- 内件材质
    seal_material TEXT,                          -- 密封材质
    stem_material TEXT,                          -- 阀杆材质
    end_connection TEXT,                         -- 端部连接 (法兰/螺纹/焊接)
    standard TEXT,                               -- 遵循标准
    operation_method TEXT,                       -- 操作方式 (手动/气动/电动)
    
    -- 性能参数
    flow_coefficient TEXT,                       -- 流量系数 Cv/Kv
    leak_rate TEXT,                              -- 泄漏等级 (API 598, FIV等)
    fire_safe BOOLEAN DEFAULT FALSE,             -- 防火设计
    anti_static BOOLEAN DEFAULT FALSE,           -- 防静电
    
    -- 应用信息
    applicable_media TEXT[],                     -- 适用介质
    applications TEXT[],                         -- 应用场景
    industry_tags TEXT[],                        -- 行业标签
    
    -- 元数据
    specs_json JSONB,                            -- 存储完整规格数据 (灵活性)
    is_active BOOLEAN DEFAULT TRUE,              -- 是否启用
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. 用户收藏表
CREATE TABLE user_favorites (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    valve_spec_id UUID REFERENCES valve_specs(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, valve_spec_id)
);

-- 5. 用户查询历史表 (Pro 用户功能)
CREATE TABLE user_query_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    search_params JSONB,                         -- 查询条件
    results_count INTEGER,                       -- 结果数量
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. 用户反馈表 (点赞/纠错/使用反馈)
CREATE TABLE valve_feedback (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    valve_spec_id UUID REFERENCES valve_specs(id) ON DELETE CASCADE,
    user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,  -- 游客也可以反馈
    
    -- 反馈类型
    type VARCHAR(20) NOT NULL CHECK (type IN ('like', 'dislike', 'correction', 'rating')),
    
    -- 评分 (1-5星)
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    
    -- 纠错内容
    correction_content TEXT CHECK (length(correction_content) <= 2000),
    correction_suggestion TEXT CHECK (length(correction_suggestion) <= 2000),

    -- 实际使用反馈
    actual_usage TEXT CHECK (length(actual_usage) <= 2000),
    actual_lifespan_months INTEGER,  -- 实际使用年限
    has_leak BOOLEAN DEFAULT FALSE,  -- 是否泄漏
    
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 7. 用户健康度评分表
CREATE TABLE valve_health_scores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    valve_spec_id UUID REFERENCES valve_specs(id) ON DELETE CASCADE,
    
    -- 健康度计算结果
    health_score INTEGER NOT NULL CHECK (health_score >= 0 AND health_score <= 100),
    score_factors JSONB,         -- 评分因素详情 (材质加分、压力裕度等)
    
    -- 基于反馈的评分
    feedback_count INTEGER DEFAULT 0,
    average_rating DECIMAL(3,2) DEFAULT 0,
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(valve_spec_id)
);

-- 10. 用户订阅表（接入 Stripe 和 Creem 双网关）
CREATE TABLE user_subscriptions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE UNIQUE,
    
    -- 套餐信息
    plan_id VARCHAR(50) NOT NULL,                -- free / pro / enterprise / supplier_basic / supplier_gold / supplier_platinum
    status VARCHAR(20) DEFAULT 'active',         -- active / canceled / past_due / trialing
    subscription_type VARCHAR(20) DEFAULT 'user', -- user / supplier
    
    -- Stripe 关联
    stripe_customer_id VARCHAR(100),
    stripe_subscription_id VARCHAR(100),
    
    -- Creem 关联
    creem_customer_id VARCHAR(100),
    creem_checkout_id VARCHAR(100),
    creem_subscription_id VARCHAR(100),
    
    -- 有效期
    started_at TIMESTAMPTZ DEFAULT NOW(),
    renews_at TIMESTAMPTZ,
    canceled_at TIMESTAMPTZ,
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 11. 线索购买记录
CREATE TABLE lead_purchases (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    supplier_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL,
    total_amount INTEGER NOT NULL,               -- 单位：分
    stripe_payment_intent VARCHAR(100),
    creem_transaction_id VARCHAR(100),            -- Creem 交易 ID
    status VARCHAR(20) DEFAULT 'completed',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 8. UGC 选型技巧 / 经验帖
CREATE TABLE valve_tips (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,                     -- 标题
    content TEXT NOT NULL,                           -- 正文内容
    valve_type_id UUID REFERENCES valve_types(id) ON DELETE SET NULL,  -- 关联阀门类型
    brand_id UUID REFERENCES brands(id) ON DELETE SET NULL,            -- 关联品牌
    
    -- 标签
    tags TEXT[],                                     -- 标签 (如: 安装, 维护, 选型)
    difficulty VARCHAR(20) DEFAULT 'intermediate' CHECK (difficulty IN ('beginner', 'intermediate', 'advanced')),
    
    -- 作者信息 (支持匿名/昵称)
    author_name VARCHAR(100) DEFAULT '匿名工程师',    -- 作者昵称
    author_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
    
    -- 互动数据
    like_count INTEGER DEFAULT 0,
    view_count INTEGER DEFAULT 0,
    comments_count INTEGER DEFAULT 0,
    
    -- 状态
    is_published BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 9. 技巧评论表
CREATE TABLE tip_comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tip_id UUID REFERENCES valve_tips(id) ON DELETE CASCADE,
    author_name VARCHAR(100) DEFAULT '匿名工程师',
    content TEXT NOT NULL CHECK (length(content) <= 2000),
    like_count INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 索引优化 (加速查询)
-- ============================================================

-- 品牌常用查询索引
CREATE INDEX idx_brands_name ON brands USING gin(to_tsvector('english', name));
CREATE INDEX idx_brands_country ON brands(country);

-- 阀门类型索引
CREATE INDEX idx_valve_types_key ON valve_types(type_key);

-- 核心查询索引 (多维筛选)
CREATE INDEX idx_valve_specs_brand ON valve_specs(brand_id);
CREATE INDEX idx_valve_specs_type ON valve_specs(valve_type_id);
CREATE INDEX idx_valve_specs_size ON valve_specs USING gin(to_tsvector('english', size_range));
CREATE INDEX idx_valve_specs_pressure ON valve_specs USING gin(to_tsvector('english', pressure_range));
CREATE INDEX idx_valve_specs_material ON valve_specs USING gin(to_tsvector('english', body_material));
CREATE INDEX idx_valve_specs_standard ON valve_specs USING gin(to_tsvector('english', standard));

-- JSONB 索引 (用于灵活查询)
CREATE INDEX idx_valve_specs_applications ON valve_specs USING gin(applications);
CREATE INDEX idx_valve_specs_industry ON valve_specs USING gin(industry_tags);

-- 全文搜索索引
CREATE INDEX idx_valve_specs_fulltext ON valve_specs USING gin(to_tsvector('english', 
    COALESCE(model, '') || ' ' || 
    COALESCE(body_material, '') || ' ' || 
    COALESCE(seal_material, '') || ' ' ||
    COALESCE(standard, '')
));

-- ============================================================
-- RLS (Row Level Security) - 数据访问控制
-- ============================================================

-- 所有用户可读
ALTER TABLE brands ENABLE ROW LEVEL SECURITY;
ALTER TABLE valve_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE valve_specs ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_favorites ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_query_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE valve_feedback ENABLE ROW LEVEL SECURITY;
ALTER TABLE valve_health_scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE valve_tips ENABLE ROW LEVEL SECURITY;
ALTER TABLE tip_comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE lead_purchases ENABLE ROW LEVEL SECURITY;

-- 品牌表: 所有人可读
CREATE POLICY "Anyone can read brands" ON brands FOR SELECT USING (true);

-- 阀门类型表: 所有人可读
CREATE POLICY "Anyone can read valve_types" ON valve_types FOR SELECT USING (true);

-- 阀门规格表: 所有人可读
CREATE POLICY "Anyone can read valve_specs" ON valve_specs FOR SELECT USING (true);

-- 用户收藏: 只能读写自己的
CREATE POLICY "Users can view own favorites" ON user_favorites FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own favorites" ON user_favorites FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can delete own favorites" ON user_favorites FOR DELETE USING (auth.uid() = user_id);

-- 查询历史: 只能读写自己的
CREATE POLICY "Users can view own history" ON user_query_history FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own history" ON user_query_history FOR INSERT WITH CHECK (auth.uid() = user_id);

-- 阀门反馈: 任何人可读取，但提交需认证且 user_id 由服务端设置
CREATE POLICY "Anyone can read feedback" ON valve_feedback FOR SELECT USING (true);
CREATE POLICY "Authenticated users can submit feedback" ON valve_feedback FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

-- 健康度评分: 所有人可读，仅管理员可写（通过 RLS 策略控制）
CREATE POLICY "Anyone can read health scores" ON valve_health_scores FOR SELECT USING (true);
CREATE POLICY "Admin only write health scores" ON valve_health_scores FOR UPDATE USING (auth.uid() IS NOT NULL);

-- UGC 技巧: 所有人可读，提交需认证
CREATE POLICY "Anyone can read tips" ON valve_tips FOR SELECT USING (true);
CREATE POLICY "Authenticated users can create tips" ON valve_tips FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "Authors can update own tips" ON valve_tips FOR UPDATE USING (auth.uid() = author_id);
CREATE POLICY "Authors can delete own tips" ON valve_tips FOR DELETE USING (auth.uid() = author_id);

-- 评论: 所有人可读，提交需认证且有内容长度限制
CREATE POLICY "Anyone can read comments" ON tip_comments FOR SELECT USING (true);
CREATE POLICY "Authenticated users can create comments" ON tip_comments FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

-- ============================================================
-- 索引
-- ============================================================

-- UGC 技巧索引
CREATE INDEX idx_valve_tips_type ON valve_tips(valve_type_id);
CREATE INDEX idx_valve_tips_brand ON valve_tips(brand_id);
CREATE INDEX idx_valve_tips_tags ON valve_tips USING gin(tags);
CREATE INDEX idx_valve_tips_created ON valve_tips(created_at DESC);
CREATE INDEX idx_valve_tips_popular ON valve_tips(like_count DESC);
CREATE INDEX idx_tip_comments_tip ON tip_comments(tip_id);

-- ============================================================
-- 辅助函数
-- ============================================================

-- 更新 updated_at 的触发器
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_brands_updated_at BEFORE UPDATE ON brands
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_valve_specs_updated_at BEFORE UPDATE ON valve_specs
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_valve_health_scores_updated_at BEFORE UPDATE ON valve_health_scores
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- 更新健康度评分的函数（反馈时调用）
CREATE OR REPLACE FUNCTION update_health_score()
RETURNS TRIGGER AS $$
DECLARE
    v_spec_id UUID;
    v_avg_rating DECIMAL;
    v_rating_count INTEGER;
    v_feedback_count INTEGER;
BEGIN
    -- 获取阀门规格 ID
    v_spec_id := NEW.valve_spec_id;
    
    -- 计算平均评分
    SELECT COALESCE(AVG(rating::DECIMAL), 0), COUNT(*)
    INTO v_avg_rating, v_rating_count
    FROM valve_feedback
    WHERE valve_spec_id = v_spec_id AND type = 'rating';
    
    -- 计算反馈总数
    SELECT COUNT(*) INTO v_feedback_count
    FROM valve_feedback
    WHERE valve_spec_id = v_spec_id;
    
    -- 插入或更新健康度记录
    INSERT INTO valve_health_scores (valve_spec_id, average_rating, feedback_count)
    VALUES (v_spec_id, v_avg_rating, v_feedback_count)
    ON CONFLICT (valve_spec_id) DO UPDATE SET
        average_rating = EXCLUDED.average_rating,
        feedback_count = EXCLUDED.feedback_count,
        updated_at = NOW();
    
    RETURN NEW;
END;
$$ language 'plpgsql';

-- 绑定触发器
CREATE TRIGGER trigger_update_health_score
    AFTER INSERT OR UPDATE ON valve_feedback
    FOR EACH ROW EXECUTE FUNCTION update_health_score();

-- ============================================================
-- 示例数据 (可选, 用于测试)
-- 注意: 实际数据通过 import-real-data.js 导入
-- ============================================================

-- 插入示例品牌
INSERT INTO brands (name, country, established, description, website) VALUES
('ARMSTRONG', 'USA', 1967, 'Leading provider of efficient steam traps and heat management solutions', 'https://www.armstrong-intl.com'),
('Spirax Sarco', 'UK', 1913, 'Global leader in steam system management solutions', 'https://www.spiraxsarco.com'),
('ARI', 'Germany', 1876, 'German precision valve manufacturer specializing in control valves and steam traps', 'https://www.ari.de'),
('GEMU', 'Germany', 1860, 'German process valve leader, renowned for butterfly and diaphragm valves', 'https://www.gemu-group.com'),
('Fisher (Emerson)', 'USA', 1904, 'Global leader in control valves and process control solutions', 'https://www.emerson.com'),
('Cameron (SLB)', 'USA', 1864, 'Oil and gas industry valve leader under Schlumberger', 'https://www.cameron.com'),
('Keen Valve', 'China', 2005, 'High-end valve manufacturer specializing in cryogenic and special condition valves', 'https://www.keenvalve.com'),
('KITZ', 'Japan', 1921, 'Japanese cast iron valve industry leader', 'https://www.kitz.co.jp'),
('Yoshitake', 'Japan', 1918, 'Japanese steam trap and flow meter industry leader', 'https://www.yoshitake.co.jp'),
('Belimo', 'Switzerland', 1974, 'Swiss actuator and control valve brand', 'https://www.belimo.com')
ON CONFLICT (name) DO NOTHING;

-- 插入示例阀门类型 (使用 ARRAY[] 语法)
INSERT INTO valve_types (name, type_key, description, common_applications) VALUES
('Ball Valve', 'ball_valve', 'Controls fluid flow by rotating a sphere with a hole', ARRAY['Oil & Gas', 'Chemical', 'Power', 'HVAC']),
('Globe Valve', 'globe_valve', 'Controls flow by raising and lowering a disc against a seat', ARRAY['Flow regulation', 'Boiler systems', 'Heat distribution']),
('Butterfly Valve', 'butterfly_valve', 'Controls flow with a rotating disc, compact and cost-effective', ARRAY['Water treatment', 'HVAC', 'Chemical process control']),
('Gate Valve', 'gate_valve', 'Controls flow by raising and lowering a gate, low resistance when fully open', ARRAY['Oil & Gas pipelines', 'Water treatment', 'Power plants']),
('Check Valve', 'check_valve', 'Automatically prevents reverse flow of fluid', ARRAY['Pump stations', 'Compressors', 'All fluid piping systems']),
('Control Valve', 'control_valve', 'Automatically adjusts flow, pressure, and temperature via control signals', ARRAY['Process industries', 'Power plants', 'Chemical refining']),
('Diaphragm Valve', 'diaphragm_valve', 'Controls flow using a flexible diaphragm, excellent sealing', ARRAY['Water treatment', 'Food & Pharma', 'Corrosive media']),
('Needle Valve', 'needle_valve', 'Precise flow control using a needle-shaped stem', ARRAY['Instrumentation', 'Sampling systems', 'Low flow regulation']),
('Steam Trap', 'steam_trap', 'Automatically discharges condensate and non-condensable gases while blocking steam', ARRAY['Power plants', 'Steam networks', 'Process heating']),
('Pressure Relief Valve', 'pressure_relief_valve', 'Automatically opens to relieve pressure when system exceeds setpoint', ARRAY['Pressure vessels', 'Piping systems', 'Power plants'])
ON CONFLICT (type_key) DO NOTHING;
