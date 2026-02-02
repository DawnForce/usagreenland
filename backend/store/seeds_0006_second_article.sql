/* -------------------------------------------------
   USAGreenland — Second Article Insert (v1.0)
   Purpose: Prove repeatability of article ingestion
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* 1) Create article (draft) */
INSERT INTO articles (
  id, slug, title, deck, status,
  published_at, content_path, canonical_url, source_note, hash,
  created_at, updated_at
) VALUES (
  'art-002',
  'us-greenland-business-outlook',
  'U.S.–Greenland Business Outlook',
  'An initial overview of emerging commercial and investment opportunities.',
  'draft',
  NULL,
  'articles/us-greenland-business-outlook.html',
  NULL,
  'Manual seed to validate repeatable article ingestion.',
  NULL,
  datetime('now'),
  datetime('now')
);

/* 2) Link primary sector (Business & Opportunities) */
INSERT INTO article_sectors (
  article_id, sector_id, primary_flag
) VALUES (
  'art-002',
  'sec-003',
  1
);

/* 3) Create revision snapshot (rev 1) */
INSERT INTO article_revisions (
  id, article_id, rev, title, deck, content_path, hash, note, created_at
) VALUES (
  'rev-002',
  'art-002',
  1,
  'U.S.–Greenland Business Outlook',
  'An initial overview of emerging commercial and investment opportunities.',
  'articles/us-greenland-business-outlook.html',
  NULL,
  'Initial ingestion seed (repeatability test).',
  datetime('now')
);

COMMIT;
