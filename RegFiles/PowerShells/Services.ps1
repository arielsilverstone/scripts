#
#
# 	Change Tracking
Start-ThreadJob { 
	$Name="Services"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "11FEB25" | Out-Null
} -Name "$Name.ps1 Changed" 

##
#
#
$ToStop = 	"AarSvc",			"AdobeARMservice",			"AGMService",			"AppIDSvc", ` 
"Aqua Computer Service",		"aspnet_state", 			"atzautoupdate",		"AUEPLauncher", `
"AxInstSV",						"AzureAttestService",		"BcastDVRUserService",	"Beep",	`
"CaptureService",				"CertPropSvc",				"CloudBackupRestoreSvc", `
"ConsentUxUserSvc",				"DevicePickerUserSvc",		"DevicesFlowUserSvc", `
"diagnosticshub.standardcollector.service",					"DmEnrollmentSvc", `
"dmwappushservice",				"DoSvc",					"DPS",					"EFS", `
<# WiFi-Direct #> 				"FDSConMgrSvc", `
"FileSyncHelper", 				"GraphicsPerfSvc",			"HgClientService", `
"igccservice",					"Intel(R) Platform License Manager Service", `
"Intel(R) TPM Provisioning Service",						"IntelArcControlService", `
"InventorySvc",					"ipfsvc",					"iphlpsvc",				"IpOverUsbSvc", `
"LMS",							"LVUVC64",					"McpManagementService", "MEIx64",`
"Microsoft-Windows-WindowsToGo-StartupOptions",				"MSQuic", 				"MSQuicPrev", `
"NaturalAuthentication",		"NcbService", `
"NdisCap", 						"NdisTapi",					"Ndiswan",				"Ndiswanlegacy",`
"Ndu", 							"NetTcpPortSharing",		"OneSyncSvc", `
"P9Rdr",						"P9RdrService", 			"PcaSvc",				"PerfHost", `
"PIEServiceNew",				"PimIndexMaintenanceSvc", 	"pla",					"PolicyAgent", `
"QWAVE",						"QWAVEdrv",					"R0AquaComputerService","Raddrvv3", `
"RasAgileVpn",					"RasGRE",					"RasL2TP",				"RasMan", `
"RasPPPOE",						"RasSSTP", `
"ReFS",							"refsdedupsvc",				"ReFSv1",`
"RpcLocator", 					"RServer3", `
"RTTEAMPT640",					"RTVLANPT640", `
"SCardSvr",						"ScDeviceEnum", 			"SCPolicySvc", `
"SecurityHealthService",		"SEMgrSvc", `
"SENS",							"Sense",					"SensorDataService", 	"SensorService",
"SensrSvc",`
"SgrmAgent", 					"SharedAccess",				"SharedAccess\ShellHWDetection", `
"ssh-agent", 					"SstpSvc", 		`
"StarFlb", 						"StarNVMeoF", 				"StarWindNVMeoF", `
"StarWindService",`
"StiSvc", 						"SysMain", 					"tapisrv", `
"Tcpip6",						"TCPIP6TUNNEL", `
"TokenBroker",					"TrkWks",					"tzautoupdate",			"UALSVC", `
"UdkUserSvc",					"UGatherer",				"UGTHRSVC",				"UnistoreSvc", `
"UserDataSvc",					"UsoSvc",					"WaaSMedicSvc", 		"WacomPen",`
"WalletService",				"WarpJITSvc",				"WbioSrvc",				"wcncsvc", `
"WdiServiceHost", 				"WdiSystemHost", `
<# Terminal Server #> 			"WDSServer", 				"WEPHOSTSVC", 			"WFDSConMgrSvc", `
"WiaRpc", 						"Windefend",				"WlanSvc", `
<# MSFT Account sign in helper "3" is needed by office #>	"wlidsvc",				"workfolderssvc", `
"WPDBusEnum",					"wscsvc", 					"WSearch",				"WSearchIdxPi"
$Manuals  =   "ALG","AppXSvc","BITS","Brother XP spl Service", `
			  <# Both needed by Office #> "ClickToRunSvc","ClipSVC", `
			  "CredentialEnrollmentManagerUserSvc", `
			  <# webcam will not work without this at 3 #> "FrameServer","FrameServerMonitor",`
			  "GSCx64","IntelGFXFWupdateTool","KeyIso","LicenseManager","MEIx64", `
			  "MouseWithoutBordersSvc", `
			  "mpsdrv","mpssvc","mpssvc\Enum","MSiSCSI","OneDrive Updater Service","OO DiskImage", `
			  "RtNdPt640","rtu57cx22x64","rtucx21x64","rtump64x64", `
			  <# Windows licensing, needed by Office #> "sppsvc","sshd", `
			  <# Move the update orchastrator service to manual #> "UsoSvc", `
			  "WdmCompanionFilter","Wecsvc","wuauserv","ZTDNS"
			  
