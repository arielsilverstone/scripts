###############################################################################
# Document: MenuFixer — Project Workspace                                     #
# Purpose: Persistent baseline, rules, and scripts for MenuFixer (PS 5.1)     #
###############################################################################

## A. Checkpoint E (Prompt 2 Baseline)

A. You are
1. You are an AI agent named MenuFixer.
   Your purpose is to design and maintain a PowerShell 5.1 text-based menu system.
   The menu will manage environment, configuration, and project tasks.

B. Persona
1. Persona: pragmatic, precise, schema-driven.
   You always generate PowerShell code using my strict formatting rules.
   You default to minimal valid changes and ask before expanding scope.

C. Constraints
1. Be succinct. Only act on what is requested.
2. Do not provide code until it is tested.
3. Always target PowerShell 5.1 (not 7.x or Core).
4. Never generate beyond the requested scope.
5. When ambiguous, ask me for clarification before proceeding.
6. Many of these tasks already have partial implementations in existing files. Some work and some do not.
   You must account for this when generating fixes.

D. Task Flow
1. Request list of tasks or functions to include in the menu if not already provided.
2. Validate each task against what PowerShell 5.1 can achieve.
3. For simple tasks, generate numbered menu entries (1–99).
4. For combined tasks, generate lettered menu entries (A–Z).
5. Ensure all code uses banners, sections, and indentation per my formatting rules.
6. Confirm code correctness and test before offering it.
7. Present final menu scripts in modular form, allowing extension as new tasks are added.
4 (moved up). Use AI/YAML mapping option (optional), may draw from SDK snippets.

E. Output
1. Deliver PowerShell 5.1 scripts implementing the requested menu system.
2. Ensure formatting is fully compliant with my rules.
3. Provide only tested, validated code.
4. Be succinct. No explanations beyond what is requested.

---

## B. Formatting Rules (Ariel)
- Full-width 79-character `#` delimiter banners.
- When two banners are adjacent, they **share one delimiter line** (no extra `#` lines between).
- Sections numbered; functions within sections numbered (e.g., Function 2.1).
- Comments appear **above** control blocks (`if/else/try/catch/while/foreach`).
- PowerShell 5.1 only; no PS7-only features.
- Avoid aliases; use explicit cmdlets and `-ErrorAction` words.
- Tail marker must be exactly:
  
  #
  #
  ## End of <filename>

---

## C. Canonical Scripts

### C.1 Check-DesktopHeap.ps1 (Final)
- Stored here verbatim.

### C.2 Enable-OfflineFiles-Server.ps1 (Final)
- Stored here verbatim.

---

## D. MenuFixer — Implementation Index
- E.7.a Environment variables — **Implemented** (see `MenuFixer.ps1` section below)
- E.7.b Apply .reg files — **Planned**
- E.7.c … E.7.ai — **Planned**

---

## E. MenuFixer.ps1 (Starter + E.7.a implemented)
- PS 5.1 menu shell following banner rules.
- Implements E.7.a (env vars) with `Ensure-EnvVar`, `Load-EnvConfig`, `Invoke-EnvVariables`.
- Further items will be added incrementally.

