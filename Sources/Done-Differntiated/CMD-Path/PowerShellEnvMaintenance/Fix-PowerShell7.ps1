# Save this as Fix-PowerShell7.ps1 and run as administrator

# 1. Create backup folder
$backupDir = "$env:USERPROFILE\Documents\PS7ModuleBackup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item -Path $backupDir -ItemType Directory -Force | Out-Null
Write-Host "Created backup directory: $backupDir" -ForegroundColor Cyan

# 2. Backup existing PowerShell 7 modules
Write-Host "Backing up existing PowerShell 7 modules..." -ForegroundColor Cyan
if (Test-Path "D:\Program Files\PowerShell\7\Modules\PackageManagement") {
    Copy-Item -Path "D:\Program Files\PowerShell\7\Modules\PackageManagement" -Destination "$backupDir\PackageManagement_PS7" -Recurse -Force
}
if (Test-Path "D:\Program Files\PowerShell\7\Modules\PowerShellGet") {
    Copy-Item -Path "D:\Program Files\PowerShell\7\Modules\PowerShellGet" -Destination "$backupDir\PowerShellGet_PS7" -Recurse -Force
}

# 3. Remove existing corrupted modules
Write-Host "Removing existing corrupted modules..." -ForegroundColor Cyan
if (Test-Path "D:\Program Files\PowerShell\7\Modules\PackageManagement") {
    Remove-Item -Path "D:\Program Files\PowerShell\7\Modules\PackageManagement" -Recurse -Force
}
if (Test-Path "D:\Program Files\PowerShell\7\Modules\PowerShellGet") {
    Remove-Item -Path "D:\Program Files\PowerShell\7\Modules\PowerShellGet" -Recurse -Force
}

# 4. Download fresh copies of the modules
Write-Host "Downloading fresh modules..." -ForegroundColor Cyan
$tempDir = "$env:TEMP\PS7Modules"
if (-not (Test-Path $tempDir)) {
    New-Item -Path $tempDir -ItemType Directory -Force | Out-Null
}

# Download PackageManagement
$pmUrl = "https://www.powershellgallery.com/api/v2/package/PackageManagement/1.4.8.1"
$pmZip = "$tempDir\PackageManagement.zip"
Invoke-WebRequest -Uri $pmUrl -OutFile $pmZip

# Download PowerShellGet
$psgUrl = "https://www.powershellgallery.com/api/v2/package/PowerShellGet/2.2.5"
$psgZip = "$tempDir\PowerShellGet.zip"
Invoke-WebRequest -Uri $psgUrl -OutFile $psgZip

# 5. Install the modules to PowerShell 7 directory
Write-Host "Installing fresh modules to PowerShell 7..." -ForegroundColor Cyan
$ps7ModulePath = "D:\Program Files\PowerShell\7\Modules"

# Install PackageManagement
$pmDir = "$ps7ModulePath\PackageManagement"
if (-not (Test-Path $pmDir)) {
    New-Item -Path $pmDir -ItemType Directory -Force | Out-Null
}
Expand-Archive -Path $pmZip -DestinationPath $pmDir -Force

# Install PowerShellGet
$psgDir = "$ps7ModulePath\PowerShellGet"
if (-not (Test-Path $psgDir)) {
    New-Item -Path $psgDir -ItemType Directory -Force | Out-Null
}
Expand-Archive -Path $psgZip -DestinationPath $psgDir -Force

# 6. Clean up
Remove-Item -Path $tempDir -Recurse -Force

# 7. Launch PowerShell 7 to test the installation
Write-Host "Opening PowerShell 7 to test the installation..." -ForegroundColor Cyan
Write-Host "In PowerShell 7, run these commands to verify:" -ForegroundColor Yellow
Write-Host "Get-Module -Name PackageManagement, PowerShellGet -ListAvailable" -ForegroundColor White
Write-Host "Get-Command -Module PackageManagement | Format-Table Name" -ForegroundColor White
Write-Host "Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force" -ForegroundColor White
Write-Host "Install-Module -Name PSScriptAnalyzer -Force -Scope CurrentUser" -ForegroundColor White

Write-Host "`nFix complete! Now launching PowerShell 7..." -ForegroundColor Green
Start-Process -FilePath "D:\Program Files\PowerShell\7\pwsh.exe"