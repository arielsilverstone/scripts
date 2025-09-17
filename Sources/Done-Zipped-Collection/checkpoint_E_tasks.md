# Checkpoint E: Menu System Task List (Cumulative)

1. Create, update, or correct environment variables
2. Apply one or more .reg files (to be designed later)
3. Create a .vscode folder for a project, including configs copied from other files
4. Intelligently move or mklink (symlink) folders under user or AppData Local/Roaming to proper locations
5. Optionally, use AI to generate a YAML file mapping which folders should be moved and to where
6. Verify drive mappings are correct
7. Verify subst settings
8. Create and remove context menu items
9. Fix settings of cmd, PowerShell, and PowerShell 7 window and buffers
10. Fix the command redirections for these shells
11. Remove and ideally purge from the running image (payload removed, not just disabled) certain features and capabilities
12. Fix file associations
13. Create files in D:\links that implement redirection to executables, with some entries using ENV vars
14. Install Scoop
15. Install specified packages in Scoop
16. Check if certain tasks are implemented and executing; if not, fix or reinstall them
17. Create new scheduled tasks by asking interactive questions
18. Create and maintain my tools index list
19. Find and remove junk items in the system (similar to DISM++ functionality)
20. Create and maintain a list of useful environment variables (may or may not be active at a given moment)
21. Fix only the cmd and PowerShell 'Run as Administrator' context menu commands
22. Fix user interface elements (A-type task: includes window sizes, commands, and variable repair)
23. Check and fix AppData and LocalAppData redirection (for Ariel or for all specified users)
24. Install .NET (possibly integrated into Scoop scripts)
25. Fix services (reset, permissions, and other elements)
26. Remove all vestiges of Edge (but keep WebView)
27. Dedicated task to fix specific registry values
28. Fix PowerShell PackageManagement
29. Fix NuGet
30. Fix Winget
31. Check for corruption, existence, and version of PowerShell modules, then update them
32. Dedicated command to fix PATHs (in cmd, PowerShell 5.1, and PowerShell 7)
33. Fix PowerShell execution policy
34. Integrated into the fix-cmd executions: enable QuickEdit and other improvements
35. Fix all folder view options

Note: Many of these tasks already have partial implementations in existing files. Some work and some do not. The agent must account for this when generating fixes.
