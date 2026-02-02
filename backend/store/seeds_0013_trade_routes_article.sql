/* -------------------------------------------------
   USAGreenland — Trade Routes Article Seed (art-005) v1.2
   Schema-authoritative, idempotent
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* 1) Create article if it does not already exist */
INSERT OR IGNORE INTO articles (
  id,
  slug,
  title,
  status,
  content_path,
  created_at,
  updated_at
) VALUES (
  'art-005',
  'global-arctic-trade-routes',
  'Global Arctic Trade Routes: Emerging Corridors and Constraints',
  'draft',
  'articles/global-arctic-trade-routes.html',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

/* 2) Ensure canonical sector mapping (idempotent) */
INSERT OR IGNORE INTO article_sectors (
  article_id,
  sector_id,
  primary_flag
) VALUES (
  'art-005',
  (SELECT id FROM sectors WHERE key='business'),
  1
);

/* 3) Create initial revision (schema-correct) */
INSERT OR IGNORE INTO article_revisions (
  id,
  article_id,
  rev,
  note,
  created_at
) VALUES (
  'rev-art-005-1',
  'art-005',
  1,
  'Initial draft created for Trade Routes analysis.',
  CURRENT_TIMESTAMP
);

COMMIT;
