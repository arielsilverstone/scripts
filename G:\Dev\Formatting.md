 # Python File Banners and Tails — Requirements Understanding
 
 ## B. Banner Requirements (What to include and where)
     1. Top-of-file header banner
          a. Bounded by full-width delimiter lines using
          # ==...==, which ends at col 79.
          b. Must include:
               i.    File: <logical path> (example: File: src/project_manager.py).
               ii.   Purpose: with a concise multi-line description.
               iii.  Immediately after, a section header banner for imports:
                    (a) for Py:
                         `# SECTION 1: Imports and Configurations
                    (b) for PowerShell:
                         `# SECTION 1: Global VARs and Imports
                         # ==...==
                         #`, which ends at col 79.
 
     2. Section banners
          a. Use full-width delimiter
               `#
               # ==...==
               #`, which ends at col 79.
          b. Title as # SECTION N: <Title> (e.g., SECTION 2: Project Management Classes).
          c. Introduces the grouping for the code that follows.
 
     3. Class banners
          a. Directly under a section banner.
          b. Format:
               i.    # Class 2.1: ProjectManager
               ii.   # Purpose: line describing the class role.
          c. Followed by a single # separator line just before class ProjectManager:.
 
     4. Method banners (synchronous and asynchronous)
          a. Use the same full-width delimiter
          #
          # ==...==, which ends at col 79.
          b. Include:
               i.    Label with hierarchical numbering and name (e.g., # Method 2.1.1: __init__).
               ii.   For coroutines, prefix with Async (e.g., # Async Method 2.1.3: _acquire_file_lock).
               iii.  # Purpose: line explaining intent.
          c. A single # separator line comes immediately before the def signature.
 
     5. Nested/local helper banners
          a. Inner helpers defined within methods also receive banners and numbering extended to a sub-index (e.g., # Async Method 2.1.20.1: save_single).
          b. Each includes its own # Purpose: line and follows the same delimiter and spacing conventions.
 
     6. Numbering scheme
          a. Hierarchical, consistent, and informative:
               i.    Section → Class → Method → Nested helper (e.g., 2 → 2.1 → 2.1.20 → 2.1.20.1).
               ii.   Async is part of the method label when applicable.
 
     7. Delimiter usage
          a. All banners (File/Section/Class/Method/Nested) use the same full-width delimiter
          #
          # ==...==.
          b. A single # separator line precedes the actual code element after every banner block.
          c. A single # separator line must also precede every banner after the first (the top-of-file header is the only exception).
          d. No blank lines are allowed between: a banner block and its trailing #; the leading # before a banner and that banner; or the trailing # and the subsequent code element.
          e. All banners end at column 79.
 
 
 ## C. File Tail Requirement (End-of-file conventions)
     1. Explicit EOF marker
          a. Concludes the file with:
               i.    Two single # separator lines.
               ii.   A terminal marker line of the form: ## End of <FileName>.py (e.g., ## End of ProjectManager.py).
          b. This provides a clear EOF boundary and names the logical file being closed.
 
 
 ## D. Practical Checklist
     1. Header present with File and Purpose, then Section 1 banner, then a # separator, then imports.
     2. Every Section/Class/Method is preceded by its banner and a # separator before code.
     3. Async methods labeled with Async Method and numbered.
     4. Nested helpers receive their own sub-numbered banners and Purpose.
     5. EOF tail with two # lines and an explicit ## End of <FileName>.py marker.
 
 
 ## E. Bullet and Indentation Rules Summary
     1. Top-level sections (H2)
          a. Format: ## A. <Title>, ## B. <Title>, ...
          b. One blank line before each H2.
          c. No extra blank line immediately after H2 unless starting a new paragraph.
 
     2. Level 1 list (under each H2)
          a. Marker: 1., 2., …
          b. Column: 5 (4 leading spaces).
          c. Spacing after marker: 1 space.
          d. Numbering restarts at 1 for each H2.
 
     3. Level 2 sublist (under each 1.)
          a. Marker: a., b., …
          b. Column: 10 (9 leading spaces).
          c. Spacing after marker: 1 space.
          d. Restarts at a. under each new numeric item.
 
     4. Level 3 sublist (under each a.)
          a. Marker: i., ii., …
          b. Column: starts at15 (14 leading spaces), left aligned to others at same level.
          c. Spacing after marker depends on Roman numeral length:
               i.    One-character markers (e.g., i., v., x.) → 4 spaces
               ii.   Two-character markers (e.g., ii., xi.) → 3 spaces
               iii.  Three-character markers (e.g., iii., viii., xiii.) → 2 spaces
               iv.   Four-or-more-character markers → 1 space
          d. Restarts at i. under each new lettered item.
 
     5. Empty-line rules within lists
          a. No blank lines between sibling items at any level.
          b. No blank lines between a parent item and its immediate nested sublist.
          c. Blank lines only used to separate major sections (e.g., between H2 blocks).
 
     6. General
          a. Use spaces (not tabs) to achieve column alignment.
          b. Markers are followed by text on the same line (no trailing punctuation required).
 
