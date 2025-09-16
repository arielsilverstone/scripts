#
## Dot-source external functions
$FunctionsPath = "D:\Desktop\New\WSIndex\functions.ps1"
. $FunctionsPath
##
# Track changes
Track-Change -Name "ControlPanel"
# Enable tracing
Manage-Tracing -On
# Set global aliases
Set-GlobalAliases
##
# Global VARs
#
#
#
##
# Control what shows and does not show in CPL
$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Don't Load"
$CPLs = @(
    "inetcpl",                                            "intl",
    "irprops",                                            "joy",
    "timedate",                                           "main",
    "mmsys",                                              "tabletpc",       
    "telephon"                                                          )
Start-Throt {
    # Hide specified CPLs
    Foreach ($CPL in $CPLs) {
        TPSP -Path $Path -Name "$CPL.cpl" -Value ""
    }
} -Name "CPLs"
#
## Add Hyper-V Manager to Control Panel
#
Start-Throt {
    $HyperVPath = JP "HKLM:\Software\Classes\CLSID" "{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}"
    TPSP -Path $HyperVPath -Name "Default" -Value "Hyper-V Manager"
    TPSP -Path $HyperVPath -Name "InfoTip" -Value "Management of HYPER-V Virtualization platform"
    TPSP -Path $HyperVPath -Name "System.ControlPanel.Category" -Value 8
} -Name "Hyper-V"
#
## Disable accessibility features
#
Start-Throt {
    $AccessibilityItems = "AudioDescription","Blind Access","ShowSounds"
    Foreach ($Feature in $AccessibilityItems) {
        $AccessibilityPath = JP "HKCU:\Control Panel\Accessibility" $Feature
        TPSP -Path $AccessibilityPath -Name "On" -Value 0
    }
} -Name "CPL Accessibility"
#
## Set Language Preferences
#
Start-Throt {
    $LangProfilePath   = "HKCU:\Control Panel\International\User Profile"
    $LangProfilePaths  = @($LangProfilePath, (JP $LangProfilePath "System Backup"))
    $LanguageCodes     = @{ "en-GB"="0809";"en-US"="0409";"he-IL"="040D"}
    $LangSettings      = @{
        "Languages"="en-VI en-US en-GB he pl";
        "WindowsOverride"="en-GB";
        "InputMethodOverride"="0809:00000409";
        "HttpAcceptLanguageOptOut"=1;
        "ShowAutoCorrection"=1;
        "ShowTextPrediction"=0;
        "ShowCasing"=1;
        "ShowShiftLock"=1
    }

    Foreach ($ProfilePath in $LangProfilePaths) {
        Foreach ($Setting in $LangSettings.Keys) {
            TPSP -Path $ProfilePath -Name $Setting -Value $LangSettings[$Setting]
            Write-Log "$Setting $($LangSettings[$Setting])"
        }
        Foreach ($LangKey in $LanguageCodes.Keys) {
            $RegName = $LanguageCodes[$LangKey] + ":0000" + $LanguageCodes[$LangKey]
            TPSP -Path (JP $ProfilePath $LangKey) -Name "HttpAcceptLanguageOptOut" -Value 1
            TPSP -Path (JP $ProfilePath $LangKey) -Name "FeaturesToInstall" -Value 227
            TPSP -Path (JP $ProfilePath $LangKey) -Name $RegName -Value 1
        }
    }
    $CacheName = "CachedLanguageName"
    TPSP -Path (JP $LangProfilePath "en-GB") -Name $CacheName -Value "@Winlangdb.dll,-1110"
    TPSP -Path (JP $LangProfilePath "en-US") -Name $CacheName -Value "@Winlangdb.dll,-1121"
    TPSP -Path (JP $LangProfilePath "he-IL") -Name $CacheName -Value "@Winlangdb.dll,-1202"
} -Name "Lang Preferences"
#
## CTFs
#
$Root 	   = "HKCU"
$Base      = "SOFTWARE\Microsoft\CTF"

$AssemblyPath  = JP $Root $Base "Assemblies\0000"
$SortOrderPath = JP $Root $Base "SortOrder\AssemblyItem\0000"

$Languages      = @("0809","0409","040D")
$CLSBranch      = "{34745C63-B2F0-4784-8B67-5E12C8701A31}"
$PropertyNames  = @("Profile","Default","CLSID")
$ZeroGUID       = "{00000000-0000-0000-0000-000000000000}"