$Automatics = "BthA2dp","BthAvctpSvc","BthMini", `
			  <# Capability Access Manager, must leave on for webcam to work #> "camsvc", `
			  "cbdhsvc","cdfs","CDPSvc","CDPUserSvc","cdrom","CscService","DeviceAssociationBrokerSvc","IntelGNA","LLTD","RemoteAccess","RemoteRegistry","rt25cx21","SSDPSRV", `
			  <# HyperV Cluster disk sharing driver #> "svhdxflt", `
			  "WinHttpAutoProxySvc","WinMgmt","WinRM","WMIRegistrationService"
			  
$Boots 	  =   <# Attempt to avoid VHD BOOT INITIALIZATION ERROR #> "FSDepends","FSDepends\Parameters", `
			  "mpio","seclogon"

$ToDelete =   "AJRouter", `
			  "AMD External Events Utility","amdi2c","amdgpio2","amdkmdap","amdPPM","amdsata","amdsbs","amdwps","AMDXE",`
			  "amdxata",`
			  "AsusUpdateCheck", `
			  <# Eldos #> "cbfs6", `
			  <# Various Intel #> "cplspcon","DiagTrack","DSAService","DSAUpdateService","dptftcs", `
			  "edgeupdate","edgeupdatem", "EventLog\Application\edgeupdate","EventLog\Application\edgeupdatem","EventLog\System\Microsoft Edge Etw", `
			  "EntAppSvc","GameInputSvc","HWiNFO_202", `
			  <# Store Install Service #> "InstallService", `
			  <# Killer Services #> "Killer Analytics Service","KillerSmartphoneSleepService","KAPSService","KfeCoSvc","KNDBWM",`
			  "lfsvc","MapsBroker", `
			  <# NUIBI #> "MDA_NTDRV","MicrosoftEdgeElevationService","NgcCtnrSvc","NgcSvc","NPSMSvc", `
			  "NVDisplay.ContainerLocalSystem","NVWMI","nvlddmkm", `
			  "PenService","PPTPMiniport","PushToInstall","pvscsi","RetailDemo", `
			  "RRstMwService","RstMwService", `
			  "rspSanity","SCVMMAgent","SgrmBroker","TPM","wercplsupport","WerSvc","WinRing0_1_2_0","WMPNetworkSvc", `
			  "Wms","WmsRepair","WmsVolFilter","WmsWlFltr", `
			  "WpnService","WpnUserService", `
			  "xbgm","XblAuthManager","XblGameSave","XboxNetApiSvc","XboxGipSvc", `
			  "wanarpv6"

$WPPs1 	  =   "ACPI","acpiex","AzureAttestService","bindflt", `
			  "BthHFEnum","BthLEEnum","BTHPORT","BTHUSB","Microsoft_Bluetooth_AvrcpTransport", `
			  "mouclass","mouhid", `
			  "OneDrive Updater Service","OneSyncSvc", `
			  "PimIndexMaintenanceSvc","pla","PolicyAgent","PrintWorkflowUserSvc","QWAVEdrv","R0AquaComputerService","RemoteAccess","RemoteRegistry", `
			  "seclogon","SharedAccess\Epoch","slpd", `
			  "SysMain","UdkUserSvc","UnistoreSvc","USBXHCI\Parameters\Wdf","W32Time\Config","WDSServer\Providers\WDSPXE",`
			  "wuauserv",`
			  <# Scanner service #> "StiSvc"

$WPPs2 	  =   "BthA2dp","BthA2dp","BthAvctpSvc","BthMini","pci","WbioSrvc","WinRM","ZTDNS"
		  
$Flags 	  =   "BcastDVRUserService","BluetoothUserService","CaptureService","cbdhsvc", `
			  <# Connected Devices Platform Service #> "CDPSvc","CDPUserSvc", `
			  "CloudBackupRestoreSvc","ConsentUxUserSvc","CredentialEnrollmentManagerUserSvc","DeviceAssociationBrokerSvc","DevicePickerUserSvc","DevicesFlowUserSvc","PimIndexMaintenanceSvc","PrintWorkflowUserSvc","UdkUserSvc","UnistoreSvc","UserDataSvc","OneSyncSvc","P9RdrService"

