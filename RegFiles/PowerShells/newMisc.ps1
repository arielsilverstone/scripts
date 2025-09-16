#
#
# Change Tracking
Start-ThreadJob { 
	$Name="newMisc"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "11FEB25" | Out-Null
} -Name "$Name.ps1 Changed"
#
#

# disable Memory Compression (requires SysMain (service))
Disable-MMAgent -mc
#Get-MMAgent




$Files = "C:\Windows\System32\asus*", 				
         "C:\Windows\System32\compattelrunner.exe", 
         "C:\Windows\System32\MicrosoftEdge*", 		
         "C:\Windows\System32\XPS*", 				
         "C:\Windows\System32\Smart*", 				
		 "C:\Program Files (x86)\microsoft\EdgeCore", 
		 "C:\Program Files (x86)\microsoft\EdgeUpdate",
## Remove search from Default User taskbar
		 "D:\Users\Default\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\Search",
# and for the Ariel user
		 "D:\users\Ariel\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\Search",
		 "D:\users\Ariel\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Tombstones"
		 
Start-ThreadJob { 
	ForEach ($File in $Files) { 
		DEL -Path $File -Force -Recurse 
	} 
} -Name "Files"
#
##
#
$Items = "Bluetooth File Transfer.lnk","Compressed (zipped) folder.ZFSendToTarget","Desktop.ini",`
		 "Documents.mydocs","Mail recipient.mapimail"
Start-ThreadJob { 
	ForEach ($Item in $Items) { 
		DEL -Path "D:\Users\Ariel\AppData\Roaming\Microsoft\Windows\SendTo\$Item" -Force -Recurse 
		} 
} -Name "Delete from SendTo"
#
##
##
# CMD.exe /c "RD /S /Q C:\Windows\System32\DriverStore\FileRepository\hptec22a4_x64.inf_amd64_d9d3bec99929584f > Nul"
###
##
$Regs = "{9459C573-B17A-45AE-9F64-1857B5D58CEE}",`
		"{45ea75a0-a269-11d1-b5bf-0000f8051515}",`
		"{5fd399c0-a70a-11d1-9948-00c04f98bbc9}",`
		"{630b1da0-b465-11d1-9948-00c04f98bbc9}",`
		"{89820200-ECBD-11cf-8B85-00AA005B4340}",`
		"{89820200-ECBD-11cf-8B85-00AA005B4383}",`
		"{6fab99d0-bab8-11d1-994a-00c04f98bbc9}",`
		"{89820200-ECBD-11cf-8B85-00AA005B4383}"
Start-ThreadJob { 
	ForEach ($Reg in $Regs) { 
		DEL -Path "HKLM:\Software\Microsoft\Active Setup\Installed Components\"+$Reg -Recurse 
	}  
} -Name "Active Setup" 
#
##
# Deprovision Apps
#
$Apps1 	 = "3DBuilder","Microsoft3DViewer","549981C3F5F10","Advertising.Xaml","BingFinance", `
		   "BingNews","BingSports","BingWeather","ECApp","GetHelp","Getstarted","Microsoft3DViewer","MicrosoftEdgeDevToolsClient","MicrosoftEdge.Stable","MicrosoftEdge","MicrosoftEdgeDevToolsClient","MicrosoftOfficeHub","MicrosoftPowerBIForWindows","MicrosoftSolitaireCollection","MicrosoftStickyNotes","MicrosoftTeamsforSurfaceHub","MixedReality.Portal","People","PowerAutomateDesktop","Todos","Office.OneNote","Office.Sway","OutlookForWindows","StorePurchaseApp","Whiteboard","WindowsFeedbackHub","WindowsMaps","WindowsNotepad","WindowsPhone","WindowsSoundRecorder","WindowsTerminal","windowscommunicationsapps","Xbox.TCUI","XboxApp","XboxGameOverlay","XboxGamingOverlay","XboxIdentityProvider","XboxSpeechToTextOverlay","ZuneMusic","ZuneVideo" 
$Apps2 	 = "QuickAssist","MicrosoftFamily"
$Apps3 	 = "SecHealthUI","SecureAssessmentBrowser","Apprep.ChxApp","CloudExperienceHost", `
		   "ContentDeliveryManager","PeopleExperienceHost"
$Apps4 	 = "MicrosoftWindows.Client.WebExperience","MicrosoftWindows.CrossDevice", `
		   "1527c705-839a-4832-9118-54d4Bd6a0c89"
$Apps5 	 = "clipchamp.clipchamp_yxz26nhyzhsrt","AdvancedMicroDevicesInc-RSXCM_fhmx3h6dzfmvj", `
		   "B9ECED6F.ArmouryCrate_qmba6cd70vzyy"	
$Path 	 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\"
$Dongle1 = "_8wekyb3d8bbwe"	 
$Dongle2 = "_cw5n1h2txyewy"
Start-ThreadJob { 
	ForEach ($App in $Apps1) {
		$Test =($Path+"\Microsoft."+$App+$Dongle1)
		If (Get-ItemProperty ($Test)) {
			Start-ThreadJob { 
				Del -Path $Test
			} -Name $App
		}
	}
	ForEach ($App in $Apps2) { 
		$Test =($Path+"MicrosoftCorporationII."+$App+$Dongle1)
		If (Get-ItemProperty ($Test)) {
			Start-ThreadJob { 
				Del -Path $Test
			} -Name $App
		}
	}
	ForEach ($App in $Apps3) { 
		$Test =($Path+"MicrosoftWindows."+$App+$Dongle2 )
		If (Get-ItemProperty ($Test)) {
			Start-ThreadJob { 
				Del -Path $Test
			} -Name $App
		}
	}
	ForEach ($App in $Apps4) { 
		$Test =($Path+$App+$Dongle2 )
		If (Get-ItemProperty ($Test)) {
			Start-ThreadJob { 
				Del -Path  $Test
			} -Name $App		
		}
	}
	ForEach ($App in $Apps5) { 
		$Test =($Path+$App)
		If (Get-ItemProperty ($Test)) {
			Start-ThreadJob { 
				Del -Path  $Test
			} -Name $App
		} 
	}
} -Name "Deprovision Apps"
#
##GET-JOB
#
$Taskkills = "AggregatorHost.exe","CompTelRunner.exe","DeviceCensus.exe","MicrosoftEdgeUpdate.exe", `
			 "MRT.exe","msfeedssync.exe","Smartscreen.exe","RobloxPlayerBeta.exe"
$Path 	   = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\"+ `
			 $TaskKill
