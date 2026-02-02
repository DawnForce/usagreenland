BEGIN TRANSACTION;

/* Remove all existing signal links for art-002 */
DELETE FROM article_signals
WHERE article_id = 'art-002';

/* Attach correct signal: U.S.–Greenland Economic Integration */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-002',
  'sig-005',
  85,
  75,
  'Economic integration is the primary driver of this article.'
);

COMMIT;

