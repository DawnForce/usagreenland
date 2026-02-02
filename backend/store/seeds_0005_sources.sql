/* -------------------------------------------------
   USAGreenland — Source Provenance Seed (v1.0)
   Purpose: Prove source + article provenance linkage
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* 1) Create placeholder source */
INSERT INTO sources (
  id, name, base_url, bias_notes, credibility, is_active
) VALUES (
  'src-001',
  'Editorial / Internal Analysis',
  NULL,
  'Placeholder source for internally produced or synthesized analysis.',
  80,
  1
);

/* 2) Link source to article */
INSERT INTO article_sources (
  article_id, source_id, source_url, retrieved_at, paywalled
) VALUES (
  'art-001',
  'src-001',
  'internal://editorial/first-briefing',
  datetime('now'),
  0
);

COMMIT;
