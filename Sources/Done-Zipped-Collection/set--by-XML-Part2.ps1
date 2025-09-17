# =============================================================================
# File: Full-System-Config.ps1
# Purpose: A comprehensive post-installation script for Windows Server 2025 that
#          installs and removes specific features, and applies detailed registry
#          and environment configurations based on user-provided specifications.
# =============================================================================
# SECTION 1: Feature Installation
# Purpose: Installs required Windows Features and Capabilities. Some features from
#          the original request are client-OS specific and have been adapted or
#          noted below.
# =============================================================================
#
Write-Host "[Step 1] Installing Windows Features and Capabilities..." -ForegroundColor Cyan

# --- Check for Administrator privileges ---
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script must be run as an Administrator. Please re-launch PowerShell as an Administrator and try again."
    Start-Sleep -Seconds 10
    Exit
}

# --- Check for Hyper-V and install if it's a dependency for Containers ---
Write-Host "  - Checking for Hyper-V dependency..."
$hyperV = Get-WindowsFeature -Name Hyper-V
if (-not $hyperV.Installed) {
    Write-Host "    - Hyper-V not found. Installing Hyper-V role and management tools..."
    Install-WindowsFeature -Name Hyper-V, Hyper-V-PowerShell, RSAT-Hyper-V-Tools -IncludeManagementTools -Restart
    Write-Host "    - A restart is required to complete the Hyper-V installation. Please restart and run this script again." -ForegroundColor Yellow
    Start-Sleep -Seconds 20
    Exit
} else {
    Write-Host "    - Hyper-V is already installed."
}

# The server equivalent for Containers is simply "Containers". Sandbox is not available on Server.
Write-Host "  - Installing Containers..."
Install-WindowsFeature -Name Containers -ErrorAction SilentlyContinue

# Language features are "Capabilities", not "Features", and are installed differently.
Write-Host "  - Installing language capabilities..."
$languageCapabilities = @(
    "Language.Speech~~~en-GB~0.0.1.0",
    "Language.Speech~~~he-IL~0.0.1.0",
    "Language.TextToSpeech~~~en-GB~0.0.1.0",
    "Language.TextToSpeech~~~he-IL~0.0.1.0",
    "Language.OCR~~~en-US~0.0.1.0",
    "Language.OCR~~~he-IL~0.0.1.0"
)
foreach ($cap in $languageCapabilities) {
    Write-Host "    - Adding $cap"
    Add-WindowsCapability -Online -Name $cap -ErrorAction SilentlyContinue
}

# =============================================================================
# SECTION 2: Feature and Package Removal
# Purpose: Removes unnecessary features, roles, and provisioned AppX packages from
#          the system and the base image to reduce footprint.
# =============================================================================
#
Write-Host "[Step 2] Removing unnecessary Windows Features and Packages..." -ForegroundColor Cyan

# Define Server Features to remove. The -Remove switch deletes the payload from WinSxS.
# This list now includes features that are part of the "Desktop Experience".
$featuresToRemove = @(
    "BitLocker",                # BitLocker Drive Encryption
    "EnhancedStorage",          # Enhanced Storage
    "Fax",                      # Fax Service
    "InkAndHandwritingServices",# Ink Support (for TabletPC)
    "IPAM-Server-Feature",      # IPAM Server
    "NLB",                      # Network Load Balancing
    "SMTP-Server",              # SMTP Server
    "TabletPC-Platform",        # Tablet PC Components
    "Telnet-Server",            # Telnet Server
    "Windows-Search-Service",   # Windows Search Service
    "Windows-Maps-Service",     # Maps Broker Service (if feature exists)
    "Windows-Identity-Foundation" # Support for some legacy apps
)

Write-Host "  - Removing Server Features..."
foreach ($feature in $featuresToRemove) {
    Write-Host "    - Removing $feature"
    Remove-WindowsFeature -Name $feature -Remove -ErrorAction SilentlyContinue
}

