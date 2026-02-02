/* =================================================
   USAGreenland — Article Seed TEMPLATE (v1.0)
   PURPOSE:
   - Canonical pattern for inserting a new article
   - Copy this file → rename → replace placeholders
   - Do NOT execute this template directly
   ================================================= */

/*
INSTRUCTIONS (READ FIRST):

1) COPY this file and rename it:
   seeds_XXXX_new_article_<slug>.sql

2) Replace ALL placeholders marked with <<< >>>.

3) IDs must be globally unique.
   - Article ID: art-XXX
   - Revision ID: rev-XXX

4) Every article MUST:
   - Insert into articles
   - Link ≥ 1 sector (one primary)
   - Create revision rev = 1

5) Signals and sources are OPTIONAL but recommended.
*/

BEGIN TRANSACTION;

/* -------------------------------------------------
   1) ARTICLE (required)
   ------------------------------------------------- */

INSERT INTO articles (
  id,
  slug,
  title,
  deck,
  status,
  published_at,
  content_path,
  canonical_url,
  source_note,
  hash,
  created_at,
  updated_at
) VALUES (
  '<<<ART_ID>>>',                           -- e.g. art-002
  '<<<SLUG>>>',                             -- e.g. us-greenland-investment-outlook
  '<<<TITLE>>>',
  '<<<DECK>>>',
  'draft',                                 -- draft | published | archived
  NULL,                                    -- set when published
  'articles/<<<SLUG>>>.html',
  NULL,
  '<<<SOURCE_NOTE>>>',
  NULL,
  datetime('now'),
  datetime('now')
);

/* -------------------------------------------------
   2) SECTOR LINK (required)
   ------------------------------------------------- */

INSERT INTO article_sectors (
  article_id,
  sector_id,
  primary_flag
) VALUES (
  '<<<ART_ID>>>',
  '<<<SECTOR_ID>>>',                        -- e.g. sec-001
  1                                        -- exactly one primary
);

/* -------------------------------------------------
   3) REVISION SNAPSHOT (required)
   ------------------------------------------------- */

INSERT INTO article_revisions (
  id,
  article_id,
  rev,
  title,
  deck,
  content_path,
  hash,
  note,
  created_at
) VALUES (
  '<<<REV_ID>>>',                           -- e.g. rev-002
  '<<<ART_ID>>>',
  1,
  '<<<TITLE>>>',
  '<<<DECK>>>',
  'articles/<<<SLUG>>>.html',
  NULL,
  'Initial ingestion (rev 1).',
  datetime('now')
);

/* -------------------------------------------------
   4) SIGNALS (optional, repeatable)
   ------------------------------------------------- */

/*
INSERT INTO article_signals (
  article_id,
  signal_id,
  impact,
  confidence,
  note
) VALUES (
  '<<<ART_ID>>>',
  '<<<SIGNAL_ID>>>',                        -- e.g. sig-007
  0,                                       -- 0–100
  0,                                       -- 0–100
  '<<<WHY_THIS_SIGNAL_APPLIES>>>'
);
*/

/* -------------------------------------------------
   5) SOURCE PROVENANCE (optional, recommended)
   ------------------------------------------------- */

/*
INSERT INTO article_sources (
  article_id,
  source_id,
  source_url,
  retrieved_at,
  paywalled
) VALUES (
  '<<<ART_ID>>>',
  '<<<SOURCE_ID>>>',                        -- e.g. src-001
  '<<<SOURCE_URL>>>',
  datetime('now'),
  0
);
*/

COMMIT;

/* =================================================
   END TEMPLATE
   ================================================= */
