@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "CleanupFileChanged" /f
Reg.exe add "HKCU\Changes" /v "CleanupFileChanged" /t REG_SZ /d "17JAN25" /f
Reg.exe delete "HKCU\System\GameConfigStore\Children" /f
Reg.exe delete "HKCU\System\GameConfigStore\Parents" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\$$Windows.data.unifiedtile.startglobalproperties\Current" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Extended Properties\System.ControlPanel.Category" /f
Reg.exe delete "HKLM\Software\Microsoft\WindowsUpdate\Orchestrator\UScheduler_OOBE\DevHomeUpdate" /f
Reg.exe delete "HKLM\Software\Microsoft\WindowsUpdate\Orchestrator\UScheduler_OOBE\EdgeUpdate" /f
Reg.exe delete "HKLM\Software\Microsoft\WindowsUpdate\Orchestrator\UScheduler_OOBE\OutlookUpdate" /f
Reg.exe delete "HKCU\Control Panel\NotifyIconSettings\12391959222534665583" /f
Reg.exe delete "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Control Panel\NotifyIconSettings\47907198689039309" /f
Reg.exe delete "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Control Panel\NotifyIconSettings\5094882407936927971" /f
Reg.exe delete "HKU\S-1-5-21-3912854748-1947628653-3346818719-1000\Control Panel\NotifyIconSettings\9676152021255912203" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Proximity" /f
Reg.exe delete "HKCR\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\find" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows nt\terminal services\RAUnsolicit" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Enum\SWD\MSRRAS\MS_SSTPMINIPORT" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\IconsOnly\Policy\DisableThumbnails" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NowPlayingSessionManager" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{8F929B8F-C156-4A39-BA89-BC6F9EB60FDB}" /f
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{961261AA-FF62-4D3A-8882-71FDCD7493BD}" /f
Reg.exe delete "HKLM\Software\Microsoft\Keyboard\Native Media Players\WMP" /f
Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\netcache\nomakeavailableofflinelist" /f
Reg.exe delete "HKLM\System\Software\Microsoft\TIP\AggregateResults" /f
Reg.exe delete "HKCR\!AppX9kvz3rdv8t7twanaezbwfcdgrbg3bck0" /f
Reg.exe delete "HKLM\Software\Microsoft\AppServiceProtocols\ms-phone-api" /f
Reg.exe delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows\Pen" /f
Reg.exe delete "HKCR\.library-ms\ShellNew" /f
Reg.exe delete "HKCR\Software\Classes\.bmp\ShellNew" /f
Reg.exe delete "HKCR\Software\Classes\.lnk\ShellNew" /f
Reg.exe delete "HKCR\Software\Classes\.zip\ShellNew" /f
Reg.exe delete "HKCR\.accdb\Access.Application.16\ShellNew" /f
Reg.exe delete "HKCR\.pptx\PowerPoint.Show.12\ShellNew" /f
Reg.exe delete "HKCR\.pub\Publisher.Document.16\ShellNew" /f
Reg.exe delete "HKCR\.doc\Word.Document.12\ShellNew" /f
Reg.exe delete "HKCR\.docx\Word.Document.12\ShellNew" /f
Reg.exe delete "HKCR\.xlsx\Excel.Sheet.12\ShellNew" /f
Reg.exe delete "HKCR\.zip\CompressedFolder\ShellNew" /f
Reg.exe delete "HKCR\.odg\LibreOffice.DrawDocument.1\ShellNew" /f
Reg.exe delete "HKCR\.odp\LibreOffice.DrawDocument.1\ShellNew" /f
Reg.exe delete "HKCR\.ods\LibreOffice.DrawDocument.1\ShellNew" /f
Reg.exe delete "HKCR\.odt\LibreOffice.DrawDocument.1\ShellNew" /f
Reg.exe delete "HKCR\batfile\ShellEx\ContextMenuHandlers\Compatibility" /f
Reg.exe delete "HKCR\cmdfile\ShellEx\ContextMenuHandlers\Compatibility" /f
Reg.exe delete "HKCR\exefile\ShellEx\ContextMenuHandlers\Compatibility" /f
Reg.exe delete "HKLM\Windows.aVhdFileX" /f
Reg.exe delete "HKLM\batfile" /f
Reg.exe delete "HKCR\.bat\ShellNew" /f
Reg.exe delete "HKCR\.bmp\ShellNew" /f
Reg.exe delete "HKLM\cmdfile" /f
Reg.exe delete "HKCR\.contact\ShellNew" /f
Reg.exe delete "HKCR\.lnk\ShellNew" /f
Reg.exe delete "HKCR\.mdb\ShellNew" /f
Reg.exe delete "HKCR\.rtf\ShellNew" /f
Reg.exe delete "HKCR\.zip\ShellNew" /f
Reg.exe delete "HKLM\MSEdgeHTM\Application" /f
Reg.exe delete "HKCU\MSEdgeHTM\Application" /f
Reg.exe delete "HKCR\MSEdgeMHT\Application" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
