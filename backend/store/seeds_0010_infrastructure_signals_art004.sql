/* -------------------------------------------------
   USAGreenland — Infrastructure Signals (art-004) v1.0
   Purpose: Activate infrastructure intelligence with intent
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* Core driver: Arctic Infrastructure Development */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-004',
  'sig-008',
  80,
  75,
  'Infrastructure development is the central economic driver of the article.'
);

/* Contextual driver: Global Arctic Trade Routes */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-004',
  'sig-009',
  55,
  65,
  'Trade routes provide important context but are not the primary focus.'
);

COMMIT;