Start-ThreadJob { 
	ForEach ($Taskkill in $Taskkills) {
		SP -Path $Path -Name "Debugger" -value "\"%WinDir%\\System32\\taskkill.exe\" " 
	} 
} -Name "Task Kills"
#
## Give specific apps the right to use large memory pages. # Note that Thorium is 000 
# 
$LargePages = "Acrobat.exe","dllhost.exe","excel.exe","Explorer.exe","powerpnt.exe", `
			  "VirtualBox.exe","VirtualBoxVM.exe","vmcompute.exe","winword.exe"
$Path 		= "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\"
Start-ThreadJob { 
	ForEach ($LargePage in $LargePages) { 

		SP -Path $Path+$LargePage+".exe" -Name "UseLargePages" -Value 1 -Type DWord
		SP -Path $Path+"vmcompute.exe\0" -Name "UseLargePages" -Value 1 -Type DWord
		SP $Path $Path+"Thorium.exe" 	 -Name "UseLargePages" -Value 0 -Type DWord 
	}
} -Name "Large Pages"
# 
##
#
$Interfaces	= "{C13C1F5C-DDC1-426B-939F-0E4684C3DD87}",`
			  "{D58CF048-611B-4812-A6FC-26D6106086E3}",`
			  "{93123211-9629-4E04-82F0-EA2E4F221468}",`
			  "{2EE2C70C-A092-4D88-A654-98C8D7645CD5}",`
			  "{07374750-E68B-490E-9330-9FD785CD71B6}"
$MSFT6 		= "ATI Technologies","ASUS","Hasleo","Intel\Driver and Support Assistant","Logitech",`
			  "MozillaPlugins","Wow6432Node\MozillaPlugins","NVIDIA Corporation","Partner\Wallet","RTLSetup\VISTA_8169"
$Packages	= "Microsoft.MicrosoftEdgeDevToolsClient_1000.25128.1000.0_neutral_neutral_8wekyb3d8bbwe",`
			  "OutlookForWindows_1.2024.403.300_x64__8wekyb3d8bbwe","Windows.Ai.Copilot.Provider_1.0.3.0_neutral__8wekyb3d8bbwe","Windows.CloudExperienceHost_10.0.26085.1_neutral_neutral_cw5n1h2txyewy","Windows.NarratorQuickStart_10.0.26085.1_neutral_neutral_8wekyb3d8bbwe","Windows.PeopleExperienceHost_10.0.26085.1_neutral_neutral_cw5n1h2txyewy","BioEnrollment_10.0.19587.1000_neutral__cw5n1h2txyewy"
Start-Job {
	ForEach ($Interface in $Interfaces) {
		$Path1 = "HKLM:\SYSTEM\CurrentControlSet\Control\NetworkSetup2\Interfaces\"+$Interface		
		Start-ThreadJob { 
			DEL -Path $Path1 -Recurse
		} -Name "Interfaces"
	} 
	ForEach ($MSFT in $MSFT6) { 
		$Path2 = "HKLM:\SOFTWARE\"+$MSFT
		Start-ThreadJob { 
			DEL -Path $Path2 -Recurse
		} 
	}
	ForEach ($Package in $Packages) {
		$Path3 = "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\ `
			      AppModel\Repository\Packages\"+$Package
		Start-ThreadJob { 
			DEL -Path $Path3 -Recurse 
		} -Name "Packages"
	}
} -Name "Remove Various"
#
## PushNotifications
#
$Pushers  = "Windows.PeopleExperienceHost","Windows.CloudExperienceHost","BioEnrollment"
$Pushers2 = "CortanaUI","DesktopStickerEditorCentennial","Global.CopilotNudges", `
			"Global.DesktopSpotlight","Global.DesktopStickerEditor","Global.FamilyValueProp","Global.ValueBanner"
$Pushers3 = "DesktopSpotlight$DongleGlobal.DesktopSpotlight", `
			"DesktopSpotlight$DonglePackageMetadata"
Start-ThreadJob { 
	$Dongle = "_cw5n1h2txyewy!"
	$Path	= "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications\Applications\"
	ForEach ($Push in $Pushers) { 
		Start-ThreadJob { 
			$PathX = $Path+"Microsoft."+$Push+$Dongle+"App"
			DEL -Path $PathX -Recurse 
		}
	}
	ForEach ($Push in $Pushers2) { 
		Start-ThreadJob { 
			$PathY = $Path+"MicrosoftWindows.Client.LKG_"+$Dongle+$Push
			DEL -Path $PathY -Recurse
		}
	}
	ForEach ($Push in $Pushers3) { 
		Start-ThreadJob { 
			DEL -Path $Path+"MicrosoftWindows.LKG."+$Push -Recurse 
		} 
	}
} -Name "Pushers"
# End PushNotifications
##
#
$MSFT17 = "Microsoft.ScreenSketch_8wekyb3d8bbwe","SecHealthUI_8wekyb3d8bbwe", 1
		  "Windows.NarratorQuickStart_8wekyb3d8bbwe","Windows.PeopleExperienceHost_cw5n1h2txyewy","Windows.Search_cw5n1h2txyewy"
Start-ThreadJob { 
	ForEach ($MSFT in $MSFT17) { 
		$Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\"+$MSFT
		DEL -Path $Path -Recurse 
	}
} -Name "BackgroundAccess"
#
##  Device Capabilities
#
$MSFT27 = "activity","appDiagnostics","appointments","bluetoothSync","broadFileSystemAccess", `
		  "cellularData","chat","contacts","documentsLibrary","downloadsFolder","email","gazeInput","graphicsCaptureProgrammatic","graphicsCaptureWithoutBorder","graphicsCaptureWithoutBorder\NonPackaged","location\NonPackaged","musicLibrary","phoneCall","phoneCallHistory","picturesLibrary","radios","sensors.custom","userAccountInformation","userDataTasks","userNotificationListener","videosLibrary","wifiData","wiFiDirect"
$MSFT28 = "microphone","webcam"
Start-ThreadJob {
	$Path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\"
	ForEach ($MSFT in $MSFT27) { 
		Start-ThreadJob {
			SP -Path $Path+$MSFT -Name "Value" -Value "Deny"
		} 
	}
	ForEach ($MSFT in $MSFT28) { 
		Start-ThreadJob {
			SP -Path $Path+$MSFT -Name "Value" -Value "Allow" 
		} 
	}
} -Name "Capabilities"		
#
##
#
Start-ThreadJob  { 
(97..(97+25)) | 
	% { [char]$_ } { 
		SP -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreventIndexingCertainPaths" -Name "file://([char]$_):\*" -Value "file://([char]$_):\*" 
	}
} -Name "Indexing"
#
## Device Access
#
$Hives    = "HKCU","HKLM"
$Allows   = "{2EEF81BE-33FA-4800-9670-1CD474972C3F}",`
			"{E5323777-F976-4f5b-9b55-B94699c46e4}"
