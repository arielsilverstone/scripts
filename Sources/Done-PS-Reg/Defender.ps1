# ==============================================
# Script Setup
# ==============================================
##
# Dot-source external functions
. "$PSScriptRoot\functions.ps1"
#
# Track changes
Track-Change -Name "Defender"
#
# Enable tracing
Manage-Tracing -On
#
# Set global aliases
Set-GlobalAliases
#
##
# Global Variables
# ==============================================
# Define global variables
$WDSC          = "Windows Defender Security Center"
$Pol           = "HKLM:\SOFTWARE\Policies\Microsoft"
$CV            = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion"
$WinSecRoot    = "HKLM:\Software\Microsoft\Windows"
$DefenderFeatPath = JP $WinSecRoot "Defender\Features"
$PolicyRoots   = @("$Pol", "$Pol\Wow6432Node")
$DefenderSubPath = "Windows Defender"

# ==============================================
# Group 1: Base Defender Settings
# ==============================================
# Remove Windows Defender from Run
Start-Throt {
    TPSP -Path (JP $CV "Run") -Name "WindowsDefender" -Delete -Recurse
} -Name "RemoveDefenderRun"

# Job 1.1: Configure Base Defender Settings
Start-Throt {
    TPSP -Path $DefenderFeatPath -Name "TamperProtection" -Value 0 -T D
} -Name "DefenderSettings"

# ==============================================
# Group 2: SmartScreen Settings
# ==============================================
# Job 2.1: Configure SmartScreen States
Start-Throt {
    $WinSecRoot  = "HKLM:\Software\Microsoft\Windows"
    $AppBrowser  = "AppAndBrowser_"
    $SmartScreen = "SmartScreenOff"
    $SecurityStatePath = JP $WinSecRoot "Security Health\State"
    
    @("${AppBrowser}Edge${SmartScreen}",
      "${AppBrowser}PUA${SmartScreen}",
      "${AppBrowser}StoreApps${SmartScreen}") | 
        ForEach { 
            TPSP -Path $SecurityStatePath -Name $_ -Value 1 -T D
        }
} -Name "SmartScreen-States"

# Job 2.2: Configure SmartScreen Policy
Start-Throt {
    Foreach ($PolicyRoot in $PolicyRoots) {
        $FullPolicyPath = JP $PolicyRoot $DefenderSubPath
        $SmartScreenPath = JP $FullPolicyPath "SmartScreen"
        TPSP -Path $SmartScreenPath -Name "ConfigureAppInstallControl" -Value "Nowhere"
        TPSP -Path $SmartScreenPath -Name "ConfigureAppInstallControlEnabled" -Value 0
    }
} -Name "SmartScreen-Policy"

# Job 2.3: Configure SmartScreen Explorer
Start-Throt {
    $PathEx = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"
    TPSP -Path $PathEx -Name SmartScreenEnabled -Type String -Value Off -Force
} -Name "SmartScreen-Explorer"

# ==============================================
# Group 3: RealTime Protection Settings
# ==============================================
# Job 3.1: Configure RealTime Protection
Start-Throt {
    Foreach ($PolicyRoot in $PolicyRoots) {
        $FullPolicyPath = JP $PolicyRoot $DefenderSubPath
        $RealTimePath = JP $FullPolicyPath "Real-Time Protection"
        $RealTimeSettings = @{
            "DisableRealtimeMonitoring"                 = 1
            "DisableEnhancedNotifications"              = 1
            "DisableGenericReports"                     = 1
            "DisableIoavProtection"                     = 1
            "DisableOnAccessProtection"                 = 1
            "DisableScanOnRealtimeEnable"               = 1
            "DisableScriptScanning"                     = 1
            "LocalSettingOverrideDisableRealtimeMonitoring" = 1
        }
        Foreach ($Setting in $RealTimeSettings.Keys) {
            TPSP -Path $RealTimePath -Name $Setting -Value $RealTimeSettings[$Setting]
        }
    }
} -Name "RealTime-Protection"