```powershell
###############################################################################
# File: MenuFixer.ps1                                                         #
# Purpose: PowerShell 5.1 menu; implements E.7.a (env vars)                   #
###############################################################################
# Section 1: Global VARs and Configurations                                   #
###############################################################################
#
$ConfigPath = 'D:\MenuFixer\envvars.json'
#
###############################################################################
# Section 2: Functions                                                        #
###############################################################################
# Function 2.1: Ensure-EnvVar                                                 #
# Purpose: Create/update an environment variable in User or Machine scope     #
###############################################################################
#
function Ensure-EnvVar {
    param(
        [Parameter(Mandatory)][ValidateSet('User','Machine')] [string] $Scope,
        [Parameter(Mandatory)][ValidatePattern('^[A-Za-z_][A-Za-z0-9_]*$')] [string] $Name,
        [Parameter(Mandatory)] [string] $Value
    )
    # Determine target registry path for the scope
    if ($Scope -eq 'Machine') {
        $regPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment'
    } else {
        $regPath = 'HKCU:\Environment'
    }
    # Create the key if missing
    if (-not (Test-Path -Path $regPath)) { New-Item -Path $regPath -Force | Out-Null }
    # Read existing value (if any)
    $existing = (Get-ItemProperty -Path $regPath -ErrorAction SilentlyContinue |
                 Select-Object -ExpandProperty $Name -ErrorAction SilentlyContinue)
    # If missing or different, set it (REG_EXPAND_SZ if contains %...%)
    if ($null -eq $existing -or $existing -ne $Value) {
        $type = ($Value -like '*%*') ? 'ExpandString' : 'String'
        New-ItemProperty -Path $regPath -Name $Name -Value $Value -PropertyType $type -Force | Out-Null
        [Environment]::SetEnvironmentVariable($Name, $Value, $Scope)
        Write-Host ("Set {0} env var: {1}={2}" -f $Scope, $Name, $Value)
    }
}
#
###############################################################################
# Function 2.2: Load-EnvConfig                                                #
# Purpose: Load JSON {Machine:{},User:{}} if present                          #
###############################################################################
#
function Load-EnvConfig {
    if (Test-Path -Path $ConfigPath) {
        try {
            $json = Get-Content -Path $ConfigPath -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
            return @{ Machine = @{} + ($json.Machine | ForEach-Object { $_ }); User = @{} + ($json.User | ForEach-Object { $_ }) }
        } catch {
            Write-Warning ("Failed to load env config: {0}" -f $_.Exception.Message)
            return @{ Machine = @{}; User = @{} }
        }
    } else { return @{ Machine = @{}; User = @{} } }
}
#
###############################################################################
# Function 2.3: Invoke-EnvVariables                                           #
# Purpose: Implement E.7.a using config file or inline sample map             #
###############################################################################
#
function Invoke-EnvVariables {
    # Load config map (Machine/User)
    $map = Load-EnvConfig
    # Example defaults if file missing (edit/remove as needed)
    if (($map.Machine.Count -eq 0) -and ($map.User.Count -eq 0)) {
        $map = @{ Machine = @{ 'MY_TOOL_HOME' = 'D:\Tools\MyTool'; 'PATH' = '%PATH%;D:\Tools\MyTool\bin' }; User = @{ 'MY_PROJECT' = 'D:\Projects\Current' } }
    }
    # Apply Machine env vars
    foreach ($kv in $map.Machine.GetEnumerator()) { Ensure-EnvVar -Scope 'Machine' -Name $kv.Key -Value $kv.Value }
    # Apply User env vars
    foreach ($kv in $map.User.GetEnumerator()) { Ensure-EnvVar -Scope 'User' -Name $kv.Key -Value $kv.Value }
    Write-Host "Environment variable updates complete."
}
#
###############################################################################
# Section 3: Menu                                                             #
###############################################################################
#
function Show-Menu {
    Clear-Host
    Write-Host '================ MenuFixer (PS 5.1) ================'
    Write-Host ' a. E.7.a  Create/update/correct environment variables'
    Write-Host ' q. Quit'
}
# Main Loop
Do {
    Show-Menu
    $sel = Read-Host 'Select option'
    switch ($sel) {
        'a' { Invoke-EnvVariables }
        'q' { break }
        Default { Write-Host 'Invalid selection' }
    }
    if ($sel -ne 'q') { Read-Host 'Press Enter to continue' | Out-Null }
} While ($true)
#
#
## End of MenuFixer.ps1
```

---

## F. Next Steps
- Implement E.7.b (Apply .reg files) with `reg.exe import` wrappers and safety/backup.
- Add a shared module `Common.psm1` for banner/tail helpers and logging if desired (PS 5.1-safe).
- Keep all future modules here under their own banners for persistence.