$Denies   = "{52079E78-A92B-413F-B213-E8FE35712E72}",`
			"{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}",`
		    "{992afa70-6f47-4148-B3e9-3003349c1548}",`
			"{A8804298-2d5f-42e3-9531-9c8c39eb29ce}",`
			"{C1d23acc-752b-43e5-8448-8d0e519cd6d6}",`
			"{D89823ba-7180-4b81-B50c-7e471e6121a3}",`
			"{BFA794E4-F964-4FDB-90F6-51056BFE4B44}",`
			"{52079E78-A92B-413F-B213-E8FE35712E72}"
$Statuses = "{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
#  ALLOW apps to use microphone
ForEach ($Key in $Hives) {
	$Path = $Key+":\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\"
	Start-ThreadJob {
		ForEach ($Item in $Allows) { 
			$PathX = $Path+$Item
			SP -Path $PathX -Name "Value"  				  -Value "Allow"
		}
	} -Name "Allows"
	Start-ThreadJob {
		ForEach ($Item in $Denies) { 
			$PathY = $Path+$Item
			SP -Path $PathY -Name "Value"  				  -Value "Deny" 
		}
	} -Name "Denys"
	Start-ThreadJob {
		ForEach ($Item in $Statuses) { 
			$PathZ = $Path+$Item
			SP -Path $PathZ -Name "SensorPermissionState" -Value 0 -Type DWord 
			SP -Path $PathZ -Name "Status" 				  -Value "Off"
		} 
	} -Name "Device allow/deny"
} 
#
## **************************** WDI - Diagnostics #>
#
$Deny  = "{081D3213-48AA-4533-9284-D98F01BDC8E6}",`
		 "{659F08FB-2FAB-42A7-BD4F-566CFA528769)",`
		 "{88D69CE1-577A-4DD9-87AE-AD36D3CD9643}",`
		 "{9C5A40DA-B965-4FC3-8781-88DD50A6299D}",`
		 "{D113E4AA-2D07-41B1-8D9B-C065194A791D}"
$Allow = "{ACFD1CA6-18B6-4CCF-9C07-580CDB6EDED4}"
$Path  = "HKLM:\Software\Policies\Microsoft\Windows\WDI\"
Start-ThreadJob {
	ForEach ($MSFT in $Deny) { 
		SP -Path $Path -Name "EnabledScenarioExecutionLevel"	-Value "-" 
		SP -Path $Path -Name "ScenarioExecutionEnabled" 		-Value 0 -Type DWord
	}
	ForEach ($MSFT in $Allow) { 
		SP -Path $Path -Name "EnabledScenarioExecutionLevel" 	-Value 1 -Type DWord 
		SP -Path $Path -Name "ScenarioExecutionEnabled" 		-Value 1 -Type DWord 	

	}
	$PathX = "HKLM:\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\Looselycoupled"
	SP -Path $PathX    -Name "Value" 							-Value "Deny" 
} -Name "WDI"
#
##
#	
$MSFT45 = "AutoPlay","CapabilityAccess","SecurityAndMaintenance","StartupApp","Suggested",`
		  "WindowsUpdate.MoNotification2","WindowsUpdate.Notification"
$MSFT46 = "AllowDefaultCredentials","AllowDefCredentialsWhenNTLMOnly","AllowFreshCredentials",`
		  "AllowFreshCredentialsWhenNTLMOnly","AllowSavedCredentials","AllowSavedCredentialsWhenNTLMOnly","'1'='wsman/*'"
$MSFT48 = "","_UserInControlOfTheseApps","_ForceAllowTheseApps","_ForceDenyTheseApps" 
Start-ThreadJob {
	ForEach ($MSFT in $MSFT45) {
		$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast."+$MSFT
		SP -Path $Path -Name "Enabled" -Value 0 -Type DWord 
	} 
} -Name "SystemToast"
Start-ThreadJob {
	ForEach ($MSFT in $MSFT46) { 
		$Path = "HKCU:\Software\Policies\Microsoft\Windows\CredentialsDelegation\"+$MSFT
		SP -Path $Path -Name "Enabled" -Value 0 -Type DWord
	} 
}	
Start-ThreadJob {
	ForEach ($MSFT in $MSFT48) {
		$Path = "HKLM:\Software\Policies\Microsoft\Windows\WwanSvc\CellularDataAccess"
		$Name = "LetAppsAccessCellularData"+$MSFT
		SP -Path $Path -Name $Name    	-Value 0 -Type DWord 
	} 
} -Name "Cell Access"
#
## Set unknown networks private
# 			
$MSFT49 = "10000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24",`
		  "20000000F0000F0ABA0226144020107D469B778399BF3083A7EBB37586084F5B7A71A633E24B5AF","80000000F0000F04407FBA8F35F2D908A79CA8FF0EC5F395B8F008220F9AD518FCC9E5BEE5F4C25","80000000F0000F0F2CE0D3289DA55493A0F5834184C964E61003AB294E095F3FEC308D1BD81E3C5"
$Craps = "CategoryReadOnly","","IconReadOnly","NameReadOnly","NetworkName"
Start-ThreadJob {
	ForEach ($MSFT in $MSFT49) { 
		$Path = "HKLM:\Software\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\`
		         Signatures\010103000F0000F00"+$MSFT
		ForEach ($Crap in $Craps) {
			SP -Path $Path -Name $Crap 		-Value 0 -Type DWord
		}
		SP -Path $Path 	   -Name "Category" -Value 1 -Type DWord 
	}
}-Name "Set Nets Private"
#
##
#
$Hives = "HKCU","HKLM"
$MSFT50 = "csrss","dwm","ntoskrnl"
Start-ThreadJob { 
	ForEach ($Key in $Hives) {
		ForEach ($MSFT in $MSFT50) { 
			$Path = $Key+":\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions\`
						  ProcessMitigationOptions"
			$Name = $MSFT+".exe"
			SP -Path $Path -Name $Name -Value "00000000000000000000000000000000"
		} 
	}
} -Name "Mitigate"
#
##  ****** Disable miniports
#
$MiniPorts = "AGILEVPNMINIPORT","GREMINIPORT","L2TPMINIPORT","NDISWANBH","NDISWANIP", `
			 "NDISWANIPV6","PPPOEMINIPORT","PPTPMINIPORT","SSTPMINIPORT"
ForEach ($MiniPort in $MiniPorts) { 
	Start-ThreadJob {
		$Path = "HKLM:\System\CurrentControlSet\Enum\SWD\MSRRAS\MS_"+$MiniPort
		SP -Path $Path -Name "ConfigFlags" -Value 0 -Type DWord -EA 0 | Out-Null
	} -Name "Miniports"	
} 
#
## Autologger
#
$Enabled = 	"AITEventLog","AppMoDEL","AppPlat","Audio","Circular Kernel Context Logger",`
			"EventLog-ForwardedEvents","EventLog-Security","EventLog-System","EventLog-Microsoft-Windows-SMBServer-Analytic","FamilySafetyAOT","iclsClient","iclsProxy","IntelRST","LWTNetLog","Mellanox-WinOF2-Kernel","Mellanox-Kernel","Microsoft-Windows-Dedup-Filter-Log","Microsoft-Windows-Dedup-Filter-Trace","Microsoft-Windows-ProjFS-Filter-Log","Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace","NetCore","NTFSLog","PEAuthLog","RadioMgr","NtfsLog","PEAuthLog","PlatformLicenseManagerService","RadioMgr","RdrLog","ReadyBoot","ReFSLog","SetupPlatform","SetupPlatformTel","SpoolerLogger","TileStore","TPM","UBPM","WDIContextLog","WiFiDriverIHVSession","WiFiDriverIHVSessionRepro","WiFiSession"
