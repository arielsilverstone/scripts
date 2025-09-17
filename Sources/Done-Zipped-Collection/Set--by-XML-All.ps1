#=================================================================================
# [YOUR CUSTOM BANNER AND SCRIPT HEADER GOES HERE]
#=================================================================================

# --- Check for Administrator privileges ---
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script must be run as an Administrator. Please re-launch PowerShell as an Administrator and try again."
    Start-Sleep -Seconds 10
    Exit
}

Write-Host "Starting Full System Configuration..." -ForegroundColor Magenta
Write-Host "=====================================" -ForegroundColor Magenta
Write-Host ""

# ===================================================================
# Step 1: System Identity and Information
# ===================================================================
Write-Host "[Step 1] Setting System Identity..." -ForegroundColor Cyan

# Set Computer Name (requires a restart at the end)
$newComputerName = "Ben"
Write-Host "  - Setting Computer Name to '$newComputerName'..."
Rename-Computer -NewName $newComputerName -Force

# Set Registered Owner and Organization
Write-Host "  - Setting Registered Owner and Organization..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name "RegisteredOwner" -Value "Ariel"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name "RegisteredOrganization" -Value "Data Protectors LLC"

# Set Product Key (using the GVLK from your XML for Server Datcenter)
Write-Host "  - Setting Product Key..."
& slmgr.vbs /ipk 2KNJJ-33Y9H-2GXGX-KMQWH-G6H67


# ===================================================================
# Step 2: Locale, Time, Page File, and OOBE Settings
# ===================================================================
Write-Host "[Step 2] Configuring System Settings..." -ForegroundColor Cyan

# Set Locale and Language Information
Write-Host "  - Setting System Locale and Language..."
Set-WinSystemLocale -SystemLocale "en-GB"
Set-WinUserLanguageList -LanguageList "en-GB", "en-US", "en-VI" -Force
Set-WinUILanguageOverride -Language "en-GB"

# Set TimeZone
Write-Host "  - Setting TimeZone..."
Set-TimeZone -Id "Pacific Standard Time"

# Configure Page File on Y: drive (Using corrected method)
Write-Host "  - Configuring Page File on Y: drive..."
$pageFilePath = "Y:\pagefile.sys"
$pageFileSetting = Get-CimInstance -Query "SELECT * FROM Win32_PageFileSetting WHERE Name = '$($pageFilePath.Replace('\','\\'))'"
if (-not $pageFileSetting) {
    New-CimInstance -ClassName Win32_PageFileSetting -Property @{ Name = $pageFilePath } | Out-Null
}
Set-CimInstance -Query "SELECT * FROM Win32_PageFileSetting WHERE Name = '$($pageFilePath.Replace('\','\\'))'" -Property @{ InitialSize = 2048; MaximumSize = 8192 }

# Set Network Location and OOBE Settings
Write-Host "  - Setting Network Location and OOBE policies..."
Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory "Private"
$updatePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
if (-not (Test-Path $updatePath)) { New-Item -Path $updatePath -Force | Out-Null }
Set-ItemProperty -Path $updatePath -Name "NoAutoUpdate" -Value 1 -Type DWord


# ===================================================================
# Step 3: User Accounts
# ===================================================================
Write-Host "[Step 3] Creating User Accounts..." -ForegroundColor Cyan

# Create User 'Machine' and add to Administrators
Write-Host "  - Creating user 'Machine'..."
$machinePassword = ConvertTo-SecureString "T" -AsPlainText -Force
New-LocalUser -Name "Machine" -Password $machinePassword -FullName "Machine" -Description "Local Computer Service Account"
Add-LocalGroupMember -Group "Administrators" -Member "Machine"

# Set Built-in Administrator password
Write-Host "  - Setting Administrator password..."
$adminPassword = ConvertTo-SecureString "T" -AsPlainText -Force
Get-LocalUser -Name "Administrator" | Set-LocalUser -Password $adminPassword


# ===================================================================
# Step 4: Directory Creation & Environment Variables
# ===================================================================
Write-Host "[Step 4] Creating directories and setting Environment Variables..." -ForegroundColor Cyan

# Create Directories
$directoriesToCreate = @(
    "D:\Temp", "D:\AppData", "D:\Links",
    "G:\Dev\Tools\Python313", "G:\Dev\Tools\PyPaks\Scripts",
    "G:\Dev\Settings\Ariel", "G:\Dev\Windsurf"
)
foreach ($dir in $directoriesToCreate) {
    if (-not (Test-Path -Path $dir)) {
        New-Item -Path $dir -ItemType Directory -Force | Out-Null
    }
}