Start-ThreadJob { 
	$Key = "HKLM:\SYSTEM\CurrentControlSet\Services\"
	ForEach ( $Stop in $ToStop) { 
		Start-ThreadJob { 
			Get-Service -Name $Stop   	 | Stop-Service | Set-Service -StartupType Disabled		
			SP -Path $Key+$Stop	   -Name "Start" -Value 4 -Type DWord		
		}
	}
	ForEach ( $Manual in $Manuals) { 
		Start-ThreadJob { 
			Get-Service -Name $Manual 	 | Stop-Service | Set-Service -StartupType Manual		
<#			SP $Key+$Manual    -Name "Start" -Value 3 -Type DWord #>
		}
	} 
	ForEach ( $Automatic in $Automatics ) { 
		Start-ThreadJob { 
			Get-Service -Name $Automatic | Set-Service -StartupType Automatic		
<#			SP $Key+$Automatic -Name "Start" -Value 2 -Type DWord #>	
		}                                                      
	}                                                          
	ForEach ( $Boot in $Boots ) {                              
		Start-ThreadJob {         
			Get-Service -Name $Boot 	 | Set-Service -StartupType Boot		
<#			SP $Key+$Boot	   -Name "Start" -Value 0 -Type DWord #>
		}
	} 											  
	ForEach ( $Delete in $ToDeletes ) { 
		Start-ThreadJob { 
			RP $Key+$Delete -Recurse -EA 0 | Out-Null
		}
	}
	ForEach ( $WPP in $WPPs1 ) {  
		Start-ThreadJob {
			RP $Key+$WPP+"\Parameters" -Name "WppRecorder_TraceGuid" -Recurse -EA 0 | Out-Null 
		}
	} 
	ForEach ( $WPP in $WPPs2 ) { 
		Start-ThreadJob { 
			RP $Key+$WPP -Name "WppRecorder_TraceGuid"  -Recurse -EA 0 | Out-Null
		}
	} 									
	ForEach ( $Flag in $Flags ) { 
		Start-ThreadJob { 
			SP $Key+$Flag -Name "UserServiceFlags" -Value 0 -Type DWord 
		}
	} 
} -Name "Services"
##	
#
# Adding individual keys and values
#  
Start-ThreadJob { 

	$Key = "HKLM:\SYSTEM\CurrentControlSet\Services\"
	
	SP $Key+"\debugregsvc\Parameters" 				-Name "DebugState" 						-Value 1 	  -Type DWord
	SP $Key+"\Dmadmin\Parameters" 					-Name "EnableDynamicConversionFor1394" 	-Value 0 	  -Type DWord
	SP $Key+"\NetBT\Parameters" 					-Name "EnableLMHOSTS" 					-Value 1 	  -Type DWord
#			  
	SP $Key+"\FSDepends\Parameters" 				-Name "VirtualDiskExpandOnMount" 		-Value 4 	  -Type DWord
	SP $Key+"\FsDepends\Parameters\AccessControl"	-Name "ISOMountAllowNormalUser" 		-Value 1 	  -Type DWord 
	
	SP $Key+"\rtucx21x64" 							-Name "DisplayName" 					-Value "@rtucx21x64.inf,%rtuniccx22x64.Service.DispName%;Realtek USB FE/1GbE/2.5GbE/5GbE NIC Family NetAdapterCx 2.2 64-bit Driver"
	SP $Key+"\rtump64x64" 							-Name "DisplayName" 					-Value "@oem23.inf,%rtunicmp64x64.Service.DispName%;Realtek USB FE/1GbE/2.5GbE/5GbE/10GbE NIC Family Miniport 6.4 64-bit Driver"
	SP $Key+"\RTTEAMPT640" 							-Name "DisplayName" 					-Value "Realtek Teaming Protocol Driver (NDIS 6.40)" 
	SP $Key+"\RTVLANPT640" 							-Name "DisplayName" 					-Value "Realtek Vlan Protocol Driver (NDIS 6.40)"
				
	SP $Key+"\SharedAccess\Epoch" 					-Name "Epoch"							-Value 158 	  -Type DWord
	SP $Key+"\slpd"  								-Name "AutorunsDisabled" 				-Value 2 	  -Type Dword
#
	SP $Key+"\svhdxflt" 							-Name "SupportedFeatures" 				-Value 3 	  -Type Dword
	SP $Key+"\svhdxflt\Instances" 					-Name "DefaultInstance" 				-Value "svhdxflt"
	SP $Key+"\svhdxflt\Instances\svhdxflt" 			-Name "Altitude" 						-Value 135100 -Type DWord
	SP $Key+"\svhdxflt\Instances\svhdxflt"			-Name "Flags" 							-Value 0 	  -Type DWord
	SP $Key+"\svhdxflt\Parameters" 					-Name "AutoAttachOnNonCSVVolumes" 		-Value 1 	  -Type DWord 
#	
	SP $Key+"\USBXHCI\Parameters\Wdf" 				-Name "NoExtraBufferRoom" 				-Value 1 	  -Type Dword
<#	SP $Key+"\UCPD​"-Name "Start" -Value 4 -Type Dword #>
	SP $Key+"\VSS\Settings" 						-Name "MaxShadowCopies" 				-Value 10	  -Type Dword
	SP $Key+"\W32Time\Config" 						-Name "MaxPollInterval" 				-Value 6  	  -Type Dword
	SP $Key+"\W32Time\Parameters" 					-Name "Type"						  	-Value "NoSync"
	SP $Key+"\WbioSrvc\Parameters" 					-Name  "ServiceDllUnloadOnStop" 		-Value 1 	  -Type Dword
	SP $Key+"\WDSServer\Providers\WDSPXE" 			-Name  "UseDHCPPorts" 					-Value 0 	  -Type Dword 
	SP $Key+"\atapi\Parameters" 					-Name "EnableBigLba" 					-Value 0 	  -Type Dword `
} -Name "Services One-Off" #End ThreadJob 
#
## 
# And Keys with multiple values
#
# Brother Printer
$RegKey = 	 "HKLM:\SYSTEM\CurrentControlSet\Services\Brother XP spl Service"
$RegValues = @{ "DisplayName"="BrSplService";"ErrorControl"="1 -Type DWord";"Group"="SpoolerGroup"; `
				"ImagePath"="([Byte[]](x43,0x00,0x3a,0x00,0x5c,0x00,0x57,0x00,0x69,0x00,0x6e, `
				0x00,0x64,0x00,0x6f,0x00,0x77,0x00,0x73,0x00,0x5c,0x00,0x73,0x00,0x79,0x00,0x73, `
				0x00,0x74,0x00,0x65,0x00,0x6d,0x00,0x33,0x00,0x32,0x00,0x5c,0x00,0x62,0x00,0x72, `
				0x00,0x73,0x00,0x76,0x00,0x63,0x00,0x30,0x00,0x31,0x00,0x61,0x00,0x2e,0x00,0x65, `
				0x00,0x78,0x00,0x65,0x00,0x00,0x00))";`
			 "ObjectName"="LocalSystem";"Tag"="3 -Type DWord";"Type"="11 -Type DWord";"WOW64"="332 -Type DWord" }

