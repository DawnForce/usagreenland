/* -------------------------------------------------
   USAGreenland — Core Sector Seed (v1.0)
   Purpose: Lock primary business pillars
   ------------------------------------------------- */

INSERT INTO sectors (id, key, name, description, sort_order, is_active) VALUES
('sec-001', 'news-analysis', 'News & Analysis', 'Policy, geopolitics, and strategic developments involving the U.S. and Greenland.', 10, 1),
('sec-002', 'travel', 'Travel', 'Tourism, destinations, logistics, and visitor guidance for Greenland.', 20, 1),
('sec-003', 'business', 'Business & Opportunities', 'Investment, trade, infrastructure, and commercial opportunities.', 30, 1),
('sec-004', 'defense', 'Defense & Security', 'Military posture, Arctic security, and strategic defense considerations.', 40, 1),
('sec-005', 'science', 'Science & Environment', 'Climate, research, sustainability, and environmental factors.', 50, 1),
('sec-006', 'premium', 'Premium Intelligence', 'Exclusive analysis, briefings, and members-only content.', 60, 1);
