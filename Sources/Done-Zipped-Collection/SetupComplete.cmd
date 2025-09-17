@echo off
label %SystemDrive% Gamer OS v4
powercfg -h Off
net accounts /maxpwage:unlimited
compact - /c /s /i /a /exe:lzx "%SystemDrive%\Windows\*"
compact - /c /s /i /a /exe:lzx "%SystemDrive%\Program Files\*"
compact - /c /s /i /a /exe:lzx "%SystemDrive%\Program Files(x86)\*"
compact - /c /s /i /a /exe:lzx "%SystemDrive%\Users\*"
call "%WINDIR%\Setup\Files\Services Tweaks.cmd"
call "%WINDIR%\Setup\Files\Gaming Plan Import.cmd"
rd /q /s "%WINDIR%\Setup\Files"
del /q /f "%0"
