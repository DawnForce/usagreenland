/* -------------------------------------------------
   USAGreenland — Defense Signals (art-003) v1.0
   Purpose: Activate defense intelligence with intent
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* Core driver: Arctic Defense Posture */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-003',
  'sig-003',
  85,
  75,
  'Primary strategic focus of the article; defense posture is the central theme.'
);

/* Contextual driver: NATO Arctic Coordination */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-003',
  'sig-004',
  60,
  65,
  'Material context around multilateral defense coordination in the Arctic.'
);

COMMIT;