# Define AppX and Provisioned Packages to remove.
# UWP apps like Maps, QuickAssist etc. can be removed this way if they are present.
$appsToRemove = @(
    "*OneDrive*",                # OneDrive
    "*SkypeApp*",                # Skype
    "*StorePurchaseApp*",        # Store-related app
    "*WindowsStore*",            # The Store itself
    "*NET.Native.Framework*",    # UWP Dependency
    "*GamingApp*",               # GamingApp
    "*Xbox*",                    # All Xbox related apps
    "*Zune*",                    # Zune apps
    "*Bing*",                    # All Bing related apps
    "*Maps*",                    # Windows Maps AppX package
    "*QuickAssist*",             # Quick Assist AppX package
    "*People*",                  # Microsoft People
    "*YourPhone*",               # Your Phone / Phone Link
    "*GetHelp*",                 # Get Help app
    "*OfficeHub*"                # Office Hub
)

Write-Host "  - Removing Provisioned AppX Packages..."
foreach ($appName in $appsToRemove) {
    Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like $appName } | ForEach-Object {
        Write-Host "    - Removing provisioned package: $($_.DisplayName)"
        Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction SilentlyContinue
    }
    Get-AppxPackage -AllUsers -Name $appName | ForEach-Object {
        Write-Host "    - Removing installed package: $($_.Name)"
        Remove-AppxPackage -Package $_.PackageFullName -AllUsers -ErrorAction SilentlyContinue
    }
}

# =============================================================================
# SECTION 3: Registry and Environment Configuration
# Purpose: Applies specific system configurations via registry modification,
#          including setup bypasses, environment variables, and UI tweaks.
# =============================================================================
#
Write-Host "[Step 3] Applying Registry and Environment configurations..." -ForegroundColor Cyan

# --- Setup Bypass Checks (Note: These are for the setup process, no effect post-install) ---
Write-Host "  - Applying LabConfig setup bypass keys..."
$labConfigPath = "HKLM:\SYSTEM\Setup\LabConfig"
if (-not (Test-Path $labConfigPath)) { New-Item -Path $labConfigPath -Force | Out-Null }
Set-ItemProperty -Path $labConfigPath -Name "BypassTPMCheck" -Value 1 -Type DWord
Set-ItemProperty -Path $labConfigPath -Name "BypassSecureBootCheck" -Value 1 -Type DWord
Set-ItemProperty -Path $labConfigPath -Name "BypassCPUCheck" -Value 1 -Type DWord
Set-ItemProperty -Path $labConfigPath -Name "BypassRAMCheck" -Value 1 -Type DWord
Set-ItemProperty -Path $labConfigPath -Name "BypassStorageCheck" -Value 1 -Type DWord

# --- Environment Variables ---
Write-Host "  - Setting custom environment variables..."
[Environment]::SetEnvironmentVariable("HOME", "D:\Desktop", "Machine")
[Environment]::SetEnvironmentVariable("HOMEDRIVE", "D:", "Machine")
[Environment]::SetEnvironmentVariable("HOMEPATH", "\Users\Ariel", "Machine")

# --- UI and Policy Tweaks ---
# HKCU settings will apply to the user running the script (Administrator)
Write-Host "  - Applying UI and Policy tweaks..."
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'FontSmoothing' -Value '2'
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\WindowMetrics' -Name 'MinAnimate' -Value '0'

$storePolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"
if (-not (Test-Path $storePolicyPath)) { New-Item -Path $storePolicyPath -Force | Out-Null }
Set-ItemProperty -Path $storePolicyPath -Name "AutoDownload" -Value 2 -Type DWord

Write-Host ""
Write-Host "--- Configuration Script Finished ---" -ForegroundColor Green
Write-Host "A restart may be required for all changes to take effect." -ForegroundColor Yellow
#
#
## End of Full-System-Config.ps1