$MSFT53	= 	"AutoLogger-DiagTrack-Listener","DefenderAPILogger","DefenderAuditLogger","DiagLog",`
			"EventLog-Microsoft-Windows-SMBServer-Analytic","IntelRST","LWTNetLog","Mellanox-WinOF2-Kernel","Microsoft-Windows-Dedup-Filter-Trace"
$MSFT54 = 	"CloudExperienceHostOOBE","DiagTtrack-Listener","SQMLogger","WFP-IPSec Trace"
#
##Autologger Commands to reduce amount of logs
#
Start-Job {
	$Path = "HKLM:\System\CurrentControlSet\Control\WMI\Autologger\"
	Start-ThreadJob {
		ForEach  ($Disable in $Enabled) {
			$PathX = $Path+$Disable 
			SP -Path $PathX -Name "Enabled" -Value 0 -Type DWord 
		}
	}
	Start-ThreadJob {
		
		ForEach ($MSFT in $MSFT53) {
			$PathY = $Path+$MSFT
			SP -Path $PathY -Name "Start" 	-Value 0 -Type DWord 
		} 
	}
	Start-ThreadJob {
		ForEach ($MSFT in $MSFT54) {
			$PathZ = $Path+$MSFT
			DEL -Path $PathZ 
		} 
	}
	Start-ThreadJob {
		$Path1 = $($Path)+"EventLog-System"
		$Path2 = $($Path)+"EventLog-Security"
		$Path3 = $($Path)+"TCPIPLOGGER" 
		SP -Path $Path1 -Name "LogFileMode" 	-Value 10000180 
		SP -Path $Path2 -Name "LogFileMode" 	-Value 268435904
		SP -Path $Path2 -Name "EnableProperty" 	-Value 0
		SP -Path $Path3 -Name "Start" 			-Value 4 
	} -Name "AutoLogger-Eventlog"
} -Name "AutoLogger"
#
## WINEVT
#
$MSFT55 = "GfxFwAnalytic","GfxFwError","Intel-GFX-Info/Application","Intel-GFX-Info/System",`
		  "Microsoft-Client-Licensing-Platform/Admin"
$MSFT56 = "All-User-Install-Agent/Admin","AppHost/Admin"
$MSFT57 = "AllJoyn/Operational","Application-Experience/Program-Compatibility-Assistant",`
		  "Application-Experience/Program-Compatibility-Troubleshooter","Application-Experience/Program-Inventory","Application-Experience/Program-Telemetry","Biometrics/Operational","Windows Defender/Operational","Superfetch/Main",`
		  "Superfetch/PfApLog","Superfetch/StoreLog","Application-Experience/Program-Telemetry"
Start-ThreadJob {
	$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\"
	ForEach ($MSFT in $MSFT55) { 
		$PathX = $Path+$MSFT
		Start-ThreadJob {
			SP  -Path $PathX 	-Name "Enabled" -Value 0 -Type DWord 
		} -Name "WinEvt 1"
	}			
	ForEach ($MSFT in $MSFT56) { 
		Start-ThreadJob -InputObject ($Path) {
			$PathY = $Path+"Microsoft-Windows-"+$MSFT
			SP  -Path $PathY 	-Name "Enabled" -Value 0 -Type DWord 
			SP  -Path $PathY	-Name "Type" 	-Value 0 -Type DWord 
		} -Name "WinEvt 2"
	}
	ForEach ($MSFT in $MSFT57) { 
		$PathZ = $Path+"Microsoft-Windows-"+$MSFT
		$PathA = $Path+"Microsoft-Client-Licensing-Platform\Admin"
		$PathB = $Path+"Intel-GFX-Info\System"
		Start-ThreadJob {
			SP  -Path $PathZ 	-Name "Enabled" -Value 0 -Type DWord 
		} -Name "WinEvt 3.1"
		SP -Path $PathA 		-Name "Type" 	-Value 0 -Type DWord
		SP -Path $PathB 		-Name "Start" 	-Value 0 -Type DWord
	}
} -Name "WinEvt 3"
#
## LabConfig
# 
$MSFT58 = "BypassCPUCheck","BypassDiskCheck","BypassRAMCheck","BypassSecureBootCheck", `
		  "BypassStorageCheck","BypassTPMCheck"
Start-ThreadJob {
	ForEach ( $MSFT in $MSFT58) { 
		SP -Path "HKLM:\System\Setup\LabConfig" -Name $MSFT -Value 1 -Type DWord 
	} 
} -Name "LabConfig"
#
## Start Menu
#
$MSFT59 = "AllowPinnedFolderDocuments","AllowPinnedFolderDocuments_ProviderSet",`
		  "AllowPinnedFolderDownloads","AllowPinnedFolderDownloads_ProviderSet",`
		  "AllowPinnedFolderFileExplorer","AllowPinnedFolderFileExplorer_ProviderSet"
$Hives  = "HKCU","HKLM"
$Path   = ":\SOFTWARE\Microsoft\PolicyManager\current\device\Start"
Start-ThreadJob -InputObject ($Path) {
	ForEach ($MSFT in $MSFT59) { 
		ForEach ($Key in $Hives) {
			SP -Path $Key$Path -Name $MSFT -Value 1 -Type DWord 
		}
	}
} -Name "Start Menu"
#
## Disable recording of event logging and tracing 
# 
$MSFT60 = 	"{0E28E245-9368-4853-AD84-6DA3BA35BB75}",`
			"{17D89FEC-5C44-4972-B12D-241CAEF74509}",`
			"{1A6364EB-776B-4120-ADE1-B63A406A76B5}",`
			"{3A0DBA37-F8B2-4356-83DE-3E90BD5C261F}",`
			"{5794DAFD-BE60-433f-88A2-1A31939AC01F}",`
			"{6232C319-91AC-4931-9385-E70C2B099F0E}",`
			"{6A4C88C6-C502-4f74-8F60-2CB23EDC24E2}",`
			"{7150F9BF-48AD-4da4-A49C-29EF4A8369BA}",`
			"{728EE579-943C-4519-9EF7-AB56765798ED}",`
			"{74EE6C03-5363-4554-B161-627540339CAB}",`
			"{91FBB303-0CD5-4055-BF42-E512A681B325}",`
			"{A3F3E39B-5D83-4940-B954-28315B82F0A8}",`
			"{AADCED64-46C-4633-A97C-D61349046527}" ,`
			"{B087BE9D-ED37-454f-AF9C-04291E351182}",`
			"{BC75B1ED-5833-4858-9BB8-CBF0B166DF9D}",`
			"{C418DD9D-0D14-4efb-8FBF-CFE535C8FAC7}",`
			"{E47248BA-94CC-49c4-BBB5-9EB7F05183D0}",`
			"{E4F48E54-F38D-4884-BFB9-D4D2E5729C18}",`
			"{E5094040-C46C-4115-B030-04FB2E545B00}",`
			"{E62688F0-25FD-4c90-BFF5-F508B9D2E31F}",`
			"{F9C77450-3A41-477E-9310-9ACD617BD9E3}"
Start-ThreadJob {
	ForEach ($MSFT in $MSFT60) { 
		$Path = "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\"+$MSFT
		Start-ThreadJob { 
			SP -Path $Path -Name "LogLevel"   -Value 0 -Type DWord
			SP -Path $Path -Name "TraceLevel" -Value 0 -Type DWord 
		} 
	}
} -Name "Group Policies"
#
## Sync Policy
#
$Path   = "HKLM:\Software\Microsoft\Windows\CurrentVersion\SettingSync"
$MSFT66 = "Accessibility","BrowserSettings","Credentials","Language","Personalization","Windows"
$MSFT67 = "DisableApplicationSettingSync","DisableAppSyncSettingSync",`
		  "DisableCredentialsSettingSync","DisableDesktopThemeSettingSync","DisableLanguageSettingSync","DisablePersonalizationSettingSync","DisableSettingSync","DisableStartLayoutSettingSync","DisableWebBrowserSettingSync","DisableWindowsSettingSync"
