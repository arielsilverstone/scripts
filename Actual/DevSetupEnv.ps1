##
## Enable Tracing and Load Functions
## Modified by Ariel 03JUN25
#
#  . "D:\Program Files\Dev\Core\Functions.ps1"
# Track-Change -Name "Environment"
#
# Manage-Tracing -On
#
# Set-GlobalAliases
##
#
# ══════════════════════════════════════════════════════════════════════════
# Section 1: Git Setup
# ══════════════════════════════════════════════════════════════════════════
#
# Function Setup-Git {
#     $GitRegistryPath = "HKLM:\SOFTWARE\GitForWindows"
#     If (Test-Path $GitRegistryPath -Name "Git Registry") {
#         $GitInstallPath = Get-ItemProperty $GitRegistryPath -Name InstallPath -EA 0 | Select-Object -ExpandProperty InstallPath
#         If ($GitInstallPath -and ($GitInstallPath -notlike "$DevRootPath*")) {
#             $TargetGitPath = Join-Path "Dev" "Git"
#             If (Test-Path $GitInstallPath -Name "Existing Git Folder") {
#                 # Write-Log -Msg "Moved Git from $GitInstallPath to $TargetGitPath"
#                 Move $GitInstallPath -Dest $TargetGitPath -Force
#                 $GitInstallPath = $TargetGitPath
#             }
#         }
#         Test-Path (Join-Path "Global" "Git") -Name "Global Git Folder" -T Dir
#         Test-Path (Join-Path "User" "Git")   -Name "User Git Folder"   -T Dir
#         $GitGlobalConfig = "$env:ProgramData\Git\config"
#         $GlobalDest = Join-Path "Global" "Git\.config"
#         If (Test-Path $GitGlobalConfig -Name "Global Git Config") {
#             If (Test-Path $GlobalDest -Name "Existing Global Config") {
#                 Move $GlobalDest -Dest "$GlobalDest.bak" -Force
#             }
#             CP $GitGlobalConfig $GlobalDest -Force
#             # Write-Log -Msg "Copied global Git config to $GlobalDest"
#         }
#         $GitUserConfig = "$env:USERPROFILE\.gitconfig"
#         $UserDest      = Join-Path "User" "Git\.gitconfig"
#         If (Test-Path $GitUserConfig -Name "User Git Config") {
#             If (Test-Path $UserDest -Name "Existing User Config") {
#                 Move $UserDest -Dest "$UserDest.bak" -Force
#             }
#             CP $GitUserConfig $UserDest -Force
#             # Write-Log -Msg "Copied user Git config to $UserDest"
#         }
#         Test-Path $GitRegistryPath -Name "InstallPath" -Value $GitInstallPath
#     }
# }
#
# ══════════════════════════════════════════════════════════════════════════
# Section 2: Python Setup
# ══════════════════════════════════════════════════════════════════════════
#
Function Setup-Python {
    $PythonRegistryPath = "HKLM:\SOFTWARE\Python"
    If (Test-Path $PythonRegistryPath -Name "Python Registry") {
        $PythonInstallPath = Join-Path "Dev" "Python"
        If ($PythonInstallPath -and ($PythonInstallPath -notlike "$DevRootPath*")) {
            $TargetPythonPath = Join-Path "Dev" "Python"
            If (Test-Path $PythonInstallPath -Name "Existing Python Folder") {
                # Write-Log -Msg "Moved Python from $PythonInstallPath to $TargetPythonPath"
                Move $PythonInstallPath -Dest $TargetPythonPath -Force
                $PythonInstallPath = $TargetPythonPath
            }
        }
        Test-Path (Join-Path "Global" "Python") -Name "Global Python Folder" -T Dir
        Test-Path (Join-Path "User" "Python")   -Name "User Python Folder"   -T Dir
        $GlobalPipConfig = "$Env:ProgramData\pip\pip.ini"
        $GlobalDest      = Join-Path "Global" "Python\pip.ini"
        If (Test-Path $GlobalPipConfig -Name "Global pip.ini") {
            If (Test-Path $GlobalDest -Name "Existing pip.ini") {
                Move $GlobalDest -Dest "$GlobalDest.bak" -Force
            }
            CP $GlobalPipConfig $GlobalDest -Force
            # Write-Log -Msg "Copied pip.ini to $GlobalDest"
        }
        Test-Path $GlobalEnvPath -Name "PYTHONHOME" -Value $PythonInstallPath
        # Write-Log -Msg "Set PYTHONHOME to $PythonInstallPath"
    }
}
#
# ══════════════════════════════════════════════════════════════════════════
# Section 3: SQLite Setup
# ══════════════════════════════════════════════════════════════════════════
#
# Function Setup-SQLite {
#     $SQLitePath = Join-Path "Dev" "SQLite"
#     If ($SQLitePath -and ($SQLitePath -notlike "$DevRootPath*")) {
#         $TargetSQLitePath = Join-Path "Dev" "SQLite"
#         If (Test-Path $SQLitePath -Name "Existing SQLite Folder") {
#             # Write-Log -Msg "Moved SQLite from $SQLitePath to $TargetSQLitePath"
#             Move $SQLitePath -Dest $TargetSQLitePath -Force
#             $SQLitePath = $TargetSQLitePath
#         }
#     }
#     Test-Path $GlobalEnvPath -Name "SQLITE_HOME" -Value $SQLitePath
#     # Write-Log -Msg "Set SQLITE_HOME to $SQLitePath"
# }
#
# ══════════════════════════════════════════════════════════════════════════
# Section 4: Windsurf Setup
# ══════════════════════════════════════════════════════════════════════════
#
Function Setup-Windsurf {
    $WindsurfRoot   = "D:\Program Files\Dev\Windsurf"
    $WindsurfConfig = "$WindsurfRoot\settings.json"
    $UserDest       = Join-Path "User" "Windsurf\settings.json"
    If (Test-Path $WindsurfRoot) {
        Test-Path (Join-Path "User" "Windsurf") -Name "User Windsurf Folder" -T Dir
        If (Test-Path $WindsurfConfig) {
            If (Test-Path $UserDest) {
                Move $UserDest -Dest "$UserDest.bak" -Force
            }
            CP $WindsurfConfig $UserDest -Force
            # Write-Log -Msg "Copied Windsurf config to $UserDest"
        }
    }
}
#
# ══════════════════════════════════════════════════════════════════════════
# Section 5: HOMEPATH Setup
# ══════════════════════════════════════════════════════════════════════════
#
Function Setup-HomePath {
    $Drive = "D:"
    $Path  = "\\Users\\Ariel"
    ForEach ($Scope in "User", "Machine") {
        [Environment]::SetEnvironmentVariable("HOMEDRIVE", $Drive, $Scope)
        [Environment]::SetEnvironmentVariable("HOMEPATH",  $Path,  $Scope)
        # Write-Log -Msg "Set HOMEDRIVE=$Drive and HOMEPATH=$Path for $Scope"
    }
}
#
# ══════════════════════════════════════════════════════════════════════════
# Section 6: Function Execution
# ══════════════════════════════════════════════════════════════════════════
$FunctionList = @(
#    "Setup-Git",
    "Setup-Python",
#    "Setup-SQLite",
#    "Setup-Trae",
    "Setup-Windsurf",
#    "Setup-TEMP",
    "Setup-HomePath"
)
#
ForEach ($FuncName in $FunctionList) {
    Start-ThreadJob -Command (Get-Command $FuncName).ScriptBlock -Name $FuncName
}
#
# Below, relocations.  
# ══════════════════════════════════════════════════════════════════════════
# Section 7: Relocate Windsurf to Dev
# ══════════════════════════════════════════════════════════════════════════
#
$AppMoves = @(
    @{
        Name         = "Windsurf"
        OldName      = "Windsurf"
        SourcePath   = "D:\Program Files\Dev\VS\Windsurf"
        RenamedPath  = "D:\Program Files\Dev\VS\Windsurf"
        FinalPath    = "D:\Program Files\Dev\Windsurf"
        EnvVarName   = "WINDSURF_PORTABLE"
    }
)
#
foreach ($App in $AppMoves) {
    $Name        = $App.Name
    $OldPath     = $App.SourcePath
    $RenamedPath = $App.RenamedPath
    $FinalPath   = $App.FinalPath
    $EnvVar      = $App.EnvVarName
#
    if ((Test-Path $OldPath) -and ($OldPath -ne $RenamedPath)) {
        Echo "Renaming $OldPath to $RenamedPath"
        Rename $OldPath -NewName (Split-Path $RenamedPath -Leaf)
    }
#
    if ((Test-Path $RenamedPath) -and (-not (Test-Path $FinalPath))) {
        Echo "Moving $Name to $FinalPath"
        Move-Item $RenamedPath -Destination $FinalPath -Force
    } elseif (Test-Path $FinalPath) {
        Echo "$Name already exists at $FinalPath. Skipping move."
    } else {
        Echo "$Name not found at expected location. Skipping."
    }
#
    [System.Environment]::SetEnvironmentVariable($EnvVar, $FinalPath, "Machine")
    Echo "Set env var $EnvVar to $FinalPath"
}
#
# ══════════════════════════════════════════════════════════════════════════
# Section 10: Relocate Settings Files from Dev\VS to Dev\Settings\System
# ══════════════════════════════════════════════════════════════════════════
#
# $OldVSFolder     = "D:\Program Files\Dev\VS"
# $NewSettingsRoot = "D:\Program Files\Dev\Settings\System"
# #
# if (-not (Test-Path $NewSettingsRoot)) {
#     New-Item $NewSettingsRoot -ItemType Directory -Force | Out-Null
#     Echo "Created $NewSettingsRoot"
# }
# #
# $Files = @("settings.json", "temp.json")
# #
# foreach ($File in $Files) {
#     $Source = Join-Path $OldVSFolder $File
#     $Dest   = Join-Path $NewSettingsRoot $File
# #
#     if (Test-Path $Source) {
#         Move-Item $Source -Destination $Dest -Force
#         Echo "Moved $File to $NewSettingsRoot"
#     } else {
#         Echo "$File not found at $Source"
#     }
# }
# #
# if ((Test-Path $OldVSFolder) -and (-not (Get-ChildItem $OldVSFolder))) {
#     Remove-Item $OldVSFolder -Force
#     Echo "Removed empty folder: $OldVSFolder"
# }
#
# ══════════════════════════════════════════════════════════════════════════
# Manage-Tracing -Off
# ══════════════════════════════════════════════════════════════════════════
##
#  				End of File
