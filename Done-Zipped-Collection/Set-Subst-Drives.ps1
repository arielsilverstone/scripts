#=================================================================================
# Create-PersistentDrives.ps1
#
# This script creates persistent virtual drives (like SUBST) using the registry.
# These drives will be available after restarting the computer.
# MUST be run as an Administrator.
#=================================================================================

# --- Check for Administrator privileges ---
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script must be run as an Administrator. Please re-launch PowerShell as an Administrator and try again."
    # Pause for 10 seconds to allow the user to read the message before the window closes.
    Start-Sleep -Seconds 10
    Exit
}

# --- Define the drive mappings ---
# You can add or change drives and paths here as needed.
$driveMappings = @{
    "P:" = "G:\Dev\Projects";
    "S:" = "G:\Dev\Settings";
    "T:" = "G:\Dev\Tools";
}

# --- Set the registry path for persistent DOS Devices ---
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices"

Write-Host "Creating persistent drive mappings..." -ForegroundColor Yellow

# --- Loop through the mappings and create the registry entries ---
foreach ($driveLetter in $driveMappings.Keys) {
    $folderPath = $driveMappings[$driveLetter]
    # The "\??\" prefix is required for this type of registry mapping.
    $value = "\??\$folderPath"

    Write-Host "Mapping $driveLetter to $folderPath" -ForegroundColor Cyan
    Set-ItemProperty -Path $registryPath -Name $driveLetter -Value $value -Type String
}

Write-Host ""
Write-Host "SUCCESS: Registry values have been created." -ForegroundColor Green
Write-Host "You must restart your computer for the new drives to appear." -ForegroundColor Yellow