$MSFT68 = "AccountInfo","BackgroundSpatialPerception","Calendar","CallHistory","Contacts",`
		  "Email","GazeInput","GraphicsCaptureProgrammatic","GraphicsCaptureWithoutBorder","GraphicsCaptureWithoutBorder","HumanPresence","Location","Messaging","Motion","Notifications","Phone","Radios","Tasks","TrustedDevices"
$MSFT69 = "ActivateWithVoice","ActivateWithVoiceAboveLock","GetDiagnosticInfo",`
		  "SyncWithDevices","DisableApplicationSettingSyncUserOverride","DisableAppSyncSettingSyncUserOverride","DisableCredentialsSettingSyncOverride","DisableDesktopThemeSettingSyncUserOverride","DisableLanguageSettingSyncUserOverride","DisablePersonalizationSettingSyncUserOverride","DisableSettingSyncUserOverride","DisableStartLayoutSettingSyncUserOverride","DisableSyncOnPaidNetwork","DisableWebBrowserSettingSyncUserOverride","DisableWindowsSettingSyncUserOverride"
$MSFT70 = "","_ForceAllowTheseApps","_ForceDenyTheseApps","_UserInControlOfTheseApps"
$MSFT71 = "Camera","Microphone"
## Enable sync for all.  "SyncPolicy"=dword:00000005 will disable for all
Start-ThreadJob -InputObject ($Path) {
	SP -Path $Input -Name "SyncPolicy" -Value 1 -Type DWord  
} -Name "Sync Policy"

Start-Job {
	ForEach ($MSFT in $MSFT66) { 
		$Path  = "HKLM:\Software\Microsoft\Windows\CurrentVersion\SettingSync"
		$Path2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
		Start-ThreadJob -ArgumentList @($Path) {
			Param ($Path)
			$PathX = $Path+"\Groups"
			SP -Path $PathX -Name $MSFT -Value 0 -Type DWord 
		} -Name "Setting Sync 1"
	}   
	ForEach ($MSFT in $MSFT67) { 
		Start-ThreadJob { 
			$PathY = "HKLM:\Software\Policies\Microsoft\Windows\SettingSync"
			SP -Path $PathY -Name $MSFT -Value 2 -Type DWord 
		} -Name "Setting Sync 2"
	}   				
	ForEach ($MSFT in $MSFT68) { 
		Start-ThreadJob -ArgumentList @($Path2) { 
			Param ($Path2)
			SP -Path $Path2 -Name "LetAppsAccess"+$MSFT -Value 2 -Type DWord 
		} -Name "AppPrivacy 1"
	}   
	ForEach ($MSFT in $MSFT69) { 
		Start-ThreadJob -ArgumentList @($Path2) { 
			Param ($Path2) 
			$Name = "LetApps"+$MSFT
			SP -Path $Path2 -Name $Name -Value 2 -Type DWord 
		} -Name "AppPrivacy 2"
	}   
	ForEach ($MSFT in $MSFT70) { 
		Start-ThreadJob -ArgumentList @($Path2) { 
			Param ($Path2)
			$Name = "LetAppsRunInBackground"+$MSFT
			SP -Path $Path2 -Name $Name -Value 0 -Type DWord 
		}   -Name "AppPrivacy 3"
	}   				
	ForEach ($MSFT in $MSFT71) {
		Start-ThreadJob -ArgumentList @($Path2) { 
			Param ($Path2)
			$Name = "LetAppsAccess"+$MSFT
			SP -Path $Path2 -Name $Name -Value 1 -Type DWord 
		} -Name "AppPrivacy 4"
	}
} -Name "Sync Setting + AppPrivacy"
#
##  Credentials
#
$Credentials  = "DefaultCredentials","DefCredentialsWhenNTLMOnly","FreshCredentials",`
			    "FreshCredentialsWhenNTLMOnly","ProtectedCreds","SavedCredentials","SavedCredentialsWhenNTLMOnly"
$Credentials2 = "Default","DefNTLMOnly","Fresh","FreshNTLMOnly","Saved","SavedNTLMOnly"

Start-ThreadJob -ArgumentList ($PathX,$Credentials,$Credentials2) {
	Param ($Credentials,$Credentials2)
	$PathX = "HKLM:\Software\Policies\Microsoft\Windows\CredentialsDelegation" 
	ForEach ($Credential in $Credentials) { 
		Start-ThreadJob -ArgumentList @($PathX,$Credential) { 
			Param ($PathX,$Credential) 
			SP -Path $PathX -Name "Allow$Credential" -Value 1 -Type DWord 
		} 
	}
	ForEach ($Credential in $Credentials2) { 
		Start-ThreadJob -ArgumentList  @($PathX,$Credential) { 
			Param ($PathX,$Credential)
			SP -Path $PathX -Name "ConcatenateDefaults_Allow$Credential" -Value 1 -Type DWord 
		} 
	}
} -Name "Credentials2"
#
##  StorPort
#
$Values = "Performance","ErrorData","DeviceHealth"
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\StorPort"
Start-ThreadJob {
	ForEach ($Value in $Values) {
		$Name = "Telemetry"+$Value+"Enabled"
		SP -Path $Path -Name $Name -Value 0 -Type DWord 
	}
} -Name "StorPort"
#
## WER
# 
$Hives 		= "HKCU","HKLM"
$Path		= ":\Software\Policies\Microsoft\Windows\Windows Error Reporting"
$Path1 		= "HKCU"+$Path
$Path2		= "HKLM"+$Path
$Path3 		= "HKLM:\Software\Microsoft\Windows\Windows Error Reporting"
$Path4		= "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\Windows Error Reporting"
$Paths 		= $Path1,$Path2,$Path3,$Path4
$Throts 	= "Data","NetworkCost","Power"
$Disables 	= "Archive","d","Queue"
$Disables2 	= "Disabled","DisableArchive","LoggingDisabled","DontSendAdditionalData",`
			  "DontShowUI","OobeCompleted"
