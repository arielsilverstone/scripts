@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "1MergedFileChanged" /f
Reg.exe add "HKCU\Changes" /v "1MergedFileChanged" /t REG_SZ /d "27JAN25" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Bluetooth" /v "AdvancedDiscoveryMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Bluetooth" /v "QuickPair" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudExperienceHost\WebcamPermission" /v "InboxWebcamAccessAllowlist" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudExperienceHost\WebcamPermission" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\SystemMetaData" /v "CloudStorePlatformSupported" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OEMPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsOverlayEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RemediationRequired" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Policies" /v "TemporaryEnterpriseFeatureControlState_Mirrored" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\App Management" /v "COMClassStore" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller" /v "EnableAppInstaller" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller" /v "EnableExperimentalFeatures" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller" /v "EnableMicrosoftStoreSource" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller" /v "EnableWindowsPackageManagerCommandLineInterfaces" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller" /v "EnableWindowsPackageManagerConfiguration" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Backup\Server" /v "OnlySystemBackup" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Backup\Server" /v "NoBackupToDisk" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Backup\Server" /v "NoBackupToNetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Backup\Server" /v "NoRunNowBackup" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CredUI" /v "DisablePasswordReveal" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DoDownloadMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ConnectivityNoNetworkTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ConnectivityRestrictedNetworkTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DiagTrackAuthorization" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DiagTrackStatus" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "UploadEtlFileConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "UploadPermissionReceived" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" /v "EnableEventTranscript" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" /v "DiagTrackAuthorization" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\Features" /v "EventTagDropUserIds" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\OmittedIds" /v "w:B04E2543-63EB-D3C6-4722-FBFE64FA31C0" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\OmittedIds" /v "w:51BD64A6-CB3C-BE69-C3CF-6F201192D6F4" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\OmittedIds" /v "w:2CD5BDB8-5AAC-E974-9C40-74864CF5B277" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\OmittedIds" /v "w:24BB1808-7651-CEDC-68C9-ABAD2D870DE7" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\SettingsRequests\telemetry.ASM-WindowsDefault" /v "ETag" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\SettingsRequests\telemetry.ASM-WindowsDefault" /v "ETagQueryParameters" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\SettingsRequests\telemetry.P-Eco3PTelDefault" /v "ETag" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\SettingsRequests\telemetry.P-Eco3PTelDefault" /v "ETagQueryParameters" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\SettingsRequests\utc.app" /v "ETag" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\SettingsRequests\utc.app" /v "ETagQueryParameters" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TraceManager" /v "MiniTraceSlotContentPermitted" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TraceManager" /v "MiniTraceSlotEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg.exe delete "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /f
Reg.exe delete "HKCU\System\GameConfigStore" /v "Win32_GameModeRelatedProcesses" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\GameBar" /v "ShowGameModeNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\Default\ApplicationManagement\AllowGameDVR" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Games" /v "EnableXBGM" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Games" /v "AllowAdvancedGamingServices" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_TOASTS_ENABLED" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notanager\Default\Browser\AllowSmartScreenows.immersiveControlpanel_cw5n1h2txyewy!Microsoft.Windows.immersiveControlpanel" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\MDM" /v "AutoEnrollMDM" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\MDM" /v "DisableRegistration" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PushToInstall" /v "DisablePushToInstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PushToInstall" /v "DisableVoice" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "DatabaseMigrationCompleted" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoTileApplicationNotification" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "DisallowNotificationMirroring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "EnableExpandedToastNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoCloudApplicationNotification" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoTileApplicationNotification" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\MicrosoftAccount" /v "DisableUserAuth" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PassportForWork" /v "AllowAllUserAccessToSmartCardNode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PassportForWork" /v "DisablePostLogonProvisioning" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PassportForWork" /v "DisableSmartCardNode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PassportForWork" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Registration Wizard Control" /v "NoRegistration" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Setup" /v "SourcePath" /t REG_SZ /d "D:\Windows Setup Files" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsMitigation" /v "UserPreference" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppV\Client\PackageManagement" /v "AutoCleanupEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppV\Client\PowerManagement" /v "SyncOnBatteriesEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppHVSI" /v "AllowAppHVSI_ProviderSet" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppHVSI" /v "AllowCameraMicrophoneRedirection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppHVSI" /v "AllowPersistence" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppHVSI" /v "AllowVirtualGPU" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppHVSI" /v "AppHVSIPrintingSettings" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppHVSI" /v "AuditApplicationGuard" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppHVSI" /v "SaveFilesToHost" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoActiveHelp" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoImplicitFeedback" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoOnlineAssist" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\WSMAN\Client" /v "maxEnvelopeSize" /t REG_DWORD /d "8192" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\WSMAN\Client" /v "spn_prefix" /t REG_SZ /d "WSMAN" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\WSMAN\Client" /v "trusted_hosts" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CallLegacyWCMPolicies" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DisableCachingOfSSLPages" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnableNegotiate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnablePunyCode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnableSSL3Fallback" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MigrateProxy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PageOrientation " /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PaperSize" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PreventIgnoreCertErrors" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PrivacyAdvanced" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PrintQuality " /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "Security_HKLM_only" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnOnIntranet" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnOnZoneCrossing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DisableCachingOfSSLPages" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnableNegotiate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PrivacyAdvanced" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "SecureProtocols" /t REG_DWORD /d "10240" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DisableCachingOfSSLPages" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PrivacyAdvanced" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "SecureProtocols" /t REG_DWORD /d "10240" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHTTP" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "http" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "https" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "ftp" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "file" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "@ivt" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "shell" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "knownfolder" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones" /v "SelfHealCount" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "AllowRemoteRPC" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "AllSigningEqual" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableBalloonTips" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSendGenericDriverNotFoundToWER" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSendRequestAdditionalSoftwareToWER" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "InstallTimeout" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "SuppressNewHWUI" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "AllowAdminInstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DriverSearching" /v "DontSearchWindowsUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DriverSearching" /v "DriverUpdateWizardWuSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DriverSearching" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies\EarlyLaunch" /v "DriverLoadPolicy" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "EveryoneIncludesAnonymous" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "ForceGuest" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "LsaCfgFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\LsaInformation" /v "UACInstalled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "CachedDrtmAuthIndex" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "ConfigCIPolicyFilepath" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "ConfigureSystemGuardLaunch" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "DeployConfigCIPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "Locked" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "LsaCfgFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "RequireMicrosoftSignedBootChain" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "CachedDrtmAuthIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "Locked" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "RequireMicrosoftSignedBootChain" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Locked" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\KernelShadowStacks" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\KernelShadowStacks" /v "AuditModeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "IsSecureKernelRunning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "EncryptionKeyAvailable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "EncryptionKeyPersistent" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "SecretsMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "IsTestConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "KeyGuardEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "CredGuardEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "LsaIsoLaunchAttempted" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "LsaIsoLaunchError" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KeyGuard\Status" /v "ExecSystemProcessesError" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\SystemGuard" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "DSEnvironment" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "LogDataCreated" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "MsmqRootPath" /t REG_EXPAND_SZ /d "\"D:\Program Files\MSMQ\"" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "StoreLogPath" /t REG_EXPAND_SZ /d "D:\temp" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "StoreReliablePath" /t REG_EXPAND_SZ /d "\"D:\Program Files\MSMQ\storage\"" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "StoreXactLogPath" /t REG_EXPAND_SZ /d "D:\temp" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "StorePersistentPath" /t REG_EXPAND_SZ /d "\"D:\Program Files\MSMQ\storage\"" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "StoreJournalPath" /t REG_EXPAND_SZ /d "\"D:\Program Files\MSMQ\storage\"" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "Workgroup" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters\Setup\StoragePaths" /v "MSMQRootPath" /t REG_EXPAND_SZ /d "\"D:\Program Files\MSMQ\"" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters\Setup\StoragePaths" /v "StoreJournalPath" /t REG_EXPAND_SZ /d "\"D:\Program Files\MSMQ\storage\"" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters\Setup\StoragePaths" /v "StoreLogPath" /t REG_EXPAND_SZ /d "D:\temp" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters\Setup\StoragePaths" /v "StorePersistentPath" /t REG_SZ /d "D:\Program Files\MSMQ\storage" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters\Setup\StoragePaths" /v "StoreReliablePath" /t REG_EXPAND_SZ /d "\"D:\Program Files\MSMQ\storage\"" /f
Reg.exe add "HKLM\Software\Microsoft\MSMQ\Parameters\Setup\StoragePaths" /v "StoreXactLogPath" /t REG_EXPAND_SZ /d "D:\temp" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Driver Signing" /v "BehaviorOnFailedVerify" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\FileHistory" /v "Disabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\PowerShell" /v "EnableScripts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" /v "EnableModuleLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v "EnableScriptBlockLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v "EnableInvocationHeader" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v "EnableTranscripting" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v "OutputDirectory" /t REG_SZ /d "d:\desktop" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PowerShellCore" /v "EnableScripts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PowerShellCore" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PowerShellCore" /v "UseWindowsPowerShellPolicySetting" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\powerShellcore\modulelogging" /v "EnableModuleLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\powerShellcore\modulelogging" /v "useWindowspowerShellpolicysetting" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\powerShellcore\scriptBlocklogging" /v "EnableScriptBlockLogging" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\powerShellcore\scriptBlocklogging" /v "EnablescriptBlockinvocationlogging" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\powerShellcore\scriptBlocklogging" /v "useWindowspowerShellpolicysetting" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\PowerShellCore\Transcription" /v "Enableinvocationheader" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PowerShellCore\Transcription" /v "EnableTranscripting" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\PowerShellCore\Transcription" /v "outputdirectory" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PowerShellCore\Transcription" /v "UseWindowspowerShellpolicysetting" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShell" /v "DisablePromptToUpdateHelp" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "InstallFolder" /t REG_SZ /d "C:\Program Files\PowerShell\\" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "AddToPath" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "RegisterManifest" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "EnablePSRemoting" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "DisableTelemetry" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "AddExplorerContextMenuOpenPowerShell" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "AddFileContextMenuRunPowerShell" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "UseMU" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShellCore\InstallerProperties" /v "EnableMU" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f
Reg.exe add "HKCU\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\EnhancedStorageDevices" /v "TCGSecurityActivationDisabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\StorageHealth" /v "AllowDiskHealthModelUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseTemporaryFilesCleanup" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\StorageSense" /v "ConfigStorageSenseRecycleBinCleanupThreshold" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\fssProv" /v "EncryptProtocol" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\RemovableStorageDevices" /v "AllowRemoteDASD" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "01" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "04" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "08" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "32" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "256" /t REG_DWORD /d "14" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "512" /t REG_DWORD /d "14" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "1024" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "2048" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications" /v "EnableAccountNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ReserveManager" /v "MiscPolicyInfo" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ReserveManager" /v "PassedPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\DeviceHealthAttestationService" /v "EnableDeviceHealthAttestationService" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PeerDist\Service" /v "Enable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PeerDist\CooperativeCaching" /v "Enable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PeerDist\HostedCache\Discovery" /v "SCPDiscoveryEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "AddAdminGroupToRUP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "AllowBlockingAppsAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "AllowClipboardHistory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "AllowCrossDeviceClipboard" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "AllowuserinfoAccess" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "CompatibleRUPSecurity" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableCMD" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableHHDEP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableLockScreenAppNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableAppUriHandlers" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableCdp" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableFontProviders" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableMmx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableAppUriHandlers" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "HomeDirLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "HomeDir" /t REG_SZ /d "D:\Users" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "HomeDirDrive" /t REG_SZ /d "D:" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "MachineProfilePath" /t REG_SZ /d "\192.168.0.123\Homes\%%USERNAME%%" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "RSoPLogging" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "RunAsPPL" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "SecureBoot" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "ShellSmartScreenLevel" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "SlowLinkUIEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\System" /v "AllowCrossDeviceClipboard" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\System" /v "DisableCMD" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\System\Fdeploy" /v "FolderRedirectionEnableCacheRename" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CDP" /v "CDPSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CDP" /v "NearShareChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CDP" /v "RomeSDKChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Microsoft\Feeds" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" /v "AllowBasic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" /v "AllowCredSSP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" /v "AllowUnencryptedTraffic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" /v "TrustedHosts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" /v "TrustedHostsList" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "AllowAutoConfig" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "AllowBasic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "AllowCredSSP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "AllowUnencryptedTraffic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "HttpCompatibilityListener" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "HttpsCompatibilityListener" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "IPv4Filter" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "IPv6Filter" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" /v "AllowRemoteShellAccess" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" /v "MaxConcurrentUsers" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" /v "MaxShellsPerUser" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Wireless\NetCost" /v "Cost" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\FVE" /v "DisableExternalDMAUnderLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\FVE" /v "OSAllowSecureBootForIntegrity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\SecureBoot\State" /v "UEFISecureBootEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\MMC" /v "RestrictToPermittedSnapins" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\MMC\{6A712058-33C6-4046-BCF9-0EA3A8808EDC}" /v "Restrict_Run" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\MMC\{6E8E0081-19CD-11D1-AD91-00AA00B8E05A}" /v "Restrict_Run" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "DisableOSUpgrade" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "DisableStoreApps" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "EnableWindowsStoreOnWTG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "RemoveWindowsStore" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\WindowsStore" /v "DisableOSUpgrade" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Microsoft\FamilyStore\AuthConfig" /v "ServiceUrl" /f
Reg.exe add "HKLM\Software\Microsoft\FamilyStore\AuthConfig" /f
Reg.exe delete "HKLM\Software\Microsoft\FamilyStore\ClientConfig" /v "ServiceUrl" /f
Reg.exe add "HKLM\Software\Microsoft\FamilyStore\ClientConfig" /f
Reg.exe add "HKLM\Software\Microsoft\FamilyStore\SyncPolicy" /v "CreateAccounts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\FamilyStore\SyncPolicy" /v "CreateAccountsAsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\FamilyStore\SyncPolicy" /v "DeleteStaleAccounts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Packages\Applications" /v "EnableDynamicContentUriRules" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\software\Microsoft\Windows\CurrentVersion\Policies\packages\applications\contenturirules" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\MYS" /v "DisableShowAtLogon" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\iSCSI" /v "ChangeIQNName" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\iSCSI" /v "RestrictAdditionalLogins" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\iSCSI" /v "RequireIPSec" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\iSCSI" /v "RequireMutualCHAP" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\iSCSI" /v "RequireOneWayCHAP" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" /v "ReplaceVan" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Network Connections" /v "NC_RenameAllUserRasConnection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Network Connections" /v "NC_RenameConnection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Network Connections" /v "NC_RenameLanConnection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Network Connections" /v "NC_PersonalFirewallConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Network\Persistent Connections" /v "SaveConnections" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetworkIsolation" /v "DomainSubnets" /t REG_SZ /d "192.168.0.1/23" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sandbox" /v "AllowAudioInput" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sandbox" /v "AllowClipboardRedirection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sandbox" /v "AllowMappedFolders" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sandbox" /v "AllowNetworking" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sandbox" /v "AllowPrinterRedirection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sandbox" /v "AllowVGPU" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sandbox" /v "AllowVideoInput" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sandbox" /v "AllowWriteToMappedFolders" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" /v "AutoSetup" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /v "3G" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /v "4G" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /v "Default" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /v "Ethernet" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /v "WiFi" /t REG_DWORD /d "2" /f
Reg.exe delete "HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\NewNetworks" /v "NetworkList" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\NewNetworks" /v "NetworkName" /t REG_SZ /d "Home" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\EveryNetwork" /v "CategoryReadOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\EveryNetwork" /v "IconReadOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\EveryNetwork" /v "NameReadOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\MuiCache\83\417C44EB" /v "@C:\Windows\System32\nlmgp.dll,-200" /t REG_SZ /d "Network List Manager Policies" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" /v "**delvals." /t REG_SZ /d " " /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider" /v "RestoreConnection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "0200" /t REG_BINARY /d "000001010000010000000000000000001e000000000000000000000000000000000000000000000000000000000000000000ffff00ffff000000000000000000ffffffff000000000000000000ff000000000000000000000000000000000000" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "1700" /t REG_BINARY /d "000000000000000000000000000000001e000000000000000000000000000000000000000000000000000000000000000000000000ffff000000000000000000ffffffff00000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26" /v "00000000" /t REG_BINARY /d "0000000000000000000000000200000000000000000000000000000000000000ff00000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26" /v "04000000" /t REG_BINARY /d "0000000000000000000000000200000000000000000000000000000000000000ff00000000000000" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Network" /v "NoEntireNetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DisableIPv6DefaultDnsServers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "EnableNetbios" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "NameServer" /t REG_SZ /d "192.168.0.254 1.1.1.1 8.8.8.8" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "PreferLocalOverLowerBindingDNS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "Value" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "6to4_State" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "ISATAP_State" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "Teredo_State" /t REG_SZ /d "Disabled" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition\IPHTTPS" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanServer" /v "DisableCompression" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanServer" /v "EnableCompressedTraffic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanServer" /v "EnableSMBQUIC" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanServer" /v "HashPublicationForPeerCaching" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowOfflineFilesforCAShares" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "BlockNTLM" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "DisableCompression" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "DisabledSMBQUICServerExceptionList" /t REG_MULTI_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "EnableCompressedTraffic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "EnableHandleCachingForCAFiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "EnableSMBQUIC" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "fSoftDisconnectConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "RequireEncryption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "AllowLLTDIOOnDomain" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "AllowLLTDIOOnPublicNet" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "AllowRspndrOnDomain" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "AllowRspndrOnPublicNet" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "EnableLLTDIO" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "EnableRspndr" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "ProhibitLLTDIOOnPrivateNet" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "ProhibitRspndrOnPrivateNet" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\SNMP\Parameters\ValidCommunities" /v "2300" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\Software\Policies\SNMP\Parameters\ValidCommunities" /v "Local" /t REG_DWORD /d "16" /f
Reg.exe delete "HKLM\Software\Microsoft\RPC\Internet" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_4F90&SUBSYS_60031849&REV_00\6&34b8f2c8&0&002000E8\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "DisableHTTPPrinting" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "DisableWebPnPDownload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "DisableWebPrinting" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "DoNotInstallCompatibleDriverFromWindowsUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "PublishPrinters" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "RegisterSpoolerRemoteRpcEndPoint" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "ServerThread" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "Restricted" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "RestrictDriverInstallationToAdministrators" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "TrustedServers" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "NoWarningNoElevationOnInstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "UpdatePromptSettings" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PushedConnections\{9C8C8607-2A08-4997-952A-C16796FB4154}" /v "uNCName" /t REG_SZ /d "\\Ben\Lazer" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PushedConnections\{9C8C8607-2A08-4997-952A-C16796FB4154}" /v "serverName" /t REG_SZ /d "\\Ben" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PushedConnections\{9C8C8607-2A08-4997-952A-C16796FB4154}" /v "printerName" /t REG_SZ /d "Lazer" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PushedConnections\{9C8C8607-2A08-4997-952A-C16796FB4154}" /v "printAttributes" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC" /v "RpcProtocols" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC" /v "RpcUseNamedPipeProtocol " /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\software\Policies\Microsoft\Windows NT\Printers\Wizard" /v "Downlevel Browse" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonUI" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Reliability" /v "SnapShot" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Reliability Analysis\WMI" /v "WMIEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability" /v "ShutdownReasonUI" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability" /v "ShutdownReasonOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability\shutdown" /v "ReasonCode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "EnableUiaRedirection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowDesktopCompositionOnServer" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowFullControl" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnlistedRemotePrograms" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnSolicitedFullControl" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDenyTSConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableAudioCapture" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableAutoReconnect" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCam" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCameraRedir" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCcm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCdm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableClip" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCpm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableLocationRedir" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableLPT" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisablePNPRedir" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fEnableSmartCard" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fEnableTimeZoneReDirection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fNoRemoteDesktopWallpaper" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fPromptForPassword" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fSingleSessionPerUser" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fUseMailTo" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "maxticketexpiry" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "maxticketexpiryunits" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxInstanceCount" /t REG_DWORD /d "999" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "Password" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "Shadow" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "UserAuthentication" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "Username" /t REG_SZ /d "Ariel" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\TSAppSrv\VirtualIP" /v "EnableVirtualIP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\TSAppSrv\VirtualIP" /v "VirtualMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\TSAppSrv\VirtualIP" /v "PerApp" /t REG_MULTI_SZ /d "" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "AllowRemoteRPC" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "fSingleSessionPerUser" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "MaxInstanceCount" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "PerSessionTempDir" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "TSUserEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration" /v "fInheritAutoLogon" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration" /v "fLogonDisabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration" /v "fPromptForPassword" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration" /v "fReconnectSame" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration" /v "Password" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration" /v "Shadow" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration" /v "Username" /t REG_SZ /d "Ariel" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fAutoClientDrives" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fAutoClientLpts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fDisableAudioCapture" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fDisableCam" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fDisableCcm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fDisableCdm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fDisableClip" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fDisableCpm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fDisableEncryption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fDisableLPT" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fEnableBreakDisconnect" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fEnableDsrSensitivity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fEnableDTR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fEnableRTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fFlowSoftwareRx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fFlowSoftwareTx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fForceClientLptDef" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "fInheritAutoClient" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "FlowHardwareRx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "FlowHardwareTx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "FlowType" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "InputBufferLength" /t REG_DWORD /d "2048" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "MaxInstanceCount" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "MinEncryptionLevel" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "SelectNetworkDetect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "SelectTransport" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "Username" /t REG_SZ /d "Ariel" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "XoffChar" /t REG_DWORD /d "19" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd" /v "XonChar" /t REG_DWORD /d "17" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\Console" /v "Shadow" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fAllowSecProtocolNegotiation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fAutoClientDrives" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fAutoClientLpts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableAudioCapture" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableCam" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableCcm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableCdm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableClip" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableCpm" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableEncryption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableExe" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fDisableLPT" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fEnableWinStation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fForceClientLptDef" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fHomeDirectoryMapRoot" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fInheritAutoClient" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fInheritAutoLogon" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fInheritCallback" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fInheritShadow" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fLogonDisabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fPromptForPassword" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "fReconnectSame" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "MaxInstanceCount" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "SelectNetworkDetect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "SelectTransport" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "Shadow" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "Username" /t REG_SZ /d "Ariel" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v "UserAuthentication" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Terminal Server Client" /v "ShowShutdownDialog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "BlockProtocolElevation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "DefaultFileTypeRisk" /t REG_DWORD /d "6152" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "LowRiskFileTypes" /t REG_SZ /d ".7z;.7zip;.avi;.bat;.bmp;.chm;.cmd;.com;.doc;.exe;.htm;.html;.js;.jpg;.jpeg;.lnk;.m3u;.mkv;.mpg;.mpeg;.mov;.mp3;.mp4.msi;.rar;.reg;.pdf;.pptx;.ps1;.txt;.tgz;.tif;.tiff.;.vbs;.wav;.xls;.xlsx;.zip" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "BlockProtocolElevation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "DefaultFileTypeRisk" /t REG_DWORD /d "6152" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "LowRiskFileTypes" /t REG_SZ /d ".7z;.7zip;.avi;.bat;.bmp;.chm;.cmd;.com;.doc;.exe;.htm;.html;.js;.jpg;.jpeg;.lnk;.m3u;.mkv;.mpg;.mpeg;.mov;.mp3;.mp4.msi;.rar;.reg;.pdf;.pptx;.ps1;.txt;.tgz;.tif;.tiff.;.vbs;.wav;.xls;.xlsx;.zip" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Calculator" /v "AllowGraphingCalculator" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Settings" /v "DisableModernPaintBootstrap" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\MobilityCenter" /v "NoMobilityCenter" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum" /v "{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum" /v "{0DF44EAA-FF21-4412-828E-260A8728E7F1}" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum" /v "{450D8FBA-AD25-11D0-98A8-0800361B1103}" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum" /v "{6DFD7C5C-2451-11d3-A299-00C04F8EF6AF}" /t REG_DWORD /d "1073741857" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum" /v "{BDEADF00-C265-11D0-BCED-00A0C90AB50F}" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Programs" /v "NoGetPrograms" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Programs" /v "NoProgramsAndFeatures" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Programs" /v "NoProgramsCPL" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Programs" /v "NoWindowsMarketplace" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Programs" /v "NoGetPrograms" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Servicing" /v "CountryCode" /t REG_SZ /d "GB" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "BlockHostedAppAccessWinRT" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DSCAutomationHostEnabled" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableAutomaticRestartSignOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableCAD" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableRegistryTools" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableStartupSound" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisplayLastLogonInfo" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DontDisplayLastUsername" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableCursorSuppression" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFullTrustStartupTasks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLinkedConnections" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUWPStartupTasks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "HideUnsupportedHardwareNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "InactivityTimeoutSecs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "LocalAccountTokenFilterPolicy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "MSAOptional" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoConnectedUser" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoDispCPL" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoWindowsMarketplace" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "scforceoption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "shutdownWithoutlogon" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "SupportFullTrustStartupTasks" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "SupportUWPStartupTasks" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "SynchronousUserGroupPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "UndockWithoutlogon" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\SmartGlass" /v "BluetoothPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\SmartGlass" /v "UserAuthPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\UnInstall" /v "NoAddFromInternet" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\UnInstall" /v "NoSupportInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Manufacturer" /t REG_SZ /d "ASUS" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Model" /t REG_SZ /d "Prime Z-790-P Wifi" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOwner" /t REG_SZ /d "Ariel Silverstone" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\EMDMgmt" /v "AllowNewCachesByDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\EMDMgmt" /v "GroupPolicyDisallowCaches" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "Low" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "AllowWindowsEntitlementReactivation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v "DisableDnsPublishing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "NoGenTicket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Virtualization\Replication" /v "DisableCertRevocationCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Multimedia\DrawDib" /v " 3840x2160x32(BGR 0)" /t REG_SZ /d "31,31,31,31" /f
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\Security\TrustManager\PromptingLevel" /v "Internet" /t REG_SZ /d "Enabled" /f
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\Security\TrustManager\PromptingLevel" /v "LocalIntranet" /t REG_SZ /d "Enabled" /f
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\Security\TrustManager\PromptingLevel" /v "MyComputer" /t REG_SZ /d "Enabled" /f
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\Security\TrustManager\PromptingLevel" /v "OnlyUseLatestCLR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\Security\TrustManager\PromptingLevel" /v "TrustedSites" /t REG_SZ /d "Enabled" /f
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\Security\TrustManager\PromptingLevel" /v "UntrustedSites" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\Software\Microsoft\.NETFramework" /v "OnlyUseLatestCLR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\.NETFramework" /v "OnlyUseLatestCLR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ActiveHoursEnd" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ActiveHoursStart" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "activehoursmaxrange" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "AutorestartNotificationSchedule" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "AutorestartRequiredNotificationdismissal" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ActiveHoursEnd" /t REG_DWORD /d "23" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ActiveHoursStart" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "AllowOptionalContent" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "AllowRebootlessUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "AUPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "AutoRestartDeadlinePeriodInDays" /t REG_DWORD /d "39198" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "AutoRestartDeadlinePeriodInDaysForFeatureUpdates" /t REG_DWORD /d "39198" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdatesPeriodInDays" /t REG_DWORD /d "39321" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferQualityUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferQualityUpdatesPeriodInDays" /t REG_DWORD /d "629145" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "629145" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableDualScan" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWUfBSafeguards" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ElevateNonAdmins" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "EnableFeaturedSoftware" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuilds" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuildsPolicyValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "NoAUAsDefaultShutdownOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "NoAUShutdownOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "NoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "SetActiveHours" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "SetActiveHoursMaxRange" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "SetAllowOptionalContent" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "SetAutoRestartDeadline" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "SetAutoRestartNotificationConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "SetAutoRestartNotificationDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "SetAutoRestartRequiredNotificationDismissal" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "SetUpdateNotificationLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "UpdateNotificationLevel" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "**del.RebootRelaunchTimeout" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "**del.RebootWarningTimeout" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AlwaysAutoRebootAtScheduledTime" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AlwaysAutorebootatScheduledTimeminutes" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AllowMUUpdateservice" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutomaticMaintenanceEnabled" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequencyEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "EnableFeaturedSoftware" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "IncludeRecommendedUpdates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAUAsDefaultShutdownOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAUShutdownOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpgrade" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RebootRelaunchTimeoutEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RebootWarningTimeoutEnabled" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallDay" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallEveryWeek" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallFirstWeek" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallFourthWeek" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallSecondWeek" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallThirdWeek" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallTime" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UpdateServiceUrlAlternate" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\EditionSettings" /v "LogDir" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKLM\SYSTEM\Setup\UpgradeNotification" /v "UpgradeAvailable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971f918-a847-4430-9279-4a52d1efe18d" /v "RegisteredWithAU" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971f918-a847-4430-9279-4a52d1efe18d" /v "LastTaskOperationHandle" /t REG_DWORD /d "15" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "DeferQualityUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "DeferFeatureUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsDeferralIsActive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsWUfBConfigured" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsWUfBDualScanActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "FeatureUpdatesDeferralInDays" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "ExcludeWUDrivers" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "PolicySources" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "FlightSettingsMaxPauseDays" /t REG_DWORD /d "7300" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "IsContinuousInnovationOptedIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "SmartActiveHoursSuggestionState" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "TrayIconVisibility" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "UxOption" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SystemCertificates\AuthRoot" /v "DisableRootAutoUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "100663296" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\BitlockerStatus" /v "BootStatus" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\BitlockerStatus" /v "PreventDeviceEncryption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e96a-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUDMA66" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "AlwaysKeepMemoryDump" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisableEmoticon" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DumpLogLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "EnableLogFile" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "Overwrite" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "SendAlert" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl\StorageTelemetry" /v "DeviceDumpEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "DisableDeleteNotification" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NTFSDisable8dot3NameCreation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NTFSDisableEncryption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d "2147483649" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NTFSMemoryUsage" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NTFSMftZoneReservation" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "RefsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies" /v "DisableDeleteNotification" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies" /v "NTFSDefaultTier" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies" /v "NTFSDisableEncryption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies" /v "NTFSEncryptPagingFile" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies" /v "NTFSDisable8dot3NameCreation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies" /v "NTFSDisableLastAccessUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "CSEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "EcoModeState" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\System\CurrentControlSet\Control\Power" /v "PlatformAoACOverride" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\PSched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\0" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\0" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\1" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\1" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "34" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurePipeServers\winreg" /v "remoteregaccess" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "AutoChkTimeout" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "DisableWpbtExecution" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager" /v "BackupCount" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager" /v "EnablePeriodicBackup" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager\LastKnownGood" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "AllowRemoteDASD" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableTSX" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "AutoChkTimeout" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableBoottrace" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "IOPageLockLimit" /t REG_DWORD /d "41231686041" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "512" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBootTrace" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "isMemoryCompressionEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\SafeBoot\Minimal\MSIServer" /ve /t REG_SZ /d "Service" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\SafeBoot\Network\MSIServer" /ve /t REG_SZ /d "Service" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\TimeZoneInformation" /v "RealTimeIsUniversal" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\W32Time\TimeProviders\NTPClient" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "**del.LimitSystemRestoreCheckpointing" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "AllowLockdownMedia" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "DisableAutomaticApplicationShutdown" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "DisableMSI" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "DisablePatchUninstall" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "EnableUserControl" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\Hotpatch\Environment" /v "AllowRebootlessUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides" /v "3716656780" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NvCache" /v "OptimizeBootAndResume" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Dfrg\BootOptimizeFunction" /v "Enable" /t REG_SZ /d "N" /f
Reg.exe add "HKLM\Software\Microsoft\Dfrg\BootOptimizeFunction" /v "OptimizeComplete" /t REG_SZ /d "No" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout" /v "EnableAutoLayout" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableDpxLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\EventLog\System\Microsoft-Windows-Firewall" /v "ProviderGuid" /t REG_SZ /d "{e595f735-b42a-494b-afcd-b68666945cd3}" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\EventLog\System\Microsoft-Windows-Firewall" /v "EventMessageFile" /t REG_SZ /d "%%SystemRoot%%\System32\mpssvc.dll" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\EventLog\System\Microsoft-Windows-Windows Firewall With Advanced Security" /v "ProviderGuid" /t REG_SZ /d "{d1bc9aff-2abf-4d71-9146-ecb2a986eb85}" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\EventLog\System\Microsoft-Windows-Windows Firewall With Advanced Security" /v "EventMessageFile" /t REG_SZ /d "%%SystemRoot%%\System32\mpssvc.dll" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\IPSec\ICFv4" /v "BypassFirewall" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" /v "LogDroppedPackets" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" /v "LogSuccessfulConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsFirewall\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsFirewall\StandardProfile\Logging" /v "LogDroppedPackets" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsFirewall\StandardProfile\Logging" /v "LogSuccessfulConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "PUAProtection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows Defender\mpengine" /v "mpCloudBlocklevel" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\mpengine" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Policy Manager" /v "AllowCloudProtection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\NIS" /v "DisableDatagramProcessing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealTimeMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealTimeEnable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScriptScanning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableRealTimeMonitoring" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "RealTimeScanDirection" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericRePorts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableLoggingForUnknown" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "WPPTracingLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "AllowPause" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableEmailScanning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableHeuristics" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableRemovableDriveScanning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableReparsePointScanning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableRestorePoint" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableScanningMappedNetworkDrivesForFullScan" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableScanningNetworkFiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "DisableScanOnUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "DisableScheduledSignatureUpdateOnBattery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "DisableUpdateOnStartupWithoutEngine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "ForceUpdateFromMU" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "MeteredConnectionUpdates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "RealTimeSignatureDelivery" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "UpdateOnStartUp" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "LastMAPSSuccessTime" /t REG_BINARY /d "ea034966d279d601" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "LastMAPSFailureTime" /t REG_BINARY /d "3366c3a7217ad601" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "MAPSConcurrency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "MAPSConcurrencyDSS" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "SSLOptions" /t REG_DWORD /d "3" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\software\Microsoft\Windows defender\spynet" /v "spynetreporting" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\software\Microsoft\Windows defender\spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\UX Configuration" /v "Notification_Suppress" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "ExploitGuard_ControlledFolderAccess_ProtectedFolders" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "EnableControlledFolderAccess" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access\ProtectedFolders" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" /v "EnableNetworkProtection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Family options" /v "UILockdown" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Systray" /v "HideSystray" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\Security Center" /v "SecurityCenterInDomain" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControl" /t REG_SZ /d "Anywhere" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Security Health\State" /v "AppAndBrowser_EdgeSmartScreenOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Security Health\State" /v "AppAndBrowser_PUASmartScreenOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Security Health\State" /v "AppAndBrowser_StoreAppsSmartScreenOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\Default\Browser\AllowSmartScreen" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\SmartScreen\EnableSmartScreenInShell" /v "Behavior" /t REG_DWORD /d "73760" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\SmartScreen\EnableSmartScreenInShell" /v "GPBlockingRegKeyPath" /t REG_SZ /d "Software\Policies\Microsoft\Windows\System" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\SmartScreen\EnableSmartScreenInShell" /v "GPBlockingRegValueName" /t REG_SZ /d "EnableSmartScreen" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\SmartScreen\EnableSmartScreenInShell" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRE" /v "DisableSetup" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WTDS\Components" /v "CaptureThreatWindow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WTDS\Components" /v "NotifyMalicious" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WTDS\Components" /v "NotifyPasswordReuse" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WTDS\Components" /v "NotifyUnSafeApp" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WTDS\Components" /v "ServiceEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Windows Defender" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Intel® Arc™ Control" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "ImagePath" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "DPIMapIOMMUContiguous" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAcmSupportDeveloperPreview" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePreemption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDebugMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitCount" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitTime" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "TdrTestMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "VsyncIdleTimeout" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "Adaptive De-interlacing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DDC2Disabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableAllClockGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableCpPowerGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableDynamicGfxMGPowerGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableFBCSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableGfxCGPowerGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableGfxClockGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisablePCIConfigAsicReset" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisablePowerGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableRlcSmuPGHandshake" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableStaticGfxMGPowerGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "DisableSysClockGating" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "EnableCrossFireAutoLink" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "EnableLBPWSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "ExtEvent_BIOSEventByInterrupt" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "GCOOPTION_DisableGPIOPowerSaveMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "GamePerformanceAdviserEnabled" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "KMD_CursorMagnificationThreshold" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "KMD_EnableOPM2Interface" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "LazyPreload" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "MemInitLatencyTimer" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "MultiFunctionSupported" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "TVDisableModes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "TVEnableOverScan" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "TimingSelection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "UA_Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "VPE Adaptive De-interlacing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "VGACompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\Video\{10776D1A-2D77-11EE-8A20-806E6F6E6963}\0000" /v "wmAGPMaxIdleClk" /t REG_DWORD /d "32" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;DXGIEffects=1028;VRROptimizeEnable=1;AutoHDREnable=48;HighPerfAdapter=8086&56A2&60031849" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DXGIEffects" /t REG_DWORD /d "4136" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "AutoHDREnable" /t REG_DWORD /d "72" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "SwapEffectUpgradeEnable" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "VRROptimizeEnable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\DirectX" /v "D3D11_MULTITHREADED" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\DirectX" /v "D3D12_MULTITHREADED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\DirectX" /v "D3D11_RESOURCE_ALIGNMENT" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\DirectX" /v "D3D12_RESOURCE_ALIGNMENT" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\DirectX" /v "D3D12_CPU_PAGE_TABLE_ENABLED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\DirectX" /v "D3D12_HEAP_SERIALIZATION_ENABLED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\DirectX" /v "D3D12_RESIDENCY_MANAGEMENT_ENABLED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "**del.KFMBlockOptIn" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "**del.KFMOptInWithWizard" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "**del.KFMSilentOptIn" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "**del.KFMSilentOptInWithNotification" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "**del.LocalMassDeleteFileDeleteThreshold" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "**del.MinDiskSpaceLimitInMB" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "BlockExternalSync" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "DefaultRootDir" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "DisableFREAnimation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "DisableFirstDeleteDialog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "DisableLibrariesDefaultSaveToOneDrive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "DisablePauseOnBatterySaver" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "DisablePauseOnMeteredNetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "DisableTutorial" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "EnableContactSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "EnableSendFeedback" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "EnableSurveyCampaigns" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "EnableSyncAdminReports" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "EventLoggingLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "FilesOnDemandEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "GoOfflineAction" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "KFMBlockOptin" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\OneDrive" /v "KFMOptInWithWizard" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "KFMSilentOptInDesktop" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "KFMSilentOptInDocuments" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "KFMSilentOptInPictures" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\OneDrive" /v "KFMSilentOptInWithNotification" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\OneDrive" /v "KFMSilentOptIn" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "LocalMassDeleteFileDeleteThreshold" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "PermitDisablePermissionInheritance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\OneDrive" /v "PreventNetworkTrafficPreUserSignIn" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\OneDrive" /v "DefaultRootDir" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\OneDrive\DefaultRootDir" /v "o:\\" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSync" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableLibrariesDefaultSaveToOneDrive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableMeteredNetworkFileSync" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisablePauseOnBatterySaver" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "4035969101" /f
Reg.exe add "HKCU\Software\Classes\WOW6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "4035969101" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "AMDNoiseSuppression" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "AzureArcSetup" /t REG_BINARY /d "000000000000000000000000" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "OODITRAY.EXE" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "RtkAudUService" /t REG_BINARY /d "020000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Reflect UI" /t REG_BINARY /d "020000000000000000000000" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" /v "Intel® Arc™ Control" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder" /v "WinMFT Cleanup.lnk" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WorkFolders" /v "AutoProvision" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WorkFolders" /v "LocalFolderPath" /t REG_SZ /d "D:\WorkFolders" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WorkFolders" /v "GhostingPreference" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WorkplaceJoin" /ve /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WorkplaceJoin" /v "autoWorkplaceJoin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WorkplaceJoin" /v "BlockAADWorkplaceJoin" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Command Processor" /v "AutoRun" /t REG_SZ /d "CD /D D:\Desktop" /f
Reg.exe add "HKLM\Software\Microsoft\Command Processor" /v "CompletionChar" /t REG_DWORD /d "9" /f
Reg.exe add "HKLM\Software\Microsoft\Command Processor" /v "EnableExtensions" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Command Processor" /v "InteractiveExtensionLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Command Processor" /v "PathCompletionChar" /t REG_DWORD /d "9" /f
Reg.exe add "HKLM\Software\Microsoft\Fusion" /v "DisableCacheViewer" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\PCHC" /v "PreviousUnInstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\PCHC" /v "UpgradeEligibility" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Wbem\CIMOM" /v "EnableEvents" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Enum\USB" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Enum\USB" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Group Policy" /v "EnableLocalStoreOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Editor\ADMX Filter" /v "KeywordsLanguage" /t REG_DWORD /d "2057" /f
Reg.exe add "HKLM\System\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\TPM" /v "OSManagedAuthLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowAllTrustedApps" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowDevelopmentWithoutDevLicense" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Classes\AppID\slui.exe" /v "NoGenTicket" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Digital Locker" /v "DoNotRunDigitalLocker" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "**del.ReminderFreqMinutes" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "**del.InitialBalloonTimeoutSeconds" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "**del.ReminderBalloonTimeoutSeconds" /t REG_SZ /d " " /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "BackgroundSyncBlockOutDurationMin" /t REG_DWORD /d "800" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "BackgroundSyncBlockOutStartTime" /t REG_DWORD /d "2000" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "BackgroundSyncEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "BackgroundSyncEnabledForForcedOffline" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "BackgroundSyncIgnoreBlockOutAfterMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "BackgroundSyncMaxStartMin" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "BackgroundSyncPeriodMin" /t REG_DWORD /d "360" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "EconomicalAdminPinning" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "EncryptCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "EventLoggingLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "ExcludeExtensions" /t REG_SZ /d "\"*.lnk\";\"*.tmp\";\"*.log\";\"*.temp\";\"*.crdownload\"" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "GoOfflineAction" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "NoCacheViewer" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "noconfigcache" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "nomakeavailableoffline" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "NoReminders" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "OnlineCachingLatencyThreshold" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "PeerCachingLatencyThreshold" /t REG_DWORD /d "80" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "SlowLinkEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "SlowLinkSpeed" /t REG_DWORD /d "99999999" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "SyncEnabledForCostedNetwork" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "SyncAtLogoff" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "SyncAtLogon" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "SyncAtSuspend" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache" /v "WorkOfflineDisabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache\AssignedOfflineFolders" /v "\\msi\d$\Desktop" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\NetCache\SlowLinkParams" /v "*" /t REG_SZ /d "Throughput=10000,Latency=50" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableExperimentation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\Current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Safer\codeidentifiers" /v "authenticodeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\ScPnP" /v "EnableScPnP" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "DisableQueryRemoteServer" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "EnableQueryRemoteServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Server\InitialConfigurationTasks" /v "DoNotOpenAtLogon" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Sudo" /v "Enabled" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Sudo" /v "Enabled" /t REG_DWORD /d "3" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
