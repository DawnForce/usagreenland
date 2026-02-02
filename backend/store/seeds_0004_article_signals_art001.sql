/* -------------------------------------------------
   USAGreenland — Article Signals (art-001) v1.0
   Purpose: Prove article ↔ signal intelligence linkage
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* Attach Critical Minerals Supply Chain */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-001',
  'sig-007',
  75,
  70,
  'Baseline relevance as the Canonical Store underpins future mineral and resource coverage.'
);

/* Attach U.S.–Greenland Policy Alignment */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-001',
  'sig-001',
  60,
  65,
  'Initial article establishes governance and policy framing for the platform.'
);

COMMIT;
