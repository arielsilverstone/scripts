<#
╔═════════════════════════════════════════════════════════════════════════════╗
║                             IDE-Env.ps1 V.2                                 ║
║ Project: Comparisons                                                        ║
║ Purpose: Contains IDE-related environment setup functions: IDEEnvVars,      ║
║          Trae, Windsurf, VSCode, and Visual Studio.                         ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Define IDE-related global paths if needed
$GlobalSettings = "D:\Program Files\Dev\Settings\Global"
$UserSettings   = "D:\Program Files\Dev\Settings\Ariel"
$DevRoot        = "D:\Program Files\Dev"

<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 1: Setup-IDEEnvVars                                                ║
║ Purpose:      Configure Visual Studio and VSCode environment variables      ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Setup-IDEEnvVars: Configure Visual Studio and VSCode environment variables (moved from master)
Function Setup-IDEEnvVars {
    # Visual Studio setup
    $UserVS   = JP "User"   "VS"
    $GlobalVS = JP "Global" "VS"
    $VS       = "SOFTWARE\Microsoft\VisualStudio"
    $Roots    = @("HKCU", "HKLM")
    $VSVals   = @($UserVS, $GlobalVS)
    If (TPSP -Path "HKLM:\$VS" -Name "VS Registry") {
        $VSRegSubkey = "$VS\*"
        $Roots | ForEach {
            $regPath = JP $_ $VSRegSubkey
            TPSP -Path $regPath -Name "UserSettingsRoot" -Value $VSVals[[array]::IndexOf($Roots, $_)]
        }
    }
    # VSCode setup
    $IDEVars = @{
        VSCODE_PORTABLE = 'D:\\Program Files\\Dev\\Settings'
    }
    $IDEVars.GetEnumerator() | ForEach {
        TPSP -Path $UserEnv -Name $_.Key -Value $_.Value
    }
}

<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 2: Trae Setup                                                      ║
║ Purpose:      Set environment variables for Trae                            ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Setup-Trae: Set environment variables for Trae (moved from master)
Function Setup-Trae {
    $TraeRoot   = JP  "Dev"   "Trae"
    $TraeConfig = "$TraeRoot\config.ini"
    $UserDest   = JP   "User" "Trae\config.ini"
    If (TPSP -Path $TraeRoot -Name "Trae") {
        TPSP -Path (JP "User" "Trae") -Name "User Trae Folder" -T Dir
        If (TPSP -Path $TraeConfig -Name "Trae Config") {
            If (TPSP -Path $UserDest -Name "Existing Trae Config") {
                Move -Path $UserDest -Dest "$UserDest.bak" -Force
            }
            Copy $TraeConfig $UserDest -Force
        }
    }
}

<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 2: Windsurf Setup                                                   ║
║ Purpose:      Set environment variables for Windsurf                         ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Setup-Windsurf: Set environment variables for Windsurf (moved from master)
Function Setup-Windsurf {
    $WindsurfRoot   = JP "Dev" "Windsurf"
    $WindsurfConfig = "$WindsurfRoot\settings.json"
    $UserDest       = JP "User" "Windsurf\settings.json"
    If (TPSP -Path $WindsurfRoot -Name "Windsurf") {
        TPSP -Path (JP "User" "Windsurf") -Name "User Windsurf Folder" -T Dir
        If (TPSP -Path $WindsurfConfig -Name "Windsurf Config") {
            If (TPSP -Path $UserDest   -Name "Existing Windsurf Config") {
                Move -Path $UserDest   -Dest "$UserDest.bak" -Force
            }
            Copy $WindsurfConfig $UserDest -Force
        }
    }
}

<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 3: VSCode Setup                                                     ║
║ Purpose:      Configure Visual Studio Code installation and settings          ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Setup-VSCode: Configure Visual Studio Code installation and settings (moved from master)
Function Setup-VSCode {
    $VSCodeBin   = "$Env:ProgramFiles\Microsoft VS Code\bin\code.exe"
    $SourcePath  = JP "Dev"   "VSCode\settings.json"
    $DestPath    = JP "User"  "VSCode\settings.json"
    If (TPSP -Path $VSCodeBin -Name "VSCode Executable") {
        TPSP -Path (JP "User" "VSCode") -Name "User VSCode Folder" -T Dir
        If (TPSP -Path $SourcePath   -Name "VSCode Settings File") {
            If (TPSP -Path $DestPath -Name "Existing VSCode Settings") {
                Move -Path $DestPath -Dest "$DestPath.bak" -Force
            }
            CP $SourcePath $DestPath -Force
        }
    }
}

<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 4: Visual Studio Setup                                              ║
║ Purpose:      Configure Visual Studio installation and registry              ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Setup-VS: Configure Visual Studio installation and registry (moved from master)
Function Setup-VS {
    $UserVs   = JP "User"   "VS"
    $GlobalVs = JP "Global" "VS"
    $Vs       = "SOFTWARE\Microsoft\VisualStudio"
    $Roots    = @("HKCU", "HKLM")
    $VsVals   = @($UserVs, $GlobalVs)
    If (TPSP -Path "HKLM:\$Vs" -Name "VS Registry") {
        $VsRegSubkey = "$Vs\*"
        $Roots | ForEach-Object {
            $regPath = JP $_ $VsRegSubkey
            TPSP -Path $regPath -Name "UserSettingsRoot" -Value $VsVals[[array]::IndexOf($Roots, $_)]
        }
    }
}
