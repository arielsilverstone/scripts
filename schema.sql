CREATE TABLE files (
    file_id INTEGER PRIMARY KEY AUTOINCREMENT,
    filename TEXT NOT NULL,
    filepath TEXT NOT NULL UNIQUE,
    file_ext TEXT,
    size_bytes INTEGER,
    line_count INTEGER,
    sha256 TEXT
);

CREATE TABLE menu_items (
    menu_id TEXT PRIMARY KEY,
    function_name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE xml_files (
    xml_id INTEGER PRIMARY KEY AUTOINCREMENT,
    filename TEXT NOT NULL,
    filepath TEXT NOT NULL UNIQUE,
    xml_content TEXT NOT NULL
);
