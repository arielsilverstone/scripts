CREATE TABLE "Menu-Options" (
    idx TEXT NOT NULL,
    option_no INTEGER NOT NULL,
    title TEXT NOT NULL,
    PRIMARY KEY (idx, option_no)
);

CREATE TABLE dynamic_values(file, kind TEXT, name TEXT, value TEXT, line INTEGER);

CREATE TABLE file_functions(file TEXT, func_name TEXT, start_line INTEGER, end_line INTEGER);

CREATE TABLE file_line_assignments(file TEXT, line INTEGER, text TEXT, label TEXT);

CREATE TABLE files(
  name TEXT PRIMARY KEY,
  path TEXT,
  exists_flag INTEGER,
  size_bytes INTEGER,
  line_count INTEGER,
  sha256 TEXT,
  ext TEXT
);

CREATE TABLE line_map(
  file TEXT,
  line INTEGER,
  text TEXT,
  tags TEXT
);

CREATE TABLE "line_tags" (
"file" TEXT,
  "line" INTEGER,
  "tag" TEXT
);

CREATE TABLE "lines" (
"file" TEXT,
  "line" INTEGER,
  "text" TEXT,
  "tags" TEXT
);

CREATE TABLE names_index(
  source_name TEXT NOT NULL,
  name        TEXT NOT NULL,
  PRIMARY KEY (source_name, name)
);

CREATE TABLE orphan_lines(file TEXT, line INTEGER, text TEXT);

CREATE TABLE source_names(
  source_name TEXT PRIMARY KEY,
  names_json  TEXT,
  notes       TEXT
);

