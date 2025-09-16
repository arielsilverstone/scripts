@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCR\SOFTWARE\Classes\CLSID\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\imageres.dll,-183" /f
Reg.exe add "HKCR\SOFTWARE\Classes\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\imageres.dll,-183" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\WOW6432Node\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /v "System.IsPinnedtoNameSpaceTree" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Classes\WOW6432Node\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\imageres.dll,-183" /f
Reg.exe add "HKCR\SOFTWARE\Classes\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\imageres.dll,-183" /f
Reg.exe add "HKCR\SOFTWARE\Classes\CLSID\{d3162b92-9365-467a-956b-92703aca08af}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\imageres.dll,-183" /f
Reg.exe add "HKCR\SOFTWARE\Classes\CLSID\{088e3905-0323-4b02-9826-5d99428e115f}\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\imageres.dll,-183" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
