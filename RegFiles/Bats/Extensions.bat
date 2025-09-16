@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "ExtentionsFileChanged" /f
Reg.exe add "HKCU\Changes" /v "ExtentionsFileChanged" /t REG_SZ /d "17JAN25" /f
Reg.exe add "HKLM\SOFTWARE\Classes\msi.package\shellex\-ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\shellex\-ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
Reg.exe add "HKCR\Software\Classes\.7z" /ve /t REG_SZ /d "ArchiveFolder" /f
Reg.exe add "HKCR\Software\Classes\ArchiveFolder\DefaultIcon" /ve /t REG_EXPAND_SZ /d "D:\PortApps\7-Zip\7zG.exe,0" /f
Reg.exe add "HKCR\.avhd" /ve /t REG_SZ /d "progId_VirtualBox.Shell.vhd" /f
Reg.exe add "HKCR\.avhd" /v "Content Type" /t REG_SZ /d "application/x-virtualbox-vhd" /f
Reg.exe add "HKCR\.avhd" /v "Original Value" /t REG_SZ /d "@=Windows.VhdFile" /f
Reg.exe add "HKCR\Windows.aVhdFile\tabsets" /v "selection" /t REG_DWORD /d "1796" /f
Reg.exe add "HKCR\.avhdx" /ve /t REG_SZ /d "Windows.VhdFile" /f
Reg.exe add "HKCR\Windows.aVhdFileX\tabsets" /v "selection" /t REG_DWORD /d "1796" /f
Reg.exe add "HKCR\Software\Classes\Windows.VhdFile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\System32\imageres.dll,-32" /f
Reg.exe add "HKCR\Software\Classes\.bat" /ve /t REG_SZ /d "batfile" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat\OpenWithList" /v "a" /t REG_SZ /d "Command.Command" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat\OpenWithList" /v "b" /t REG_SZ /d "notepad++.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat\OpenWithList" /v "MRUList" /t REG_SZ /d "acb" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat\OpenWithProgids" /v "ProgId" /t REG_SZ /d "Applications\notepad++.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat\OpenWithProgids" /v "txtfile" /t REG_NONE /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat\OpenWithProgids" /v "txt_auto_file" /t REG_NONE /d "" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat\UserChoice" /v "ProgId" /t REG_SZ /d "Applications\notepad++.exe" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bat\UserChoice" /v "Hash" /t REG_SZ /d "maFA2RixpJg=" /f
Reg.exe add "HKCR\batfile" /ve /t REG_SZ /d "Windows Batch File" /f
Reg.exe add "HKCR\batfile" /v "EditFlags" /t REG_BINARY /d "30040000" /f
Reg.exe add "HKCR\batfile" /v "FriendlyTypeName" /t REG_SZ /d "@%%SystemRoot%%\System32\acppage.dll,-6002" /f
Reg.exe add "HKCR\Software\Classes\batfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\System32\imageres.dll,63" /f
Reg.exe add "HKCR\batfile\Shell\edit\Command" /ve /t REG_SZ /d "D:\Program Files\Notepad++\notepad++.exe\" \"%%1\"" /f
Reg.exe add "HKCR\batfile\Shell\open" /v "EditFlags" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCR\batfile\Shell\open\Command" /ve /t REG_SZ /d "%%SystemRoot%%\System32\cmd.exe /C \"%%1\" %%*" /f
Reg.exe add "HKCR\batfile\shell\Open with" /v "MUIVerb" /t REG_SZ /d "@Shell32.dll,-9016" /f
Reg.exe add "HKCR\batfile\shell\Open with\command" /ve /t REG_SZ /d "{09799AFB-AD67-11d1-ABCD-00C04FC30936}" /f
Reg.exe add "HKCR\batfile\Shell\print\Command" /ve /t REG_SZ /d "D:\Program Files\Notepad++\notepad++.exe\" \"%%1\" \"%%2\" \"%%3\" \"%%4\"" /f
Reg.exe add "HKCR\batfile\Shell\RunAs" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\batfile\Shell\RunAs\Command" /ve /t REG_SZ /d "%%SystemRoot%%\System32\cmd.exe /C\" \"%%1\" %%*\"" /f
Reg.exe add "HKCR\batfile\Shell\RunAsuser" /ve /t REG_SZ /d "@Shell32.dll,-50944" /f
Reg.exe add "HKCR\batfile\Shell\RunAsuser" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\batfile\Shell\RunAsuser" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\batfile\Shell\RunAsuser" /v "SuppressionPolicyEx" /t REG_SZ /d "{F211AA05-D4DF-4370-A2A0-9F19C09756A7}" /f
Reg.exe add "HKCR\batfile\Shell\RunAsuser\Command" /ve /t REG_SZ /d "%%SystemRoot%%\System32\cmd.exe /C \"%%1\" %%*" /f
Reg.exe add "HKCR\batfile\Shell\RunAsuser\Command" /v "DelegateExecute" /t REG_SZ /d "{ea72d00e-4960-42fa-ba92-7792a7944c1d}" /f
Reg.exe add "HKCR\batfile\ShellEx\ContextMenuHandlers" /ve /t REG_SZ /d "Compatibility" /f
Reg.exe add "HKCR\batfile\ShellEx\DropHandler" /ve /t REG_SZ /d "{86C86720-42A0-1069-A2E8-08002B30309D}" /f
Reg.exe add "HKCR\batfile\ShellEx\PropertySheetHandlers\ShimLayer Property Page" /ve /t REG_SZ /d "{513D916F-2A8E-4F51-AEAB-0CBC76FB1AF8}" /f
Reg.exe add "HKCR\batfile\ShellEx\{8895b1c6-b41f-4c1c-a562-0d564250836f}" /ve /t REG_SZ /d "{1531d583-8375-4d3f-b5fb-d23bbd169f22}" /f
Reg.exe add "HKCR\Software\Classes\bcd_auto_file\DefaultIcon" /ve /t REG_EXPAND_SZ /d "D:\PortApps\SingleFiles\BOOTICE64.exe,0" /f
Reg.exe add "HKCR\Software\Classes\PBrush\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\System32\mspaint.exe,0" /f
Reg.exe add "HKCR\Software\Classes\.cab" /ve /t REG_SZ /d "CABFolder" /f
Reg.exe add "HKCR\Software\Classes\CABFolder\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\system32\cabview.dll,0" /f
Reg.exe add "HKCR\Software\Classes\CABFolder\Shell\runas" /ve /t REG_SZ /d "Install this update" /f
Reg.exe add "HKCR\Software\Classes\CABFolder\Shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Software\Classes\CABFolder\Shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Software\Classes\CABFolder\Shell\runas\command" /ve /t REG_SZ /d "cmd /k dism /online /add-package /packagepath:\"%%1\"" /f
Reg.exe add "HKCR\Software\Classes\cfg_auto_file\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\System32\msconfig.exe,0" /f
Reg.exe add "HKCR\Software\Classes\.cmd" /ve /t REG_SZ /d "cmdfile" /f
Reg.exe add "HKCR\Software\Classes\cmdfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\Imageres.dll,-68" /f
Reg.exe add "HKCR\Software\Classes\cmdfile\Shell\Open with\command" /ve /t REG_SZ /d "{09799AFB-AD67-11d1-ABCD-00C04FC30936}" /f
Reg.exe add "HKCR\Software\Classes\cmdfile\Shell\Open with" /v "MUIVerb" /t REG_SZ /d "@Shell32.dll,-9016" /f
Reg.exe add "HKCR\cmdfile" /ve /t REG_SZ /d "Windows CMD File" /f
Reg.exe add "HKCR\cmdfile" /v "EditFlags" /t REG_BINARY /d "30040000" /f
Reg.exe add "HKCR\cmdfile" /v "FriendlyTypeName" /t REG_SZ /d "@%%SystemRoot%%\System32\acppage.dll,-6002" /f
Reg.exe add "HKCR\cmdfile\Shell\edit\Command" /ve /t REG_SZ /d "D:\PortApps\Notepad++\notepad++.exe\" \"%%1" /f
Reg.exe add "HKCR\cmdfile\Shell\open" /v "EditFlags" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCR\cmdfile\Shell\open\Command" /ve /t REG_SZ /d "%%SystemRoot%%\System32\cmd.exe /C \"%%1\" %%*" /f
Reg.exe add "HKCR\cmdfile\shell\Open with" /v "MUIVerb" /t REG_SZ /d "@Shell32.dll,-9016" /f
Reg.exe add "HKCR\cmdfile\shell\Open with\command" /ve /t REG_SZ /d "{09799AFB-AD67-11d1-ABCD-00C04FC30936}" /f
Reg.exe add "HKCR\cmdfile\shell\print\command" /ve /t REG_EXPAND_SZ /d "\"D:\portApps\Notepad++\Notepad++.exe\" /p \"%%1\"" /f
Reg.exe add "HKCR\cmdfile\Shell\RunAs" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\cmdfile\Shell\RunAs\Command" /ve /t REG_SZ /d "%%SystemRoot%%\System32\cmd.exe /C \"%%1\" %%*" /f
Reg.exe add "HKCR\cmdfile\Shell\RunAsuser" /ve /t REG_SZ /d "@Shell32.dll,-50944" /f
Reg.exe add "HKCR\cmdfile\Shell\RunAsuser" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\cmdfile\Shell\RunAsuser" /v "SuppressionPolicyEx" /t REG_SZ /d "{F211AA05-D4DF-4370-A2A0-9F19C09756A7}" /f
Reg.exe add "HKCR\cmdfile\Shell\RunAsuser\Command" /v "DelegateExecute" /t REG_SZ /d "{ea72d00e-4960-42fa-ba92-7792a7944c1d}" /f
Reg.exe add "HKCR\cmdfile\ShellEx\DropHandler" /ve /t REG_SZ /d "{86C86720-42A0-1069-A2E8-08002B30309D}" /f
Reg.exe add "HKCR\cmdfile\ShellEx\{8895b1c6-b41f-4c1c-a562-0d564250836f}" /ve /t REG_SZ /d "{1531d583-8375-4d3f-b5fb-d23bbd169f22}" /f
Reg.exe add "HKCR\cmdfile\ShellEx\PropertySheetHandlers\ShimLayer Property Page" /ve /t REG_SZ /d "{513D916F-2A8E-4F51-AEAB-0CBC76FB1AF8}" /f
Reg.exe add "HKCR\Software\Classes\.csv" /ve /t REG_SZ /d "Excel.CSV" /f
Reg.exe add "HKCR\Software\Classes\Excel.CSV\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Program Files\Microsoft Office\Root\VFS\Windows\Installer\{90160000-000F-0000-1000-0000000FF1CE}\xlicons.exe,9" /f
Reg.exe add "HKCR\Software\Classes\.drv" /ve /t REG_SZ /d "drvfile" /f
Reg.exe add "HKCR\Software\Classes\drvfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\system32\imageres.dll,-67" /f
Reg.exe add "HKCR\Software\Classes\.etl" /ve /t REG_SZ /d "wpa.etl_file" /f
Reg.exe add "HKCR\Software\Classes\wpa.etl_file\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\shell32.dll,69" /f
Reg.exe add "HKCR\Software\Classes\.flac\-ShellEx\{e357fccd-a995-4576-b01f-234630154e96}" /ve /t REG_SZ /d "{9DBD2C50-62AD-11D0-B806-00C04FD706EC}" /f
Reg.exe add "HKCR\Software\Classes\.flac\-ShellEx\{BB2E617C-0920-11D1-9A0B-00C04FC2D6C1}" /ve /t REG_SZ /d "{9DBD2C50-62AD-11D0-B806-00C04FD706EC}" /f
Reg.exe add "HKCR\Software\Classes\.hta" /ve /t REG_SZ /d "htafile" /f
Reg.exe add "HKCR\Software\Classes\htafile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\shell32.dll,91" /f
Reg.exe add "HKCR\Software\Classes\.htm\PersistentHandler" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe add "HKCR\Software\Classes\.html\OpenWithProgids" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe delete "HKCR\Software\Classes\.html\OpenWithProgids" /v "MSEdgeHTM" /f
Reg.exe add "HKCR\Software\Classes\MSEdgeHTM\DefaultIcon" /ve /t REG_EXPAND_SZ /d "D:\PortApps\Thorium\BIN\thorium.exe,0" /f
Reg.exe add "HKCR\Software\Classes\.html\PersistentHandler" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe add "HKCR\Software\Classes\.html\OpenWithProgids" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe delete "HKCR\Software\Classes\.html\OpenWithProgids" /v "MSEdgeHTM" /f
Reg.exe add "HKCR\Software\Classes\.img\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\System32\imageres.dll,-5205" /f
Reg.exe add "HKCR\Software\Classes\Windows.IsoFile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\System32\imageres.dll,-5205" /f
Reg.exe add "HKCR\Windows.IsoFile\Shell\Mount" /v "CommandStateSync" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Windows.IsoFile\Shell\Mount" /v "DelegateExecute" /t REG_SZ /d "{9ab3b1c9-3225-4bb4-93b6-bfb3c0d93743}" /f
Reg.exe add "HKCR\Windows.IsoFile\Shell\Mount" /v "ExplorerCommandHandler" /t REG_SZ /d "{9ab3b1c9-3225-4bb4-93b6-bfb3c0d93743}" /f
Reg.exe add "HKCR\Windows.IsoFile\Shell\Mount" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\Windows.IsoFile\Shell\Mount\Command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\Explorer.exe" /f
Reg.exe add "HKCR\SOFTWARE\Classes\Windows.IsoFile\Shell\burn" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\CLSID\{9ab3b1c9-3225-4bb4-93b6-bfb3c0d93743}" /ve /t REG_SZ /d "Disc Image Mount" /f
Reg.exe add "HKCR\CLSID\{9ab3b1c9-3225-4bb4-93b6-bfb3c0d93743}\InProcServer32" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\shell32.dll" /f
Reg.exe add "HKCR\CLSID\{9ab3b1c9-3225-4bb4-93b6-bfb3c0d93743}\InProcServer32" /v "ThreadingModel" /t REG_SZ /d "Apartment" /f
Reg.exe add "HKCR\Software\Classes\jpegfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\System32\imageres.dll,-72" /f
Reg.exe delete "HKCR\Software\Classes\.mhtml\OpenWithProgids" /v "MSEdgeHTM" /f
Reg.exe add "HKCR\Software\Classes\.mhtml\OpenWithProgids" /f
Reg.exe add "HKCR\MSEdgeHTM" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe add "HKCR\MSEdgeMHT" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe add "HKCR\.pdf\OpenWithProgids" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe delete "HKCR\.pdf\OpenWithProgids" /v "MSEdgePDF" /f
Reg.exe add "HKCR\.pdf\PersistentHandler" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe add "HKCR\pdf_auto_file\shell\open\command" /ve /t REG_SZ /d "\"D:\PortApps\Thorium\BIN\thorium.exe\" \"%%1\"" /f
Reg.exe add "HKCR\Software\Classes\.png" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Png" /f
Reg.exe add "HKCR\Software\Classes\DefaultIcon" /ve /t REG_EXPAND_SZ /d "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe,0" /f
Reg.exe add "HKCR\.reg" /ve /t REG_SZ /d "regfile" /f
Reg.exe add "HKCR\.reg\PersistentHandler" /ve /t REG_SZ /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
Reg.exe add "HKCR\reg" /ve /t REG_SZ /d "URL:Reg Protocol" /f
Reg.exe add "HKCR\reg" /v "URL Protocol" /t REG_SZ /d "" /f
Reg.exe add "HKCR\reg\shell\open\command" /ve /t REG_SZ /d "\"D:\PortApps\RegWorkshop\RegWorkshopX64.exe\" /g \"%%1\"" /f
Reg.exe add "HKCR\regedit" /ve /t REG_SZ /d "Registration Entries" /f
Reg.exe add "HKCR\regedit\shell\open\command" /ve /t REG_SZ /d "\"D:\PortApps\RegWorkshop\RegWorkshopX64.exe\" \"%%1\"" /f
Reg.exe add "HKCR\regfile" /ve /t REG_SZ /d "Registration Entries" /f
Reg.exe add "HKCR\regfile" /v "EditFlags" /t REG_DWORD /d "1048576" /f
Reg.exe add "HKCR\regfile" /v "FriendlyTypeName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\regedit.exe,-309" /f
Reg.exe add "HKCR\regfile\DefaultIcon" /f
Reg.exe add "HKCR\Software\Classes\regfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "D:\PortApps\RegWorkshop\RegWorkshopX64.exe,1" /f
Reg.exe add "HKCR\regfile\shell" /v "EditFlags" /t REG_DWORD /d "1714614707" /f
Reg.exe add "HKCR\regfile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "D:\PortApps\Notepad++\notepad++.exe \"%%1\"" /f
Reg.exe add "HKCR\regfile\shell\Edit with Registry Workshop" /ve /t REG_SZ /d "Registry &Workshop" /f
Reg.exe add "HKCR\regfile\shell\Edit with Registry Workshop\command" /ve /t REG_SZ /d "\"D:\PortApps\RegWorkshop\RegWorkshopX64.exe\" \"%%1\"" /f
Reg.exe add "HKCR\regfile\shell\open" /ve /t REG_SZ /d "Mer&ge" /f
Reg.exe add "HKCR\regfile\shell\open" /v "MUIVerb" /t REG_EXPAND_SZ /d "\"D:\PortApps\RegWorkshop\RegWorkshopX64.exe\"" /f
Reg.exe add "HKCR\regfile\shell\open" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKCR\regfile\shell\open\command" /ve /t REG_SZ /d "\"D:\PortApps\RegWorkshop\RegWorkshopX64.exe\" \"%%1\"" /f
Reg.exe add "HKCR\regfile\shell\print\command" /ve /t REG_EXPAND_SZ /d "\"D:\portApps\Notepad++\Notepad++.exe\" /p \"%%1\"" /f
Reg.exe add "HKCR\regfile\ShellEx\{8895b1c6-b41f-4c1c-a562-0d564250836f}" /ve /t REG_SZ /d "{1531d583-8375-4d3f-b5fb-d23bbd169f22}" /f
Reg.exe add "HKCR\Software\Classes\.shtml\PersistentHandler" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe add "HKCR\Software\Classes\.shtml\OpenWithProgids" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe delete "HKCR\Software\Classes\.shtml\OpenWithProgids" /v "MSEdgeHTM" /f
Reg.exe delete "HKCR\Software\Classes\.SVG\OpenWithProgids" /v "MSEdgeHTM" /f
Reg.exe add "HKCR\Software\Classes\.SVG\OpenWithProgids" /f
Reg.exe add "HKCR\.txt" /ve /t REG_SZ /d "txtfile" /f
Reg.exe add "HKCR\.txt" /v "Content Type" /t REG_SZ /d "text/plain" /f
Reg.exe add "HKCR\.txt" /v "PerceivedType" /t REG_SZ /d "text" /f
Reg.exe add "HKCR\SOFTWARE\Classes\.txt" /v "Notepad++_backup" /t REG_SZ /d "txtfile" /f
Reg.exe add "HKCR\SOFTWARE\Classes\.txt" /ve /t REG_SZ /d "Notepad++_file" /f
Reg.exe add "HKCR\.txt\ShellNew" /v "NullFile" /t REG_SZ /d "" /f
Reg.exe add "HKCR\.txt\ShellNew" /v "ItemName" /t REG_MULTI_SZ /d "D:\PortApps\NotePad++\NotePad++.exe,0" /f
Reg.exe add "HKCR\.txt\ShellNew" /v "FileName" /t REG_SZ /d "\"C:\AnyFolder\template.txt\"" /f
Reg.exe add "HKCR\.txt\PersistentHandler" /ve /t REG_SZ /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
Reg.exe add "HKCR\SystemFileAssociations\.txt" /v "PerceivedType" /t REG_SZ /d "document" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithList" /v "a" /t REG_SZ /d "notepad++.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithProgids" /v "Text File" /t REG_NONE /d "" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithProgids" /v "Notepad++_file" /t REG_NONE /d "" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithProgids" /v "txtfile" /t REG_NONE /d "" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\UserChoice" /v "Hash" /t REG_SZ /d "hyXk/CpboWw=" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\UserChoice" /v "ProgId" /t REG_SZ /d "txtfile" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Roaming\OpenWith\FileExts\.txt\UserChoice" /v "Hash" /t REG_SZ /d "FvJcqeZpmOE=" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\Roaming\OpenWith\FileExts\.txt\UserChoice" /v "ProgId" /t REG_SZ /d "txtfile" /f
Reg.exe add "HKCR\textfile" /ve /t REG_SZ /d "Text Document" /f
Reg.exe add "HKCR\textfile" /v "EditFlags" /t REG_DWORD /d "2162688" /f
Reg.exe add "HKCR\textfile" /v "FriendlyTypeName" /t REG_EXPAND_SZ /d "D:\portApps\Notepad++\Notepad++.exe,-189" /f
Reg.exe add "HKCR\textfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "D:\PortApps\Notepad++\Notepad++.exe,-100" /f
Reg.exe add "HKCR\textfile\shell\open\command" /ve /t REG_EXPAND_SZ /d "\"D:\portApps\Notepad++\Notepad++.exe\" /p \"%%1\" \"%%2\" \"%%3\" \"%%4\"" /f
Reg.exe add "HKCR\textfile\shell\print\command" /ve /t REG_EXPAND_SZ /d "\"D:\portApps\Notepad++\Notepad++.exe\" /p \"%%1\"" /f
Reg.exe add "HKCR\.vbs" /ve /t REG_SZ /d "VBSFile" /f
Reg.exe add "HKCR\.vbs\PersistentHandler" /ve /t REG_SZ /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
Reg.exe add "HKCR\Software\Classes\progId_VirtualBox.Shell.vbox\DefaultIcon" /ve /t REG_SZ /d "\"D:\Program Files\VirtualBox\VBoxRes.dll\",-201" /f
Reg.exe add "HKCR\.vhd" /ve /t REG_SZ /d "Windows.VhdFile" /f
Reg.exe add "HKCR\.vhd" /v "Content Type" /t REG_SZ /d "application/x-virtualbox-vhd" /f
Reg.exe add "HKCR\Software\Classes\progId_VirtualBox.Shell.vhd\DefaultIcon" /ve /t REG_SZ /d "\"D:\Program Files\VirtualBox\VBoxRes.dll\",-305" /f
Reg.exe add "HKCR\Windows.VhdFile\Shell\Mount" /v "CommandStateSync" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Windows.VhdFile\Shell\Mount" /v "ExplorerCommandHandler" /t REG_SZ /d "{9ab3b1c9-3225-4bb4-93b6-bfb3c0d93743}" /f
Reg.exe add "HKCR\Windows.VhdFile\Shell\Mount" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\Windows.VhdFile\Shell\Mount\Command" /ve /t REG_SZ /d "%%SystemRoot%%\Explorer.exe" /f
Reg.exe add "HKCR\Windows.VhdFile\Shell\Mount\Command" /v "DelegateExecute" /t REG_SZ /d "{9ab3b1c9-3225-4bb4-93b6-bfb3c0d93743}" /f
Reg.exe add "HKCR\Windows.VhdFile\tabsets" /v "selection" /t REG_DWORD /d "1796" /f
Reg.exe add "HKCR\Software\Classes\.XHT\PersistentHandler" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe add "HKCR\Software\Classes\.XHT\OpenWithProgids" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe delete "HKCR\Software\Classes\.XHT\OpenWithProgids" /v "MSEdgeHTM" /f
Reg.exe add "HKCR\Software\Classes\.XHTML\PersistentHandler" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe add "HKCR\Software\Classes\.XHTML\OpenWithProgids" /ve /t REG_SZ /d "ThoriumHTM.BNEAUQ76PTY5KUR7PFEAS6YD5M" /f
Reg.exe delete "HKCR\Software\Classes\.XHTML\OpenWithProgids" /v "MSEdgeHTM" /f
Reg.exe delete "HKCR\Software\Classes\.XML\OpenWithProgids" /v "MSEdgeHTM" /f
Reg.exe add "HKCR\Software\Classes\.XML\OpenWithProgids" /f
Reg.exe add "HKCU\Software\Classes\.zip" /ve /t REG_SZ /d "CompressedFolder" /f
Reg.exe add "HKCU\Software\Classes\CompressedFolder\DefaultIcon" /ve /t REG_EXPAND_SZ /d "D:\PortApps\7-Zip\7zG.exe,0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities" /v "ApplicationDescription" /t REG_SZ /d "@%%%%ProgramFiles%%%%\Windows Photo Viewer\photoviewer.dll,-3069" /f
Reg.exe add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities" /v "ApplicationName" /t REG_SZ /d "@%%%%ProgramFiles%%%%\Windows Photo Viewer\photoviewer.dll,-3009" /f
Reg.exe add "HKCR\Applications\photoviewer.dll\Shell\open" /v "MuiVerb" /t REG_SZ /d "@photoviewer.dll,-3043" /f
Reg.exe add "HKCR\Applications\photoviewer.dll\Shell\open\Command" /v "@" /t REG_SZ /d "%%%%SystemRoot%%%%\System32\rundll32.exe \"%%%%ProgramFiles%%%%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %%%%1" /f
Reg.exe add "HKCR\Applications\photoviewer.dll\Shell\open\DropTarget" /v "CLSID" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f
Reg.exe add "HKCR\Applications\photoviewer.dll\Shell\print\DropTarget" /v "Clsid" /t REG_SZ /d "{60fd46de-f830-4894-a628-6fa81bc0190d}" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