Start-Threadjob {
	ForEach ( $Val in $RegValues.Keys ) {
		SP -Path $RegKey -Name $Val -Value $Val.Value
	}
} -Name "Brother Printer"
#
# Caching offline files
$RegKey = "HKLM:\SYSTEM\CurrentControlSet\Services\CscService"
$RegValues = @{ "CachingEnabled"="1 -Type DWord";"CacheLocation"="\\??\\D:\\Program Files\\CSC";`
				"MigrationParameters"="1 -Type DWord";"OnlineCachingLatencyThreshold"="2000 -Type DWord";"PeerCachingLatencyThreshold"="5 -Type DWord" }

Start-Threadjob {
	ForEach ( $Val in $RegValues.Keys) {
		SP -Path $RegKey -Name $Val -Value $Val.Value
	}
} -Name "Offline files"

$RegKey 	= "HKLM:\SYSTEM\CurrentControlSet\Services\CSC\Parameters"
$RegValues 	= @{"CacheLocation"="\\??\\D:\\Program Files\\CSC";"CachingEnabled"="1 -Type DWord";`
				"MigrationParameters"="1 -Type DWord"}
Start-Threadjob {
	ForEach ( $Val in $RegValues.Keys) {
		SP -Path $RegKey -Name $Val -Value $Val.Value
	}
} -Name "CSC"
#
#
# Dedup Partial settings.   The rest are in a file called ddpsvc.reg 
$RegKey		= "HKLM:\SYSTEM\CurrentControlSet\Services\ddpsvc\Settings"
$RegValues 	= "High","Low"
Start-Threadjob {
	ForEach ( $Val in $RegValues ) {
			SP -Path $RegKey -Name "SvcTelemetryLastLoggedTime$ValPart" -Value 0 -Type DWord
	}
} -Name "ddpsvc"
#
# DirectX 
$RegKey 	= "HKLM:\System\CurrentControlSet\Services\DXGKrnl"
$RegValues 	= "Monitor","MonitorRefresh"
Start-Threadjob {
	ForEach ( $Val in $RegValues ) {
			SP -Path $RegKey -Name "$ValLatencyTolerance" -Value 1 -Type DWord
			}
} -Name "DXGKrnl"
#
#  Keyboard
$RegKey 	= "HKLM:\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters"
$RegValues 	= "WppRecorder_UseTimeStamp","KeyboardDataQueueSize"
Start-Threadjob { 
	ForEach ( $Val in $RegValues ) {
		SP -Path $RegKey -Name $Val -Value 60 -Type DWord
	}
}  -Name "Keyboard 1"
#
$RegKey 	= "HKLM:\System\CurrentControlSet\Services\kbdhid\Parameters"
$RegValues 	= "CrashOnCtrlScroll","WppRecorder_UseTimeStamp"
Start-Threadjob {
	ForEach ( $Val in $RegValues ) {
		SP -Path $RegKey -Name $Val -Value 0 -Type DWord
	}
}  -Name "Keyboard 2"
#
$RegKey 	= "HKLM:\System\CurrentControlSet\Services\mouhid\Parameters"
$RegValues 	= @{"ThreadPriority"="31";"TreatAbsolutePointerAsAbsolute"="1"; `
				"TreatAbsoluteAsRelative"="0"}
Start-Threadjob {
	ForEach ( $Val in $RegValues ) {
		SP -Path $RegKey -Name $Val.Key -Value $Val.Value -Type DWord
	}
}  -Name "Keyboard and Mouse"
#
$RegKey = "HKLM:\System\CurrentControlSet\Services\mpio\Parameters"
$RegValues = @{
	"DefaultConfigOutputFile"=
	<# Equals to %SystemRoot%\System32\MPIO_Configuration.log #>`
	"([Byte[]](0x25,0x00,0x53,0x00,0x79,0x00,0x73,0x00,0x74,0x00,0x65,0x00,0x6d,0x00,0x52,0x00, `
			  0x6f,0x00,0x6f,0x00,0x74,0x00,0x25,0x00,0x5c,0x00,0x53,0x00,0x79,0x00,0x73,0x00,`
			  0x74,0x00,0x65,0x00,0x6d,0x00,0x33,0x00,0x32,0x00,0x5c,0x00,0x4d,0x00,0x50,0x00,`
			  0x49,0x00,0x4f,0x00,0x5f,0x00,0x43,0x00,0x6f,0x00,0x6e,0x00,0x66,0x00,0x69,0x00,`
			  0x67,0x00,0x75,0x00,0x72,0x00,0x61,0x00,0x74,0x00,0x69,0x00,0x6f,0x00,0x6e,0x00,`
			  0x2e,0x00,0x6c,0x00,0x6f,0x00,0x67,0x00,0x00,0x00))";
	"DiskPathCheckDisabled"="-Value 0 -Type DWord";
	"DiskPathCheckInterval"="10 -Type DWord";
	"FlushHealthInterval"="90 -Type DWord";
	"GatherHealthStats"="1 -Type DWord";
	"PathRecoveryInterval"="28 -Type DWord";
	"PathVerificationPeriod"="30 -Type DWord";
	"PathVerifyEnabled"="0 -Type DWord";
	"PDORemovePeriod"="14 -Type DWord";
	"RetryCount"="3 -Type DWord";
	"RetryInterval"="1 -Type DWord";
	"UseCustomPathRecoveryInterval"="1 -Type DWord" }
