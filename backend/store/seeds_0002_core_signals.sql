/* -------------------------------------------------
   USAGreenland — Core Signal Seed (v1.0)
   Purpose: Lock high-level intelligence signals
   ------------------------------------------------- */

INSERT INTO signals (id, key, name, type, description, default_weight) VALUES

-- Policy / Governance
('sig-001', 'us-greenland-policy-alignment', 'U.S.–Greenland Policy Alignment', 'policy',
 'Diplomatic, legal, and governance alignment between the United States and Greenland.', 80),

('sig-002', 'arctic-sovereignty-positioning', 'Arctic Sovereignty Positioning', 'policy',
 'National and international positioning over Arctic governance, sovereignty, and norms.', 75),

-- Defense / Security
('sig-003', 'arctic-defense-posture', 'Arctic Defense Posture', 'security',
 'Military presence, readiness, and strategic defense considerations in the Arctic region.', 90),

('sig-004', 'nato-arctic-coordination', 'NATO Arctic Coordination', 'security',
 'Defense coordination and strategic alignment among NATO members in the Arctic.', 70),

-- Economy / Trade
('sig-005', 'us-greenland-economic-integration', 'U.S.–Greenland Economic Integration', 'economic',
 'Trade, investment, and economic cooperation between the U.S. and Greenland.', 85),

('sig-006', 'global-arctic-trade-routes', 'Global Arctic Trade Routes', 'trade',
 'Shipping lanes, logistics, and commercial implications of Arctic maritime routes.', 65),

-- Resources / Infrastructure
('sig-007', 'critical-minerals-supply-chain', 'Critical Minerals Supply Chain', 'economic',
 'Extraction, processing, and strategic importance of Greenland’s mineral resources.', 95),

('sig-008', 'arctic-infrastructure-development', 'Arctic Infrastructure Development', 'infrastructure',
 'Ports, airfields, energy, and communications infrastructure in Arctic regions.', 80),

-- Science / Environment
('sig-009', 'climate-change-arctic-impact', 'Climate Change Arctic Impact', 'science',
 'Environmental and climatic changes affecting Greenland and the wider Arctic.', 85),

-- Tourism / Soft Power
('sig-010', 'arctic-tourism-growth', 'Arctic Tourism Growth', 'tourism',
 'Expansion, regulation, and economic impact of tourism in Greenland and Arctic regions.', 60);
