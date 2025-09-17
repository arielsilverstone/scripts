# Redirect Desktop for ALL users to D:\Desktop and Ariel's Roaming AppData to D:\AppData
# Safe: Roaming AppData only. Do NOT touch Local AppData.

$ErrorActionPreference = 'Stop'

# Targets
$DesktopTarget = 'D:\Desktop'
$ArielAppData  = 'D:\AppData'

# Ensure folders
foreach ($p in @($DesktopTarget, $ArielAppData)) {
    if (-not (Test-Path $p)) { New-Item -ItemType Directory -Path $p | Out-Null }
}

# Helper: set a REG_EXPAND_SZ value under a loaded hive path
function Set-UserShellValue {
    param(
         [Parameter(Mandatory)][string]$HiveRoot,   # e.g., 'HKU\S-1-5-21-...\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders'
         [Parameter(Mandatory)][string]$Name,
         [Parameter(Mandatory)][string]$Data
    )
    reg.exe add "$HiveRoot" /v "$Name" /t REG_EXPAND_SZ /d "$Data" /f | Out-Null
}

# 1) Default User (affects NEW users)
$DefaultHive = 'HKU\_DEF'
reg.exe load $DefaultHive 'C:\Users\Default\NTUSER.DAT' | Out-Null
try {
    $USF = "$DefaultHive\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
    Set-UserShellValue -HiveRoot $USF -Name 'Desktop' -Data $DesktopTarget
} finally {
    reg.exe unload $DefaultHive | Out-Null
}

# 2) Existing users (including current)
#    Iterate HKEY_USERS and set Desktop. Skip system SIDs.
$Skip = @(
    'S-1-5-18','S-1-5-19','S-1-5-20' # LocalSystem, LocalService, NetworkService
)
$UserHives = (reg.exe query HKU | Where-Object { $_ -match '^HKEY_USERS\\S-1-5-21' }) -replace 'HKEY_USERS\\',''
foreach ($sid in $UserHives) {
    if ($Skip -contains $sid) { continue }
    $USF = "HKU\$sid\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
    # All users: Desktop -> D:\Desktop
    Set-UserShellValue -HiveRoot $USF -Name 'Desktop' -Data $DesktopTarget
}

# 3) Ariel only: Roaming AppData -> D:\AppData
#    Find Ariel's SID
$Ariel = 'Ariel'
$ArielSid = (wmic useraccount where "name='$Ariel'" get sid /value | findstr /i sid=) -replace 'SID=',''
if ($ArielSid) {
    $USF = "HKU\$ArielSid\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
    Set-UserShellValue -HiveRoot $USF -Name 'AppData' -Data $ArielAppData
} else {
    Write-Host "Warning: Could not resolve SID for user '$Ariel'. AppData redirect not applied."
}

Write-Host "Done. Log off/on for changes to fully apply."