Start-Threadjob { 
	ForEach ( $Val in $RegValues.Keys ) { 
		SP -Path $RegKey -Name $Val -Value $Val.Value
	}
} -Name "MPIO"
	 
$RegKey = "HKLM:\System\CurrentControlSet\Services\msdsm\Parameters"
$RegValues = @{ 
<# "MSFT2005iSCSIBusType_0x9";"Vendor 8Product 16";"MSFT2011SASBusType_0xA" 0xA is my addition #>`
	"DsmSupportedDeviceList"="([Byte[]](0x56,0x00,0x65,0x00,0x6e,0x00,0x64,0x00,0x6f,0x00,0x72,0x00,0x20,0x00,0x38,0x00,0x50,`
			  0x00,0x72,0x00,0x6f,0x00,0x64,0x00,0x75,0x00,0x63,0x00,0x74,0x00,0x20,0x00,0x20,0x00,`
			  0x20,0x00,0x20,0x00,0x20,0x00,0x20,0x00,0x20,0x00,0x31,0x00,0x36,0x00,0x00,0x00,0x4d,`
			  0x00,0x53,0x00,0x46,0x00,0x54,0x00,0x32,0x00,0x30,0x00,0x30,0x00,0x35,0x00,0x69,0x00,`
			  0x53,0x00,0x43,0x00,0x53,0x00,0x49,0x00,0x42,0x00,0x75,0x00,0x73,0x00,0x54,0x00,0x79,`
			  0x00,0x70,0x00,0x65,0x00,0x5f,0x00,0x30,0x00,0x78,0x00,0x39,0x00,0x00,0x00,0x4d,0x00,`
			  0x53,0x00,0x46,0x00,0x54,0x00,0x32,0x00,0x30,0x00,0x31,0x00,0x31,0x00,0x53,0x00,0x41,`
			  0x00,0x53,0x00,0x42,0x00,0x75,0x00,0x73,0x00,0x54,0x00,0x79,0x00,0x70,0x00,0x65,0x00,`
			  0x5f,0x00,0x30,0x00,0x78,0x00,0x41,0x00,0x00,0x00,0x00,0x00))";`
	"DsmDisableStatistics" = "1 -Type DWord"}
