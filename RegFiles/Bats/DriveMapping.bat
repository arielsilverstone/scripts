@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "Drive Mapping" /f
Reg.exe add "HKCU\Changes" /v "Drive Mapping" /t REG_SZ /d "14JAN25" /f
Reg.exe delete "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#Baks" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#baks" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\B" /v "RemotePath" /t REG_SZ /d "\\192.168.0.122\Baks" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\B" /v "UseOptions" /t REG_BINARY /d "446566437c000000040074000000020003000100010000000000000000000000000000000000000000000000000000000000000000000000000000000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000436f6d50100000000100000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\B" /v "CredentialType" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#Baks" /v "_LabelFromDesktopINI" /t REG_SZ /d "Backup Repo" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\H" /v "RemotePath" /t REG_SZ /d "\\192.168.0.122\Software" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\H" /v "UseOptions" /t REG_BINARY /d "446566437c000000040074000000020003000100010000000000000000000000000000000000000000000000000000000000000000000000000000000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000436f6d50100000000100000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\H" /v "CredentialType" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#Software" /v "_LabelFromDesktopINI" /t REG_SZ /d "Software Store" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "RemotePath" /t REG_SZ /d "\\192.168.0.122\Software" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "UserName" /t REG_SZ /d "" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "ProviderName" /t REG_SZ /d "Microsoft Windows Network" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "ProviderType" /t REG_DWORD /d "131072" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "ConnectionType" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "ConnectFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "DeferFlags" /t REG_DWORD /d "4" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "UseOptions" /t REG_BINARY /d "446566437C000000040074000000020003000100010000000000000000000000000000000000000000000000000000000000000000000000000000000F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000436F6D50100000000100000000000000" /f
Reg.exe add "HKU\.DEFAULT\Network\H" /v "_LabelFromDesktopINI" /t REG_SZ /d "Software Store" /f
Reg.exe delete "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#isos" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#isos" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\I" /v "RemotePath" /t REG_SZ /d "\\192.168.0.122\ISOs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\I" /v "UseOptions" /t REG_BINARY /d "446566437c000000040074000000020003000100010000000000000000000000000000000000000000000000000000000000000000000000000000000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000436f6d50100000000100000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\I" /v "CredentialType" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#ISOs" /v "_LabelFromDesktopINI" /t REG_SZ /d "ISOs Repo" /f
Reg.exe delete "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#OneDrive" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#OneDrive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\U" /v "RemotePath" /t REG_SZ /d "\\192.168.0.122\OneDrive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\U" /v "UseOptions" /t REG_BINARY /d "446566437c000000040074000000020003000100010000000000000000000000000000000000000000000000000000000000000000000000000000000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000436f6d50100000000100000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\GlobalMappings\U" /v "CredentialType" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.0.122#OneDrive" /v "_LabelFromDesktopINI" /t REG_SZ /d "OneDrive" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
