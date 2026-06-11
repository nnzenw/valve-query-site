-- Valve Database Import (from valve_database_real_final.json)
-- Generated: 2026-06-08T05:45:14.727Z

-- Brands
INSERT INTO brands (name, country) VALUES
('Siemens', NULL),
('Keystone', NULL),
('Edmund Valve', NULL),
('Velan', NULL),
('JG Valve', NULL),
('Kayts Valve', NULL),
('CNC Flow Control', NULL),
('Honeywell', NULL),
('Neway Valve', NULL),
('Shield Valve', NULL),
('Sky Valve', NULL),
('Conbraco', NULL),
('Invaco Valve', NULL),
('Zhong Valve', NULL)
ON CONFLICT (name) DO NOTHING;

-- Valve Types
INSERT INTO valve_types (name, type_key, description, common_applications) VALUES
('butterfly_valve', 'butterfly_valve', 'Industrial butterfly_valve', ARRAY['Industrial']),
('check_valve', 'check_valve', 'Industrial check_valve', ARRAY['Industrial']),
('ball_valve', 'ball_valve', 'Industrial ball_valve', ARRAY['Industrial']),
('gate_valve', 'gate_valve', 'Industrial gate_valve', ARRAY['Industrial'])
ON CONFLICT (type_key) DO NOTHING;

-- Valve Specs (using PL/pgSQL for FK resolution)
DO $$
DECLARE
  brand_id UUID;
  type_id UUID;
  d RECORD;
