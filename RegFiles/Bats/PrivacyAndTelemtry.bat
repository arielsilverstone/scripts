@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "PrivacyNTelemteryChanged" /f
Reg.exe add "HKCU\Changes" /v "PrivacyNTelemteryChanged" /t REG_SZ /d "27JAN25" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\DataSharing" /f
Reg.exe add "HKLM\Software\Microsoft\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Biometrics\Credential Provider" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\WinBio\Credential Provider" /v "Domain Accounts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\FindMyDevice" /v "AllowFindMyDevice" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\FindMyDevice" /v "LocationSyncEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WMDRM" /v "DisableOnline" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "DesktopShortcut" /t REG_SZ /d "no" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "DisableAutoUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "GroupPrivacyAcceptance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventCDDVDMetadataRetrieval" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventCodecDownload" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventLibrarySharing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventMusicFileMetadataRetrieval" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventRadioPresetsRetrieval" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "QuickLaunchShortcut" /t REG_SZ /d "no" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer" /v "UsageTracking" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "DisableMRU" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer\Protocols" /v "WindowsMediaStreamingProtocols" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer\Protocols" /v "Multicast" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer\Protocols" /v "UDP" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer\Protocols" /v "TCP" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer\Protocols" /v "HTTP" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "NoLockScreenCamera" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "NoLockScreenSlideshow" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLanguageFeaturesUninstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Lock Screen" /v "SlideshowDuration" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\SessionData" /v "AllowLockScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Camera" /v "AllowCamera" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Media Foundation" /v "EnableFrameServerMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "HistoryViewEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationEnableAboveLockscreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationLastUsed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationOnLockScreenEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Speech" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\UEV\Agent\Configuration" /v "CustomerExperienceImprovementProgram" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\UEV\Agent\Configuration" /v "DontSyncWindows8AppSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\UEV\Agent\Configuration" /v "SynceEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\UEV\Agent\Configuration" /v "SyncOverMeteredNetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\UEV\Agent\Configuration" /v "SyncOverMeteredNetworkWhenRoaming" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\Default\WiFi\AllowWiFiHotSpotReporting" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\Default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fDisablePowerManagement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\WcmSvc\Local" /v "WCMPresent" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\LocationAndSensors" /v "LocationEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Input\Settings" /v "EnableExpressiveInputShellHotkey" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Input\Settings" /v "EnableExpressiveInputEmojiMultipleSelection" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Input\Settings" /v "EnableHwkbAutocorrection2" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Input\Settings" /v "EnableHwkbTextPrediction" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Input\Settings" /v "MultilingualEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "AutoAccent" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "AutoApostrophe" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "AutoCap" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "AutoCapAllTokens" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "AutoCorrectFirstWord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "AutoCorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "AutoCorrectVisualDelay" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "DictationEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "DisablePersonalization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "EmojiSuggestion" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "EmojiTranslation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "EnableExpressiveInputShellHotkey" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "EnableHwkbAutocorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "EnableHwkbAutocorrection2" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "EnableHwkbMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "EnableHwkbTextPrediction" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "HarvestContacts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "HasTrailer" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "HwkbInlinePredictionAlwaysOffList" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "IsVoiceTypingKeyEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "KeyboardMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "LMDataLoggerEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "MultilingualEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "PeriodShortcut" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "Prediction" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "Private" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "ProofDataSources" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "SearchDataSources" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "ShortenMultilingualTraversal" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Input\Settings" /v "Spellcheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" /v "AllowSuggestedAppsInWindowsInkWorkspace" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceButtonDesiredVisibility" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\software\policies\Microsoft\PenTraining" /v "DisablePenTraining" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\ImproveInkingAndTyping" /v "DefaultValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\ImproveInkingAndTyping" /v "InheritsFromDevice" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\ImproveInkingAndTyping" /v "LegacyKeyName" /t REG_SZ /d "Enabled" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\ImproveInkingAndTyping" /v "LegacyKeyType" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\ImproveInkingAndTyping" /v "LegacyProjection" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\InternetManagement" /v "RestrictCommunication" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Troubleshooting\AllowRecommendations" /v "TroubleshootingAllowRecommendations" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "AllOrNone" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "DWNoSecondLevelCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "DWNoFileCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "DWNoExternalURL" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "ForceQueueMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "IncludeKernelFaults" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "IncludeMicrosoftApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "IncludeShutdownErrs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "IncludeWindowsApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "ShowUI" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "AllOrNone" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "DWNoSecondLevelCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "DWNoFileCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "DWNoExternalURL" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "ForceQueueMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "IncludeKernelFaults" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "IncludeMicrosoftApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "IncludeShutdownErrs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PCHealth\ErrorReporting" /v "IncludeWindowsApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWAllowHeadless" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWFileTreeRoot" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoExternalURL" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoFileCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoSecondLevelCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWReporteeName" /t REG_SZ /d "shit" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\EventViewer" /v "MicrosoftEventVwrDisableLinks" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\HelpSvc" /v "Headlines" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\PCHealth\HelpSvc" /v "MicrosoftKBSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\MdmCommon\SettingValues" /v "LocationSyncEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "PreventAutoRun" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SoundRecorder" /v "Soundrec" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SoundRecorder" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t REG_SZ /d "ichs.local" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "studyid" /f
Reg.exe add "HKLM\Software\Microsoft\SQMClient\Windows" /v "DisableOptinExperience" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\SQMClient\Windows" /v "SqmLoggerRunning" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\SQMClient\Reliability" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\SQMClient\Reliability" /v "SqmLoggerRunning" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\AppV\CEIP" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\FVE\MDOPBitLockerManagement\Configuration" /v "CustomerExperienceImprovementProgram" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DisableOneSettingsDownloads" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "LimitDiagnosticLogCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MicrosoftEdgeDataOptIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowCommercialDataPipeline" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowDesktopAnalyticsProcessing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowUpdateComplianceProcessing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowWUfBCloudProcessing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "CommercialId" /t REG_SZ /d "0" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "ConfigureMicrosoft365UploadEndpoint" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableDeviceDelete" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableDiagnosticDataViewer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableEnterpriseAuthProxy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableOneSettingsDownloads" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableTelemetryOptInChangeNotification" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableTelemetryOptInSettingsUx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "EnableOneSettingsAuditing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "LimitDiagnosticLogCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "LimitDumpCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "LimitEnhancedDiagnosticDataWindowsAnalytics" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "MicrosoftEdgeDataOptIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "TelemetryProxyServer" /t REG_SZ /d "host.local:8080" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowCommercialDataPipeline" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowDesktopAnalyticsProcessing" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowUpdateComplianceProcessing" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowWUfBCloudProcessing" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "CommercialId" /t REG_SZ /d "0" /f
Reg.exe delete "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "ConfigureMicrosoft365UploadEndpoint" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableDeviceDelete" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableDiagnosticDataViewer" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableEnterpriseAuthProxy" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableOneSettingsDownloads" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableTelemetryOptInChangeNotification" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableTelemetryOptInSettingsUx" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "EnableOneSettingsAuditing" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "LimitDiagnosticLogCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "LimitDumpCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "LimitEnhancedDiagnosticDataWindowsAnalytics" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "MicrosoftEdgeDataOptIn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "TelemetryProxyServer" /t REG_SZ /d "host.local:8080" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableEngine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisablePCAUI" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "disableproppage" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "SbEnable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "VDMDisallowed" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\AppCompat]" /v "DisablePCA" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Appraiser" /v "HaveUploadedForTarget" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\AIT" /v "AITEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "IsCensusDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "DontRetryOnError" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "TaskEnableRun" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies\Microsoft\Compatibility" /v "DisableDeviceFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Policies\Microsoft\Compatibility" /v "DisableDriverShims" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{A2E30F80-D7DE-11d2-BBDE-00C04F86AE3B}" /v "NoSlowLink" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{A2E30F80-D7DE-11d2-BBDE-00C04F86AE3B}" /v "NoBackgroundPolicy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{A2E30F80-D7DE-11d2-BBDE-00C04F86AE3B}" /v "NoGPOListChanges" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Tracing" /v "EnableConsoleTracing" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "AllowAdvertising" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\AdvertisingInfo" /v "DefaultValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\AdvertisingInfo" /v "InheritsFromDevice" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\AdvertisingInfo" /v "LegacyKeyName" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\AdvertisingInfo" /v "LegacyKeyType" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\AdvertisingInfo" /v "LegacyProjection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\AdvertisingInfo" /v "ManageLegacyKeySecurity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\UserPolicy\AdvertisingInfo" /v "StaticMigrationPath" /t REG_SZ /d "-" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Bluetooth\AllowAdvertising" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Bluetooth\AllowPromptedProximalConnections" /v "value" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /v "DeviceMetadataServiceURL" /t REG_SZ /d "about:blank" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /v "MaxRetryLimit" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /v "RequestBatchSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "EnableSecondOOBE" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components" /v "CaptureThreatWindow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v "DetailedFeedback" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v "ScriptingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v "WinEnterLaunchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\LiveCaptions\UI" /v "ProfanityFilterOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell\Update\TelemetryID" /v "TelemetryID" /t REG_SZ /d "FUCK-MICROSOFT" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\NVlddmkm" /v "EnableRID73779" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\NVlddmkm" /v "EnableRID73780" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\NVlddmkm" /v "EnableRID74361" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\NVlddmkm" /v "NVFBCEnable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\CoProcManager" /v "ShowContextMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\CoProcManager" /v "ShowTrayIcon" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\NVCplApi\Policies" /v "ContextUIPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\Stereo3D" /v "EnablePersistentStereoDesktop" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\Stereo3D" /v "EnableWindowedMode" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\Stereo3D" /v "StereoRefreshDefaultOn" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\Stereo3D" /v "StereoTypeSet" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\Global\Stereo3D" /v "StereoVisionConfirmed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\NvTray" /v "StartOnLogin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\NVControlPanel2\Client" /v "launchsource" /t REG_DWORD /d "61" /f
Reg.exe add "HKLM\Software\NVIDIA Corporation\NVControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
