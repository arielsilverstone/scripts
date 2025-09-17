# Save this as Fix-PackageManagement.ps1 and run as administrator

# 1. Create backup folder
$backupDir = "$env:USERPROFILE\Documents\PSModuleBackup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item -Path $backupDir -ItemType Directory -Force | Out-Null
Write-Host "Created backup directory: $backupDir" -ForegroundColor Cyan

# 2. Backup existing modules
Write-Host "Backing up existing modules..." -ForegroundColor Cyan
if (Test-Path "C:\Program Files\WindowsPowerShell\Modules\PackageManagement") {
    Copy-Item -Path "C:\Program Files\WindowsPowerShell\Modules\PackageManagement" -Destination "$backupDir\PackageManagement_Windows" -Recurse -Force
}
if (Test-Path "D:\Program Files\PowerShell\7\Modules\PackageManagement") {
    Copy-Item -Path "D:\Program Files\PowerShell\7\Modules\PackageManagement" -Destination "$backupDir\PackageManagement_PS7" -Recurse -Force
}
if (Test-Path "C:\Program Files\WindowsPowerShell\Modules\PowerShellGet") {
    Copy-Item -Path "C:\Program Files\WindowsPowerShell\Modules\PowerShellGet" -Destination "$backupDir\PowerShellGet_Windows" -Recurse -Force
}
if (Test-Path "D:\Program Files\PowerShell\7\Modules\PowerShellGet") {
    Copy-Item -Path "D:\Program Files\PowerShell\7\Modules\PowerShellGet" -Destination "$backupDir\PowerShellGet_PS7" -Recurse -Force
}

# 3. Remove existing modules
Write-Host "Removing existing modules..." -ForegroundColor Cyan
if (Test-Path "C:\Program Files\WindowsPowerShell\Modules\PackageManagement") {
    Remove-Item -Path "C:\Program Files\WindowsPowerShell\Modules\PackageManagement" -Recurse -Force
}
if (Test-Path "C:\Program Files\WindowsPowerShell\Modules\PowerShellGet") {
    Remove-Item -Path "C:\Program Files\WindowsPowerShell\Modules\PowerShellGet" -Recurse -Force
}

# 4. Download fresh copies of the modules
Write-Host "Downloading fresh modules..." -ForegroundColor Cyan
$tempDir = "$env:TEMP\PSModules"
if (-not (Test-Path $tempDir)) {
    New-Item -Path $tempDir -ItemType Directory -Force | Out-Null
}

# Download PackageManagement
$pmUrl = "https://www.powershellgallery.com/api/v2/package/PackageManagement/1.4.7"
$pmZip = "$tempDir\PackageManagement.zip"
Invoke-WebRequest -Uri $pmUrl -OutFile $pmZip

# Download PowerShellGet
$psgUrl = "https://www.powershellgallery.com/api/v2/package/PowerShellGet/2.2.5"
$psgZip = "$tempDir\PowerShellGet.zip"
Invoke-WebRequest -Uri $psgUrl -OutFile $psgZip

# 5. Install the modules
Write-Host "Installing fresh modules..." -ForegroundColor Cyan
$windowsPSModulePath = "C:\Program Files\WindowsPowerShell\Modules"

# Install PackageManagement
$pmDir = "$windowsPSModulePath\PackageManagement\1.4.7"
if (-not (Test-Path $pmDir)) {
    New-Item -Path $pmDir -ItemType Directory -Force | Out-Null
}
Expand-Archive -Path $pmZip -DestinationPath $pmDir -Force

# Install PowerShellGet
$psgDir = "$windowsPSModulePath\PowerShellGet\2.2.5"
if (-not (Test-Path $psgDir)) {
    New-Item -Path $psgDir -ItemType Directory -Force | Out-Null
}
Expand-Archive -Path $psgZip -DestinationPath $psgDir -Force

# 6. Clean up
Remove-Item -Path $tempDir -Recurse -Force

# 7. Test the installation
Write-Host "Testing installation..." -ForegroundColor Cyan
Write-Host "Restarting PowerShell is required. After restarting, run these commands:" -ForegroundColor Yellow
Write-Host "Get-Module -Name PackageManagement, PowerShellGet -ListAvailable" -ForegroundColor White
Write-Host "Get-Command -Module PackageManagement | Format-Table Name" -ForegroundColor White
Write-Host "Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force" -ForegroundColor White
Write-Host "Install-Module -Name PSScriptAnalyzer -Force -Scope CurrentUser" -ForegroundColor White

Write-Host "`nFix complete! Please RESTART PowerShell to apply the changes." -ForegroundColor Green