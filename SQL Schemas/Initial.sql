CREATE TABLE IF NOT EXISTS source_names (
    source_name TEXT PRIMARY KEY,
    names_json  TEXT,   -- JSON array of names (0..N)
    notes       TEXT
);

CREATE TABLE IF NOT EXISTS names_index (
    source_name TEXT NOT NULL,
    name        TEXT NOT NULL,
    PRIMARY KEY (source_name, name),
    FOREIGN KEY (source_name) REFERENCES source_names(source_name)
);
