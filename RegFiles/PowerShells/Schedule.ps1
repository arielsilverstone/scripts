#
## Change Tracking
#
Start-ThreadJob { 
	$Name="Schedule"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path "HKCU:\Changes" -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "16FEB25" | Out-Null
} -Name "$Name.ps1 Changed"
##
##
#
#
##    Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null

#
SaJb {
	$Numericals = "{7F16AD35-6951-4E8F-BEF0-D457C39B61D8}",`
				  "{9C4C4F25-9780-4903-AC5E-8AE073BE5234}",`		# WinSat
				  "{2FF7A0A0-9A9C-4F24-A282-12EC7F0BFA7F}",`
				  "{5662572E-A514-4D83-96B0-018CD72CE557}",`
				  "{D76434FF-56F5-4869-9F33-94A31490908A}"
	ForEach ( $Number in $Numericals ) { 
		$Item = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\"+$Number
		Start-ThreadJob { 
			DEL $Item -Recurse -EA 0
		} -Name "Numericals" 
	}	
} -Name "Various Tasks" | Out-Null  #End Job
#
## To Disable by Task Name or PathDisable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" 				 | Out-Null

#
$Tasks 		 =	".NET Framework NGEN",`
				"Active Directory Rights Management Services Client (Automated)",`
				"Active Directory Rights Management Services Client (Manual)",`
				"Adobe","AppUriVerifierDaily","aquasuite","BgTaskRegistrationMaintenanceTask","BootstrapUsage","Cellular","Consolidator","FamilySafety","GatherNetworkInfo","Indexer","iSCSIAgentAutoStartup","La57",`
				"License Validation","MDMDiag","Microsoft Compatibility Appraiser","MicrosoftEdge","Microsoft-Windows-DiskDiagnosticDataCollector","MobilityManager","Office","OneDrive","ProgramDataUpdater","Proxy","Scheduled Start","ServerManager","SmartScreen","Speech","StartAllBack Update","StorageCard","Synchronize Language Settings","SystemSoundsService","UnexpectedCodepath","UpdateUser","UsageData",`
				"User_Feed","WakeUpAnd","WindowsAdminCenterUpdater","WinSAT","Zoom"
				
$TasksPath 	 =	"Application Experience","AppID","AppxDeploymentClient","BitLocker","CloudExperienceHost",`
				"CloudRestore","Device information","DirectX","DiskDiagnostic","EnterpriseMgmt","ExploitGuard","Input","MemoryDiagnostic","OneDrive","PI","ManagementAutoPilot","PLA",`
				"Power Efficiency Diagnostics","ReFsDedupSvc","SharedPC","Software Inventory Logging","Speech",`
				"Time Synchronization","Time Zone","UpdateOrchestrator","Windows Defender","WwanSvc","WaaSMedic",`
				"Windows Error Reporting","Windows Media Sharing","WindowsUpdate","WorkFolders"
				
$TasksOffice = 	"Office Automatic Updates 2.0","Office ClickToRun Service Monitor","Office Feature Updates",`
				"Office Performance Monitor","Office Feature Updates Logon"
#	To Remove
$TasksDelete = "Media Center\","Customer Experience Improvement Program\","Location\","Maps\",`
			   "PushToInstall\","TPM\","\WiseCleaner\*","\Intel\*","USBCeip"
#
$TasksDeleteNotMSFT = "\WiseCleaner\*","\Intel\*","\CCleaner*","\StartCN","\StartDVR",`
					  "\DriverMax_RESTART"
#
#	To Make Sure Enabled
$TasksEnable = "\Microsoft\Windows\Offline Files\"
##
# 	To Suspend
SaJb {
	Start-ThreadJob { 
		ForEach ($Task in $Tasks) { 
			Disable-ScheduledTask 		 -TaskName $Task* 						-EA 0 
		}
	}
	Start-ThreadJob { 
		ForEach ($Task in $TasksPath) { 
			Disable-ScheduledTask 		 -TaskPath "\Microsoft\Windows\"+$Task* -EA 0 
		}
	}
	Start-ThreadJob { 
		ForEach ($Task in $TasksOffice) { 
			Unregister-ScheduledTask 		-TaskName "\Microsoft\Office\"+$Task*	-EA 0
		} 
	}
	Start-ThreadJob { 
		ForEach ($Task in $TasksDelete) { 
			If (Test-Path -Path $Task) {
				Unregister-ScheduledTask 	-TaskPath "\Microsoft\Windows\"+$Task 	-EA 0 -Confirm 0 -Recurse 
			} 
		}
	}							
	Start-ThreadJob { 
		ForEach ($Task in $TasksDeleteNotMSFT ) { 
			Unregister-ScheduledTask -		TaskPath $Task 							-EA 0 -Confirm 0  
		}
	} 
#	Enable
	Start-ThreadJob { 
		ForEach ($Task in $TasksEnable) { 
			Enable-ScheduledTask -TaskPath $Task -Taskname * 	-EA 0 
		}
	}
} -Name "Suspend"  #End Job
#
##
#
SaJb {
	Start-ThreadJob { 
		Remove-DedupSchedule -Name "Optimization" 			 	-EA 0 
	}
	Start-ThreadJob { 
		New-DedupSchedule 	 -Name "Optimization" 				-Type Optimization -DurationHours 6 `
		-Memory 80 -Cores 80 -Priority High -Days @(0,1,2,3,4,5,6) `
		-Start (Get-Date "2024-06-09 21:00:00") 			  	-EA 0 
	}
#
	Start-ThreadJob { 
		Remove-DedupSchedule -Name "WeeklyIntegrityScrubbing" 	-EA 0 
	} 	
	Start-ThreadJob { 
		New-DedupSchedule 	 -Name "WeeklyIntegrityScrubbing" 	-Type Scrubbing    -DurationHours 2 `
		-Memory 20 -Cores 30 -Priority High -Days @(0) `
		-Start (Get-Date "2024-05-09 02:00:00")	-EA 0 
	}
} -Name "New Sched"  # End Job
###
#
## Disable OneDrive Update
#
Start-ThreadJob { 
	$Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\`
			{CC79186C-C0E7-422C-A1A5-3DAA3B1764F0}"
	SP -Path $Path -Name "Hash" -Value `
	([byte[]](0x56,0x3d,0xf4,0x02,0x6f,0x7e,0x49,0xd6,0x46,0x4e,0xd6,0xf6,0xcc,0xdb,0x03,0x02,0x5b,0xcb,`
			  0x86,0x81,0xac,0x1e,0x17,0x81,0xd1,0xf1,0xb5,0xca,0x4b,0xc7,0xae,0x10)) 	-EA 0 
	Unregister-ScheduledTask -TaskName "OneDrive Per-Machine Standalone Update Task" -Confirm 0 
	
	
	Schtasks /change /tn "onedrive Per-Machine Standalone Update Task" /disable 
} -Name "OneDrive"
#
## Edge
#
Start-ThreadJob { Unregister-ScheduledTask  microsoftedge -Confirm 0 } -Name "Edge"
#
##
#

#
##
#

#
##
#

#
##
#
