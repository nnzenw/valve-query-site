-- ============================================================
-- 迁移：给 brands 表添加 slug 字段
-- 目标：支持语义化 URL（/brand/kitz 替代 /brand/uuid）
-- ============================================================

-- 1. 添加 slug 字段
ALTER TABLE brands ADD COLUMN IF NOT EXISTS slug VARCHAR(255) UNIQUE;

-- 2. 创建索引（唯一约束已通过 UNIQUE 字段实现，这里加一个用于查询的索引）
-- 注意：UNIQUE 字段自动创建唯一索引，无需重复创建
-- 但如果想显式创建，可以用：
-- CREATE UNIQUE INDEX IF NOT EXISTS idx_brands_slug ON brands(slug);

-- 3. 数据迁移：根据 name 生成 slug
-- 规则：小写 + 替换特殊字符 + 去掉括号内容
-- 需要手动为每个品牌设置 slug（更可控）

-- 先查看现有品牌
-- SELECT id, name, slug FROM brands;

-- 根据已知品牌数据设置 slug（参考 init.sql 中的示例数据）
-- 注意：这里用 UPDATE ... WHERE name= 来精确匹配

-- 如果有 Supabase 客户端，可以用 RPC 函数批量生成：
-- CREATE OR REPLACE FUNCTION generate_brand_slugs()
-- RETURNS void AS $$
-- DECLARE
--   r RECORD;
--   new_slug TEXT;
-- BEGIN
--   FOR r IN SELECT id, name FROM brands WHERE slug IS NULL LOOP
--     -- 生成 slug：小写，替换特殊字符
--     new_slug := lower(r.name);
--     new_slug := regexp_replace(new_slug, '\(.*?\)', '', 'g');  -- 去掉括号内容
--     new_slug := regexp_replace(new_slug, '[^a-z0-9]+', '-', 'g');  -- 非字母数字替换为 -
--     new_slug := regexp_replace(new_slug, '^-+|-+$', '', 'g');  -- 去掉首尾 -
--     
--     UPDATE brands SET slug = new_slug WHERE id = r.id;
--   END LOOP;
-- END;
-- $$ LANGUAGE plpgsql;

-- 为已知品牌手动设置 slug（更安全可控）
-- 如果你的品牌数据是通过 import-real-data.js 导入的，请先查询实际数据：
-- SELECT id, name FROM brands ORDER BY name;

-- 然后根据实际查询结果设置 slug，例如：
-- UPDATE brands SET slug = 'kitz' WHERE name = 'KITZ';
-- UPDATE brands SET slug = 'ksb' WHERE name = 'KSB';
-- UPDATE brands SET slug = 'fisher' WHERE name LIKE 'Fisher%';
-- UPDATE brands SET slug = 'gemu' WHERE name = 'GEMÜ';
-- UPDATE brands SET slug = 'armstrong' WHERE name = 'ARMSTRONG';
-- UPDATE brands SET slug = 'spirax-sarco' WHERE name = 'Spirax Sarco';
-- UPDATE brands SET slug = 'ari' WHERE name = 'ARI';
-- UPDATE brands SET slug = 'cameron' WHERE name = 'Cameron (SLB)';
-- UPDATE brands SET slug = 'keen-valve' WHERE name = 'Keen Valve';
-- UPDATE brands SET slug = 'yoshitake' WHERE name = 'Yoshitake';
-- UPDATE brands SET slug = 'belimo' WHERE name = 'Belimo';

-- 4. 验证 slug 设置
-- SELECT id, name, slug FROM brands WHERE slug IS NULL;
-- 如果还有 NULL，说明有品牌没设置到，需要补充

-- 5. 设置 slug 为 NOT NULL（可选，建议在数据全部填充后再执行）
-- ALTER TABLE brands ALTER COLUMN slug SET NOT NULL;

-- ============================================================
-- 简化版：用 SQL 批量生成 slug（适合数据量小的场景）
-- ============================================================
-- 执行这个 SQL 来自动生成所有品牌的 slug
UPDATE brands 
SET slug = lower(
  regexp_replace(
    regexp_replace(
      regexp_replace(name, '\(.*?\)', '', 'g'),  -- 去掉括号及内容
      '[^a-zA-Z0-9]+', '-', 'g'  -- 非字母数字替换为连字符
    ),
    '^-+|-+$', '', 'g'  -- 去掉首尾连字符
  )
)
WHERE slug IS NULL;

-- 检查是否有重复的 slug（唯一约束会阻止，但提前检查更安全）
-- SELECT slug, COUNT(*) FROM brands GROUP BY slug HAVING COUNT(*) > 1;

-- 如果有重复，需要手动处理（在 slug 后加数字后缀）
-- 例如：UPDATE brands SET slug = 'kitz-2' WHERE id = '...';

-- 最后：设置为 NOT NULL
ALTER TABLE brands ALTER COLUMN slug SET NOT NULL;
