-- MenuFixer Checkpoint G — Schema Extension (DDL)
-- Purpose: Pre-wire the DB for future ingestion, deduping, and normalized registry tables.
-- Apply against MenuFixer_mapping.sqlite with: sqlite3 MenuFixer_mapping.sqlite < MenuFixer_checkpointG_schema_extension.sql

BEGIN TRANSACTION;

-- Collections: label logical groups (e.g., "registry-project")
CREATE TABLE IF NOT EXISTS collections (
  collection_id TEXT PRIMARY KEY,
  label         TEXT NOT NULL
);

-- Map files into one or more collections
CREATE TABLE IF NOT EXISTS file_collections (
  collection_id TEXT NOT NULL,
  file          TEXT NOT NULL,
  PRIMARY KEY (collection_id, file),
  FOREIGN KEY (collection_id) REFERENCES collections(collection_id)
);

-- Optional: Track duplicate files by content hash
CREATE TABLE IF NOT EXISTS dupes (
  file       TEXT PRIMARY KEY,
  original   TEXT NOT NULL,
  sha256     TEXT NOT NULL
);

-- Normalized .reg content (best-effort parsing)
-- norm_hash can be a hash of (hive|key|name|type|value) for deduping unique logical entries
CREATE TABLE IF NOT EXISTS reg_norm (
  file       TEXT NOT NULL,
  line       INTEGER NOT NULL,
  hive       TEXT,
  key        TEXT,
  name       TEXT,
  type       TEXT,
  value      TEXT,
  norm_hash  TEXT,
  PRIMARY KEY (file, line)
);

-- Explicit bucket for registry key deletions (lines beginning with "[-...")
CREATE TABLE IF NOT EXISTS reg_deletes (
  file       TEXT NOT NULL,
  line       INTEGER NOT NULL,
  hive       TEXT,
  key        TEXT,
  PRIMARY KEY (file, line)
);

-- Registry comments and any non-parsed / informational lines
CREATE TABLE IF NOT EXISTS reg_comments (
  file       TEXT NOT NULL,
  line       INTEGER NOT NULL,
  text       TEXT,
  PRIMARY KEY (file, line)
);

-- Useful indexes
CREATE INDEX IF NOT EXISTS idx_reg_norm_normhash   ON reg_norm(norm_hash);
CREATE INDEX IF NOT EXISTS idx_reg_norm_hive_key   ON reg_norm(hive, key);
CREATE INDEX IF NOT EXISTS idx_reg_deletes_hivekey ON reg_deletes(hive, key);
CREATE INDEX IF NOT EXISTS idx_file_collections    ON file_collections(file);

-- Optional view for unique normalized registry entries
CREATE VIEW IF NOT EXISTS v_reg_unique AS
SELECT * FROM (
  SELECT rn.*,
         ROW_NUMBER() OVER (PARTITION BY rn.norm_hash ORDER BY rn.file, rn.line) AS rn_rank
  FROM reg_norm rn
) WHERE rn_rank = 1;

COMMIT;