Start-Threadjob {
	ForEach ( $Val in $RegValues.Keys ) {
		SP -Path $RegKey -Name $Val -Value $Val.Value
	}
} -Name "MSDSM Params"	
#
$RegKey 	= "HKLM:\System\CurrentControlSet\Services\msdsm\Parameters\DsmSupportedDeviceList"
$RegValues 	= @{"1"="MSFT2005iSCSIBusType_0x9";"2"="Vendor 8Product 16";"3"="MSFT2011SASBusType_0xA"}
Start-Threadjob {
	ForEach ( $Val in $RegValues.Keys ) {
		SP -Path $RegKey -Name $Val -Value $Val.Value
	}
} -Name "MSDSM"
#
$RegKey 	= "HKLM:\System\CurrentControlSet\Services\partmgr\Parameters"
$RegValues 	= <# The below was "2", I changed to "1". 
			   # 1=Mounts all available storage devices. This is the default value
			   # 2= Mounts all storage devices except those on a shared 
			   # bus (Examples of shared buses are: SCSI; iSCSI; Fiber; and SAS.)
			   # 3=Does not mount storage devices. 									#> 
			  "SanPolicy","StorageSupportedFeatures"
Start-Threadjob {
	ForEach ( $Val in $RegValues ) {
		SP -Path $RegKey -Name $Val -Value 1 -Type DWord
	}
} -Name "PartMgr"

