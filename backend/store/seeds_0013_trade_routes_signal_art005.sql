BEGIN TRANSACTION;

/* Attach core signal: Global Arctic Trade Routes */
INSERT INTO article_signals (
  article_id, signal_id, impact, confidence, note
) VALUES (
  'art-005',
  'sig-006',
  80,
  70,
  'Article analyzes feasibility, constraints, and strategic relevance of emerging Arctic shipping corridors.'
);

COMMIT;