Foreach ($Lang in $Languages) {
    $FullAssemblyPath  = JP $AssemblyPath $Lang $CLSBranch
    $FullSortOrderPath = JP $SortOrderPath $Lang $CLSBranch "00000000"

    Write-Log $FullAssemblyPath
    Write-Log $FullSortOrderPath

    Foreach ($PropertyName in $PropertyNames) {
        TPSP -Path $FullAssemblyPath  -Name $PropertyName  -Value $ZeroGUID
        TPSP -Path $FullSortOrderPath -Name $PropertyName -Value $ZeroGUID
    }

    $KeyboardLayoutValue = "0409+" + $Lang
    $FullAssemblyPath, $FullSortOrderPath | ForEach-Object {
        TPSP -Path $_ -Name "KeyboardLayout" -Value $KeyboardLayoutValue
    }
} -Name "CTF Settings"

#
##										Control Panel\KeyBoard
# Set order of keyboards
Start-Throt {
    $KeyboardRoot    = "HKCU:\Keyboard Layout\"
    $PreloadPath     = JP $KeyboardRoot "Preload"
    $SubstitutePath  = JP $KeyboardRoot "Substitutes"


    $PreloadPairs = @{
        "1" = "00000809";                                  		"2" = "00000409";
        "3" = "0000040d";                                  		"4" = "d001040d";
        "5" = "00000415";                                  		"6" = "d0010809"          }

    $SubstitutePairs = @{
        "d001040d" = "0002040d";                          		"00000809" = "00000409";
        "d0010809" = "00000809"                          		            		      }

    # Set keyboard preload and substitutes
    Foreach ($PreloadKey in $PreloadPairs.Keys) {
        TPSP -Path $PreloadPath -Name $PreloadKey -Value $PreloadPairs[$PreloadKey]
    }
    Foreach ($SubstituteKey in $SubstitutePairs.Keys) {
        TPSP -Path $SubstitutePath -Name $SubstituteKey -Value $SubstitutePairs[$SubstituteKey]
    }
} -Name "Keyboards Order"
#
##
#
Start-Throt {
    $KeyboardSettingsPath = "HKCU:\Control Panel\Keyboard"
    $KeyboardSettings     = @{
        "InitialKeyboardIndicators"=2; 		 # Enable Numlock on by Default
        "KeyboardSpeed"            =31;
        "KeyboardDelay"            =0    }   # reduce repeat delay on KB

    # Set keyboard properties
    Foreach ($Setting in $KeyboardSettings.Keys) {
        TPSP -Path $KeyboardSettingsPath -Name $Setting -Value $KeyboardSettings[$Setting]
    }
    TPSP -Path $KeyboardSettingsPath -Name "PrintScreenKeyForSnippingEnabled" -Value 1

} -Name "Keyboard Settings"
#
##										Control Panel\Langs
#
Start-Throt {
    $LanguagePath    = "HKCU:\Control Panel\International\User Profile"
    $DisabledOptions = @("ShowTextPrediction")
    $EnabledOptions  = @("HttpAcceptLanguageOptOut", "ShowAutoCorrection", "ShowCasing", "ShowShiftLock")

    # Set language options
    Foreach ($Option in $DisabledOptions) {
        TPSP -Path $LanguagePath -Name $Option           -Value 0
    }
    Foreach ($Option in $EnabledOptions) {
        TPSP -Path $LanguagePath -Name $Option           -Value 1
    }
    TPSP -Path $LanguagePath -Name "Languages"           -Value "en-VI en-US en-GB he pl"
    TPSP -Path $LanguagePath -Name "WindowsOverride"     -Value "en-GB"
    TPSP -Path $LanguagePath -Name "InputMethodOverride" -Value "0809:00000409"

} -Name "Language Settings"
#
## Language Sort Order
#
Start-Throt {
    $SortOrderPath   = "HKCU:\SOFTWARE\Microsoft\CTF\SortOrder\Language"
    $SortOrderValues = @{
        "0"="00002400"; <# En-VI #>                              "1"="00000809"; <# En-GB #>
        "2"="00000409"; <# En-US #>                              "4"="0000040d"; <# Hebrew #>
        "5"="00000415" <# Polish #>                                                             }

    # Set language sort order
    Foreach ($LangOrder in $SortOrderValues.Keys) {
        TPSP -Path $SortOrderPath -Name $LangOrder -Value $SortOrderValues[$LangOrder]
    }
} -Name "Langs 2"
#
## IME Removal
#
Start-Throt {
    $UserIMEPaths   = @("CHS","CHT","JPN","KOR")
    $SystemIMEPaths = @("JP","KR","TC")

    # Remove IME settings
    # Remove IME settings from HKCU
    Foreach ($IMEPath in $UserIMEPaths) {
        $Path = JP "HKCU:\Software\Policies\Microsoft\InputMethod\Settings" $IMEPath
        TPSP -Path $Path -Delete
    }

    # Remove IME settings from HKLM
    Foreach ($IMEPath in $SystemIMEPaths) {
        $HKLMPath1 = JP "HKLM:\SOFTWARE\Microsoft\IME" $IMEPath
        $HKLMPath2 = JP "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\IME" $IMEPath

        TPSP -Path $HKLMPath1 -Delete
        TPSP -Path $HKLMPath2 -Delete
    }
} -Name "IME Removal"
#
##
#
Start-Throt {
    $CPRootPath         = "HKCU:\Control Panel"
    $AccessibilityRoot  = JP $CPRootPath  "Accessibility"
    # Accessibility paths with flags
    $AccessibilityPaths = @{ "Keyboard Response" = 122; "StickyKeys" = 506; "ToggleKeys" = 58}

    Foreach ($Path in $AccessibilityPaths.Keys) {
        TPSP -Path (JP $AccessibilityRoot $Path) `
             -Name "Flags" -Value $AccessibilityPaths[$Path]
    }

    # Notification settings
    $NotificationSettings = @{
        "MessageDuration"      = 1   # 1 sec duration
        "Sound on Activation"  = 0   # no sound on activate
        "Warning Sounds"       = 1   # warning sound enabled    }

    Foreach ($Notif in $NotificationSettings.Keys) {
        TPSP -Path $CPRootPath `
             -Name $Notif `
             -Value $NotificationSettings[$Notif]
    }


    $MouseSettings 		= @{
    "Beep"                     = "No";                                     "MouseHoverWidth"   = 4
    "DoubleClickHeight"        = 4;                                        "MouseSensitivity"  = 10
    "DoubleClickSpeed"         = 500;                                      "MouseSpeed"        = 1
    "DoubleClickWidth"         = 4;                                        "MouseThreshold1"   = 6
    "ExtendedSounds"           = "No";                                     "MouseThreshold2"   = 10
    "MouseHoverHeight"         = 4;                                        "MouseTrails"       = 0
    "MouseHoverTime"           = 8;                                        "SwapMouseButtons"  = 0
        "SnapToDefaultButton"      = 1;
        "SmoothMouseXCurve" = ([Byte[]](0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x15,0x6e,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x01,0x00,0x00,0x00,0x00,0x00,0x29,0xdc,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x28,0x00,0x00,0x00,0x00,0x00));
        "SmoothMouseYCurve" = ([Byte[]](0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xfd,0x11,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x24,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0xfc,0x12,0x00,0x00,0x00,0x00,0x00,0x00,0xc0,0xbb,0x01,0x00,0x00,0x00,0x00))         		            		            		   }

    Foreach ($MouseSetting in $MouseSettings.Keys) {
        TPSP -Path $CPRootPath `
             -Name $MouseSetting `
             -Value $MouseSettings[$MouseSetting]
    }

    # Additional clocks
    $ClockSettings = @(
        @("TimeDate\AdditionalClocks\1", "DisplayName", "Israel"),
        @("TimeDate\AdditionalClocks\1", "TzRegKeyName", "Israel Standard Time"),
        @("TimeDate\AdditionalClocks\1", "Enable",       1),
        @("TimeDate\AdditionalClocks\2", "PlaceHolder",     1)                        )

    Foreach ($ClockSet in $ClockSettings) {
        $Path = JP $CPRootPath "TimeDate\AdditionalClocks\$($ClockSet[0])"
        TPSP -Path $Path -Name $ClockSet[1] -Value $ClockSet[2]
    }

    # Cursor settings
    TPSP -Path (JP $CPRootPath "Cursors") -Name "CursorCrosshairEnabled" -Value 1
    # Unsupported hardware notification
    TPSP -Path (JP $CPRootPath "UnsupportedHardwareNotificationCache") -Name "SV2" -Value 0

    # Sound settings
    TPSP -Path (JP $CPRootPath "Sound") -Name "Beep" -Value "No"
    TPSP -Path (JP $CPRootPath "Sound") -Name "ExtendedSounds" -Value "No"

    # Explorer Control Panel settings
    TPSP -Path $CPRootPath -Name "AllItemsIconView"   -Value 0
    TPSP -Path $CPRootPath -Name "StartupPage"        -Value 1

    $ColorsPath = "HKCU:\Control Panel\Colors"

    $BorderColors = @{
        "ActiveBorder" = "0 128 255"  # More defined border
        "WindowFrame"  = "0 128 255"  # Window frame color         		   }

    Foreach ($Color in $BorderColors.Keys) {
        TPSP -Path $ColorsPath -Name $Color -Value $BorderColors[$Color]
    }

} -Name "Control Panel Settings"
