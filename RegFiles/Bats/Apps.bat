@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "AppsFileChanged" /f
Reg.exe add "HKCU\Changes" /v "AppsFileChanged" /t REG_SZ /d "14JAN25" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ctfmon.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\fontdrvhost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\fontdrvhost.exe\PerfOptions" /v "IoPriority" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "d:\PortApps\Notepad++\notepad++.exe -notepadStyleCmdline -z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Notepad++" /t REG_SZ /d "D:\PortApps\Notepad++\notepad++.exe" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "readme" /t REG_SZ /d "call NotepadStarter.exe instead of notepad.exe. To disable this option remove notepad.exe entry" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sihost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sihost.exe\PerfOptions" /v "IoPriority" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sppsvc.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sppsvc.exe\PerfOptions" /v "IoPriority" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\osu!.exe" /v "EAFModules" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\osu!.exe" /v "MitigationAuditOptions" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\osu!.exe" /v "MitigationOptions" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgc.exe" /v "EAFModules" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgc.exe" /v "MitigationAuditOptions" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgc.exe" /v "MitigationOptions" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Adobe\Adobe Genuine Service\Consent\Retail" /v "ConsentInfo" /t REG_MULTI_SZ /d "UserType: YellowZone\0Consent: No | DateAndTime: 1716503758 | DontAskAgain: No | ConsentedButtonText: Install | Retries: 0 | Pending: No" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Font Drivers" /v "Adobe Type Manager" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Font Drivers" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SharedTaskScheduler" /v "{8E1DF471-6439-4FBB-AC8D-97CC89D10700}" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SharedTaskScheduler" /f
Reg.exe delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\SharedTaskScheduler" /v "{8E1DF471-6439-4FBB-AC8D-97CC89D10700}" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\SharedTaskScheduler" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\{8E1DF471-6439-4FBB-AC8D-97CC89D10700}" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\EldosIconOverlay-cbfs6" /f
Reg.exe delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\EldosIconOverlay-cbfs6" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Printers\PropertyBags\Manufacturers\HP" /v "DuplexDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Printers\PropertyBags\Manufacturers\HP" /v "GrayscaleDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Printers\PropertyBags\Manufacturers\HP" /v "PrintQuality" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Printers\PropertyBags\Manufacturers\HP" /v "PrivatePrintDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Printers\PropertyBags\Manufacturers\HP" /v "PrivatePrintPin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\Local Settings\Printers\PropertyBags\Manufacturers\HP" /v "SEPMinimumPasswordLength" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "AllowUserDefaults" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "DuplexDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "EconomodeDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "EdgelineQACDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "GrayscaleDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "OfficeInkDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "PrivatePrintDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "PrivatePrintPin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Hewlett-Packard\HP Print Settings\ADSPrintPolicy" /v "SEPMinimumPasswordLength" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Intel\PSIS" /f
Reg.exe delete "HKLM\SOFTWARE\Intel\Driver and Support Assistant" /f
Reg.exe add "HKLM\Software\Intel\Display\igfxcui\3D" /v "PrebuiltShaderBinaryDirPath" /t REG_SZ /d "d:\Program Files\Intel\PrebuiltShaderBinaries" /f
Reg.exe add "HKLM\Software\Intel\InfInst" /v "RebootRequired" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Intel\Intel Arc Control" /v "Shortcut" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\Software\Intel\Prounstl\Services" /v "ixgbt" /f
Reg.exe add "HKLM\Software\Intel\Prounstl\Services" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Drivers32" /v "vidc.i420" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Drivers32" /v "vidc.spv1" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Drivers32" /f
Reg.exe delete "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Drivers32" /v "vidc.i420" /f
Reg.exe delete "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Drivers32" /v "vidc.spv1" /f
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Drivers32" /f
Reg.exe add "HKLM\SOFTWARE\Mellanox\MLNX_WinOF2" /v "InstalledPath" /t REG_SZ /d "D:\program files\mellanox\MLNX_WinOF2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\ClickToRun\OverRide" /v "DisableLogManagement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\ClickToRun\OverRide" /v "InstallPath" /t REG_SZ /d "D:\Program Files\Office" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v "TimerInterval" /t REG_SZ /d "900000" /f
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "d:\PortApps\Notepad++\notepad++.exe -notepadStyleCmdline -z" /f
Reg.exe add "HKLM\SOFTWARE\Macrium\RMBuilder\Settings" /v "unsupported" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Macrium\RMBuilder\Settings" /v "bootprompt" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Macrium\RMBuilder\Settings" /v "multiboot" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Macrium\RMBuilder\Settings" /v "iscsi" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Macrium\RMBuilder\Settings" /v "networkprofiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Macrium\RMBuilder\Settings" /v "addwifi" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Macrium\RMBuilder\Settings" /v "staticip" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\StarWind Software\License\StarWindService" /v "LicenseInstallCheckProductType" /t REG_SZ /d "Pegasus" /f
Reg.exe add "HKLM\Software\StarWind Software\License\StarWindService" /v "OldLicenseInstallCheckProductType" /t REG_SZ /d "Pegasus" /f
Reg.exe add "HKCU\Software\SysInternals" /v "EulaAccepted" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\SysInternals\AutoRuns" /v "EulaAccepted" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorGraphBk" /t REG_DWORD /d "15790320" /f
Reg.exe add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorGraphBkDark" /t REG_DWORD /d "3421236" /f
Reg.exe add "HKLM\Software\Thorium" /v "UsageStatsInSample" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Oracle\VBoxSDS" /v "ServerSession0" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects" /f
Reg.exe delete "HKLM\Software\Clients\StartMenuInternet\Microsoft Edge" /f
Reg.exe delete "HKLM\Software\Clients\StartMenuInternet\IEXPLORE.EXE" /f
Reg.exe delete "HKLM\Software\WOW6432Node\Microsoft\EdgeUpdate" /f
Reg.exe delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Extensions" /f
Reg.exe delete "HKCR\OCHelper.BrowserHelper" /f
Reg.exe delete "HKCR\OCHelper.BrowserHelper.1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\EdgeUpdateDev" /v "AllowUninstall" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Edge\SmartScreenAllowListDomains" /v "1" /t REG_SZ /d "*" /f
Reg.exe add "HKCU\Software\Microsoft\Edge\SmartScreenEnabled" /ve /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\MicrosoftEdge" /v "PreventFirstRunPage" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "PreventOverride" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MicrosoftEdge" /v "OSIntegrationLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\MicrosoftEdge" /v "OSIntegrationLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\MicrosoftEdge" /v "OSIntegrationLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\MicrosoftEdge" /v "OSIntegrationLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Edge\Defaults" /v "is_DSE_Recommended" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Internet Explorer" /v "No3DBorder" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Internet Explorer" /v "RtfConverterFlags" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Internet Explorer" /v "AppliedUnattend" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Internet Explorer\AutoComplete" /v "Append Completion" /t REG_SZ /d "no" /f
Reg.exe add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "DoNotTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "EnablePreBinding" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "HideNewEdgeButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes" /v "ShowSearchSuggestionsInAddressGlobal" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer" /v "AllowServicePoweredQSA" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer\Feed Discovery" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer\Feeds" /v "BackgroundSyncStatus" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer\Feeds" /v "DisableEnclosureDownload" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer\Feeds" /v "DisableAddRemove" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer\Feeds" /v "DisableFeedPane" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer\Geolocation" /v "PolicyDisableGeolocation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Internet Explorer\Suggested Sites" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Google\Update" /v "Install{ADDE8406-A0F3-4AC2-8878-ADC0BD37BD86}" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Google\Update" /v "Install{4CCED17F-7852-4AFC-9E9E-C89D8795BDD2}" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Google\Update" /v "Install{D936DAAE-38D4-4F72-82DD-F3824534C273}" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Google\Update" /v "Install{87CD15E4-0C94-47DB-B96A-BBE485C1E31C}" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\ServerManagementGateway" /v "InstallDir" /t REG_SZ /d "d:\Program Files\Windows Admin Center\\" /f
Reg.exe add "HKLM\Software\Microsoft\ServerManagementGateway" /v "SMEAutoUpdate" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\ServerManagementGateway" /v "SMEPort" /t REG_SZ /d "443" /f
Reg.exe add "HKLM\Software\Microsoft\ServerManagementGateway" /v "SMETelemetryPrivacyType" /t REG_SZ /d "None" /f
Reg.exe add "HKLM\Software\Microsoft\ServerManagementGateway" /v "TokenAuthenticationEnabled" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Microsoft\ServerManagementGateway" /v "WebSocketValidationOverride" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\Software\Microsoft\ServerManagementGateway" /v "WinRMHTTPS" /t REG_SZ /d "" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Server\ServerManager" /v "DoNotOpenAtLogon" /t REG_DWORD /d "1" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
