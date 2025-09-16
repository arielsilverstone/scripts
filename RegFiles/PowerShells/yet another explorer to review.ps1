
# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ Job 23: Advanced Explorer Settings                                                ║
# ║ Configures advanced settings in Windows Explorer                                  ║
# ╚═══════════════════════════════════════════════════════════════════════════════════╝
# 
$ExpAdvancedPath = JP $CV "Explorer\Advanced"

# Explorer settings hashtable (two-column layout)
$ExplorerSettings = @{
    'AllowGameDVR'                    = 0;    'SeparateProcess'              = 1;    
    'AlwaysShowMenus'                 = 1;    'ServerAdminUI'                = 1;   
    'AutoCheckSelect'                 = 1;    'SharingWizardOn'              = 0;
    'DesktopLivePreviewHoverTime'     = 0;    'ShowCompColor'                = 1;
    'DisableNotificationCenter'       = 1;    'ShowCopilotButton'            = 0;
    'DisablePreviewDesktop'           = 0;    'ShowCortanaButton'            = 0;
    'DisableThumbnailCache'           = 0;    'ShowEncryptCompressedColor'   = 1;
    'DisableThumbsDBOnNetworkFolders' = 1;    'ShowInfoTip'                  = 0;    
    'SilentInstalledAppsEnabled'      = 0;    'ShowPreviewHandlers'          = 0;    
    'DisallowShaking'                 = 1;    'ShowSecondsInSystemClock'     = 0;    
    'displayIconThumb'                = 1;    'ShowStatusBar'                = 1;
    'DontPrettyPath'                  = 0;    'ShowSuperHidden'              = 1;
    'DontUsePowerShellOnWinX'         = 1;    'ShowSystrayDateTimeValueName' = 1;
    'EnableBalloonTips'               = 0;    'ShowTypeOverlay'              = 0;
    'EnableSnapAssistFlyout'          = 0;    'SnapAssist'                   = 1; 
    'EncryptionContextMenu'           = 0;    'SnapFill'                     = 0;
    'useSharingWizard'                = 1;    'UseCheckBoxes'                = 1;
    'WebView'                         = 0
}

$AdditionalSettings = @{
    'CopyBufferSize' = 100000
    'TypeAhead'      = 10
}
	
Start-Throt {
    Param ($Roots, $ExpAdvancedPath, $TaskbarPath, $ExplorerSettings, $AdditionalSettings)
    ForEach ($BaseHive in $Roots) {
        $FullPath = JP $BaseHive $ExpAdvancedPath
        TPSP -Path $FullPath
        Write-Log -Path $LogPath -Value "Path operation completed: $FullPath"
        
        ForEach ($Name in $ExplorerSettings.Keys) {
            $Value = $ExplorerSettings[$Name]
            TPSP -Path $FullPath -Name $Name -Value $Value
            Write-Log -Path $LogPath -Value "Set registry value for path: $FullPath"
        }
        
        # Apply additional settings
        ForEach ($Name in $AdditionalSettings.Keys) {
            $Value = $AdditionalSettings[$Name]
            TPSP -Path $FullPath -Name $Name -Value $Value
            Write-Log -Path $LogPath -Value "Set registry value for path: $FullPath"
        }
        
        # Additional Taskbar-related settings
        TPSP -Path (JP $TaskbarPath "People")                   -Name "PeopleBand"      -Value 0 
        TPSP -Path (JP $TaskbarPath "People\ShoulderTap")       -Name "ShoulderTap"    -Value 0 
        TPSP -Path (JP $TaskbarPath "TaskbarDeveloperSettings") -Name "TaskbarEndTask" -Value 1 
    }
} -Name "Explorer Advanced" -Arg @($Roots, $ExpAdvancedPath, $TaskbarPath, $ExplorerSettings, $AdditionalSettings)
#
# 6 Paths                              Total so far: 268+6=274
# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ Job 24: Theme Settings                                                            ║
# ║ Configures visual themes and appearance                                           ║
# ╚═══════════════════════════════════════════════════════════════════════════════════╝
# 
Start-Throt {
    # Only HKCU
    $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion"
    $PathD8 = JP $Path "Themes" "Personalize"
    
    TPSP -Path $PathD8 -Name "AppsUseLightTheme"    -Value 1 
    TPSP -Path $PathD8 -Name "ColorPrevalence"      -Value 1 
    TPSP -Path $PathD8 -Name "EnableTransparency"   -Value 0 
    TPSP -Path $PathD8 -Name "SystemUsesLightTheme" -Value 1 
    Write-Log -Path $LogPath -Value "Set registry value for path: $PathD8"
} -Name "CV to place elseware"

