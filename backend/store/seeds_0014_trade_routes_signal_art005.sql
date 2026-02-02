/* -------------------------------------------------
   USAGreenland — Trade Routes Signal Attachment (art-005) v1.0
   Schema-safe, idempotent
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* Attach core signal: Global Arctic Trade Routes */
INSERT OR IGNORE INTO article_signals (
  article_id,
  signal_id,
  impact,
  confidence,
  note
) VALUES (
  'art-005',
  'sig-006',
  80,
  70,
  'Primary analysis of emerging Arctic shipping corridors, feasibility constraints, and strategic relevance.'
);

COMMIT;
