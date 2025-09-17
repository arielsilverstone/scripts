Delimiter: single style, ends at col 79 (shorthand: # ==...===)
Structure: Section→Class→Method→Nested (e.g., 2→2.1→2.1.1→2.1.1.1)
Banners: each preceded and also followed by a single # line (except the file banner, only followed); no blank line(s) around; connect consecutive via only a single delimiter.
Indentation: first level 4 spaces (col 5), then +5 per level (cols 5,10,15,20,…); spaces only
Markdown lists: H2 as "A. <Title>"; list columns at 5/10/15; roman spacing 1ch→4, 2ch→3, 3ch→2, 4+ch→1; no extra blanks
Encoding/EOF: UTF-8 without BOM; EOF has two # lines then "## End of <FileName>.py"
Cleanup: remove temps; revert transient configs; close resources; update docs; ensure tests/linters pass
Env: All under D:/Program Files/Dev: {Tools; Projects; Settings; Settings/AI; Settings/Templates}
PS7 is on D Drive; tools are: Python(=Python3136), Bun, Deno, Go, Node, Rust, msys2, WinSDK, WinPython under Tools; most tools are not in PATH

A. Workspace conventions

1. tests/aux holds all test helpers; import as tests.aux.*
1. Virtualenvs may only be created under tests/venv/<name>
1. All utility scripts must reside under utils/
1. All logs must be written to logs/
1. No file creation is allowed in project root (modifications permitted)
1. Test reports must be written to tests/reports/<DDMMMYY-HHmm>

A. VS Code integration

1. Set python.venvPath to ${workspaceFolder}/tests/venv
1. Provide tasks to create venvs under tests/venv and to run pytest writing reports to timestamped folders
1. Provide LOG_DIR env for terminals/tasks pointing to ${workspaceFolder}/logs
