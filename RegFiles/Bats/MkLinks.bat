
REM  MKLinks
REM 
REM 
REM  
REM   Date function
Reg.exe add "HKCU\Changes" /v "MKLinks FileChanged" /t REG_SZ /d "16JUL24" /f
REM
REM
REM  Tempdirs
RD /S /Q "C:\Windows\Temp"
mklink C:\Windows\Temp D:\Temp /J

RD /S /Q "C:\Windows\SystemTemp"
mklink C:\Windows\SystemTemp D:\Temp /J

RD /S /Q "C:\Windows\System32\config\systemprofile\Temp"
mklink C:\Windows\System32\config\systemprofile\Temp D:\Temp /J


RD /S /Q "D:\Users\Ariel\AppData\Local\Temp"
mklink D:\Users\Ariel\AppData\Local\Temp D:\Temp /J

REM  Desktop
mklink C:\Windows\System32\config\systemprofile\Desktop D:\Desktop /J


REM The below cause dism errors
REM RD /S /Q "C:\Windows\WinSXS\Temp"
REM mklink C:\Windows\WinSXS\Temp D:\Temp /J