BEGIN
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-40-000',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-40-000","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.40 PN6","product_type":"butterfly_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN6"],"kvs":"50 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-40-001',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-40-001","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.40 PN10","product_type":"butterfly_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN10"],"kvs":"50 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-40-002',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-40-002","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.40 PN16","product_type":"butterfly_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN16"],"kvs":"50 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-50-003',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-50-003","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.50 PN6","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN6"],"kvs":"85 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-50-004',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-50-004","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.50 PN10","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN10"],"kvs":"85 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-50-005',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-50-005","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.50 PN16","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN16"],"kvs":"85 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-65-006',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-65-006","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.65 PN6","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN6"],"kvs":"215 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-65-007',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-65-007","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.65 PN10","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN10"],"kvs":"215 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-65-008',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-65-008","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.65 PN16","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN16"],"kvs":"215 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-80-009',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-80-009","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.80 PN6","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN6"],"kvs":"420 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-80-010',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-80-010","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.80 PN10","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN10"],"kvs":"420 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-80-011',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-80-011","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.80 PN16","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN16"],"kvs":"420 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-100-012',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-100-012","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.100 PN6","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN6"],"kvs":"800 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-100-013',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-100-013","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.100 PN10","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN10"],"kvs":"800 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-100-014',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-100-014","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.100 PN16","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN16"],"kvs":"800 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-125-015',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-125-015","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.125 PN6","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN6"],"kvs":"1010 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-125-016',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-125-016","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.125 PN10","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN10"],"kvs":"1010 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-125-017',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-125-017","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.125 PN16","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN16"],"kvs":"1010 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-150-018',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-150-018","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.150 PN6","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN6"],"kvs":"2100 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-150-019',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-150-019","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.150 PN10","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN10"],"kvs":"2100 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-150-020',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-150-020","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.150 PN16","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN16"],"kvs":"2100 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-200-021',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-200-021","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.200 PN6","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN6"],"kvs":"4000 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-200-022',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-200-022","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.200 PN10","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN10"],"kvs":"4000 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-200-023',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-200-023","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.200 PN16","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN16"],"kvs":"4000 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-250-024',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-250-024","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.250 PN6","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN6"],"kvs":"6400 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-250-025',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-250-025","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.250 PN10","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN10"],"kvs":"6400 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-250-026',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-250-026","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.250 PN16","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN16"],"kvs":"6400 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-300-027',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-300-027","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.300 PN6","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN6"],"kvs":"8500 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-300-028',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-300-028","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.300 PN10","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN10"],"kvs":"8500 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-300-029',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-300-029","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.300 PN16","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN16"],"kvs":"8500 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-350-030',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-350-030","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.350 PN6","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN6"],"kvs":"11500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-350-031',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-350-031","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.350 PN10","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN10"],"kvs":"11500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-350-032',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-350-032","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.350 PN16","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN16"],"kvs":"11500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-400-033',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-400-033","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.400 PN6","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN6"],"kvs":"14500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-400-034',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-400-034","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.400 PN10","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN10"],"kvs":"14500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-400-035',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-400-035","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.400 PN16","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN16"],"kvs":"14500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-450-036',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-450-036","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.450 PN6","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN6"],"kvs":"20500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-450-037',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-450-037","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.450 PN10","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN10"],"kvs":"20500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-450-038',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-450-038","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.450 PN16","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN16"],"kvs":"20500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-500-039',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-500-039","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.500 PN6","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN6"],"kvs":"21000 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-500-040',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-500-040","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.500 PN10","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN10"],"kvs":"21000 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-500-041',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-500-041","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.500 PN16","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN16"],"kvs":"21000 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-600-042',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-600-042","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.600 PN6","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN6"],"kvs":"29300 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-600-043',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-600-043","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.600 PN10","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN10"],"kvs":"29300 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-BFV-600-044',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-BFV-600-044","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.600 PN16","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN16"],"kvs":"29300 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-2-045',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-2-045","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 2\" 150 Class","product_type":"check_valve","specifications":{"size":"2\"","size_mm":"DN2","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-3-046',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-3-046","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 3\" 150 Class","product_type":"check_valve","specifications":{"size":"3\"","size_mm":"DN3","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-4-047',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-4-047","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 4\" 150 Class","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN4","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-6-048',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-6-048","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 6\" 150 Class","product_type":"check_valve","specifications":{"size":"6\"","size_mm":"DN6","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-8-049',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-8-049","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 8\" 150 Class","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN8","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-10-050',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-10-050","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 10\" 150 Class","product_type":"check_valve","specifications":{"size":"10\"","size_mm":"DN10","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-12-051',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-12-051","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 12\" 150 Class","product_type":"check_valve","specifications":{"size":"12\"","size_mm":"DN12","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-24-052',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-24-052","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 24\" 150 Class","product_type":"check_valve","specifications":{"size":"24\"","size_mm":"DN24","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-4-053',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-4-053","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 4\" 300 Class","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN4","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-6-054',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-6-054","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 6\" 300 Class","product_type":"check_valve","specifications":{"size":"6\"","size_mm":"DN6","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-8-055',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-8-055","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 8\" 300 Class","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN8","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-12-056',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-12-056","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 12\" 300 Class","product_type":"check_valve","specifications":{"size":"12\"","size_mm":"DN12","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-18-057',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-18-057","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 18\" 300 Class","product_type":"check_valve","specifications":{"size":"18\"","size_mm":"DN18","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-4-058',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-4-058","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 4\" 600 Class","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN4","pressure_class":["600 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-6-059',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-6-059","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 6\" 600 Class","product_type":"check_valve","specifications":{"size":"6\"","size_mm":"DN6","pressure_class":["600 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-8-060',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-8-060","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 8\" 600 Class","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN8","pressure_class":["600 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-12-061',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-12-061","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 12\" 600 Class","product_type":"check_valve","specifications":{"size":"12\"","size_mm":"DN12","pressure_class":["600 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-8-062',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-8-062","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 8\" 900 Class","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN8","pressure_class":["900 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-12-063',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-12-063","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 12\" 900 Class","product_type":"check_valve","specifications":{"size":"12\"","size_mm":"DN12","pressure_class":["900 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GCV-4-064',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GCV-4-064","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 4\" 1500 Class","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN4","pressure_class":["1500 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-12-065',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-12-065","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1/2\" 150 PSI","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-34-066',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-34-066","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3/4\" 150 PSI","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-1-067',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-1-067","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1\" 150 PSI","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-15-068',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-15-068","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1.5\" 150 PSI","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-2-069',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-2-069","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 2\" 150 PSI","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-3-070',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-3-070","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3\" 150 PSI","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-4-071',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-4-071","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 4\" 150 PSI","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-6-072',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-6-072","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 6\" 150 PSI","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-1-073',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-1-073","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1\" 300 PSI","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-2-074',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-2-074","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 2\" 300 PSI","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-3-075',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-3-075","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3\" 300 PSI","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-4-076',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-4-076","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 4\" 300 PSI","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-6-077',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-6-077","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 6\" 300 PSI","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-8-078',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-8-078","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 8\" 300 PSI","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-1-079',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-1-079","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1\" 600 PSI","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-2-080',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-2-080","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 2\" 600 PSI","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-3-081',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-3-081","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3\" 600 PSI","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-4-082',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-4-082","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 4\" 600 PSI","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-6-083',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-6-083","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 6\" 600 PSI","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-1-084',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-1-084","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1\" 900 PSI","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 900 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-2-085',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-2-085","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 2\" 900 PSI","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 900 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-3-086',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-3-086","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3\" 900 PSI","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 900 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-4-087',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-4-087","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 4\" 900 PSI","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 900 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-8-088',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-8-088","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 8\" 600 PSI","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-10-089',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-10-089","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 10\" 300 PSI","product_type":"ball_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-12-090',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-12-090","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 12\" 300 PSI","product_type":"ball_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-15-091',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-15-091","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1.5\" 600 PSI","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-BVL-2-092',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-BVL-2-092","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 2\" 900 PSI","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 900 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-2-093',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-2-093","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 2\" 150 PSI","product_type":"check_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-3-094',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-3-094","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 3\" 150 PSI","product_type":"check_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-4-095',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-4-095","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 4\" 150 PSI","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-6-096',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-6-096","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 6\" 150 PSI","product_type":"check_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-8-097',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-8-097","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 8\" 150 PSI","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-10-098',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-10-098","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 10\" 150 PSI","product_type":"check_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-12-099',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-12-099","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 12\" 150 PSI","product_type":"check_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-14-100',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-14-100","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 14\" 150 PSI","product_type":"check_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-16-101',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-16-101","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 16\" 150 PSI","product_type":"check_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-18-102',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-18-102","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 18\" 150 PSI","product_type":"check_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-20-103',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-20-103","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 20\" 150 PSI","product_type":"check_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-24-104',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-24-104","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 24\" 150 PSI","product_type":"check_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-2-105',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-2-105","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 2\" 300 PSI","product_type":"check_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-3-106',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-3-106","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 3\" 300 PSI","product_type":"check_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-4-107',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-4-107","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 4\" 300 PSI","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-6-108',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-6-108","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 6\" 300 PSI","product_type":"check_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-8-109',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-8-109","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 8\" 300 PSI","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-10-110',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-10-110","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 10\" 300 PSI","product_type":"check_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-12-111',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-12-111","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 12\" 300 PSI","product_type":"check_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-4-112',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-4-112","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 4\" 600 PSI","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-6-113',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-6-113","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 6\" 600 PSI","product_type":"check_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-8-114',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-8-114","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 8\" 600 PSI","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-10-115',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-10-115","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 10\" 600 PSI","product_type":"check_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-6-116',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-6-116","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 6\" 900 PSI","product_type":"check_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 900 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-8-117',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-8-117","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 8\" 900 PSI","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 900 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-6-118',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-6-118","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 6\" 1500 PSI","product_type":"check_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 1500 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-8-119',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-8-119","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 8\" 1500 PSI","product_type":"check_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 1500 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-4-120',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-4-120","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 4\" 900 PSI","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 900 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-1-121',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-1-121","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 1\" 150 PSI","product_type":"check_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-2-122',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-2-122","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 2\" 600 PSI","product_type":"check_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-3-123',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-3-123","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 3\" 600 PSI","product_type":"check_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-4-124',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-4-124","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 4\" 1500 PSI","product_type":"check_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 1500 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-10-125',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-10-125","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 10\" 300 PSI","product_type":"check_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-2-126',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-2-126","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 2\" 900 PSI","product_type":"check_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 900 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-2-127',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-2-127","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 2\" 1500 PSI","product_type":"check_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 1500 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-NSC-1-128',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-NSC-1-128","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 1\" 300 PSI","product_type":"check_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-50-129',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-50-129","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN50 PN10","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-50-130',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-50-130","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN50 PN16","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-50-131',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-50-131","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN50 PN25","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-50-132',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-50-132","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN50 PN40","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-50-133',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-50-133","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN50 PN64","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-65-134',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-65-134","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN65 PN10","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-65-135',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-65-135","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN65 PN16","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-65-136',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-65-136","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN65 PN25","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-65-137',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-65-137","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN65 PN40","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-65-138',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-65-138","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN65 PN64","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-80-139',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-80-139","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN80 PN10","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-80-140',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-80-140","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN80 PN16","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-80-141',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-80-141","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN80 PN25","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-80-142',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-80-142","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN80 PN40","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-80-143',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-80-143","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN80 PN64","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-100-144',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-100-144","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN100 PN10","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-100-145',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-100-145","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN100 PN16","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-100-146',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-100-146","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN100 PN25","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-100-147',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-100-147","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN100 PN40","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-100-148',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-100-148","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN100 PN64","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-125-149',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-125-149","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN125 PN10","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-125-150',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-125-150","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN125 PN16","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-125-151',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-125-151","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN125 PN25","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-125-152',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-125-152","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN125 PN40","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-125-153',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-125-153","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN125 PN64","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-150-154',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-150-154","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN150 PN10","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-150-155',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-150-155","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN150 PN16","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-150-156',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-150-156","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN150 PN25","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-150-157',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-150-157","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN150 PN40","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-150-158',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-150-158","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN150 PN64","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-200-159',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-200-159","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN200 PN10","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-200-160',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-200-160","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN200 PN16","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-200-161',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-200-161","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN200 PN25","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-200-162',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-200-162","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN200 PN40","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-200-163',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-200-163","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN200 PN64","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-250-164',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-250-164","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN250 PN10","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-250-165',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-250-165","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN250 PN16","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-250-166',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-250-166","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN250 PN25","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-250-167',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-250-167","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN250 PN40","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-250-168',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-250-168","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN250 PN64","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-300-169',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-300-169","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN300 PN10","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-300-170',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-300-170","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN300 PN16","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-300-171',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-300-171","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN300 PN25","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-300-172',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-300-172","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN300 PN40","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-300-173',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-300-173","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN300 PN64","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-350-174',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-350-174","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN350 PN10","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-350-175',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-350-175","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN350 PN16","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-350-176',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-350-176","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN350 PN25","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-350-177',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-350-177","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN350 PN40","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-350-178',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-350-178","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN350 PN64","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-400-179',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-400-179","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN400 PN10","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-400-180',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-400-180","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN400 PN16","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-400-181',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-400-181","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN400 PN25","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-400-182',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-400-182","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN400 PN40","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-400-183',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-400-183","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN400 PN64","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-450-184',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-450-184","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN450 PN10","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-450-185',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-450-185","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN450 PN16","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-450-186',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-450-186","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN450 PN25","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-500-187',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-500-187","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN500 PN10","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-500-188',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-500-188","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN500 PN16","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-500-189',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-500-189","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN500 PN25","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-600-190',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-600-190","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN600 PN10","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-600-191',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-600-191","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN600 PN16","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-QOV-600-192',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-QOV-600-192","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN600 PN25","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-2-193',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-2-193","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 2\" 150 Class","product_type":"gate_valve","specifications":{"size":"2\"","size_mm":"DN2","pressure_class":["Class 150 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-3-194',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-3-194","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 3\" 150 Class","product_type":"gate_valve","specifications":{"size":"3\"","size_mm":"DN3","pressure_class":["Class 150 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-4-195',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-4-195","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 4\" 150 Class","product_type":"gate_valve","specifications":{"size":"4\"","size_mm":"DN4","pressure_class":["Class 150 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-6-196',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-6-196","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 6\" 150 Class","product_type":"gate_valve","specifications":{"size":"6\"","size_mm":"DN6","pressure_class":["Class 150 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-8-197',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-8-197","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 8\" 150 Class","product_type":"gate_valve","specifications":{"size":"8\"","size_mm":"DN8","pressure_class":["Class 150 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-10-198',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-10-198","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 10\" 150 Class","product_type":"gate_valve","specifications":{"size":"10\"","size_mm":"DN10","pressure_class":["Class 150 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-12-199',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-12-199","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 12\" 150 Class","product_type":"gate_valve","specifications":{"size":"12\"","size_mm":"DN12","pressure_class":["Class 150 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-2-200',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-2-200","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 2\" 300 Class","product_type":"gate_valve","specifications":{"size":"2\"","size_mm":"DN2","pressure_class":["Class 300 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-3-201',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-3-201","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 3\" 300 Class","product_type":"gate_valve","specifications":{"size":"3\"","size_mm":"DN3","pressure_class":["Class 300 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-4-202',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-4-202","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 4\" 300 Class","product_type":"gate_valve","specifications":{"size":"4\"","size_mm":"DN4","pressure_class":["Class 300 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-6-203',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-6-203","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 6\" 300 Class","product_type":"gate_valve","specifications":{"size":"6\"","size_mm":"DN6","pressure_class":["Class 300 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-8-204',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-8-204","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 8\" 300 Class","product_type":"gate_valve","specifications":{"size":"8\"","size_mm":"DN8","pressure_class":["Class 300 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-10-205',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-10-205","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 10\" 300 Class","product_type":"gate_valve","specifications":{"size":"10\"","size_mm":"DN10","pressure_class":["Class 300 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-2-206',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-2-206","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 2\" 600 Class","product_type":"gate_valve","specifications":{"size":"2\"","size_mm":"DN2","pressure_class":["Class 600 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-3-207',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-3-207","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 3\" 600 Class","product_type":"gate_valve","specifications":{"size":"3\"","size_mm":"DN3","pressure_class":["Class 600 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-4-208',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-4-208","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 4\" 600 Class","product_type":"gate_valve","specifications":{"size":"4\"","size_mm":"DN4","pressure_class":["Class 600 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-6-209',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-6-209","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 6\" 600 Class","product_type":"gate_valve","specifications":{"size":"6\"","size_mm":"DN6","pressure_class":["Class 600 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-2-210',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-2-210","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 2\" 900 Class","product_type":"gate_valve","specifications":{"size":"2\"","size_mm":"DN2","pressure_class":["Class 900 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-3-211',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-3-211","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 3\" 900 Class","product_type":"gate_valve","specifications":{"size":"3\"","size_mm":"DN3","pressure_class":["Class 900 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Kayts Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-GTV-4-212',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-GTV-4-212","brand_id":"VALVE-BRAND-0006","brand_name":"Kayts Valve","product_name":"Kayts Gate Valve 4\" 900 Class","product_type":"gate_valve","specifications":{"size":"4\"","size_mm":"DN4","pressure_class":["Class 900 Class"],"body_material":"WCB/WP91/CF8M","trim_material":"13Cr/Stainless Steel","bonnet":"bolted/welded","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"API 600 / ASME B16.10","type":"gate_valve","wedge":"solid/divergent","medium":"oil, gas, steam"},"standards":["API 600","API 602","API 598"],"application":"Oil & gas, petrochemical, power generation","datasheet_url":"https://www.kaytsvalve.com/Uploads/file/20230908/20230908164058_44075.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-12-213',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-12-213","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 1/2\" 150 PSI","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-34-214',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-34-214","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 3/4\" 150 PSI","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-1-215',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-1-215","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 1\" 150 PSI","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-15-216',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-15-216","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 1.5\" 150 PSI","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-2-217',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-2-217","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 2\" 150 PSI","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-3-218',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-3-218","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 3\" 150 PSI","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-4-219',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-4-219","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 4\" 150 PSI","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-6-220',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-6-220","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 6\" 150 PSI","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-1-221',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-1-221","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 1\" 300 PSI","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-2-222',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-2-222","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 2\" 300 PSI","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-3-223',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-3-223","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 3\" 300 PSI","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-4-224',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-4-224","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 4\" 300 PSI","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-6-225',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-6-225","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 6\" 300 PSI","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-1-226',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-1-226","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 1\" 600 PSI","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-2-227',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-2-227","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 2\" 600 PSI","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-3-228',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-3-228","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 3\" 600 PSI","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'CNC Flow Control';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CNC-BVL-4-229',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CNC-BVL-4-229","brand_id":"VALVE-BRAND-0007","brand_name":"CNC Flow Control","product_name":"CNC Atlas Ball Valve 4\" 600 PSI","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel WCB/Stainless Steel 316SS","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded","flange_standard":["ASME B16.5"],"type":"two_piece_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water treatment","datasheet_url":"https://www.cncflowcontrol.com/products/literature/literaturePDF/EDC-506-CC-IOM-2-Piece-Cast-Trunnion-Mounted-Ball-Valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-40-230',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-40-230","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN40 Class 125","product_type":"butterfly_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-50-231',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-50-231","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN50 Class 125","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-65-232',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-65-232","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN65 Class 125","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-80-233',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-80-233","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN80 Class 125","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-100-234',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-100-234","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN100 Class 125","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-150-235',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-150-235","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN150 Class 125","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-200-236',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-200-236","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN200 Class 125","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-250-237',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-250-237","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN250 Class 125","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Honeywell';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-HW-BFV-300-238',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-HW-BFV-300-238","brand_id":"VALVE-BRAND-0008","brand_name":"Honeywell","product_name":"Honeywell V9BF Butterfly Valve DN300 Class 125","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["Class 125"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"Cast Iron/Stainless Steel","shaft_material":"SS","seat_material":"PTFE","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.42"],"face_to_face":"ASME B16.10","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["ASME B16.10","API 598"],"application":"HVAC, water treatment, industrial","datasheet_url":"https://www.honeywell.com.cn/content/dam/honcn/documents/2025e2r/rotary-valve---actuator/butterfly-valve/datasheet/EN%20Product%20Data%20V9BF%20and%20NOM..H.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-50-239',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-50-239","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN50 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-65-240',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-65-240","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN65 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-80-241',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-80-241","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN80 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-100-242',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-100-242","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN100 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-125-243',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-125-243","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN125 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-150-244',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-150-244","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN150 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-200-245',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-200-245","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN200 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-250-246',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-250-246","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN250 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-300-247',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-300-247","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN300 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-350-248',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-350-248","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN350 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-400-249',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-400-249","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN400 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-450-250',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-450-250","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN450 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-500-251',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-500-251","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN500 PN10","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN10"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Neway Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-NY-BFV-600-252',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-NY-BFV-600-252","brand_id":"VALVE-BRAND-0009","brand_name":"Neway Valve","product_name":"Neway Butterfly Valve DN600 PN10","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN10"],"body_material":"Cast Iron/Carbon Steel/Stainless Steel","disc_material":"SS304/SS316","seat_material":"PTFE/NBR","end_connection":"wafer/flanged","flange_standard":["ASME B16.1","EN 1092-1"],"face_to_face":"ISO 5752","type":"soft_seal_concentric","medium":"water, air, gas"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water treatment, HVAC, industrial","datasheet_url":"https://www.docin.com/p-848102608.html","data_source_type":"doc_share","data_confidence":"low"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-15-302',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-15-302","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN15 Class 150","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-15-303',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-15-303","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN15 Class 300","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-15-304',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-15-304","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN15 Class 600","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 600"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-15-305',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-15-305","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN15 Class 900","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 900"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-20-306',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-20-306","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN20 Class 150","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-20-307',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-20-307","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN20 Class 300","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-20-308',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-20-308","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN20 Class 600","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 600"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-20-309',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-20-309","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN20 Class 900","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 900"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-25-310',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-25-310","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN25 Class 150","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-25-311',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-25-311","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN25 Class 300","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-25-312',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-25-312","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN25 Class 600","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 600"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-25-313',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-25-313","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN25 Class 900","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 900"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-40-314',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-40-314","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN40 Class 150","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-40-315',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-40-315","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN40 Class 300","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-40-316',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-40-316","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN40 Class 600","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 600"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-40-317',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-40-317","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN40 Class 900","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 900"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-50-318',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-50-318","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN50 Class 150","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-50-319',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-50-319","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN50 Class 300","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-50-320',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-50-320","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN50 Class 600","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 600"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-50-321',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-50-321","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN50 Class 900","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 900"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-80-322',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-80-322","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN80 Class 150","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-80-323',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-80-323","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN80 Class 300","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-80-324',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-80-324","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN80 Class 600","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 600"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-80-325',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-80-325","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN80 Class 900","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 900"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-100-326',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-100-326","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN100 Class 150","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-100-327',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-100-327","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN100 Class 300","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-100-328',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-100-328","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN100 Class 600","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 600"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-100-329',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-100-329","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN100 Class 900","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 900"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-150-330',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-150-330","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN150 Class 150","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-150-331',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-150-331","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN150 Class 300","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-200-332',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-200-332","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN200 Class 150","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 150"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Shield Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SH-BVL-200-333',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SH-BVL-200-333","brand_id":"VALVE-BRAND-0011","brand_name":"Shield Valve","product_name":"Shield Valve 2PC Ball Valve DN200 Class 300","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 300"],"body_material":"Carbon Steel/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE","end_connection":"threaded/flanged","type":"two_piece_floating","medium":"oil, gas, water"},"standards":["API 607","API 598","ISO 17292"],"application":"Oil & gas, industrial, water","datasheet_url":"http://www.shieldvalves.com/knowledge/122.html","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-15-334',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-15-334","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN15 Class 150","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-15-335',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-15-335","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN15 Class 300","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-15-336',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-15-336","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN15 Class 600","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 600"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-20-337',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-20-337","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN20 Class 150","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-20-338',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-20-338","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN20 Class 300","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-20-339',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-20-339","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN20 Class 600","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 600"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-25-340',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-25-340","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN25 Class 150","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-25-341',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-25-341","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN25 Class 300","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-25-342',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-25-342","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN25 Class 600","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["Class 600"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-40-343',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-40-343","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN40 Class 150","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-40-344',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-40-344","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN40 Class 300","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-40-345',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-40-345","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN40 Class 600","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["Class 600"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-50-346',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-50-346","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN50 Class 150","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-50-347',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-50-347","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN50 Class 300","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-50-348',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-50-348","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN50 Class 600","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["Class 600"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-80-349',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-80-349","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN80 Class 150","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-80-350',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-80-350","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN80 Class 300","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-80-351',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-80-351","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN80 Class 600","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 600"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-100-352',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-100-352","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN100 Class 150","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-100-353',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-100-353","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN100 Class 300","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-100-354',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-100-354","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN100 Class 600","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["Class 600"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-150-355',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-150-355","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN150 Class 150","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-150-356',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-150-356","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN150 Class 300","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-200-357',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-200-357","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN200 Class 150","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 150"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Sky Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SK-BVL-200-358',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SK-BVL-200-358","brand_id":"VALVE-BRAND-0012","brand_name":"Sky Valve","product_name":"Sky Valve API608 Ball Valve DN200 Class 300","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 300"],"body_material":"A105/F316/F55","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE","end_connection":"flanged/threaded/weld","type":"three_piece_floating","medium":"oil, gas, water, chemical"},"standards":["API 608","API 6D","API 598","CE"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.skyvalves.com/product/api-608-asme-b16-34-ce-certified-dn15-dn200-pn10-pn40-class-150-300-a105-forged-steel-3pc-floating-ball-valve/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Conbraco';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CB-GTV-40-359',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CB-GTV-40-359","brand_id":"VALVE-BRAND-0013","brand_name":"Conbraco","product_name":"Conbraco Gate Valve DN40 PN10/16/25","product_type":"gate_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","trim_material":"Bronze/Stainless Steel","end_connection":"flanged/threaded","type":"gate_valve","medium":"water, oil"},"standards":["API 598","ISO 17292"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.conbraco.com/products","data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Conbraco';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CB-GTV-50-360',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CB-GTV-50-360","brand_id":"VALVE-BRAND-0013","brand_name":"Conbraco","product_name":"Conbraco Gate Valve DN50 PN10/16/25","product_type":"gate_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","trim_material":"Bronze/Stainless Steel","end_connection":"flanged/threaded","type":"gate_valve","medium":"water, oil"},"standards":["API 598","ISO 17292"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.conbraco.com/products","data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Conbraco';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CB-GTV-65-361',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CB-GTV-65-361","brand_id":"VALVE-BRAND-0013","brand_name":"Conbraco","product_name":"Conbraco Gate Valve DN65 PN10/16/25","product_type":"gate_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","trim_material":"Bronze/Stainless Steel","end_connection":"flanged/threaded","type":"gate_valve","medium":"water, oil"},"standards":["API 598","ISO 17292"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.conbraco.com/products","data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Conbraco';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CB-GTV-80-362',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CB-GTV-80-362","brand_id":"VALVE-BRAND-0013","brand_name":"Conbraco","product_name":"Conbraco Gate Valve DN80 PN10/16/25","product_type":"gate_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","trim_material":"Bronze/Stainless Steel","end_connection":"flanged/threaded","type":"gate_valve","medium":"water, oil"},"standards":["API 598","ISO 17292"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.conbraco.com/products","data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Conbraco';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CB-GTV-100-363',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CB-GTV-100-363","brand_id":"VALVE-BRAND-0013","brand_name":"Conbraco","product_name":"Conbraco Gate Valve DN100 PN10/16/25","product_type":"gate_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","trim_material":"Bronze/Stainless Steel","end_connection":"flanged/threaded","type":"gate_valve","medium":"water, oil"},"standards":["API 598","ISO 17292"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.conbraco.com/products","data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Conbraco';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CB-GTV-150-364',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CB-GTV-150-364","brand_id":"VALVE-BRAND-0013","brand_name":"Conbraco","product_name":"Conbraco Gate Valve DN150 PN10/16/25","product_type":"gate_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","trim_material":"Bronze/Stainless Steel","end_connection":"flanged/threaded","type":"gate_valve","medium":"water, oil"},"standards":["API 598","ISO 17292"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.conbraco.com/products","data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Conbraco';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CB-GTV-200-365',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CB-GTV-200-365","brand_id":"VALVE-BRAND-0013","brand_name":"Conbraco","product_name":"Conbraco Gate Valve DN200 PN10/16/25","product_type":"gate_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","trim_material":"Bronze/Stainless Steel","end_connection":"flanged/threaded","type":"gate_valve","medium":"water, oil"},"standards":["API 598","ISO 17292"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.conbraco.com/products","data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Conbraco';
  SELECT id INTO type_id FROM valve_types WHERE name = 'gate_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-CB-GTV-250-366',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-CB-GTV-250-366","brand_id":"VALVE-BRAND-0013","brand_name":"Conbraco","product_name":"Conbraco Gate Valve DN250 PN10","product_type":"gate_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN10"],"body_material":"Cast Iron/Carbon Steel","trim_material":"Bronze/Stainless Steel","end_connection":"flanged/threaded","type":"gate_valve","medium":"water, oil"},"standards":["API 598","ISO 17292"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.conbraco.com/products","data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-50-367',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-50-367","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN50 PN10/16/25/40","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN10/16/25/40"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-65-368',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-65-368","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN65 PN10/16/25/40","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN10/16/25/40"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-80-369',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-80-369","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN80 PN10/16/25/40","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN10/16/25/40"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-100-370',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-100-370","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN100 PN10/16/25/40","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN10/16/25/40"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-125-371',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-125-371","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN125 PN10/16/25/40","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN10/16/25/40"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-150-372',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-150-372","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN150 PN10/16/25/40","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN10/16/25/40"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-200-373',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-200-373","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN200 PN10/16/25/40","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN10/16/25/40"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-250-374',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-250-374","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN250 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-300-375',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-300-375","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN300 PN10/16","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN10/16"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Invaco Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-IV-BFV-350-376',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-IV-BFV-350-376","brand_id":"VALVE-BRAND-0014","brand_name":"Invaco Valve","product_name":"Invaco Butterfly Valve DN350 PN10/16/25","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN10/16/25"],"body_material":"Cast Iron/Carbon Steel","disc_material":"SS304/SS316","seat_material":"EPDM/PTFE","end_connection":"wafer/flanged","type":"concentric_butterfly","medium":"water, air, HVAC"},"standards":["API 609","ISO 17292","EN 558"],"application":"Water, HVAC, industrial","datasheet_url":"https://www.invacovalves.com/technical-data-2/","data_source_type":"product_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1000',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1000","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.40 PN6","product_type":"butterfly_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN6"],"kvs":"50 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1001',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1001","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.50 PN6","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN6"],"kvs":"85 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1002',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1002","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.65 PN6","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN6"],"kvs":"215 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1003',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1003","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.80 PN6","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN6"],"kvs":"420 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1004',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1004","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.100 PN6","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN6"],"kvs":"800 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1005',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1005","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.125 PN6","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN6"],"kvs":"1010 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1006',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1006","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.150 PN6","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN6"],"kvs":"2100 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1007',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1007","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.200 PN6","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN6"],"kvs":"4000 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1008',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1008","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.40 PN10","product_type":"butterfly_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN10"],"kvs":"50 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1009',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1009","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.50 PN10","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN10"],"kvs":"85 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1010',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1010","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.65 PN10","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN10"],"kvs":"215 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1011',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1011","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.80 PN10","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN10"],"kvs":"420 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1012',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1012","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.100 PN10","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN10"],"kvs":"800 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1013',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1013","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.125 PN10","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN10"],"kvs":"1010 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1014',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1014","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.150 PN10","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN10"],"kvs":"2100 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1015',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1015","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.200 PN10","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN10"],"kvs":"4000 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1016',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1016","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.40 PN16","product_type":"butterfly_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN16"],"kvs":"50 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1017',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1017","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.50 PN16","product_type":"butterfly_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN16"],"kvs":"85 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1018',
      '2.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1018","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.65 PN16","product_type":"butterfly_valve","specifications":{"size":"2.5\"","size_mm":"DN65","pressure_class":["PN16"],"kvs":"215 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1019',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1019","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.80 PN16","product_type":"butterfly_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN16"],"kvs":"420 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1020',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1020","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.100 PN16","product_type":"butterfly_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN16"],"kvs":"800 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1021',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1021","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.125 PN16","product_type":"butterfly_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["PN16"],"kvs":"1010 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1022',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1022","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.150 PN16","product_type":"butterfly_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN16"],"kvs":"2100 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1023',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1023","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.200 PN16","product_type":"butterfly_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN16"],"kvs":"4000 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1024',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1024","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.250 PN6","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN6"],"kvs":"6400 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1025',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1025","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.300 PN6","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN6"],"kvs":"8500 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1026',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1026","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.250 PN10","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN10"],"kvs":"6400 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1027',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1027","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.300 PN10","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN10"],"kvs":"8500 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1028',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1028","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.250 PN16","product_type":"butterfly_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN16"],"kvs":"6400 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1029',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1029","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.300 PN16","product_type":"butterfly_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN16"],"kvs":"8500 m³/h","body_material":"EN-GJL-250","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1030',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1030","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.350 PN6","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN6"],"kvs":"11500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1031',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1031","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.400 PN6","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN6"],"kvs":"14500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1032',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1032","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.350 PN10","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN10"],"kvs":"11500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1033',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1033","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.400 PN10","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN10"],"kvs":"14500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1034',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1034","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.350 PN16","product_type":"butterfly_valve","specifications":{"size":"14\"","size_mm":"DN350","pressure_class":["PN16"],"kvs":"11500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1035',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1035","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.400 PN16","product_type":"butterfly_valve","specifications":{"size":"16\"","size_mm":"DN400","pressure_class":["PN16"],"kvs":"14500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1036',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1036","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.450 PN6","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN6"],"kvs":"20500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1037',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1037","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.500 PN6","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN6"],"kvs":"21000 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1038',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1038","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.600 PN6","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN6"],"kvs":"29300 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1039',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1039","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.450 PN10","product_type":"butterfly_valve","specifications":{"size":"18\"","size_mm":"DN450","pressure_class":["PN10"],"kvs":"20500 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1040',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1040","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.500 PN10","product_type":"butterfly_valve","specifications":{"size":"20\"","size_mm":"DN500","pressure_class":["PN10"],"kvs":"21000 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Siemens';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-SI-1041',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-SI-1041","brand_id":"VALVE-BRAND-0004","brand_name":"Siemens","product_name":"Siemens Butterfly Valve VKF46.600 PN10","product_type":"butterfly_valve","specifications":{"size":"24\"","size_mm":"DN600","pressure_class":["PN10"],"kvs":"29300 m³/h","body_material":"EN-GJS-400-15","liner_material":"EPDM","end_connection":"flanged","flange_standard":["ISO 7005","EN 1092-1"],"seal_material":"PTFE/EPDM","operating_temp":"-20°C to +120°C","medium":"water, air, HVAC"},"standards":["EN 12266-1","EN 558"],"application":"HVAC, heating, ventilation, air conditioning","datasheet_url":"https://mall.industry.siemens.com/mall/collaterals/files/198/pdf/RUS_911109.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1042',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1042","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1/2\" 300 PSI","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1043',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1043","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3/4\" 300 PSI","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 300 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1044',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1044","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1/2\" 600 PSI","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1045',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1045","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3/4\" 600 PSI","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1046',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1046","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 8\" 900 PSI","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 900 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1047',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1047","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 10\" 600 PSI","product_type":"ball_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1048',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1048","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 12\" 600 PSI","product_type":"ball_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["Class 600 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1049',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1049","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1/2\" 900 PSI","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 900 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1050',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1050","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3/4\" 900 PSI","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 900 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1051',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1051","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 8\" 150 PSI","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1052',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1052","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 10\" 150 PSI","product_type":"ball_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1053',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1053","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 12\" 150 PSI","product_type":"ball_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1054',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1054","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 1/2\" 150 PSI","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Edmund Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-EM-1055',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-EM-1055","brand_id":"VALVE-BRAND-0005","brand_name":"Edmund Valve","product_name":"Edmund Ball Valve 3/4\" 150 PSI","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["Class 150 PSI"],"body_material":"Carbon Steel/WCB/Stainless Steel","ball_material":"SS316/SS304","seat_material":"PTFE/RPTFE/PEEK","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.10"],"type":"trunnion_mounted","fire_safe":"API 607","medium":"oil, gas, chemical"},"standards":["API 6D","API 607","API 598"],"application":"Oil & gas, petrochemical, industrial","datasheet_url":"https://www.edmundvalve.com/wp-content/uploads/2018/10/BallValvesCatalogue-EVC.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1056',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1056","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 3\" 150 PSI","product_type":"check_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1057',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1057","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 5\" 150 PSI","product_type":"check_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1058',
      '7"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1058","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 7\" 150 PSI","product_type":"check_valve","specifications":{"size":"7\"","size_mm":"DN175","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1059',
      '9"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1059","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 9\" 150 PSI","product_type":"check_valve","specifications":{"size":"9\"","size_mm":"DN225","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1060',
      '11"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1060","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 11\" 150 PSI","product_type":"check_valve","specifications":{"size":"11\"","size_mm":"DN275","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1061',
      '13"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1061","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 13\" 150 PSI","product_type":"check_valve","specifications":{"size":"13\"","size_mm":"DN325","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1062',
      '15"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1062","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 15\" 150 PSI","product_type":"check_valve","specifications":{"size":"15\"","size_mm":"DN375","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1063',
      '17"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1063","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 17\" 150 PSI","product_type":"check_valve","specifications":{"size":"17\"","size_mm":"DN425","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1064',
      '19"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1064","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 19\" 150 PSI","product_type":"check_valve","specifications":{"size":"19\"","size_mm":"DN475","pressure_class":["Class 150 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1065',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1065","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 3\" 300 PSI","product_type":"check_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1066',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1066","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 5\" 300 PSI","product_type":"check_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1067',
      '7"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1067","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 7\" 300 PSI","product_type":"check_valve","specifications":{"size":"7\"","size_mm":"DN175","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1068',
      '9"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1068","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 9\" 300 PSI","product_type":"check_valve","specifications":{"size":"9\"","size_mm":"DN225","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1069',
      '11"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1069","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 11\" 300 PSI","product_type":"check_valve","specifications":{"size":"11\"","size_mm":"DN275","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1070',
      '13"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1070","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 13\" 300 PSI","product_type":"check_valve","specifications":{"size":"13\"","size_mm":"DN325","pressure_class":["Class 300 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1071',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1071","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 3\" 600 PSI","product_type":"check_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1072',
      '5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1072","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 5\" 600 PSI","product_type":"check_valve","specifications":{"size":"5\"","size_mm":"DN125","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1073',
      '7"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1073","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 7\" 600 PSI","product_type":"check_valve","specifications":{"size":"7\"","size_mm":"DN175","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1074',
      '9"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1074","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 9\" 600 PSI","product_type":"check_valve","specifications":{"size":"9\"","size_mm":"DN225","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Velan';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-VL-1075',
      '11"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-VL-1075","brand_id":"VALVE-BRAND-0002","brand_name":"Velan","product_name":"Velan NSC Cast Steel Check Valve 11\" 600 PSI","product_type":"check_valve","specifications":{"size":"11\"","size_mm":"DN275","pressure_class":["Class 600 PSI"],"body_material":"Cast Steel WCB/A216 WCB","trim_material":"Stainless Steel 13Cr/410SS","end_connection":"flanged","flange_standard":["ASME B16.5"],"face_to_face":"ASME B16.10","type":"nsl_check","medium":"oil, gas, steam, water"},"standards":["API 598","API 600","API 602"],"application":"Power, oil & gas, petrochemical, marine","datasheet_url":"https://www.abvvalves.com/sites/default/files/2020-09/DS-NSC_06-20.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1121',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1121","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN25 PN10","product_type":"butterfly_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1122',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1122","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN25 PN16","product_type":"butterfly_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1123',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1123","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN25 PN25","product_type":"butterfly_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1124',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1124","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN25 PN40","product_type":"butterfly_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1125',
      '28"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1125","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN700 PN10","product_type":"butterfly_valve","specifications":{"size":"28\"","size_mm":"DN700","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1126',
      '28"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1126","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN700 PN16","product_type":"butterfly_valve","specifications":{"size":"28\"","size_mm":"DN700","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1127',
      '28"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1127","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN700 PN25","product_type":"butterfly_valve","specifications":{"size":"28\"","size_mm":"DN700","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1128',
      '28"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1128","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN700 PN40","product_type":"butterfly_valve","specifications":{"size":"28\"","size_mm":"DN700","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1129',
      '30"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1129","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN750 PN10","product_type":"butterfly_valve","specifications":{"size":"30\"","size_mm":"DN750","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1130',
      '30"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1130","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN750 PN16","product_type":"butterfly_valve","specifications":{"size":"30\"","size_mm":"DN750","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1131',
      '30"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1131","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN750 PN25","product_type":"butterfly_valve","specifications":{"size":"30\"","size_mm":"DN750","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1132',
      '30"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1132","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN750 PN40","product_type":"butterfly_valve","specifications":{"size":"30\"","size_mm":"DN750","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1133',
      '32"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1133","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN800 PN10","product_type":"butterfly_valve","specifications":{"size":"32\"","size_mm":"DN800","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1134',
      '32"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1134","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN800 PN16","product_type":"butterfly_valve","specifications":{"size":"32\"","size_mm":"DN800","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1135',
      '36"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1135","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN900 PN10","product_type":"butterfly_valve","specifications":{"size":"36\"","size_mm":"DN900","pressure_class":["PN10"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'JG Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'butterfly_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-JG-1136',
      '36"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-JG-1136","brand_id":"VALVE-BRAND-0003","brand_name":"JG Valve","product_name":"JG Valve Quadruple Offset Butterfly Valve DN900 PN16","product_type":"butterfly_valve","specifications":{"size":"36\"","size_mm":"DN900","pressure_class":["PN16"],"body_material":"WCB/CF8M/CF3M/Duplex","disc_material":"SS316/SS304/Duplex","shaft_material":"AISI 316SS","seat_material":"Stainless Steel (metal seated)","end_connection":"flanged","flange_standard":["ASME B16.1","ASME B16.47","EN 1092-1"],"face_to_face":"ISO 5752 / EN 558","type":"quadruple_offset","medium":"steam, gas, oil, aggressive media"},"standards":["API 609","ISO 17292","API 598"],"application":"Chemical, petrochemical, power plant, marine","datasheet_url":"https://www.zzjgvalve.com/skin/pdf/metal-seal-quadruple-offset-butterfly-valve.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1137',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1137","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 14\" 150 Class","product_type":"check_valve","specifications":{"size":"14\"","size_mm":"DN14","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1138',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1138","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 16\" 150 Class","product_type":"check_valve","specifications":{"size":"16\"","size_mm":"DN16","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1139',
      '18"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1139","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 18\" 150 Class","product_type":"check_valve","specifications":{"size":"18\"","size_mm":"DN18","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1140',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1140","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 20\" 150 Class","product_type":"check_valve","specifications":{"size":"20\"","size_mm":"DN20","pressure_class":["150 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1141',
      '20"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1141","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 20\" 300 Class","product_type":"check_valve","specifications":{"size":"20\"","size_mm":"DN20","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1142',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1142","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 24\" 300 Class","product_type":"check_valve","specifications":{"size":"24\"","size_mm":"DN24","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1143',
      '24"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1143","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 24\" 600 Class","product_type":"check_valve","specifications":{"size":"24\"","size_mm":"DN24","pressure_class":["600 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1144',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1144","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 14\" 300 Class","product_type":"check_valve","specifications":{"size":"14\"","size_mm":"DN14","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1145',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1145","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 16\" 300 Class","product_type":"check_valve","specifications":{"size":"16\"","size_mm":"DN16","pressure_class":["300 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1146',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1146","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 14\" 600 Class","product_type":"check_valve","specifications":{"size":"14\"","size_mm":"DN14","pressure_class":["600 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1147',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1147","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 16\" 600 Class","product_type":"check_valve","specifications":{"size":"16\"","size_mm":"DN16","pressure_class":["600 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1148',
      '14"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1148","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 14\" 900 Class","product_type":"check_valve","specifications":{"size":"14\"","size_mm":"DN14","pressure_class":["900 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Keystone';
  SELECT id INTO type_id FROM valve_types WHERE name = 'check_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-KY-1149',
      '16"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-KY-1149","brand_id":"VALVE-BRAND-0001","brand_name":"Keystone","product_name":"Keystone API 6D Swing Check Valve 16\" 900 Class","product_type":"check_valve","specifications":{"size":"16\"","size_mm":"DN16","pressure_class":["900 Class"],"body_material":"WCB/CF8M/CF8","trim_material":"Stainless Steel 13Cr/316SS","end_connection":"flanged","flange_standard":["ASME B16.5","ASME B16.47"],"face_to_face":"API 6D / ASME B16.10","type":"swing_check","bore":"full_bore","medium":"oil, gas, natural gas"},"standards":["API 6D","API 598","API 6FA"],"application":"Oil & gas pipelines, surface/subsea manifold production","datasheet_url":"https://www.keystonevalvesupply.com/keystone-valve-supply/technical-data/ks-api-6d-swing-check-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1076',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1076","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN250 PN16","product_type":"ball_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1077',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1077","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN250 25","product_type":"ball_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1078',
      '10"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1078","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN250 40","product_type":"ball_valve","specifications":{"size":"10\"","size_mm":"DN250","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1079',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1079","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN300 PN16","product_type":"ball_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1080',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1080","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN300 25","product_type":"ball_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1081',
      '12"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1081","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN300 40","product_type":"ball_valve","specifications":{"size":"12\"","size_mm":"DN300","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1082',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1082","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 PN63","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1083',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1083","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 100","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1084',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1084","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 160","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1085',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1085","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 250","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PN250"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1086',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1086","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 320","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PN320"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1087',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1087","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 PN63","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1088',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1088","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 100","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1089',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1089","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 160","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1090',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1090","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 250","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PN250"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1091',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1091","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 320","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PN320"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1092',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1092","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 PN63","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1093',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1093","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 100","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1094',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1094","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 160","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1095',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1095","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 250","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN250"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1096',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1096","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 320","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN320"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1097',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1097","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 PN63","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1098',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1098","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 100","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1099',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1099","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 160","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1100',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1100","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 250","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN250"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1101',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1101","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 320","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN320"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1102',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1102","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 PN63","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1103',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1103","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 100","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1104',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1104","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 160","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1105',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1105","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 250","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN250"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1106',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1106","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 320","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN320"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1107',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1107","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 PN63","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1108',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1108","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 100","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1109',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1109","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 160","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1110',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1110","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 250","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN250"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1111',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1111","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 PN63","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1112',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1112","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 100","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1113',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1113","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 160","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1114',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1114","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 250","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN250"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1115',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1115","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 PN63","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1116',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1116","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 100","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1117',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1117","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 160","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1118',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1118","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 PN63","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PNPN63"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1119',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1119","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 100","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-1120',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-1120","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 160","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-100-25-3PC',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-100-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 25","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-100-40-3PC',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-100-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 40","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-100-64-3PC',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-100-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 64","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-15-25-3PC',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-15-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 25","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-15-40-3PC',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-15-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 40","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-15-64-3PC',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-15-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 64","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-150-25-3PC',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-150-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 25","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-150-40-3PC',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-150-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 40","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-150-64-3PC',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-150-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 64","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-20-25-3PC',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-20-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 25","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-20-40-3PC',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-20-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 40","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-20-64-3PC',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-20-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 64","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-200-25-3PC',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-200-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 25","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-200-40-3PC',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-200-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 40","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-200-64-3PC',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-200-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 64","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-25-25-3PC',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-25-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 25","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-25-40-3PC',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-25-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 40","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-25-64-3PC',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-25-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 64","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-40-25-3PC',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-40-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 25","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-40-40-3PC',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-40-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 40","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-40-64-3PC',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-40-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 64","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-50-25-3PC',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-50-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 25","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-50-40-3PC',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-50-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 40","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-50-64-3PC',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-50-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 64","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-80-25-3PC',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-80-25-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 25","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-80-40-3PC',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-80-40-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 40","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BV-80-64-3PC',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BV-80-64-3PC","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 64","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-100-289',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-100-289","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 PN16","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-100-290',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-100-290","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 PN25","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-100-291',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-100-291","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 PN40","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-100-292',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-100-292","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 PN64","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PNPN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-100-293',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-100-293","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 PN100","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PNPN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-100-294',
      '4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-100-294","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN100 PN160","product_type":"ball_valve","specifications":{"size":"4\"","size_mm":"DN100","pressure_class":["PNPN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-15-253',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-15-253","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 PN16","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-15-254',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-15-254","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 PN25","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-15-255',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-15-255","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 PN40","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-15-256',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-15-256","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 PN64","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PNPN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-15-257',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-15-257","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 PN100","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PNPN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-15-258',
      '1/2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-15-258","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN15 PN160","product_type":"ball_valve","specifications":{"size":"1/2\"","size_mm":"DN15","pressure_class":["PNPN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-150-295',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-150-295","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 PN16","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-150-296',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-150-296","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 PN25","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-150-297',
      '6"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-150-297","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN150 PN40","product_type":"ball_valve","specifications":{"size":"6\"","size_mm":"DN150","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-20-259',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-20-259","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 PN16","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-20-260',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-20-260","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 PN25","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-20-261',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-20-261","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 PN40","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-20-262',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-20-262","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 PN64","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PNPN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-20-263',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-20-263","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 PN100","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PNPN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-20-264',
      '3/4"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-20-264","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN20 PN160","product_type":"ball_valve","specifications":{"size":"3/4\"","size_mm":"DN20","pressure_class":["PNPN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-200-298',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-200-298","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 PN16","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-200-299',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-200-299","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 PN25","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-200-300',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-200-300","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 PN40","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-200-301',
      '8"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-200-301","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN200 PN64","product_type":"ball_valve","specifications":{"size":"8\"","size_mm":"DN200","pressure_class":["PNPN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-25-265',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-25-265","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 PN16","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-25-266',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-25-266","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 PN25","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-25-267',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-25-267","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 PN40","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-25-268',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-25-268","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 PN64","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PNPN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-25-269',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-25-269","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 PN100","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PNPN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-25-270',
      '1"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-25-270","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN25 PN160","product_type":"ball_valve","specifications":{"size":"1\"","size_mm":"DN25","pressure_class":["PNPN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-40-271',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-40-271","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 PN16","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-40-272',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-40-272","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 PN25","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-40-273',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-40-273","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 PN40","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-40-274',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-40-274","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 PN64","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PNPN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-40-275',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-40-275","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 PN100","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PNPN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-40-276',
      '1.5"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-40-276","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN40 PN160","product_type":"ball_valve","specifications":{"size":"1.5\"","size_mm":"DN40","pressure_class":["PNPN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-50-277',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-50-277","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 PN16","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-50-278',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-50-278","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 PN25","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-50-279',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-50-279","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 PN40","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-50-280',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-50-280","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 PN64","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PNPN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-50-281',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-50-281","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 PN100","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PNPN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-50-282',
      '2"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-50-282","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN50 PN160","product_type":"ball_valve","specifications":{"size":"2\"","size_mm":"DN50","pressure_class":["PNPN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-80-283',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-80-283","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 PN16","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PNPN16"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-80-284',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-80-284","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 PN25","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PNPN25"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-80-285',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-80-285","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 PN40","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PNPN40"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["batch2_v2","batch2","final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-80-286',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-80-286","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 PN64","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PNPN64"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-80-287',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-80-287","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 PN100","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PNPN100"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = 'Zhong Valve';
  SELECT id INTO type_id FROM valve_types WHERE name = 'ball_valve';
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'VT-ZV-BVL-80-288',
      '3"',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"product_id":"VT-ZV-BVL-80-288","brand_id":"VALVE-BRAND-0010","brand_name":"Zhong Valve","product_name":"Zhong Valve 3PC Ball Valve DN80 PN160","product_type":"ball_valve","specifications":{"size":"3\"","size_mm":"DN80","pressure_class":["PNPN160"],"body_material":"WCB/CF8M/CF3M/F55","ball_material":"SS316/SS304/F55","seat_material":"PTFE/RPTFE/PPL","end_connection":"flanged/threaded/weld","flange_standard":["ASME B16.5","ASME B16.47"],"type":"three_piece_floating_trunnion","fire_safe":"API 607","medium":"oil, gas, water, chemical"},"standards":["API 6D","API 608","API 598","ISO 17292"],"application":"Oil & gas, petrochemical, water, industrial","datasheet_url":"https://zhongvalve.com/download-center","_sources":["final"],"data_source_type":"download_page","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'FV-503',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Cast Iron Ball Valve Screwed Ends","type":"ball_valve","model":"FV-503","pressure_rating":"Class-125","size_range":"N/A","material":"Cast Iron (IS 210 Gr. FG 220); AISI 304; PTFE","connection_type":"Screwed Ends (IS:554)","standards":"IS-9890","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in?p=204/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-288',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Cast Carbon Steel Gate Valve Flanged Ends","type":"gate_valve","model":"AV-288","pressure_rating":"Class-150","size_range":"N/A","material":"ASTM A216 Gr. WCB; 13% Cr. (SS 410)","connection_type":"Flanged Ends (ASME B16.5 Class-150)","standards":"API 600; API-598","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in?p=770/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-301',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Drop Forged Steel Gate Valve Screwed Ends","type":"gate_valve","model":"AV-301","pressure_rating":"Class-800","size_range":"N/A","material":"ASTM A105; 13% Cr. (SS 410)","connection_type":"Screwed Ends NPT (ASME B1.20.1)","standards":"API 602; BS EN-15761; API-598","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in?p=123/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-509',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Cast Stainless Steel Ball Valve Flanged Ends","type":"ball_valve","model":"AV-509","pressure_rating":"Class-150","size_range":"N/A","material":"ASTM A351 Gr. CF8M; AISI 316; PTFE","connection_type":"Flanged Ends (ASME B16.5 Class-150)","standards":"N/A","application":"Water; Steam; Gas; Oil; Air; Nitric Acid; Acetic Acid","datasheet_url":"https://www.atamvalves.in?p=1922/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-14',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Bronze Y-Type Strainer Screwed Ends","type":"strainer","model":"AV-14","pressure_rating":"PN-16; 150 Psig (Steam)","size_range":"N/A","material":"Bronze (BS EN 1982 Gr. CC491K); SS 304 Screen","connection_type":"Screwed Female BSP Parallel Threads (BS-21)","standards":"BS-21; BS EN 1982","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in/product/av-14-bronze-y-type-strainer-screwed-ends/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-75',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Bronze Gate Valve Screwed Ends","type":"gate_valve","model":"AV-75","pressure_rating":"300 Psig (Hyd.); 200 Psig (Hyd.) Seat","size_range":"N/A","material":"Bronze (BS EN 1982 Gr. CC491K); Cu-Alloy Trim","connection_type":"Screwed Female BSP Parallel Threads (BS-21)","standards":"BS EN 12266-Part 1; BS-21","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in/product/av-75-bronze-gate-valve-screwed-ends/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-1',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Bronze Union Bonnet Globe Valve No.9 Screwed Ends","type":"globe_valve","model":"AV-1","pressure_rating":"PN-20 / Class-150","size_range":"N/A","material":"Bronze (BS EN 1982 Gr. CC491K); 13% Cr. (SS 410) Trim","connection_type":"Screwed Female BSP Parallel Threads (BS-21)","standards":"BS-5154; BS EN 12266-Part 1","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in/product/av-1-bronze-union-bonnet-globe-valve-no-9-screwed-ends-pn-20-class-150/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-7',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Bronze Horizontal Lift Check Valve No.4 Screwed Ends","type":"check_valve","model":"AV-7","pressure_rating":"PN-16","size_range":"N/A","material":"Bronze (BS EN 1982 Gr. CC491K); Cu-Alloy Trim; Teflon/Rubber Disc","connection_type":"Screwed Female BSP Parallel Threads (BS-21)","standards":"BS EN 12266-Part 1","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in/product/av-7-bronze-horizontal-lift-check-valve-no-4-screwed-ends-pn-16/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'FV-501',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Bronze Ball Valve Screwed Ends","type":"ball_valve","model":"FV-501","pressure_rating":"PN-20","size_range":"N/A","material":"Bronze (BS EN 1982 Gr. CC491K); SS 304 Ball & Stem; PTFE Seats","connection_type":"Screwed Female BSP Parallel Threads (BS-21)","standards":"BS-21","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in/product/fv-501-bronze-ball-valve-screwed-ends-pn-20/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-73',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Bronze Gate Valve Flanged Ends","type":"gate_valve","model":"AV-73","pressure_rating":"N/A","size_range":"N/A","material":"Bronze (BS EN 1982 Gr. CC491K)","connection_type":"Flanged Ends","standards":"BS-5154","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-76',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Bronze Swing Check Valve Screwed Ends","type":"check_valve","model":"AV-76","pressure_rating":"PN-16","size_range":"N/A","material":"Bronze (BS EN 1982 Gr. CC491K)","connection_type":"Screwed Ends","standards":"BS EN 12266-Part 1","application":"Water; Steam; Gas; Oil; Air","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-118',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Cast Iron Gate Valve Flanged Ends","type":"gate_valve","model":"AV-118","pressure_rating":"PN-1.0","size_range":"N/A","material":"Cast Iron","connection_type":"Flanged Ends","standards":"N/A","application":"Water; Steam; Gas","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-118A',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Cast Iron Gate Valve Flanged Ends PN-1.6","type":"gate_valve","model":"AV-118A","pressure_rating":"PN-1.6","size_range":"N/A","material":"Cast Iron","connection_type":"Flanged Ends","standards":"N/A","application":"Water; Steam; Gas","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-133',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Cast Iron Y-Type Strainer Flanged Ends","type":"strainer","model":"AV-133","pressure_rating":"PN-16","size_range":"N/A","material":"Cast Iron","connection_type":"Flanged Ends","standards":"N/A","application":"Water; Steam","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'FV-507',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Investment Casting Stainless Steel CF8 Ball Valve Screwed Ends","type":"ball_valve","model":"FV-507","pressure_rating":"N/A","size_range":"N/A","material":"Investment Casting Stainless Steel (CF8)","connection_type":"Screwed Ends","standards":"N/A","application":"Water; Steam; Gas; Oil","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'FV-508',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Investment Casting Stainless Steel CF8M Ball Valve Screwed Ends","type":"ball_valve","model":"FV-508","pressure_rating":"N/A","size_range":"N/A","material":"Investment Casting Stainless Steel (CF8M)","connection_type":"Screwed Ends","standards":"N/A","application":"Water; Steam; Gas; Oil","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'FV-513',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Investment Casting Stainless Steel CF8 Ball Valve Screwed Ends Class-800","type":"ball_valve","model":"FV-513","pressure_rating":"Class-800","size_range":"N/A","material":"Investment Casting Stainless Steel (CF8)","connection_type":"Screwed Ends","standards":"N/A","application":"Water; Steam; Gas; Oil","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'FV-515',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Investment Casting Carbon Steel WCB Ball Valve Screwed Ends Class-800","type":"ball_valve","model":"FV-515","pressure_rating":"Class-800","size_range":"N/A","material":"Investment Casting Carbon Steel (WCB)","connection_type":"Screwed Ends","standards":"N/A","application":"Water; Steam; Gas; Oil","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-290B',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Cast Carbon Steel Swing Check Valve Flanged Ends Class-600","type":"check_valve","model":"AV-290B","pressure_rating":"Class-600","size_range":"N/A","material":"Cast Carbon Steel","connection_type":"Flanged Ends","standards":"N/A","application":"Water; Steam; Gas; Oil","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'AV-300',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Atam","name":"Drop Forged Stainless Steel Thermodynamic Steam Trap Screwed Ends","type":"steam_trap","model":"AV-300","pressure_rating":"N/A","size_range":"N/A","material":"Drop Forged Stainless Steel","connection_type":"Screwed Ends","standards":"N/A","application":"Steam","datasheet_url":"https://www.atamvalves.in","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      '2PC-SS',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"XHVAL","name":"2 pc Cast Steel Floating Ball Valve","type":"ball_valve","model":"2PC-SS","pressure_rating":"150LB-600LB","size_range":"1\"-10\" (DN25-DN250)","material":"WCB; A105; LF2; F316; WC6; WC9; WCC; CF8; CF3; CF3M; CF8M","connection_type":"SW; NPT; BW; RF; RTJ","standards":"API 6D; API 608; ASME B16.34; ISO 17292; BS5351","application":"Oil; Gas; Industrial","datasheet_url":"https://www.xhval.com/portfolio/2-pc-cast-steel-floating-ball-valve","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'FG-GATE',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"XHVAL","name":"Forged Steel Gate Valve","type":"gate_valve","model":"FG-GATE","pressure_rating":"150LB-2500LB; PN16-PN420","size_range":"1/4\"-2\" (DN10-DN50)","material":"A105; LF2; F304; F304L; F316; F316L; F51; F55; F1; F5; F5A; F9; F11; F22","connection_type":"SW; NPT; BW; RF; RTJ","standards":"API602; ASME B16.34; BS 5352; BS 6364","application":"Steam; Water; Compressors; Heat Exchangers","datasheet_url":"https://www.xhval.com/portfolio/forged-steel-gate-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'TH-GATE',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"XHVAL","name":"Threaded Gate Valve NPT","type":"gate_valve","model":"TH-GATE","pressure_rating":"150LB-2500LB; PN16-PN420","size_range":"1/4\"-2\" (DN10-DN50)","material":"A105; LF2; F304; F304L; F316; F316L; F51; F55; F1; F5; F5A; F9; F11; F22","connection_type":"SW; NPT; BW; RF; RTJ","standards":"API602; ASME B16.34; BS 5352; BS 6364","application":"Water; Low Pressure Piping","datasheet_url":"https://www.xhval.com/portfolio/threaded-gate-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'SS-CHECK',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"XHVAL","name":"Stainless Steel Check Valve","type":"check_valve","model":"SS-CHECK","pressure_rating":"150LB-2500LB; PN16-PN420; JIS10-20K","size_range":"2\"-60\" (DN50-DN1200)","material":"A105; LF2; F316; F11; F304; F51; F55","connection_type":"SW; NPT; BW; RF; RTJ","standards":"API 6D; API 608; ASME B16.34; ISO 17292; BS5351; API 598; API 6FA","application":"Oil; Gas; Water; Chemical; Food; Beverage","datasheet_url":"https://www.xhval.com/portfolio/stainless-steel-check-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'SS-BALL',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"XHVAL","name":"Stainless Steel Ball Valve","type":"ball_valve","model":"SS-BALL","pressure_rating":"1000 PSI","size_range":"1\"-6\" (DN25-DN150)","material":"SS304; SS316","connection_type":"Full Port; 3 Way; 4 Way","standards":"API 600; API 6D; ASME B16.10; ASME B16.5; ASME B16.47; API607; ISO9001; ISO14001","application":"Oil; Gas; Pulp; Paper; Pharmaceuticals; Water; Manufacturing","datasheet_url":"https://www.xhval.com/portfolio/stainless-steel-ball-valve","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'CAST-TRUNNION',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"XHVAL","name":"Cast Steel Trunnion Ball Valve","type":"ball_valve","model":"CAST-TRUNNION","pressure_rating":"150LB-2500LB; PN16-PN420","size_range":"2\"-60\" (DN50-DN1200)","material":"A105; LF2; F304; F316; F51; F55","connection_type":"SW; NPT; BW; RF; RTJ","standards":"API 6D; API 608; ASME B16.34; ISO 17292; BS5351; API 598; API 6FA","application":"Oil; Gas; Fluids; Petrochemical; Power","datasheet_url":"https://www.xhval.com?p=1715/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DO-BV',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Kemus","name":"Double Offset Butterfly Valve","type":"butterfly_valve","model":"DO-BV","pressure_rating":"PN10-PN64; CLASS150-600","size_range":"DN50-DN1800 (2\"-72\")","material":"WCB; LCB; WC6; CF8; CF8M; CF3; CF3M; PTFE/RPTFE/NYLON/DEVLON/PEEK","connection_type":"Wafer; Lug; Flanged; Butt Weld Ends","standards":"API 509; DIN 3202; API 598","application":"WOG; HNO3; CH3OOH","datasheet_url":"https://m.kemus-valve.com/butterfly-valve/double-offset-butterfly-valve.html","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'KB-FIXED',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Kemus","name":"Fixed Ball Valve Flanged","type":"ball_valve","model":"KB-FIXED","pressure_rating":"API 2000-10000 psi","size_range":"2 1/16\"-21 1/4\" (DN50-DN550)","material":"WCB (A216-WCB); SS 304; 2Cr13; Nylon; Rubber","connection_type":"Flanges (Ring Gasket)","standards":"API Spec 6D; 6A; ISO17292; ASME B16.34; EN 1092-1","application":"Water; Vapor; Oil; Natural Gas; Liquid Gas; Nitric Acid; Acetic Acid","datasheet_url":"https://m.kemus-valve.com/ball-valve/fixed-ball-valve.html","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'KS-SAN',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Kemus","name":"Sanitary Ball Valve","type":"ball_valve","model":"KS-SAN","pressure_rating":"0-5 bar","size_range":"3/4\"-4\" (DN20-DN100)","material":"304L/316L Forged; FPM/PTFE; HNBR/PTFE; Silicone/PTFE","connection_type":"Welding (DIN 11850); Threaded","standards":"ISO9001; API-6D; CE; TS","application":"Food; Beverage; Dairy; Beer; Bioengineering; Medicine","datasheet_url":"https://m.kemus-valve.com/ball-valve/sanitary-ball-valve.html","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'KITZ-METABALL',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Kitz","name":"Stainless Steel High Alloy Metal Ball Valve","type":"ball_valve","model":"KITZ-METABALL","pressure_rating":"Class 150/300 (B16.34); Class 10K","size_range":"2-piece flange type","material":"Stainless Steel; High Alloy; Nickel-base alloy spraying","connection_type":"Flanged (JIS B2220 10K/20K; ASME B16.5 Class 150/300)","standards":"ASME B16.10; API 609; MSS-SP 67; EN 593; JIS B 2032","application":"Powders; Slurries; Viscous Fluids; High-Temperature Fluids","datasheet_url":"https://www.kitz.com/en/product/stainless-carbon-steel-metaball","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DJ-SERIES',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Kitz","name":"Ductile Cast Iron Butterfly Valve DJ Series","type":"butterfly_valve","model":"DJ-SERIES","pressure_rating":"ASME 150 (1.03 MPa); ASME 200 (1.38 MPa); ASME 250 (1.72 MPa); PN16 (1.6 MPa); PN25 (2.5 MPa)","size_range":"2\"-14\" (NBR); 16\"-24\" (EPDM)","material":"Ductile Iron; NBR (Buna-N) Seat; EPDM Seat","connection_type":"Wafer; Lug","standards":"API 609; MSS-SP 67; EN 593; JIS B 2032; ASME B16.10; ISO 5752","application":"Water; Air; Gas; Oil; Industrial Plants; Water Treatment","datasheet_url":"https://www.kitz.com/en/product/dj","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DB-A/B/C',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Dombor","name":"Ball Valve Product Series","type":"ball_valve","model":"DB-A/B/C","pressure_rating":"Class 150-2500","size_range":"N/A","material":"Carbon Steel; Stainless Steel; Alloy Steel; Special","connection_type":"Flanged; Threaded; Welded","standards":"API 6D; API 600; MSS SP-71","application":"Oil; Gas; Petrochemical; Power","datasheet_url":"https://www.dombor.com/wp-content/uploads/2023/10/Dombor-Ball-Valve-Product-Brochure.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'WSV-GATE',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"WSV","name":"Gate Valve Parallel Slide","type":"gate_valve","model":"WSV-GATE","pressure_rating":"Class 150-2500","size_range":"N/A","material":"WCB; WC6; WC9; CF8; CF8M","connection_type":"Flanged (ASME B16.5)","standards":"API 600; API 602; API 598","application":"Water; Steam; Oil; Gas","datasheet_url":"https://www.wsv-valve.com/wsv-gate-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'WSV-BALL',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"WSV","name":"Ball Valve Floating","type":"ball_valve","model":"WSV-BALL","pressure_rating":"Class 150-600","size_range":"N/A","material":"WCB; CF8; CF8M; SS316","connection_type":"Flanged; Threaded; Welded","standards":"API 6D; API 608; API 598","application":"Water; Oil; Gas; Industrial","datasheet_url":"https://www.wsv-valve.com/wsv-ball-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'WSV-CTRL',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"WSV","name":"Control Valve Globe Type","type":"control_valve","model":"WSV-CTRL","pressure_rating":"Class 150-900","size_range":"N/A","material":"WCB; CF8M; Alloy Steel","connection_type":"Flanged","standards":"ANSI/ISA S75.25.01; IEC 60534","application":"Power; Petrochemical; Water Treatment","datasheet_url":"https://www.wsv-valve.com/wsv-control-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'WSV-PLUG',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"WSV","name":"Plug Valve Eccentric","type":"plug_valve","model":"WSV-PLUG","pressure_rating":"Class 150-600","size_range":"N/A","material":"WCB; CF8; CF8M","connection_type":"Flanged; Wafer; Lug","standards":"API 685; ISO 17292","application":"Slurry; Powder; Gas; Liquid","datasheet_url":"https://www.wsv-valve.com/wsv-plug-valves-catalogue.pdf","data_source_type":"pdf_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-FLOAT',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"Floating Ball Valve","type":"ball_valve","model":"MNC-FLOAT","pressure_rating":"Class 150/300/600","size_range":"DN15-DN600","material":"WCB; CF8 (SS304); CF8M (SS316); Duplex Steel","connection_type":"Flanged; Screwed; Butt Weld","standards":"API 6D; API 608; ASME; ISO 9001:2015","application":"Oil & Gas; Chemical; Water Treatment; Textile; Pharmaceutical","datasheet_url":"https://mncvalves.com/product/ball-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-TRUNNION',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"Trunnion Mounted Ball Valve","type":"ball_valve","model":"MNC-TRUNNION","pressure_rating":"Class 150/300/600","size_range":"DN15-DN600","material":"WCB; CF8 (SS304); CF8M (SS316); Duplex Steel","connection_type":"Flanged; Screwed; Butt Weld","standards":"API 6D; API 608; ASME; ISO 9001:2015","application":"Oil & Gas; Chemical; Water Treatment; Textile; Pharmaceutical","datasheet_url":"https://mncvalves.com/product/ball-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-SINGLE',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"Single Piece Screwed Ball Valve","type":"ball_valve","model":"MNC-SINGLE","pressure_rating":"Class 150/300/600","size_range":"DN15-DN600","material":"WCB; CF8 (SS304); CF8M (SS316); Duplex Steel","connection_type":"Screwed","standards":"API 6D; API 608; ASME; ISO 9001:2015","application":"Oil & Gas; Chemical; Water Treatment; Textile; Pharmaceutical","datasheet_url":"https://mncvalves.com/product/ball-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-2PC',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"2 Piece Flanged End Ball Valve","type":"ball_valve","model":"MNC-2PC","pressure_rating":"Class 150/300/600","size_range":"DN15-DN600","material":"WCB; CF8 (SS304); CF8M (SS316); Duplex Steel","connection_type":"Flanged","standards":"API 6D; API 608; ASME; ISO 9001:2015","application":"Oil & Gas; Chemical; Water Treatment; Textile; Pharmaceutical","datasheet_url":"https://mncvalves.com/product/ball-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-3PC',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"3 Piece Flanged End Ball Valve","type":"ball_valve","model":"MNC-3PC","pressure_rating":"Class 150/300/600","size_range":"DN15-DN600","material":"WCB; CF8 (SS304); CF8M (SS316); Duplex Steel","connection_type":"Flanged","standards":"API 6D; API 608; ASME; ISO 9001:2015","application":"Oil & Gas; Chemical; Water Treatment; Textile; Pharmaceutical","datasheet_url":"https://mncvalves.com/product/ball-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-3PC-SW',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"3 Piece Screwed Ball Valve","type":"ball_valve","model":"MNC-3PC-SW","pressure_rating":"Class 150/300/600","size_range":"DN15-DN600","material":"WCB; CF8 (SS304); CF8M (SS316); Duplex Steel","connection_type":"Screwed","standards":"API 6D; API 608; ASME; ISO 9001:2015","application":"Oil & Gas; Chemical; Water Treatment; Textile; Pharmaceutical","datasheet_url":"https://mncvalves.com/product/ball-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-3WAY',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"3 Way Flanged End Ball Valve","type":"ball_valve","model":"MNC-3WAY","pressure_rating":"Class 150/300/600","size_range":"DN15-DN200 (Flanged)","material":"WCB; CF8 (SS304); CF8M (SS316); Duplex Steel","connection_type":"Flanged","standards":"API 6D; API 608; ASME; ISO 9001:2015","application":"Mixing; Diverting; Switching","datasheet_url":"https://mncvalves.com/product/ball-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-4WAY',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"4 Way Flanged End Ball Valve","type":"ball_valve","model":"MNC-4WAY","pressure_rating":"Class 150/300/600","size_range":"DN15-DN200 (Flanged)","material":"WCB; CF8 (SS304); CF8M (SS316); Duplex Steel","connection_type":"Flanged","standards":"API 6D; API 608; ASME; ISO 9001:2015","application":"Multi-line Routing; Switching","datasheet_url":"https://mncvalves.com/product/ball-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-GATE-CS',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"Cast Steel Gate Valve API 600","type":"gate_valve","model":"MNC-GATE-CS","pressure_rating":"Class 150/300/600/900/1500","size_range":"DN15-DN600","material":"WCB; LCB; WC6; WC9; CF8; CF8M","connection_type":"Flanged; Butt Weld; Socket Weld; Threaded","standards":"API 600; API 602; API 6D; ASME B16.34; API 598","application":"Oil & Gas; Petrochemical; Power; Water Treatment","datasheet_url":"https://mncvalves.com/gate-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-GATE-FS',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"Forged Steel Gate Valve API 602","type":"gate_valve","model":"MNC-GATE-FS","pressure_rating":"High Pressure","size_range":"Compact Design","material":"Forged Steel","connection_type":"Socket Weld; Threaded; Butt Weld","standards":"API 602","application":"Refinery; Process Plant High Pressure/High Temp","datasheet_url":"https://mncvalves.com/gate-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-GATE-PIPE',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"API 6D Pipeline Gate Valve","type":"gate_valve","model":"MNC-GATE-PIPE","pressure_rating":"Pipeline Pressure Rating","size_range":"Pipeline Universal","material":"Pipeline Grade Steel","connection_type":"Flanged; Butt Weld","standards":"API 6D","application":"Oil & Gas Transmission Lines","datasheet_url":"https://mncvalves.com/gate-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'MNC-KNIFE',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"MNC","name":"Knife Edge Gate Valve","type":"gate_valve","model":"MNC-KNIFE","pressure_rating":"Standard","size_range":"Standard","material":"Special Alloy; Stainless Steel","connection_type":"Standard","standards":"Special Design","application":"Slurry; Viscous Media; Pulp; Wastewater; Solid-Laden Service","datasheet_url":"https://mncvalves.com/gate-valve/","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'PX-BV-RS',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Powrix","name":"Resilient Seated Butterfly Valve","type":"butterfly_valve","model":"PX-BV-RS","pressure_rating":"PN10-PN16","size_range":"DN50-DN1200","material":"Gray Cast Iron; Ductile Cast Steel; Cast Steel; Stainless Steel (Body/Disc); Rubber/PTFE (Seal); Stainless Steel (Stem)","connection_type":"Wafer; Flanged","standards":"CE; ISO; API","application":"Water Conservancy; Petrochemical; Coal Chemical; Pipeline Transport; Power Generation; Construction","datasheet_url":"https://powrix.com/product/resilient-seated-butterfly-valves-or-soft-seated","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'PX-KG',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Powrix","name":"Knife Gate Valve","type":"gate_valve","model":"PX-KG","pressure_rating":"0.6-1.0 MPa","size_range":"DN50-DN600","material":"Ductile Iron; Cast Steel; Stainless Steel (Body/Plate); Fluorine Rubber; EPDM Rubber; Nitrile Rubber (Seat); Stainless Steel (Stem); PTFE; Flexible Graphite (Stuffing)","connection_type":"Standard","standards":"Standard Industrial","application":"Cement Slurry; Sand Slurry; Paper Pulp; Fiber Slurry; Impurity-Containing Media","datasheet_url":"https://powrix.com/it/prodotto/knife-gate-valve","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-GG800',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Forged Steel Gate Valve GG800","type":"gate_valve","model":"DG-GG800","pressure_rating":"Class-800","size_range":"N/A","material":"Forged Steel","connection_type":"Threaded; Socket Weld","standards":"API 602","application":"Oil & Gas; Chemical; Power; Water Treatment","datasheet_url":"http://www.davsgeminivalves.com/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-GG1500',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Forged Steel Gate Valve GG1500","type":"gate_valve","model":"DG-GG1500","pressure_rating":"Class-1500","size_range":"N/A","material":"Forged Steel","connection_type":"Threaded; Socket Weld","standards":"API 602","application":"Oil & Gas; Chemical; Power; Water Treatment","datasheet_url":"http://www.davsgeminivalves.com/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-BV-FB',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Ball Valve Full Bore","type":"ball_valve","model":"DG-BV-FB","pressure_rating":"Class-150/300/600","size_range":"N/A","material":"Carbon Steel; Stainless Steel; Bronze","connection_type":"Threaded; Flanged","standards":"API 608","application":"Water Treatment; Oil & Gas; Construction; Mining; Chemical","datasheet_url":"http://www.davsgeminivalves.com/india/ball-valves.html","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-BV-RB',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Ball Valve Reduced Bore","type":"ball_valve","model":"DG-BV-RB","pressure_rating":"Class-150/300/600","size_range":"N/A","material":"Carbon Steel; Stainless Steel; Bronze","connection_type":"Threaded; Flanged","standards":"API 608","application":"Water Treatment; Oil & Gas; Construction; Mining; Chemical","datasheet_url":"http://www.davsgeminivalves.com/india/ball-valves.html","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-BV-VP',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"V-Port Characterized Ball Valve","type":"ball_valve","model":"DG-BV-VP","pressure_rating":"Class-150/300/600","size_range":"N/A","material":"Carbon Steel; Stainless Steel","connection_type":"Threaded; Flanged","standards":"API 608","application":"Linear Flow Control; Regulation","datasheet_url":"http://www.davsgeminivalves.com/india/ball-valves.html","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-BV-CF',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Cage Type Cavity Filter Ball Valve","type":"ball_valve","model":"DG-BV-CF","pressure_rating":"Class-150/300/600","size_range":"N/A","material":"Carbon Steel; Stainless Steel","connection_type":"Threaded; Flanged","standards":"API 608","application":"Cavity-Free Flow; Chemical Service","datasheet_url":"http://www.davsgeminivalves.com/india/ball-valves.html","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-BV-CD',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Centric Design Butterfly Valve PTFE","type":"butterfly_valve","model":"DG-BV-CD","pressure_rating":"PN10-PN16","size_range":"N/A","material":"Cast Iron; PTFE Seat","connection_type":"Wafer","standards":"ISO 5752","application":"Water; Air; Gas; Low Pressure","datasheet_url":"http://www.davsgeminivalves.com/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-BV-DO',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Double Offset Butterfly Valve","type":"butterfly_valve","model":"DG-BV-DO","pressure_rating":"PN16-PN42","size_range":"N/A","material":"Carbon Steel; Stainless Steel; PTFE","connection_type":"Wafer; Lug","standards":"ISO 5752; API 609","application":"High Pressure; High Temperature; Chemical","datasheet_url":"http://www.davsgeminivalves.com/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-GC-PNEU',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Pneumatic Globe Control Valve","type":"control_valve","model":"DG-GC-PNEU","pressure_rating":"Class-150/300","size_range":"N/A","material":"Carbon Steel; Stainless Steel","connection_type":"Flanged","standards":"IEC 60534","application":"Process Control; Regulation","datasheet_url":"http://www.davsgeminivalves.com/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'DG-KEG',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Davsgemini","name":"Knife Edge Gate Valve","type":"gate_valve","model":"DG-KEG","pressure_rating":"Class-150","size_range":"N/A","material":"Carbon Steel; Stainless Steel","connection_type":"Flanged","standards":"API 600","application":"Slurry; Pulp; Viscous Media; Wastewater","datasheet_url":"http://www.davsgeminivalves.com/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'UNOX-BV',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Unox","name":"Butterfly Valve Series","type":"butterfly_valve","model":"UNOX-BV","pressure_rating":"PN10-PN16","size_range":"DN40-DN600 (Special up to DN1000+)","material":"Cast Iron; Ductile Iron; Stainless Steel","connection_type":"Wafer; Lug; Flanged","standards":"ISO 5752; API 609","application":"Food; Chemical; Energy; Water Treatment; HVAC","datasheet_url":"https://unox.com.tr/en/butterfly-valve-size-options/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'UNOX-SS-BV',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Unox","name":"Stainless Steel Ball Valve","type":"ball_valve","model":"UNOX-SS-BV","pressure_rating":"PN16-PN40","size_range":"DN15-DN100","material":"Stainless Steel 304; Stainless Steel 316","connection_type":"Threaded; Flanged; Welded","standards":"ISO 9001","application":"Food; Chemical; Pharmaceutical; High Pressure","datasheet_url":"https://unox.com.tr/en/stainless-steel-valve-models/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'UNOX-ELEC',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Unox","name":"Electric Actuated Ball Valve","type":"ball_valve","model":"UNOX-ELEC","pressure_rating":"PN16-PN40","size_range":"DN15-DN100","material":"Stainless Steel; Carbon Steel","connection_type":"Threaded; Flanged","standards":"CE; ISO","application":"Automation; Remote Control; Industrial","datasheet_url":"https://unox.com.tr/en/product-categories/actuated-valves/electric-valves/","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      '2L-SCV',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"2L Engineers","name":"Swing Check Valve","type":"check_valve","model":"2L-SCV","pressure_rating":"Class 150, 300, 600, 900 & 1500","size_range":"DN 50 to DN 600 (1/2\" to 24\")","material":"Carbon or Low-Alloy Steel; Stainless Steel; CRA (Corrosion Resistant Alloy)","connection_type":"Flanged End","standards":"ASME B16.34; API 6D; BS 1868","application":"Water; Oil; Gas; Cryogenic (-196°C to 900°C)","datasheet_url":"https://2lengineers.com/swing-check-valve","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'SUP-600-GV',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Supreme Valves","name":"API 600 Gate Valve","type":"gate_valve","model":"SUP-600-GV","pressure_rating":"Class 150# to 2500# (PN10-PN420)","size_range":"1/2\" to 24\" (DN15-DN600)","material":"ASTM A216 WCB; A352 LCB/LCC; A217 WC6; WC9; CF8M (SS316); C95800 (NAB)","connection_type":"RF; RTJ; BW","standards":"API 600; ASME B16.34; BS 1414; ISO 10434","application":"Crude oil; Refined petroleum; Natural gas; LPG; Steam; Chemical; Seawater","datasheet_url":"https://www.supremevalves.in/api-gate-valve-manufacturer.html","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'SUP-KEG',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Supreme Valves","name":"Knife Edge Gate Valve","type":"gate_valve","model":"SUP-KEG","pressure_rating":"Class 150# to 2500# (PN10-PN420)","size_range":"1/2\" to 48\" (DN15-DN1200)","material":"WCB; A105; LF2; SS304; SS316; SS316L; SS321; SS347; WC6; WC9; F51; F53; Monel; Hastelloy; Inconel","connection_type":"Flanged; Threaded; Socket Weld; Butt Weld","standards":"ASME B16.34; API 600; API 602; BS 1873; DIN 3352","application":"Mining; Pulp & Paper; Wastewater; Slurry; Viscous Media","datasheet_url":"https://www.supremevalves.in/products/knife-edge-gate-valve.html","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'SUP-FSBV',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Supreme Valves","name":"Fire Safe Ball Valve API 607","type":"ball_valve","model":"SUP-FSBV","pressure_rating":"Class 150# to 2500# (PN10-PN420)","size_range":"1/2\" to 48\" (DN15-DN1200)","material":"WCB; A105; LF2; SS304; SS316; SS316L; SS321; SS347; WC6; WC9; F51; F53; Monel; Hastelloy; Inconel; Titanium; Bronze; Brass","connection_type":"Flanged; Threaded; Socket Weld; Butt Weld","standards":"ASME B16.34; API 600; API 602; API 607; BS 1873; DIN 3352","application":"Oil & Gas; Petrochemical; Refinery; Fire Protection","datasheet_url":"https://www.supremevalves.in/products/fire-safe-ball-valve.html","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'SUP-NIALBR',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Supreme Valves","name":"NiAlBr Ball Valve Flanged Class 150","type":"ball_valve","model":"SUP-NIALBR","pressure_rating":"Class 150","size_range":"Full Bore","material":"NiAlBr (Nickel Aluminium Bronze)","connection_type":"Flanged","standards":"API 600","application":"Seawater; Offshore; Marine; Desalination","datasheet_url":"https://www.supremevalves.in/products/nialbr-ball-valve-flanged-150.html","data_source_type":"web_direct","data_confidence":"high"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
  SELECT id INTO brand_id FROM brands WHERE name = NULL;
  SELECT id INTO type_id FROM valve_types WHERE name = NULL;
  IF brand_id IS NOT NULL THEN
    INSERT INTO valve_specs (brand_id, valve_type_id, model, size_range, pressure_range, temperature_range, body_material, seal_material, end_connection, standard, operation_method, specs_json)
    VALUES (
      brand_id, type_id,
      'SUP-CV',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      '{"brand":"Supreme Valves","name":"Control Valve","type":"control_valve","model":"SUP-CV","pressure_rating":"Standard","size_range":"Standard","material":"Carbon Steel; Stainless Steel","connection_type":"Flanged","standards":"IEC 60534","application":"Flow Control; Pressure Regulation; Temperature Control","datasheet_url":"https://www.supremevalves.in/products/control-valve.html","data_source_type":"web_direct","data_confidence":"medium"}'::jsonb
    ) ON CONFLICT DO NOTHING;
  END IF;
END
$$;