# 1 Path                               Total so far: 274+1=275

# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ Job 25: Input Settings                                                            ║ 
# ║ Configures keyboard and input method behaviors                                    ║
# ╚═══════════════════════════════════════════════════════════════════════════════════╝
# 
Start-Throt {
    $RegistryPath  = "Software\Microsoft\Input\Settings"  # Common registry path
    $RegistryValues = @{
        "AutoAccent"                        = 1;    "KeyboardMode"                  = 0;
        "AutoApostrophe"                    = 1;    "LMDataLoggerEnabled"          = 0;
        "AutoCap"                           = 1;    "MultilingualEnabled"          = 1;
        "AutoCapAllTokens"                  = 1;    "PeriodShortcut"               = 1;
        "AutoCorrection"                    = 1;    "ProofDataSources"             = 0;
        "AutoCorrectFirstWord"              = 1;    "Private"                      = 1;
        "AutoCorrectVisualDelay"            = 1;    "SearchDataSources"            = 0;
        "DictationEnabled"                  = 0;    "ShortenMultilingualTraversal" = 1;
        "EmojiSuggestion"                   = 0;    "TPSPellcheck"                 = 1;
        "EmojiTranslation"                  = 0;    "Start_AccountNotifications"   = 0;
        "Start_NotifyNewApps"               = 0;    "Start_IrisRecommendations"    = 0;
        "Start_SearchFiles"                 = 0;    "Start_SearchPrograms"         = 1;
        "Start_ShowMyGames"                 = 0;    "Start_TrackDocs"              = 0;
        "Start_TrackProgs"                  = 0;    "EnableHwkbAutocorrection"     = 1;
        "EnableHwkbAutocorrection2"         = 0;    "EnableHwkbMode"               = 1; 
        "EnableHwkbTextPrediction"          = 1;    "HarvestContacts"              = 0;
        "HasTrailer"                        = 1;    "InsightsEnabled"              = 0;
        "HwkbInlinePredictionAlwaysOffList" = 1;    "EnableExpressiveInputEmojiMultipleSelection" = 0;
    }

	# Process Each Registry Root (HKCU & HKLM)
	ForEach ($Root in $Roots) {
		$FullPath = JP $Root $RegistryPath
	
		# Ensure registry path exists;  errors if creation fails
		TPSP 	  	  -Path $FullPath
		Write-Log     -Path "D:\Desktop\Trace.log" -Value "Path operation completed: $FullPath"
		# Loop through registry values and set them
		ForEach ($Key in $RegistryValues.Keys) {
			TPSP 	  -Path $FullPath -Name $Key -Value $RegistryValues[$Key]
			Write-Log -Path "D:\Desktop\Trace.log" -Value "Set registry value for path: $FullPath"
		}
	} -Name "Input" -Arg @($Roots,$RegistryValues)
#
# 2 Paths                              Total so far: 275+2=277
# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ Job 26: Shell Icon Settings                                                       ║
# ║ Purpose: Configures shell icon cache and overlay behavior                         ║
# ╚═══════════════════════════════════════════════════════════════════════════════════╝
#
Start-Throt {
    $Path   = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons"
    $Values = @{
        # Cache settings
        "Max Cached Icons"  = 4096;
        "IconCacheSize"     = 4096;
        "IconCacheAge"      = 7;
        # Overlay settings
        "OverlayIcon"       = "%SystemRoot%\system32\imageres.dll,-1001";
        "OverlayIconIndex"  = 0
    }

    ForEach ($Key in $Values.Keys) {
        TPSP -Path $Path -Name $Key -Value $Values[$Key]
        Write-Log -Path $LogPath -Value "$LogMsg $Path"
    }
} -Name "Shell Icon Settings"
#
# 1 Path                               Total so far: 277+1=278
# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ Job 27: User Shell Folders
# Purpose: Configures user-specific shell folder locations
# ╚═══════════════════════════════════════════════════════════════════════════════════╝
#
Start-Throt {
    $Path   = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
    $Values = @{
        "AppData"           = "%USERPROFILE%\AppData\Roaming";
        "Cache"             = "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache";
        "Cookies"           = "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCookies";
        "Desktop"           = "%USERPROFILE%\Desktop";
        "Favorites"         = "%USERPROFILE%\Favorites";
        "History"           = "%USERPROFILE%\AppData\Local\Microsoft\Windows\History";
        "Local AppData"     = "%USERPROFILE%\AppData\Local";
        "My Music"          = "%USERPROFILE%\Music";
        "My Pictures"       = "%USERPROFILE%\Pictures";
        "My Video"          = "%USERPROFILE%\Videos";
        "Personal"          = "%USERPROFILE%\Documents";
        "Programs"          = "%APPDATA%\Microsoft\Windows\Start Menu\Programs";
        "Recent"            = "%APPDATA%\Microsoft\Windows\Recent";
        "SendTo"            = "%APPDATA%\Microsoft\Windows\SendTo";
        "Start Menu"        = "%APPDATA%\Microsoft\Windows\Start Menu";
        "Startup"           = "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup";
        "Templates"         = "%APPDATA%\Microsoft\Windows\Templates"
    }

    ForEach ($Key in $Values.Keys) {
        TPSP -Path   $Path `
             -Name   $Key `
             -Value  $Values[$Key]
        Write-Log -Path  $LogPath `
                 -Value "$LogMsg $Path"
    }
} -Name "User Shell Folders"
#
# 1 Path                               Total so far: 278+1=279
# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ Job 30: Shell Icon Overlay Settings
# Configures shell icon overlay behavior
# ╚═══════════════════════════════════════════════════════════════════════════════════╝
#
Start-Throt {
    $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons"
    $Values = @{
        "OverlayIcon" = "%SystemRoot%\system32\imageres.dll,-1001";
        "OverlayIconIndex" = 0
    }

    ForEach ($Key in $Values.Keys) {
        TPSP -Path $Path -Name $Key -Value $Values[$Key]
        Write-Log -Path $LogPath -Value$LogMsg $Path
    }
} -Name "Shell Icon Overlay" -Arg @($Values)
#
# 1 Path                               Total so far: 279+1=280
# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ Job 31: Delegate Handlers Cleanup                                                ║
# ║ Purpose: Removes unnecessary delegate handlers                                   ║
# ╚═══════════════════════════════════════════════════════════════════════════════════╝
#
Start-Throt {
    $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts"
    $Handlers = Get-ChildItem -Path $Path -ErrorAction SilentlyContinue | 
                Where-Object { $_.PSChildName -match '.*' } |
                ForEach-Object { $_.PSPath }

    ForEach ($Handler in $Handlers) {
        $OpenWithProgids = Join-Path $Handler "OpenWithProgids"
        If (Test-Path $OpenWithProgids) {
            Remove-Item -Path $OpenWithProgids -Force -Recurse
            Write-Log -Path $LogPath -Value "Removed delegate handler: $OpenWithProgids"
        }
    }
} -Name "Delegate Handlers"
#
# 1 Path                               Total so far: 280+1=281
# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ Job 32: File Extension Associations                                             ║
# ║ Purpose: Configures default file extension handlers                             ║
# ╚═══════════════════════════════════════════════════════════════════════════════════╝
#
Start-Throt {
    $Path   = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts"
    $Values = @{
        ".txt"  = "txtfile";
        ".log"  = "txtfile";
        ".ini"  = "inifile";
        ".inf"  = "inffile";
        ".bat"  = "batfile";
        ".cmd"  = "cmdfile";
        ".ps1"  = "Microsoft.PowerShellScript.1"
    }

    ForEach ($Key in $Values.Keys) {
        $ExtPath = Join-Path $Path $Key
        TPSP -Path   $ExtPath `
             -Name   "ProgId" `
             -Value  $Values[$Key]
        Write-Log -Path  $LogPath `
                 -Value "$LogMsg $ExtPath"
    }
} -Name "File Extensions"
#

# ══════════════════════════════════════════════════════════════════════════
# Job 33: Known Folders
# Purpose: Configures known folder redirections
# ══════════════════════════════════════════════════════════════════════════
#
Start-Throt {
    $Path   = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
    $Values = @{
        "{374DE290-123F-4565-9164-39C4925E467B}" = "%USERPROFILE%\Downloads";  # Downloads
        "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" = "%USERPROFILE%\Pictures";   # Pictures
        "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" = "%USERPROFILE%\Downloads";  # Downloads
        "{A0C69A99-21C8-4671-8703-7934162FCF1D}" = "%USERPROFILE%\Music";      # Music
        "{EDC0FE71-98D8-4F4A-B920-C8DC133CB165}" = "%USERPROFILE%\Videos"      # Videos
    }

    ForEach ($Key in $Values.Keys) {
        TPSP -Path   $Path `
             -Name   $Key `
             -Value  $Values[$Key]
        Write-Log -Path  $LogPath `
                 -Value "$LogMsg $Path"
    }
} -Name "Known Folders"