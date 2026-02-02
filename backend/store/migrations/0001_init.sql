PRAGMA foreign_keys = ON;

/* ------------------ ARTICLES ------------------ */

CREATE TABLE articles (
    id TEXT PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    deck TEXT,
    status TEXT NOT NULL CHECK (status IN ('draft','published','archived')),
    published_at TEXT,
    content_path TEXT NOT NULL,
    canonical_url TEXT,
    source_note TEXT,
    hash TEXT,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL
);

CREATE TABLE article_revisions (
    id TEXT PRIMARY KEY,
    article_id TEXT NOT NULL,
    rev INTEGER NOT NULL,
    title TEXT,
    deck TEXT,
    content_path TEXT,
    hash TEXT,
    note TEXT,
    created_at TEXT NOT NULL,
    UNIQUE(article_id, rev),
    FOREIGN KEY(article_id) REFERENCES articles(id)
);

/* ------------------ SECTORS ------------------ */

CREATE TABLE sectors (
    id TEXT PRIMARY KEY,
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT,
    parent_id TEXT,
    sort_order INTEGER DEFAULT 0,
    is_active INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY(parent_id) REFERENCES sectors(id)
);

CREATE TABLE article_sectors (
    article_id TEXT NOT NULL,
    sector_id TEXT NOT NULL,
    primary_flag INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(article_id, sector_id),
    FOREIGN KEY(article_id) REFERENCES articles(id),
    FOREIGN KEY(sector_id) REFERENCES sectors(id)
);

/* ------------------ SIGNALS ------------------ */

CREATE TABLE signals (
    id TEXT PRIMARY KEY,
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    description TEXT,
    default_weight INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE article_signals (
    article_id TEXT NOT NULL,
    signal_id TEXT NOT NULL,
    impact INTEGER NOT NULL CHECK (impact BETWEEN 0 AND 100),
    confidence INTEGER NOT NULL CHECK (confidence BETWEEN 0 AND 100),
    note TEXT,
    PRIMARY KEY(article_id, signal_id),
    FOREIGN KEY(article_id) REFERENCES articles(id),
    FOREIGN KEY(signal_id) REFERENCES signals(id)
);

/* ------------------ SOURCES ------------------ */

CREATE TABLE sources (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    base_url TEXT,
    bias_notes TEXT,
    credibility INTEGER CHECK (credibility BETWEEN 0 AND 100),
    is_active INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE article_sources (
    article_id TEXT NOT NULL,
    source_id TEXT NOT NULL,
    source_url TEXT NOT NULL,
    retrieved_at TEXT NOT NULL,
    paywalled INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(article_id, source_url),
    FOREIGN KEY(article_id) REFERENCES articles(id),
    FOREIGN KEY(source_id) REFERENCES sources(id)
);

/* ------------------ AUTOMATION LEDGER ------------------ */

CREATE TABLE jobs (
    id TEXT PRIMARY KEY,
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    schedule_hint TEXT,
    is_enabled INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE job_runs (
    id TEXT PRIMARY KEY,
    job_id TEXT NOT NULL,
    started_at TEXT NOT NULL,
    finished_at TEXT,
    status TEXT NOT NULL,
    summary TEXT,
    error TEXT,
    FOREIGN KEY(job_id) REFERENCES jobs(id)
);

CREATE TABLE run_items (
    id TEXT PRIMARY KEY,
    run_id TEXT NOT NULL,
    item_type TEXT NOT NULL,
    item_ref TEXT NOT NULL,
    status TEXT NOT NULL,
    note TEXT,
    FOREIGN KEY(run_id) REFERENCES job_runs(id)
);

/* ------------------ INDEXES ------------------ */

CREATE INDEX idx_articles_status ON articles(status);
CREATE INDEX idx_articles_published ON articles(published_at);
CREATE INDEX idx_signals_type ON signals(type);
CREATE INDEX idx_job_runs_status ON job_runs(status);
