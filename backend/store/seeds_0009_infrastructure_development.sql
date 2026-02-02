/* -------------------------------------------------
   USAGreenland — Infrastructure Development Article (v1.0)
   Purpose: Activate arctic-infrastructure-development signal
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* 1) Create article (draft) */
INSERT INTO articles (
  id, slug, title, deck, status,
  published_at, content_path, canonical_url, source_note, hash,
  created_at, updated_at
) VALUES (
  'art-004',
  'arctic-infrastructure-development-overview',
  'Arctic Infrastructure Development: Foundations for Growth',
  'An overview of ports, airfields, energy systems, and logistics infrastructure shaping Arctic economic expansion.',
  'draft',
  NULL,
  'articles/arctic-infrastructure-development-overview.html',
  NULL,
  'Manual seed guided by insight queries to address infrastructure coverage gap.',
  NULL,
  datetime('now'),
  datetime('now')
);

/* 2) Link primary sector (Business & Opportunities) */
INSERT INTO article_sectors (
  article_id, sector_id, primary_flag
) VALUES (
  'art-004',
  'sec-003',
  1
);

/* 3) Create revision snapshot (rev 1) */
INSERT INTO article_revisions (
  id, article_id, rev, title, deck, content_path, hash, note, created_at
) VALUES (
  'rev-004',
  'art-004',
  1,
  'Arctic Infrastructure Development: Foundations for Growth',
  'An overview of ports, airfields, energy systems, and logistics infrastructure shaping Arctic economic expansion.',
  'articles/arctic-infrastructure-development-overview.html',
  NULL,
  'Initial ingestion seed (insight-driven infrastructure article).',
  datetime('now')
);

COMMIT;
