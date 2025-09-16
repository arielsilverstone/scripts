@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "EnvironmentFileChanged" /f
Reg.exe add "HKCU\Changes" /v "EnvironmentFileChanged" /t REG_SZ /d "28JAN25" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ACSvcPort" /t REG_SZ /d "17532" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DriverData" /t REG_SZ /d "C:\Windows\System32\Drivers\DriverData" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MLNX_WINMFT" /t REG_SZ /d "D:\Program Files\Mellanox\WinMFT\\" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Path" /t REG_EXPAND_SZ /d "%%Systemroot%%;%%Systemroot%%\System32;%%Systemroot%%\System32\Wbem;%%Systemroot%%\System32\Windowspowershell\V1.0\;C:\Program Files\Dotnet\;D:\Desktop\Regfiles;D:\Links;C:\program Files\powerShell\7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DOTNET_CLI_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DriverData" /t REG_SZ /d "C:\Windows\System32\Drivers\DriverData" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MLNX_WINMFT" /t REG_SZ /d "D:\Program Files\Mellanox\WinMFT\\" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "POWERSHELL_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "PSCommand" /t REG_SZ /d "%%windir%%\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "PSModulePath" /t REG_EXPAND_SZ /d "C:\Windows\System32\WindowsPowerShell\v1.0\Modules;C:\Program Files\PowerShell\7\Modules" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TEMP" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TMP" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "USERNAME" /t REG_SZ /d "SYSTEM" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "ZES_ENABLE_SYSMAN" /t REG_SZ /d "1" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "DOTNET_CLI_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "Path" /t REG_EXPAND_SZ /d "%%Systemroot%%;%%Systemroot%%\System32;%%Systemroot%%\System32\Wbem;%%Systemroot%%\System32\Windowspowershell\V1.0\;C:\Program Files\Dotnet\;D:\Desktop\Regfiles;D:\Links;C:\program Files\powerShell\7" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "POWERSHELL_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "PSCommand" /t REG_SZ /d "%%windir%%\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "PSModulePath" /t REG_EXPAND_SZ /d "C:\Windows\System32\WindowsPowerShell\v1.0\Modules;C:\Program Files\PowerShell\7\Modules" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "SystemRoot" /t REG_SZ /d "C:\Windows" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "TEMP" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "TMP" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKCU\Environment" /v "DOTNET_CLI_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Environment" /v "Path" /t REG_EXPAND_SZ /d "%%Systemroot%%;%%Systemroot%%\System32;%%Systemroot%%\System32\Wbem;%%Systemroot%%\System32\Windowspowershell\V1.0\;C:\Program Files\Dotnet\;D:\Desktop\Regfiles;D:\Links;C:\program Files\powerShell\7" /f
Reg.exe add "HKCU\Environment" /v "POWERSHELL_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Environment" /v "PSCommand" /t REG_SZ /d "%%windir%%\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass" /f
Reg.exe add "HKCU\Environment" /v "PSModulePath" /t REG_EXPAND_SZ /d "C:\Windows\System32\WindowsPowerShell\v1.0\Modules;C:\Program Files\PowerShell\7\Modules" /f
Reg.exe add "HKCU\Environment" /v "SystemRoot" /t REG_SZ /d "C:\Windows" /f
Reg.exe add "HKCU\Environment" /v "TEMP" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKCU\Environment" /v "TMP" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\IME\Shared" /v "misconvlogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\IME\Shared" /v "SearchPlugin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\ime\imejp" /v "UseHistorybasedPredictiveInput" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\input\Locales" /v "InputLocale" /t REG_DWORD /d "1116169" /f
Reg.exe add "HKCU\Software\Microsoft\input\Locales\loc_0409\InputMethods\1" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\input\Locales\loc_040d\InputMethods\1" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\input\Locales\loc_0809\InputMethods\1" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\InputMethod\Settings\Shared" /v "Enable Cloud Candidate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\DefaultUserEnvironment" /v "TEMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKLM\Software\DefaultUserEnvironment" /v "TMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\.DEFAULT\Environment" /v "TMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-18\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-18\Environment" /v "TMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-19\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-19\Environment" /v "TMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-20\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-20\Environment" /v "TMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Environment" /v "TMP" /t REG_EXPAND_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "LOGONSERVER" /t REG_SZ /d "\\BEN" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "USERDOMAIN" /t REG_SZ /d "BEN" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "USERNAME" /t REG_SZ /d "Ariel" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "USERPROFILE" /t REG_SZ /d "D:\Users\Ariel" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "HOMEPATH" /t REG_SZ /d "\Users\Ariel" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "HOMEDRIVE" /t REG_SZ /d "D:" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "APPDATA" /t REG_SZ /d "D:\Users\Ariel\AppData\Roaming" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "LOCALAPPDATA" /t REG_SZ /d "D:\Users\Ariel\AppData\Local" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment" /v "USERDOMAIN_ROAMINGPROFILE" /t REG_SZ /d "BEN" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment\1" /v "SESSIONNAME" /t REG_SZ /d "Console" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment\1" /v "CLIENTNAME" /t REG_SZ /d "" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment\1" /v "TEMP" /t REG_SZ /d "D:\Temp" /f
Reg.exe add "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Volatile Environment\1" /v "TMP" /t REG_SZ /d "D:\Temp" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
