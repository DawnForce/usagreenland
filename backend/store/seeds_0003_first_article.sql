/* -------------------------------------------------
   USAGreenland — First Manual Article Insert (v1.0)
   Purpose: Prove end-to-end ingestion (article + sector)
   Notes:
   - Replace slug/title/content_path later if desired
   - Sector assignment uses existing seeded sector: sec-001 (news-analysis)
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* 1) Create article (draft) */
INSERT INTO articles (
  id, slug, title, deck, status,
  published_at, content_path, canonical_url, source_note, hash,
  created_at, updated_at
) VALUES (
  'art-001',
  'first-briefing',
  'First Briefing: Canonical Store is Live',
  'A baseline entry proving ingestion, taxonomy linkage, and durable storage.',
  'draft',
  NULL,
  'articles/first-briefing.html',
  NULL,
  'Manual seed to validate Canonical Store ingestion flow.',
  NULL,
  datetime('now'),
  datetime('now')
);

/* 2) Link primary sector (News & Analysis) */
INSERT INTO article_sectors (article_id, sector_id, primary_flag)
VALUES ('art-001', 'sec-001', 1);

/* 3) Create revision snapshot (rev 1) */
INSERT INTO article_revisions (
  id, article_id, rev, title, deck, content_path, hash, note, created_at
) VALUES (
  'rev-001',
  'art-001',
  1,
  'First Briefing: Canonical Store is Live',
  'A baseline entry proving ingestion, taxonomy linkage, and durable storage.',
  'articles/first-briefing.html',
  NULL,
  'Initial ingestion seed (golden path).',
  datetime('now')
);

COMMIT;