$RegKey 	= "HKLM:\System\CurrentControlSet\Services\pci\Parameters"
$RegValues 	= "ASPMOptOut","DmaRemappingCompatible","PnpAsyncNewDevices"
Start-Threadjob {
	ForEach ( $Val in $RegValues ) {
		SP -Path $RegKey -Name $Val -Value 1 -Type DWord 
	}
} -Name "PCI"

$RegKeys 	= "PerfDisk","PerfNet","PerfOS"
$RegValues	= "Collect Supports Metadata","Collect Timeout"
Start-Threadjob { 
	ForEach ($Key in $RegKeys) { 
		Start-ThreadJob {
			ForEach ( $Val in $RegValues ) { 
				$Path = "HKLM:\System\CurrentControlSet\Services\"+$RegKey+"\Performance"
				SP -Path -Name $Val -Value 0 -Type DWord 
			}
		}
	}
} -Name "Perf group"
#
# A group of Realtek Network Protocols and their current settings
$RegKeys 	= "RTTEAMPT640","RTVLANPT640"
Start-ThreadJob { 
	ForEach ( $Key in $RegKeys ) {
		SP -Path "HKLM:\SYSTEM\CurrentControlSet\Services\"+$RegKey -Name "AutorunsDisabled" -Value 3 -Type Dword
	}
} -Name "Realteks"

$RegKey 	= "HKLM:\System\CurrentControlSet\Services\svhdxflt\Instances\svhdxflt"
$RegValues 	= @{"Altitude"="135100";"Flags"="0 -Type DWord"}
Start-Threadjob {
	ForEach ( $Val in $RegValues.Keys) {
		SP -Path $RegKey -Name $Val -Value $Val.Value
	}
} -Name "Cluster sVHDxFlt"
# 
##
#  Dell Services
Start-Threadjob {
	$Base	=	"HKLM:\SYSTEM\CurrentControlSet\Services\"
	$Services =	"Dell Client Management","DellInstrumentation","DellTechHub",`
				<# Dell Data Vault#> 	 "DDVCollectorSvcApi","DDVDataCollector","DDVRulesProcessor",`
				<# Dell Pair Function #> "DellPairDriver","DellPairService"
		ForEach ( $Service in $Services) {
			$Stop = $Base+$Service
			SP -Path $Stop -Name $Service -Value 4 -Type DWord
		}
} -Name "Dell Services"
#
##
#






<#
Historical Values`
#  One Drive `
#  [HKLM:System\CurrentControlSet\Services\`
#  "Start"="4 -Type DWord" "
#
# [-HKLM:\SYSTEM\CurrentControlSet\Services\phdskmnt]
#>
