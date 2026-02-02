/* -------------------------------------------------
   USAGreenland — Economic Integration Signal (art-002) v1.0
   Purpose: Attach core economic integration signal
   ------------------------------------------------- */

BEGIN TRANSACTION;

/* Core driver: U.S.–Greenland Economic Integration */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-002',
  'sig-006',
  85,
  75,
  'Economic integration is the central theme of this article, spanning infrastructure, capital alignment, and long-term partnership.'
);

COMMIT;
