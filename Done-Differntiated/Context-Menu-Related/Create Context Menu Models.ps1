##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="ContextModels"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path "HKCU:\Changes" -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "11FEB25" | Out-Null
} -Name "$Name.ps1 Changed"

#
#
############  Create the branches

# Enable classic right-click context menu 
[HKLM:\Software\Classes\CLSID]
"IsModernRCEnabled"=dword:00000000

[HKCU:\\software\Policies\Microsoft\Windows\Settings]
"AllowConfigureTaskbarCalendar"=dword:00000001

# Dont hide Help in language bar in taskbar
[HKLM:\Software\Microsoft\CTF\LangBar\ItemState\{ED9D5450-EBE6-4255-8289-F8A31E687228}]
"DemoteLevel"=dword:00000003
#
# Disable file tracking history
[HKCU:\\Software\Microsoft\Windows\CurrentVersion\Policies\Comdlg32]
"NoFileMRU"=dword:00000001
#
# Specify default save as location
[HKCU:\\Software\Microsoft\Windows\CurrentVersion\Policies\Comdlg32\Placesbar]
"Place0"="Desktop"
#
# Fix missing System tray
[HKCU:\\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify]
"IconStreams"=-
"PasticonsStream"=-
# Make sure System tray shows
"SystemTrayChevronVisibility"=dword:00000001
#
[HKCU:\\Software\Microsoft\Clipboard]
"EnableClipboardHistory"=dword:00000001
#
# ******************************************* Context Menus
#
Start-Job { 
	$Path = "HKCU:\Models\Shell\"
#
# 	ANotePad++
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{"Default"="Notepad++ Context menu"#`
					"ExplorerCommandHandler"="{B298D29A-A6ED-11DE-BA8C-A68E55D89593}"#`
					"NeverDefault"=""}
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+"ANotePad`+`+" -Name $Value -Value $Value.Value
		}
	} -Name "ANotepad++64"	
#
# 	CMD as Admin
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{"Default"="Command Prompt As Admin";"Icon"="cmd.exe,0";"Position"="Bottom"}	
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+"RunAs" 		 -Name $Value -Value $Value.Value
		}
		NI -Path $Input+"RunAs\Command" -Value "D:\\Portapps\\NSudo\\9.1\\NSudoLC.exe /U:T /P:E `
												cmd.exe /NoLogo" -Force
	} -Name "CMD as Admin"		
#	
# 	DevMan				
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{ "Default"="Device Manager";"Icon"="c:\windows\System32\devmgr.dll,4"#`
					 "Position"="Bottom";"MUIVerb"="Device Manager"}
		$Branch = "DevMan"
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+$Branch -Name $Value 	  			-Value $Value.Value
		}
		NI -Path $Input+$Branch+"\Command" 		  -Name "Default" -Value "MMC.exe devmgmt.msc"	-Force	
	} -Name "DevMan"
# 
# 	Display Settings
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{"Default"="@%SystemRoot%\System32\display.dll,-4"#`
					"Icon"="%SystemRoot%\System32\display.dll,-1";"Position"="Bottom"#`
					"SettingsUri"="ms-settings:display" }
		$Branch = "Display"
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+$Branch -Name $Value 	   			-Value $Value.Value
		}
		NI -Path $Input+$Branch+"\Command" 		  -Name "DelegateExecute" 	-Value `
												        "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" -Force	
	} -Name "Display"
#	
# 	G-d Mode
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{"Default"="G-d Mode";"Icon"="Control.exe";"Position"="Bottom"}
		$Branch = "G-d Mode"
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+$Branch -Name $Value.Key	-Value $Value.Value
		}
		NI -Path $Input+$Branch+"\Command" 		  -Name "Default" 			-Value "explorer 	
											       Shell:::{ED7BA470-8E54-465E-825C-99712043E01C}" -Force	
	} -Name "G-d Mode"
#	
# 	Kill NR Tasks
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{ "Default"="Kill NR Tasks";"Icon"="taskmgr.exe,-30651";"Position"="Bottom"#`
					 "MUIverb"="Kill all not responding tasks" }
		$Branch = "Kill NR Tasks"
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+$Branch -Name $Value 	  	-Value $Value.Value
		}
		NI -Path $Input+$Branch+"\Command" 		  -Name "Default" 	-Value "D:\\Portapps\\NSudo\\9.1\\NSudoLC.exe/U:T /P:E cmd.exe /NoLogo /C TaskKill.exe /f /fi `
		 \"Status eq Not Responding\" & Pause" -Force	
	} -Name "Kill NR Tasks"