# Set Environment Variables from your more-vars.reg file
Write-Host "  - Setting comprehensive list of environment variables..."
$envVars = @{
    # System-wide variables
    "ACSvcPort"                        = @{ Value = "0"; Scope = "Machine" }
    "RlsSvcPort"                       = @{ Value = "0"; Scope = "Machine" }
    "HOMEDRIVE"                        = @{ Value = "D:"; Scope = "Machine" }
    "BUN_INSTALL"                      = @{ Value = "T:\Bun"; Scope = "Machine" }
    "CARGO_HOME"                       = @{ Value = "T:\Rust\cargo"; Scope = "Machine" }
    "CARGO_TARGET_DIR"                 = @{ Value = "D:\Temp\cargo\target"; Scope = "Machine" }
    "RUSTUP_HOME"                      = @{ Value = "T:\Rust\rustup"; Scope = "Machine" }
    "DENO_INSTALL"                     = @{ Value = "T:\Deno"; Scope = "Machine" }
    "JUPYTER_CONFIG_DIR"               = @{ Value = "T:\jupyter"; Scope = "Machine" }
    "LMSTUDIO_MODELS_PATH"             = @{ Value = "T:\LLMs"; Scope = "Machine" }
    "MLNX_WINMFT"                      = @{ Value = "D:\Program Files\Mellanox\WinMFT\"; Scope = "Machine" }
    "MSYS2_PATH_TYPE"                  = @{ Value = "inherit"; Scope = "Machine" }
    "PNPM_HOME"                        = @{ Value = "T:\Node\pnpm\bin"; Scope = "Machine" }
    "NUGET_PACKAGES"                   = @{ Value = "D:\Temp\Cache\nuget\packages"; Scope = "Machine" }
    "OLLAMA_MODELS"                    = @{ Value = "T:\LLMs"; Scope = "Machine" }
    "PYTHONHOME"                       = @{ Value = "T:\WinPython313"; Scope = "Machine" }
    "POETRY_HOME"                      = @{ Value = "T:\PyPaks"; Scope = "Machine" }
    "POETRY_VIRTUALENVS_PATH"          = @{ Value = "T:\PyPaks\venvs"; Scope = "Machine" }
    "UV_CACHE_DIR"                     = @{ Value = "T:\WinPython313\cache\pip"; Scope = "Machine" }
    "VSCODE_PORTABLE"                  = @{ Value = "S:"; Scope = "Machine" }
    "WINDSURF_PORTABLE"                = @{ Value = "T:\Windsurf"; Scope = "Machine" }
    "XDG_CACHE_HOME"                   = @{ Value = "D:\Temp\Cache"; Scope = "Machine" }
    "DOTNET_CLI_TELEMETRY_OPTOUT"      = @{ Value = "1"; Scope = "Machine" }
    "POWERSHELL_TELEMETRY_OPTOUT"      = @{ Value = "1"; Scope = "Machine" }
    # User-specific variables
    "HOME"                             = @{ Value = "D:\Desktop"; Scope = "User" }
    "TEMP"                             = @{ Value = "D:\Temp"; Scope = "User" }
    "TMP"                              = @{ Value = "D:\Temp"; Scope = "User" }
    "USERPROFILE"                      = @{ Value = "D:\Users\Ariel"; Scope = "User" }
    "VSCODE_APPDATA"                   = @{ Value = "S:\Ariel"; Scope = "User" }
}
foreach ($key in $envVars.Keys) {
    [Environment]::SetEnvironmentVariable($key, $envVars[$key].Value, $envVars[$key].Scope)
}

# Set the System PATH variable separately
Write-Host "  - Setting system PATH..."
$systemPath = "D:\Links;C:\Windows;C:\Windows\system32;C:\Windows\System32\WindowsPowerShell\v1.0\;D:\program Files\powerShell\7;D:\program Files\powerShell\Modules;C:\Program Files\dotnet;T:\dotnet-tools\tools;T:\Bun\bin;T:\Deno;T:\Node;T:\Node\node_modules\npm\bin;T:\PyPaks\Scripts;T:\UV;T:\WinPython313;T:\WinPython313\Scripts;C:\Windows\System32\Wbem;T:\Scoop\apps\python\current;T:\Scoop\apps\python\current\Scripts;T:\Scoop\shims"
[Environment]::SetEnvironmentVariable("Path", $systemPath, "Machine")


# ===================================================================
# Step 5: Drive Mappings and Final Tweaks
# ===================================================================
Write-Host "[Step 5] Setting up drive mappings and final tweaks..." -ForegroundColor Cyan

# Map Network Drives (Persist for all users)
Write-Host "  - Mapping network drives..."
New-PSDrive -Name 'B' -PSProvider FileSystem -Root '\\192.168.0.122\Baks' -Persist -Scope Global
New-PSDrive -Name 'H' -PSProvider FileSystem -Root '\\192.168.0.122\Software' -Persist -Scope Global
New-PSDrive -Name 'I' -PSProvider FileSystem -Root '\\192.168.0.122\ISOs' -Persist -Scope Global
New-PSDrive -Name 'U' -PSProvider FileSystem -Root '\\192.168.0.122\OneDrive' -Persist -Scope Global

# Create persistent virtual drives (SUBST equivalents) using corrected path
Write-Host "  - Creating persistent virtual drives (SUBST)..."
$dosDevicesPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices"
Set-ItemProperty -Path $dosDevicesPath -Name "P:" -Value "\??\G:\Dev\Projects" -Type String
Set-ItemProperty -Path $dosDevicesPath -Name "S:" -Value "\??\G:\Dev\Settings" -Type String
Set-ItemProperty -Path $dosDevicesPath -Name "T:" -Value "\??\G:\Dev\Tools" -Type String

# UI/UX and Policy Tweaks (These are HKCU, will apply to the admin running the script)
Write-Host "  - Applying UI/UX tweaks..."
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'FontSmoothing' -Value '2'
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\WindowMetrics' -Name 'MinAnimate' -Value '0'
$storePolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"
if (-not (Test-Path $storePolicyPath)) { New-Item -Path $storePolicyPath -Force | Out-Null }
Set-ItemProperty -Path $storePolicyPath -Name "AutoDownload" -Value 2 -Type DWord

# Create System Restore Point
Write-Host "  - Creating initial system restore point..."
Enable-ComputerRestore -Drive "C:", "D:"
Checkpoint-Computer -Description "Post-Installation Baseline" -RestorePointType "INSTALL"


# ===================================================================
# Step 6: Completion
# ===================================================================
Write-Host ""
Write-Host "========================================================" -ForegroundColor Green
Write-Host "  SCRIPT COMPLETE. A RESTART IS REQUIRED." -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Green
Write-Host ""
$response = Read-Host "Do you want to restart now? (y/n)"
if ($response -eq 'y') {
    Restart-Computer -Force
}