Start-ThreadJob -ArgumentList @($Paths,$Disables,$Disables2,$Throts) { 
	Param ($Paths)
	ForEach ($Hive in $Hives) {
		ForEach ($Path in $Paths) {
			$PathX = $Hive+$Path
			Start-ThreadJob -ArgumentList @($PathX,$Throts) { 
				Param ($PathX)
				ForEach ($Throt in $Throts) {
					$Name = "Bypass"+$Throt+"Throttling"
					SP -Path $PathX -Name $Name 				-Value 0 -Type DWord 
				}
				SP -Path $PathX -Name "AutoApproveOSDumps"		-Value 0 -Type DWord
				SP -Path $PathX -Name "ConfigureArchive" 		-Value 0 -Type DWord
			}
			Start-ThreadJob -ArgumentList @($PathX,$Disables,$Disables2) { 
				Param ($PathX)
				ForEach ($Disable in $Disables) {
					$Name = "Disable"+$Disable
					SP -Path $PathX -Name $Name 				-Value 1 -Type DWord 
				}
				ForEach ($Disable in $Disables2) {
					SP -Path $PathX -Name $Disable 				-Value 1 -Type DWord 
				}
			}
			Start-ThreadJob -ArgumentList @($PathX) { 
				Param ($PathX)
				$PathY = $PathX+"\Consent"
				SP -Path $PathY -Name "0" 						-Value ""
				SP -Path $PathY -Name "DefaultConsent" 			-Value "0"
				SP -Path $PathY -Name "DefaultOverrideBehavior" -Value "0"
			}
		}
	}
} -Name "Error Reporting"
#
## Device MSI Priorities
#
$Devs1 	= { 	"1002&DEV_AB38&SUBSYS_AB381002&REV_00\6&83d41a7&0&010000E8" }
$Devs2 	= { 	"8086&DEV_A780&SUBSYS_88821043&REV_04\3&11583659&0&10",
				"8086&DEV_A74F&SUBSYS_88821043&REV_01\3&11583659&0&40",
				"8086&DEV_7A70&SUBSYS_00748086&REV_11\3&11583659&0&A3",
				"8086&DEV_7A50&SUBSYS_87FB1043&REV_11\3&11583659&0&FB",
				"1002&DEV_731F&SUBSYS_E4261DA2&REV_CA\6&83d41a7&0&000000E8",
				"8086&DEV_7A30&SUBSYS_88821043&REV_11\3&11583659&0&E8",
				"8086&DEV_7A34&SUBSYS_88821043&REV_11\3&11583659&0&EC",
				"8086&DEV_7A38&SUBSYS_88821043&REV_11\3&11583659&0&E0",
				"8086&DEV_7A3A&SUBSYS_88821043&REV_11\3&11583659&0&E2",
				"8086&DEV_7A3C&SUBSYS_88821043&REV_11\3&11583659&0&E4",
				"8086&DEV_7A40&SUBSYS_88821043&REV_11\3&11583659&0&D8",
				"8086&DEV_7A44&SUBSYS_88821043&REV_11\3&11583659&0&DC",
				"8086&DEV_7A48&SUBSYS_88821043&REV_11\3&11583659&0&D0",
				"8086&DEV_7A4D&SUBSYS_88821043&REV_11\3&11583659&0&A9",
				"8086&DEV_7A4E&SUBSYS_88821043&REV_11\3&11583659&0&AA",
				"8086&DEV_7A4C&SUBSYS_88821043&REV_11\3&11583659&0&A8",
				"8086&DEV_A70D&SUBSYS_88821043&REV_01\3&11583659&0&08",
				"8086&DEV_A71D&SUBSYS_88821043&REV_01\3&11583659&0&20"
				"8086&DEV_A74D&SUBSYS_88821043&REV_01\3&11583659&0&30" }
$Devs3 	= {		"8086&DEV_7A60&SUBSYS_88821043&REV_11\3&11583659&0&A0",
				"10EC&DEV_8125&SUBSYS_87D71043&REV_05\01000000684CE00000",
				"1425&DEV_5410&SUBSYS_00001425&REV_00\4&286f83b0&3&04E4" }
$DevsM	= { 	"8086&DEV_7A50&SUBSYS_87FB1043&REV_11\3&11583659&0&FB",
				"8086&DEV_7A30&SUBSYS_88821043&REV_11\3&11583659&0&E8",
				"8086&DEV_7A34&SUBSYS_88821043&REV_11\3&11583659&0&EC",
				"8086&DEV_7A38&SUBSYS_88821043&REV_11\3&11583659&0&E0",
				"8086&DEV_7A3A&SUBSYS_88821043&REV_11\3&11583659&0&E2",
				"8086&DEV_7A3C&SUBSYS_88821043&REV_11\3&11583659&0&E4",
				"8086&DEV_7A40&SUBSYS_88821043&REV_11\3&11583659&0&D8",
				"1002&DEV_AB38&SUBSYS_AB381002&REV_00\6&83d41a7&0&010000E8",
				"8086&DEV_7A44&SUBSYS_88821043&REV_11\3&11583659&0&DC",
				"8086&DEV_7A48&SUBSYS_88821043&REV_11\3&11583659&0&D0",
				"8086&DEV_7A4C&SUBSYS_88821043&REV_11\3&11583659&0&A8",
				"8086&DEV_7A4D&SUBSYS_88821043&REV_11\3&11583659&0&A9",
				"8086&DEV_7A4E&SUBSYS_88821043&REV_11\3&11583659&0&AA",
				"8086&DEV_A70D&SUBSYS_88821043&REV_01\3&11583659&0&08",
				"8086&DEV_A71D&SUBSYS_88821043&REV_01\3&11583659&0&20",
				"8086&DEV_A74D&SUBSYS_88821043&REV_01\3&11583659&0&30" }			