#	
# 	Netcon
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{"Default"="Netcon";"Icon"="%SystemRoot%\System32\ncpa.cpl";"Position"="Bottom"#`
					"MUIVerb"="Network Connections"}
		$Branch = "Netcon"
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+$Branch -Name $Value -Value $Value.Value
		}
		NI -Path $Input+$Branch+"\Command" -Name "Default" -Value "Control.exe ncpa.cpl" 		-Force
	} -Name "Netcon"
#
# 	PowerShellAsAdmin
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{"Default"="Windows PowerShell (Run as Administrator)";"Icon"="PowerShell.exe"#`
					"Position"="Bottom";"NoWorkingDirectory"="";"NeverDefault"="" }
		$Branch = "PowerShellAsAdmin"
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+$Branch -Name $Value -Value $Value.Value
		}
		NI -Path $Input+$Branch+"\Command" -Name "Default" -Value "D:\\PortApps\\NSudo\\9.1\\NSudoLC.exe`
		\/U\:T \/P\:E \"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -Command /NoLogo `
		\"if (( Get-ExecutionPolicy ) -ne 'AllSigned' ) {Set-ExecutionPolicy -Scope Process Bypass}#`
		& \\'%1\\'\""" -Force
			<# Alternative is PowerShell.exe -windowstyle hidden -Command "Start-Process cmd.exe `
			-ArgumentList "/s,/c,pushd %%V && powerShell" -Verb RunAs" #>
	} -Name "PowerShellAsAdmin"
#
# 	ReflectShellExt
	Start-ThreadJob -InputObject ($Path) {
		$Value  = "{DEBB9B79-B3DD-47F4-9E5C-EA6975BAB611}"
		$Branch = "ReflectShellExt"
		NI -Path $Input+$Branch -Name "Default" -Value $Value -Force
	} -Name "ReflectShellExt"
#
# 	Snipping Tool	
	Start-ThreadJob -InputObject ($Path) {
		$Values = @{"Default"="Snipping Tool";"Icon"="snippingtool.exe,0";"Position"="Bottom"#`
					"Extended"=""}
		$Branch = "Snipping Tool"
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+$Branch -Name $Value -Value $Value.Value
		}
		NI -Path $Input+$Branch+"\Command" 	-Value "snippingtool.exe" -Force
	} -Name "Snipping Tool"
#
# StartAllBack
	Start-ThreadJob -InputObject ($Path) {
		$Path 	= "HKCR:\Drive\Shellex\FolderExtensions\{117E3954-5034-453A-A18B-7B79493646E6}"
		$Values = @{"Default"="StartAllBack";"DriveMask"="256 -Type DWord"}
		$Branch = "StartAllBack"
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Path+$Branch -Name $Value -Value $Value.Value
		}
	} -Name "StartAllBack"
#
# 	TakeOwnership	
	Start-ThreadJob -InputObject ($Path) {
		$Values  = @{ "Default"="Take Ownership";"Icon"="imageres.dll,-78";"Position"="Bottom"#`
					  "HasLUAShield"="";"NoWorkingDirectory"="";"NeverDefault"="" }
		$Branch  = "TakeOwnership"
		$Command = "D:\\Portapps\\NSudo\\9.1\\NSudoLC.exe /U:T /P:E cmd.exe /NoLogo /c takeown`
				    /f \\'%1\\' && icacls \\'%1\\' /grant administrators:F"
		$PathX   = $Input+$Branch			
		NI -Path $PathX	-Value $Branch -Force  
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $PathX -Name $Value 		-Value $Value.Value
		}
		NI -Path $PathX+"\Command" -Name "Default" 		   	-Value $Command -Force
		NI -Path $PathX+"\Command" -Name "IsolatedCommand" 	-Value $Command -Force
	} -Name "TakeOwnership"	
#	
# 	WForceDelete
	Start-ThreadJob -InputObject ($Path) {
		$Values  = @{"Default"="Force delete";"Icon"="D:\Program Files (x86)\Wise Force`
					 Deleter\forcedeleter.ico";"Position"="Bottom"}
		$Branch  = "WForceDelete"
		$Command ="D:\\Program Files (x86) \\Wise Force Deleter\\WiseDeleter.exe -force \\'%1\\'" 
		ForEach ($Value in $Values.Keys) { 
			New-ItemProperty -Path $Input+$Branch -Name $Value 	  -Value $Value.Value
		}
		NI -Path $Input+$Branch+"\Command" 		  -Name "Default" -Value $Command 		-Force
	} -Name "WForceDelete"	
	
} -Name "Shell Models"  # EndJob
# 
#
#
## ShellEX  ##
#
Start-Job { 
	$Path = "HKCU:\Models\ShellEx\ContextMenuHandlers"
#
# 	LockHunterShellExt
	Start-ThreadJob -InputObject ($Path) {
		$Value = "{0BB27CDA-7029-4C0E-9C56-D922B229F0EB}"
		$Branch = "LockHunterShellExt"
		NI -Path $Input+$Branch -Name "Default" -Value $Value -Force  
	} -Name "LockHunterShellExt"
#	
# 	ReflectShellExt
	Start-ThreadJob -InputObject ($Path) {
		$Value = "{DEBB9B79-B3DD-47F4-9E5C-EA6975BAB611}"
		$Branch = "ReflectShellExt"
		NI -Path $Input+$Branch -Name "Default" -Value $Value -Force
	} -Name "ReflectShellExt"
#	
#	RUShellExt (Revo)
	Start-ThreadJob -InputObject ($Path) {
		$Value = "{2C5515DC-2A7E-4BFD-B813-CACC2B685EB7}"
		$Branch = "RUShellExt"
		NI -Path $Input+$Branch -Name "Default" -Value $Value -Force
	} -Name "RUShellExt"
#
# 	Restore to Previous Version
	Start-ThreadJob -InputObject ($Path) {
		$Value = "{596AB062-B4D2-4215-9F74-E9109B0A8153}"
		$Branch = "Previous Version"
		NI -Path $Input+$Branch -Name "Default" -Value $Value -Force
	} -Name "Previous Version"
#
} -Name "ContextMenuHandlers"	# EndJob
#
#	
# PropertySheetHandlers
#
Start-Job { 
	$Path = "HKCU:\Models\ShellEx\PropertySheetHandlers"	
#
# 	Re-add the Security tab to file properties
	Start-ThreadJob -InputObject ($Path) {
		$Value = "{1f2e5c40-9550-11ce-99d2-00aa006e086c}"
		$Branch = "Security tab"
		NI -Path $Input+$Branch -Name "Default" -Value $Value -Force
	} -Name "Security tab"

# 	Re-add the Location tab
	Start-ThreadJob -InputObject ($Path) {
		$Value = "{4a7ded0a-ad25-11d0-98a8-0800361b1103}"
		$Branch = "Location"
		NI -Path $Input+$Branch -Name "Default" -Value $Value -Force
	} -Name "Location"
#
# 	Re-add Customize this Folder
	Start-ThreadJob -InputObject ($Path) {
		$Value = "{ef43ecfe-2ab9-4632-bf21-58909dd177f0}"
		$Branch = "Customize"
		NI -Path $Input+$Branch -Name "Default" -Value $Value -Force
	} -Name "Customize"	

} -Name "PropertySheetHandlers"	# EndJob	        
# 
#
#
# CopyHookHandlers
#
Start-Job { 
	$Path = "HKCU:\Models\ShellEx\CopyHookHandlers"	
	
} -Name "CopyHookHandlers"	# EndJob	   
#	
#
# Remove block on sharing 
[-HKLM:\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}



#
#
[HKCR\dllfile\Shell\runas]
@="Take Ownership"
"HasLUAShield"=""
"NoWorkingDirectory"=""
"Position"="Bottom"
[HKCR\dllfile\Shell\runas\command]
@="cmd.exe /c takeown /f \'%1\' && icacls \'%1\' /grant *S-1-3-4:F /c /l"
"IsolatedCommand"="cmd.exe /c takeown /f \'%1\' && icacls \'%1\' /grant *S-1-3-4:F /c /l"
#
#
[HKCR\exefile\Shell\runas]
@="Take Ownership"
"HasLUAShield"=""
"Position"="Bottom"
[HKCR\exefile\Shell\runas\command]
@="%1%*"
"IsolatedCommand"="%1%*"
#














#
## CLSIDs
#
[HKLM:\Software\Classes\CLSID\{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}\DefaultIcon]
@="%ProgramFiles%\\Hyper-V\\SnapInAbout.dll,-110"
[HKLM:\Software\Classes\CLSID\{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}\Shell\Open\Command]
@="MMC.exe virtmgmt.msc"

[HKCU:\\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32]
@=""

$Branches      	= 						"\*",
										"\AllFilesystemObjects",
										"\Directory",
										"\Drive",
										"\Folder",
										"\DesktopBackground",
										"\LibraryFolder"
$Backgrounds	= 						"\", `
				  <# #>					"\Background\"
$ShellItems   	= 						""				  
$ShellExItems  	= 						""
$ShellExCLSIDs	= <# #>					""

$ShellExSheets 	= "ContextMenuHandlers\","PropertySheetHandlers\","DragDropHandlers\",`
				  "CopyHookHandlers\"
$Manuals 	    = ""