# ==============================================
# Group 4: Network Settings
# ==============================================
# Job 4.1: Configure Network Protection
Start-Throt {
    # Network Protection Settings
    Foreach ($PolicyRoot in $PolicyRoots) {
        # NIS Settings
        $NisPath = JP $PolicyRoot "Windows Defender\Nis"
        TPSP -Path $NisPath -Name "DisableDatagramProcessing" -Value 1
        TPSP -Path $NisPath -Name "DisableMitmProtection" -Value 1

        # Network Protection
        $NetworkPath = JP $PolicyRoot "Windows Defender\NetworkProtection"
        TPSP -Path $NetworkPath -Name "EnableNetworkProtection" -Value 0
        TPSP -Path $NetworkPath -Name "DisableNetworkProtection" -Value 1
    }

    # SaveZone Settings
    $Attach = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Attachments"
    TPSP -Path $Attach -Name SaveZoneInformation -Type DWord -Value 1 -Force

    # MpPreference Settings
    $defenderModule = GMO -Name Defender -ListAvailable -EA 0
    if ($defenderModule -or (GCM Get-MpComputerStatus -EA 0)) {
        $mpStatus = Get-MpComputerStatus -EA 0
        if ($mpStatus -and $mpStatus.AntivirusEnabled -eq $true) {
            Set-MpPreference -EnableNetworkProtection Disabled -EA 0
            Set-MpPreference -PuaProtection Disabled -EA 0
            Write-Log "[INFO] MpPreference settings updated successfully"
        } else {
            Write-Log "[INFO] Windows Defender not enabled, skipping MpPreference settings"
        }
    } else {
        Write-Log "[INFO] Windows Defender PowerShell module not available, skipping MpPreference settings"
    }
} -Name "Network-Protection"

# ==============================================
# Group 5: Guard Settings
# ==============================================
# Job 5.1: Configure Guard
Start-Throt {
    Foreach ($PolicyRoot in $PolicyRoots) {
        $FullPolicyPath = JP $PolicyRoot $DefenderSubPath

        # UX Configuration
        $UxConfigPath = JP $FullPolicyPath "Ux Configuration"
        TPSP -Path $UxConfigPath -Name "NotificationSuppress" -Value 1

        # Exploit Guard Settings
        $CtrlFold = JP $FullPolicyPath "Windows Defender Exploit Guard\Controlled Folder Access"
        TPSP -Path $CtrlFold -Name "EnableControlledFolderAccess" -Value 1
        TPSP -Path $CtrlFold -Name "ExploitGuardControlledFolderAccessProtectedFolders" -Value "-"

    }

    # Device Guard Settings
    $DevGuard = JP $Pol "Windows\DeviceGuard"
    $Items = @("CachedDrtmAuthIndex", "DeployConfigCiPolicy", "EnableVirtualizationBasedSecurity", "HvcimatRequired", 
               "HypervisorEnforcedCodeIntegrity", "Locked", "LsaCfgFlags", "RequireMicrosoftSignedBootChain", 
               "RequirePlatformSecurityFeatures")
    ForEach ($Item in $Items) {
        TPSP -Path $DevGuard -Name $Item -Value 0
    }
    TPSP -Path $DevGuard -Name "ConfigureSystemGuardLaunch" -Value 2
    TPSP -Path $DevGuard -Name "ConfigCiPolicyFilepath" -Value "-"

    # System DeviceGuard Settings
    $SysDevGuard = "HKLM:\System\CurrentControlSet\Control\DeviceGuard"
    $SysItems = @("CachedDrtmAuthIndex", "Enabled", "EnableVirtualizationBasedSecurity", "HypervisorEnforcedCodeIntegrity",
                  "Locked", "RequireMicrosoftSignedBootChain", "RequirePlatformSecurityFeatures")
    ForEach ($Item in $SysItems) {
        TPSP -Path $SysDevGuard -Name $Item -Value 0
    }
} -Name "Guard"

# ==============================================
# Group 6: WDSC Settings
# ==============================================
# Job 6.1: Configure WDSC
Start-Throt {
    Foreach ($PolicyRoot in $PolicyRoots) {
        $FullPolicyPath = JP $PolicyRoot $DefenderSubPath
        $SecurityCenterPath = JP $FullPolicyPath $WDSC

        # Family Options
        $FamOpt = JP $SecurityCenterPath "Family options"
        TPSP -Path $FamOpt -Name "UiLockdown" -Value 1

        # Notifications
        $Notif = JP $SecurityCenterPath "Notifications"
        TPSP -Path $Notif -Name "DisableEnhancedNotifications" -Value 1
        TPSP -Path $Notif -Name "DisableNotifications" -Value 1

        # System Tray
        $SysTray = JP $SecurityCenterPath "Systray"
        TPSP -Path $SysTray -Name "HideSystray" -Value 1
    }
} -Name "WDSC"

# ==============================================
# Group 7: Spynet Settings
# ==============================================
# Job 7.1: Configure Spynet
Start-Throt {
    Foreach ($PolicyRoot in $PolicyRoots) {
        $SpynetPath = JP $PolicyRoot "Windows Defender\Spynet"
        $SpynetSettings = @{
            "SpynetReporting" = 0
            "SubmitSamplesConsent" = 2
            "DisableSampleSubmission" = 1
            "LocalSettingOverrideDisableReporting" = 1
        }
        Foreach ($Setting in $SpynetSettings.Keys) {
            TPSP -Path $SpynetPath -Name $Setting -Value $SpynetSettings[$Setting]
        }
    }
} -Name "Spynet"