$PathStart 	=   "HKLM:\SYSTEM\CurrentControlSet\Enum\PCI\VEN_"
$PathEnd1 	= 	"\Device Parameters\Interrupt Management\Affinity Policy"	
$PathEnd2 	= 	"\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
Start-Job {
	Start-ThreadJob {
		ForEach ($Dev in $Devs1) {
			SP -Path $PathStart+$Dev+$PathEnd1 -Name "DevicePriority" -Value 1 -Type DWord
		} 
	} -Name "Device Priority 1"
	Start-ThreadJob {
		ForEach ($Dev in $Devs2) {
			SP -Path $PathStart+$Dev+$PathEnd1 -Name "DevicePriority" -Value 2 -Type DWord
		} 
	} -Name "Device Priority 2"
	Start-ThreadJob {
		ForEach ($Dev in $Devs3) {
			SP -Path $PathStart+$Dev+$PathEnd1 -Name "DevicePriority" -Value 3 -Type DWord
		} 
	} -Name "Device Priority 3"
	
	Start-ThreadJob {
		ForEach ($Dev in $DevsM) {
			Start-ThreadJob {
				SP -Path $PathStart+$Dev+$PathEnd2 -Name "MSISupported" -Value 1 -Type DWord
			}
		} 
	} -Name "MSI Supported"
} -Name "Device Priorities"
#
##  *************************  Terminal Server
#
$Path 		= "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$Disable0 	= "AutoReconnect", 									<# Enable automatic reconnect #>
			  <# Remote Desktop Device redirection settings #> `
			  "Cam","CameraRedir","Ccm","Cdm","Clip","Cpm",		<# Dont disable printer redirection #> 
			  "Exe","LocationRedir","LPT","PNPRedir"			
$Set0 = 	  "fAllowToGetHelp",
			  "fAllowUnsolicited",
			  "fPromptForPassword",								<# Don't force asking for password #>		
			  "fSingleSessionPerUser",  						<# Dont limit remote users to 1 session #> 	
			  "fDenyConnections",	      						<# Dont deny connections #> 				
			  "UserAuthentication"													
$Set1 	 	= "fDisableAudioCapture","fDisableEncryption","fNoRemoteDesktopWallpaper",`
			  "fAllowDesktopCompositionOnServer","fAllowUnlistedRemotePrograms","fEnableSmartCard","fEnableTimeZoneReDirection","fEnableUiaRedirection" 
$Deletes 	= "AllowFullControl","AllowUnSolicitedFullControl","fUseMailTo","maxticketexpiry",`
			  "maxticketexpiryunits"
Start-Job {
	ForEach ($Disable in $Disable0) {
		Start-ThreadJob {
			SP -Path $Path -Name "fDisable"+$Disable 	-Value 0 	-Type DWord
		} -Name "fDisable0"
	}
	ForEach ($Set in $Set0) {
		Start-ThreadJob {
			SP -Path $Path -Name $Set 					-Value 0 	-Type DWord
		} -Name "Set 0"						
	} 					
	ForEach ($Set in $Set1) {					
		Start-ThreadJob {					
			SP -Path $Path -Name $Set 					-Value 1 	-Type DWord
		} -Name "Set 1"	
	}  	
	ForEach ($Delete in $Deletes) {
		Start-ThreadJob {
			RP -Path $Path -Name $Delete 				-Recurse
		} -Name "Deletes"	
	} 
	Start-ThreadJob {
		SP -Path $Path -Name "Shadow" 			-Value 2 			-Type DWord
		SP -Path $Path -Name "MaxInstanceCount" -Value 4294967295 	-Type DWord
		SP -Path $Path -Name "Password" 		-Value ""
		SP -Path $Path -Name "Username" 		-Value "Ariel"
	} -Name "Manuals"
} -Name "Policies-TS"
#
## More TS: RDP-TCP
#
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP"

$Set0 =	"fHomeDirectoryMapRoot","fInheritCallback","fLogonDisabled","fPromptForPassword",`
		"UserAuthentication"
		
$Set1 =	"fAllowSecProtocolNegotiation","fAutoClientDrives","fAutoClientLpts","fEnableWinStation",`
		"fForceClientLptDef","fInheritAutoClient","fInheritAutoLogon","fInheritShadow",`
		"fReconnectSame","SelectNetworkDetect"
		
$Set2 =	"SelectTransport","Shadow"

Start-Job {
	Start-ThreadJob {	ForEach ($Disable in $Disable0) {
		SP -Path $Path		-Name "fDisable"+$Disable 	-Value 0 -Type DWord
	} -Name "fDisable 0"
#	
	Start-ThreadJob {	
		ForEach ($Set in $Set0) {
			SP -Path $Path 	-Name $Set 					-Value 0 -Type DWord
		} -Name "Set 0"	
	}
#
	Start-ThreadJob {	
		ForEach ($Set in $Set1) {
			SP -Path $Path 	-Name $Set 					-Value 1 -Type DWord
		} -Name "Set 1"
	} 	
#	
	Start-ThreadJob {	
		ForEach ($Set in $Set2) {
			SP -Path $Path 	-Name "fDisable"+$Disable 	-Value 2 -Type DWord
		} -Name "fDisable 0"	
	}
#	
	Start-ThreadJob {	
		ForEach ($Delete in $Deletes) {
			RP -Path $Path 	-Name $Delete 				-Recurse
		} -Name "Deletes"	
	}
#	
	Start-ThreadJob {
		SP -Path 			-Name "MaxInstanceCount" 	-Value 4294967295 -Type DWord
		SP -Path 		  	-Name "Password"			-Value ""
		SP -Path 		  	-Name "Username"			-Value "Ariel"
	} -Name "Manuals"
} -Name "TS - RDP-TCP"		
#
##  More TS: RDP-WD
#
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd"
$Set0 =	"BreakDisconnect","DsrSensitivity"
$Set1 =	"fDisableAudioCapture","fDisableEncryption","fEnableDTR","fEnableRTS",`
		"fAutoClientDrives","fAutoClientLpts","fFlowSoftwareRx","fFlowSoftwareTx",`
		"fForceClientLptDef","fInheritAutoClient","FlowHardwareRx","FlowHardwareTx",`
		"FlowType","SelectNetworkDetect"
