-- ============================================================
-- 迁移：全文搜索支持
-- 功能：添加 search_vector 生成列 + GIN 索引
-- 执行：在 Supabase SQL Editor 中运行此脚本
-- ============================================================

-- 1. 添加 search_vector 生成列（自动维护，无需手动更新）
ALTER TABLE valve_specs ADD COLUMN search_vector tsvector
  GENERATED ALWAYS AS (
    setweight(to_tsvector('english', COALESCE(model, '')), 'A') ||
    setweight(to_tsvector('english', COALESCE(body_material, '')), 'B') ||
    setweight(to_tsvector('english', COALESCE(standard, '')), 'C') ||
    setweight(to_tsvector('english', COALESCE(size_range, '')), 'D') ||
    setweight(to_tsvector('english', COALESCE(end_connection, '')), 'D') ||
    setweight(to_tsvector('english', COALESCE(seal_material, '')), 'D') ||
    setweight(to_tsvector('english', COALESCE(trim_material, '')), 'D') ||
    setweight(to_tsvector('english', COALESCE(temperature_range, '')), 'D') ||
    setweight(to_tsvector('english', COALESCE(applicable_media::text, '')), 'C')
  ) STORED;

-- 2. 创建 GIN 索引（加速全文搜索查询）
CREATE INDEX idx_valve_specs_search_vector ON valve_specs USING GIN(search_vector);

-- 3. 验证（可选）：搜索 "Siemens" 应返回结果
-- SELECT model, body_material, ts_rank(search_vector, plainto_tsquery('english', 'Siemens')) AS rank
-- FROM valve_specs
-- WHERE search_vector @@ plainto_tsquery('english', 'Siemens')
-- ORDER BY rank DESC
-- LIMIT 5;