# ==============================================
# Group 8: Signature and Scan Settings
# ==============================================
# Job 8.1: Configure Signatures and Scanning
Start-Throt {
    Foreach ($PolicyRoot in $PolicyRoots) {
        $FullPolicyPath = JP $PolicyRoot $DefenderSubPath

        # Signature Updates
        $SignatureUpdatesPath = JP $FullPolicyPath "Signature Updates"
        $SignatureUpdatesSettings = @{
            "DisableScanOnUpdate" = 1
            "DisableScheduledSignatureUpdateOnBattery" = 1
            "DisableUpdateOnStartupWithoutEngine" = 1
            "ForceUpdateFromMu" = 0
            "MeteredConnectionUpdates" = 0
            "RealtimeSignatureDelivery" = 0
            "UpdateOnStartUp" = 0
        }
        Foreach ($Setting in $SignatureUpdatesSettings.Keys) {
            TPSP -Path $SignatureUpdatesPath -Name $Setting -Value $SignatureUpdatesSettings[$Setting]
        }

        # Scan Settings
        $ScanPath = JP $FullPolicyPath "Scan"
        $ScanSettings = @{
            "AllowPause" = 1
            "DisableEmailScanning" = 1
            "DisableHeuristics" = 1
            "DisableRemovableDriveScanning" = 1
            "DisableReparsePointScanning" = 1
            "DisableRestorePoint" = 0
            "DisableScanningMappedNetworkDrivesForFullScan" = 1
            "DisableScanningNetworkFiles" = 1
        }
        Foreach ($Setting in $ScanSettings.Keys) {
            TPSP -Path $ScanPath -Name $Setting -Value $ScanSettings[$Setting]
        }
    }
} -Name "SignaturesAndScanning"

# ==============================================
# Group 9: Policy Settings
# ==============================================
# Job 9.1: Configure Policy
Start-Throt {
    Foreach ($PolicyRoot in $PolicyRoots) {
        $FullPolicyPath = JP $PolicyRoot $DefenderSubPath

        # Policy Manager
        $PolicyManagerPath = JP $FullPolicyPath "Policy Manager"
        TPSP -Path $PolicyManagerPath -Name "AllowCloudProtection" -Value 0

        # Components
        $Path1 = JP $Pol "Windows\Wtds\Components"
        $Compon = @("CaptureThreatWindow", "NotifyMalicious", "NotifyPasswordReuse", "NotifyUnSafeApp", "ServiceEnabled")
        Foreach ($Comp in $Compon) {
            TPSP -Path $Path1 -Name $Comp -Value 0
        }

        # MRT Settings
        $Path2 = JP $Pol "Mrt"
        $Mrts = @("DontOfferThroughWuau", "DontReportInfectionInformation")
        Foreach ($Mrt in $Mrts) {
            TPSP -Path $Path2 -Name $Mrt -Value 1
        }

        # Security Center
        $Path3 = JP $Pol "Windows Nt\Security Center"
        TPSP -Path $Path3 -Name "SecurityCenterInDomain" -Value 0
    }
} -Name "Policy"

# ==============================================
# Group 10: TPM Settings
# ==============================================
# Job 10.1: Configure TPM
Start-Throt {
    # TPM Policy Settings
    $Tpm = JP $Pol "Tpm"
    Ensure-Path -Path $Tpm
    TPSP -Path $Tpm -Name "OsManagedAuthLevel" -Value 0
    TPSP -Path $Tpm -Name "AllowClearOwnerWithoutValidOwnerAuth" -Value 1
    
    # TPM Service Settings
    $TpmPath = "HKLM:\SYSTEM\CurrentControlSet\Services\TPM"
    If (Test-Path $TpmPath) {
        TPSP -Path $TpmPath -Name "Start" -Value 4
    }
} -Name "TPM"

# ==============================================
# Group 11: LSA Settings
# ==============================================
# Job 11.1: Configure LSA
Start-Throt {
    $Lsa = "HKLM:\System\CurrentControlSet\Control\Lsa"
    $Pairs = @{
        "EveryoneIncludesAnonymous" = 1
        "LsaCfgFlags" = 0
        "ForceGuest" = 0
        "LimitBlankPasswordUse" = 0
        "LmCompatibilityLevel" = 1
        "RestrictAnonymous" = 0
    }
    ForEach ($Item in $Pairs.Keys) {
        TPSP -Path $Lsa -Name $Item -Value $Pairs[$Item]
    }
} -Name "LSA"