$Set2 =	"InputBufferLength","MinEncryptionLevel","SelectTransport"
Start-Job {
	Start-ThreadJob {
		ForEach ($Disable in $Disable0) {
			SP -Path $Path 	-Name "fDisable"+$Disable 			-Value 0 		  -Type DWord
		} 		
	} -Name "fDisable 0"		
	Start-ThreadJob {		
		ForEach ($Set in $Set0) {		
			SP -Path $Path 	-Name $Set 							-Value 0 		  -Type DWord
		} 		
	} -Name "Set 0"			
	Start-ThreadJob {		
		ForEach ($Set in $Set1) {		
			SP -Path $Path 	-Name $Set 							-Value 1 		  -Type DWord
		} 		
	} -Name "Set 1"				
	Start-ThreadJob {		
		ForEach ($Set in $Set2) {		
			SP -Path $Path 	-Name "fDisable"+$Disable 			-Value 2 		  -Type DWord
		} 		
	} -Name "fDisable 0"	
	Start-ThreadJob {
		SP -Path $Path 		-Name "Shadow" 						-Value 2 		  -Type DWord
		SP -Path $Path 		-Name "MaxInstanceCount" 			-Value 4294967295 -Type DWord
		SP -Path $Path 		-Name "Password" 					-Value ""
		SP -Path $Path 		-Name "Username" 					-Value "Ariel"
		SP -Path $Path 		-Name "XoffChar" 					-Value 13 		  -Type DWord
		SP -Path $Path 		-Name "XonChar"  					-Value 11 		  -Type DWord
	} -Name "Manuals"
} -Name "TS - RDPpwd"			
#
Start-ThreadJob {
	$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\TSAppSrv\VirtualIP"
	SP -Path $Path -Name "EnableVirtualIP"		-Value 1 -Type DWord
	SP -Path $Path -Name "VirtualMode" 			-Value 0 -Type DWord
	SP -Path $Path -Name "PerApp" 				-Value 0 -Type MultiString
} -Name "Policies TSAppSrv\VirtualIP"		

Start-ThreadJob {
	$Path = "HKLM:\Software\Microsoft\Terminal Server Client"
	SP -Path $Path -Name "ShowShutdownDialog" 	-Value 0 -Type DWord
} -Name "Terminal Server Client"		
#
Start-ThreadJob {
	$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\Console"
	SP -Path $Path -Name "Shadow" 				-Value 2 -Type DWord
} -Name "WinStations"		
#
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration"
$Set0 = "fLogonDisabled","fPromptForPassword"
$Set1 =	"fInheritAutoLogon","fReconnectSame"
Start-Job {
	Start-ThreadJob {
		ForEach ($Set in $Set0) {
			SP -Path 	$Path -Name $Set 		-Value 0 -Type DWord
		} 
	} -Name "Set 0"	
	Start-ThreadJob {
		ForEach ($Set in $Set1) {
			SP -Path 	$Path -Name $Set 		-Value 1 -Type DWord
		} 
	} -Name "Set 1"		
	Start-ThreadJob {
		SP -Path 		$Path -Name "Shadow" 	-Value 2 -Type DWord
		SP -Path 		$Path -Name "Username" 	-Value "Ariel"
	}
} -Name "CCS - DefaultUserConfiguration"
#
# *************************  End Terminal Server
## WinRM
#
$Values = "AllowBasic","AllowCredSSP","AllowUnencryptedTraffic","TrustedHosts"
$Path 	= "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client"
$Stars 	= "TrustedHostsList"
Start-ThreadJob {
	ForEach ($Value in $Values) {
		SP -Path $Path -Name $Value -Value 1 -Type DWord
	} 
	ForEach ($Star in $Stars) {
		SP -Path $Path -Name $Star -Value "*"
	} 
} -Name "WinRM Client"
#
$Values =	"AllowBasic","AllowCredSSP","AllowUnencryptedTraffic","AllowAutoConfig",`
			"HttpCompatibilityListener","HttpSCompatibilityListener"
$Stars 	= 	"IPv4Filter","IPv6Filter"
$Path 	= 	"HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service"
Start-ThreadJob {
	ForEach ($Value in $Values) {
		SP -Path $Path -Name $Value -Value 1 -Type DWord
	} 
	ForEach ($Star in $Stars) {
		SP -Path $Path -Name $Star 	-Value "*"
	} 
} -Name "WinRM Service"
#
## 

<# Found Lost
	$MSFT26 = @{"bmp"="Tiff";"dib"="Tiff";"ico"="Tiff";"tga"="Tiff";"TIF"="Tiff";"TIFF"="Tiff"; `
			  "gif"="Gif";"jpe"="Jpeg";"jpg"="Jpeg";"jpeg"="Jpeg";"jxr"="Wdp";"wdp"="Wdp"; `
			  "png"="Png";"jfif"="JFIF"}#> 
<# #> 
<# #> 
<# #> 
<# #> 
<# #> 
<# #> 
<# #> 
<# #> 
<# 

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"



Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"

Start-ThreadJob {
	ForEach ($Run in $Runs) {
		Start-ThreadJob {
			SP -Path $Path\Run -Name $Run -Value "hex:02,00,00,00,00,00,00,00,00,00,00,00" 
		}
	} 
} -Name "Approved Runs 2"










<#
# Delete Master
$Hives = "HKCU","HKLM"

$Path1 = "\SOFTWARE\Microsoft\TPG\InputPersonalization"
$Path2 = "\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\"
$Path3 = "\Software\Classes\Directory\Background\Shellex\ContextMenuHandlers\NVCplDesktopContext"
$Path4 = "\SOFTWARE\Wow6432Node\Microsoft\Tracing\IpHlpSvc"
$Path5 = ""
$Path6= "\Software\Microsoft\RPC\Internet"
$Path6= ""
$Path7= ""
$Path8= ""
$Path9= ""
$Path10 = ""
$Path11 = ""
$Path12 = ""
$Path13 = ""
$Path14 = ""
$Path15 = ""
$Path16 = ""





$Keys1 = $Path1,$Path2+"Compatibility Assistant\Store",$Path2+"TelemetryController",$Path3
$Keys2 = $Path4,$Path5,$Path5,$Path7,


$Keys = $Keys1,$Keys2,$Keys3,$Keys4,$Keys5,$Keys6,$Keys7,$Keys8,$Keys9,$KeysA,$KeysB,$KeysC

Start-ThreadJob {
	ForEach ($Key in $Keys) {
		Del -Path $Key -Force -Recurse 
	}
	
	
	
	
	
	
	ForEach ($Key in $Keys2) {
		Del -Path $Path2$Key2 -Force -Recurse 
	}
}

<#


ExtBlocked =
$MSFT77 =
$MSFT78 =
$MSFT79 =
$MSFT80 = 


Start-ThreadJob {
	ForEach ($MSFT in $MSFT52) {
			SP -Path "HKLM:" -Name "" -Value 0 -Type DWord } }
#
Start-ThreadJob {
	ForEach ($MSFT in $MSFT52) {
			SP -Path "HKLM:" -Name "" -Value 0 -Type DWord } }

Start-ThreadJob {
	ForEach ($MSFT in $MSFT52) {
			SP -Path "HKLM:" -Name "" -Value 0 -Type DWord } }
##
#


#
##
#

#
##
#
$MSFT = "
 Start-ThreadJob {
	ForEach ($MSFT in $MSFT) { DEL -Path "HKLM:$MSFT" -Recurse } } 

#>