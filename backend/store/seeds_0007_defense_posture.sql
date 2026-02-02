/* -------------------------------------------------
   USAGreenland — Defense Posture Article (v1.0)
   Purpose: Activate arctic-defense-posture signal
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* 1) Create article (draft) */
INSERT INTO articles (
  id, slug, title, deck, status,
  published_at, content_path, canonical_url, source_note, hash,
  created_at, updated_at
) VALUES (
  'art-003',
  'arctic-defense-posture-overview',
  'Arctic Defense Posture: Strategic Realities in Greenland',
  'An overview of military presence, readiness, and strategic considerations shaping Greenland’s role in Arctic defense.',
  'draft',
  NULL,
  'articles/arctic-defense-posture-overview.html',
  NULL,
  'Manual seed guided by insight queries to address defense coverage gap.',
  NULL,
  datetime('now'),
  datetime('now')
);

/* 2) Link primary sector (Defense & Security) */
INSERT INTO article_sectors (
  article_id, sector_id, primary_flag
) VALUES (
  'art-003',
  'sec-004',
  1
);

/* 3) Create revision snapshot (rev 1) */
INSERT INTO article_revisions (
  id, article_id, rev, title, deck, content_path, hash, note, created_at
) VALUES (
  'rev-003',
  'art-003',
  1,
  'Arctic Defense Posture: Strategic Realities in Greenland',
  'An overview of military presence, readiness, and strategic considerations shaping Greenland’s role in Arctic defense.',
  'articles/arctic-defense-posture-overview.html',
  NULL,
  'Initial ingestion seed (insight-driven defense article).',
  datetime('now')
);

COMMIT;
