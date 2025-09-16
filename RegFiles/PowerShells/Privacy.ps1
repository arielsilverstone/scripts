##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="Privacy"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "17FEB25" | Out-Null
} -Name "$Name.ps1 Changed" 
#
#
## Aliases
NAL	SIP		Set-ItemProperty
NAL WO		Write-Output

#
## Global Vars
#
$PathC	= "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion"
$PathN	= "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
#
##  Disable sharing information with unpaired devices
#
Start-ThreadJob {
	$DAG = "\DeviceAccess\Global\"
	$PathD = $PathC+$DAG+"LooselyCoupled"
	SIP -Path $PathD		"Type" 				"LooselyCoupled"
	SIP -Path $PathD		"Value" 			"Deny"
	SIP -Path $PathD		"InitialAppValue" 	"Unspecified"
	
	ForEach ($Key in (Get-ChildItem ($PathC+"\DeviceAccess\Global"))) {
		if ($Key.PSChildName -EQ "LooselyCoupled") {
			continue
		}
		$PathE = $PathC+$DAG+$Key.PSChildName
		SIP -Path ($PathE) 	"Type" 				"InterfaceClass"
		SIP -Path ($PathE) 	"Value" 			"Deny"
		SIP -Path ($PathE) 	"InitialAppValue" 	"Unspecified"
	}
} -Name "Unpaired"
#
##						Defender
#
Start-ThreadJob { 
	$PathX	= "HKLM:\SOFTWARE\Microsoft\Windows Defender\Spynet"
	Write-Output "Disable submission of Windows Defender findings (w/ elevated privileges)"
	Takeown-Registry($PathX)
	SIP -Path 		 $PathX 	"SpyNetReporting"		0     
	SIP -Path 	 	 $PathX 	"SubmitSamplesConsent"	0
} -Name "SpyNet"
#
##
#
Start-ThreadJob {
	$PathX 	= "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager"
	SIP -Path $PathX "WifiSenseCredShared"		0 		
	SIP -Path $PathX "WifiSenseOpen"			0 		
#	
	$PathY	= $PathX+"\config"
	SIP -Path $PathY "WifiSenseOpen"			0 		
	SIP -Path $PathY "WiFISenseAllowed"			0 		
	SIP -Path $PathY "AutoConnectAllowedOEM"	0 		
	SIP -Path $PathY "WifiSenseCredShared"		0 	
#
	$PathZ	= $PathX+"\features"
	SIP -Path $PathZ "WifiSenseOpen"			0 		
	SIP -Path $PathZ "AutoConnectAllowedOEM"	0 		
	SIP -Path $PathZ "FeatureStates"			381 
} -Name "WiFiSense"
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





#
##								Location
#
## Locaton aware printing (changes default based on connected network)
# 
New-FolderForced -Path "HKCU:\Printers\Defaults"
SIP -Path "HKCU:\Printers\Defaults" "NetID" "{00000000-0000-0000-0000-000000000000}"

Write-Output "Disable background access of default apps"
ForEach ($Key in (Get-ChildItem $PathC+"\BackgroundAccessApplications")) {
    SIP -Path ($PathC+"\BackgroundAccessApplications\" + $Key.PSChildName) "Disabled" 1
}
#
##								Location
#
New-FolderForced -Path $PathN+"\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
SIP 			 -Path $PathN+"\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" 0









#
##
# AMD
$Root 	= "HKLM:\SOFTWARE\AMD\"
Sajb {
	<# CN #>
	$PathX = $Root+"CN"
	Start-ThreadJob { 	
		$Pairs = @{ "mobile_runtime_component_NA"="False";"HideDisplayColor"="false";`
					"StageTen_hide"="false";`
					"InstallDir"="C:\\Program Files\\AMD\\CNext\\CNext\\";"Benchmark"="false";`
					"UnloadDelay"="300 -Type DWord";"MemorySizeTreshold"="200 -Type DWord";"color_mapping_runtime_component_NA"="true";"CollectGIData"="0 -Type DWord";"InitDelay"="60 -Type DWord";"OpenVRDir"=- }
		ForEach ($Pair in $Pairs) {
			SP -Path $PathX -Name $Pair.Name -Value $Pair.Value 
		}
	} -Name "CN"

	<# ANALYTICS #>
	$PathY = $RootX+"\ANALYTICS"
	SP -Path $PathY -Name "AUEPUrl" 	-Value "d"
	<# Performance #>
	$PathZ = $RootX+"\Performance"
		<# 2a8 #>
	Start-ThreadJob { 	
		$Values = { "RecordFrametime","RecordHeavyStutterRate","RecordRenderAPI","RecordGPUVRAM",`
					"RecordSystemRAM","RecordGPUHotspotTemperature_0","RecordGPUHotspotTemperature_1","RecordGPUHotspotTemperature_2","RecordGPUVRAM_0","RecordGPUVRAM_1",`
					"RecordGPUVRAM_2","RecordCPUFrequency","RecordCPUCurrentEDC","RecordCPUCurrentTDC" }
		ForEach ($Name in $Values) {
			SP -Path $PathZ -Name $Name	-Value 680 -Type DWord 
		}
	}
		<# 2a9 #>
	Start-ThreadJob { 	
		$Values = { "RecordFPS","RecordAvgFrametime","RecordPercent99FPS","RecordEffectiveFPS",`
					"RecordRenderLatency","RecordMicroStutterRate","RecordSystemLag","RecordGPUUsage_0","RecordGPUUsage_1","RecordGPUUsage_2","RecordGPUSystemClocks_0","RecordGPUSystemClocks_1","RecordGPUSystemClocks_2","RecordGPUMemoryClocks_0","RecordGPUMemoryClocks_1","RecordGPUMemoryClocks_2","RecordGPUTemperature_0","RecordGPUTemperature_1","RecordGPUTemperature_2","RecordGPUFanSpeed_0","RecordGPUFanSpeed_1","RecordGPUFanSpeed_2","RecordGPUPower_0","RecordGPUPower_1","RecordGPUPower_2","RecordGPUBoardPower_0","RecordGPUBoardPower_1","RecordGPUBoardPower_2","RecordGPUVoltage_0","RecordGPUVoltage_1","RecordGPUVoltage_2","RecordCPUUsage","RecordCPUVoltage","RecordCPUPower","RecordCPUTemperature","RecordSmartShift","RecordGPUMemoryTemperature_0","RecordGPUMemoryTemperature_1","RecordGPUMemoryTemperature_2" }
		ForEach ($Name in $Values) {
			SP -Path $PathZ -Name $Name -Value 681 -Type DWord 
		}
	}
		<# 1 #>
	Start-ThreadJob { 	
		$Values = { "HideMetricswhileRecordingMetrics","MetricsUIStyle","ShowMetricsOnDVRRecording" }	
		ForEach ($Name in $Values) {
			SP -Path $PathZ -Name $Name -Value 1   -Type DWord 
		}	
	}

	SP -Path $PathZ -Name "RecordOutputPath" -Value ""
	SP -Path $PathZ -Name "RecordIntervalFL" -Value 25  -Type DWord 
	SP -Path $PathZ -Name "RecordIntervalHw" -Value 256 -Type DWord 
	
	<# DVR#>	
	RP -Path $Root+"DVR" -Recurse -EA 0 | Out-Null
}
#
## DiagTrak	
# 	
$MSFT22 = "CodeIntegrityAggregator","CompatAggregator","PwdlessAggregator","UpdateHeartbeatScan",`
		  "UpdatePolicyScenarioReliabilityAggregator","UpdateReboot","UusCoreHealthAggregator","UusFailover"
$MSFT23	= "HeartBeats","Aggregation\Instrumentation","AsimovUploader","ProviderControl","Tenants",`
		  "TelemetryNamespaces"
$MSFT24 = "CostDeferred_0","CriticalPersistence_0","Normal_0","Realtime_0"
$MSFT25 = "GameBar","GameChatOverlay","GameChatOverlayMessageSource"
Start-ThreadJob {
	ForEach ($MSFT in $MSFT22) {
		Start-ThreadJob {
			$Path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\Aggregation\`
					 ControlGroups\"+$MSFT
			DEL -Path $Path -Recurse
		} 
	} 
	ForEach ($MSFT in $MSFT23) {
		Start-ThreadJob {
			$Path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\"+$MSFT 
			DEL -Path $Path -Recurse
		}
	}
	ForEach ($MSFT in $MSFT24) { 
		Start-ThreadJob {
			$Path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventMonitors\Microsoft.Windows.Sentinels."+$MSFT 
			DEL -Path $Path -Recurse
		} 
	}
	ForEach ($MSFT in $MSFT25) { 
		Start-ThreadJob {
			$Path = "HKLM:\Software\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.UI."+$MSFT 
			DEL -Path $Path -Recurse | Out-Null
		} -Name "Games"
	} 
	$PathX = "HKLM:\Software\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.`
			  PresenceServer.Internal.PresenceWriter"
	If (Test-Path $PathX) { DEL -Path $PathX -Recurse }
} -Name "DiagTrack"
#
## Consent Store - Location
# 
$MSFT29 = "HKCU","HKLM"
Start-ThreadJob {
	ForEach ($MSFT in $MSFT29) {
	$Path = $MSFT+":\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\Location"
		Start-ThreadJob {
			SP -Path $Path -Name "Value" 			 -Value "Deny" 
			SP -Path $Path -Name "ShowGlobalPrompts" -Value 1 -Type DWord 
		}  
	} 
} -Name "Location"
#
$Values = "Location","LocationScripting","Sensors","WindowsLocationProvider" 
$Path = "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors"
Start-ThreadJob {
	ForEach ($Value in $Values) {
		$Name = "Disable"+$Value
		SP -Path $Path -Name $Name -Value 1 -Type DWord 
	}
} -Name "Location 2"
#
## Privacy and Tel
# 
$MSFT61 = "HKLM","HKCU"
$MSFT62 = "AcceptedPrivacyPolicy","HarvestContacts","InsightsEnabled","LMDataLoggerEnabled"
$MSFT63 = "AllowInputPersonalization"
$MSFT64 = "RestrictImplicitInkCollection","RestrictImplicitTextCollection"
#
## Disable smart screen filter's ability to check URLs Windows Store apps use
#
Start-Job {
	ForEach ($MSFT in $MSFT61) { 
		$Path2  = $MSFT+":\Software\Microsoft\Personalization\Settings"
		$Path3  = $MSFT+":\Software\Policies\Microsoft\Windows\Personalization"
		$Path4  = $MSFT+":\Software\Microsoft\Windows\CurrentVersion\AppHost"
		Start-ThreadJob { 
			SP -Path $Path2 	-Name "AcceptedPrivacyPolicy" 		-Value 0 -Type DWord 
			SP -Path $Path4 	-Name "EnableWebContentEvaluation" 	-Value 0 -Type DWord
			{ $Path,$Path4 } |   ForEach {
				SP -Path $_ 	-Name "PreventOverride" 			-Value 1 -Type DWord
										 }
		} -Name "AppHost"
		Start-ThreadJob {
			$Path5 = $MSFT+":\Software\Microsoft\InputPersonalization	rainedDataStore"
			ForEach ($MSFTx1 in $MSFT62) { 
				SP -Path $Path5	-Name $MSFTx1 						-Value 0 -Type DWord 
			}				
		}
		Start-ThreadJob {
			ForEach ($MSFTx2 in $MSFT63) { 
				{ $Path,$Path4 } | ForEach {
					SP -Path $_ -Name $MSFTx2 -Value 0 -Type DWord
				}
			}
		}
		Start-ThreadJob {
			ForEach ($MSFTx3 in $MSFT64) { 
				{ $Path2,$Path3 } | ForEach {
					SP -Path $_ -Name $MSFTx3 -Value 1 -Type DWord
				}

			} 
		} -Name "Input Pers 2"
	} 
} -Name "Some Privacy"
#
##
#

#
## More Privacy
# 
$OOBEs  = "DisablePrivacyExperience","DisableVoice","HideEULAPage","HideOEMRegistrationScreen",`
		  "HideOnlineAccountScreens","HideWirelessSetupInOOBE"
$OOBEs2 = "EnableCortanaVoice","PrivacyConsentStatus"
$Paths  = "HKLM:\Software\Microsoft\Windows\CurrentVersion\OOBE", `
		  "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OOBE"
Start-ThreadJob {
	ForEach ($Path in $Paths) {	
		Start-ThreadJob -ArgumentList @($Path,$OOBEs) {
			Param ($Path,$OOBEs)
			ForEach ($OOBE in $OOBEs) { 
				SP -Path $Path -Name $OOBE -Value 1 -Type DWord 
			}
		} 
		Start-ThreadJob -ArgumentList @($Path,$OOBEs2) { 
			Param ($Path,$OOBEs2)
			ForEach ($OOBE in $OOBEs2) {
				SP -Path $Path -Name $OOBE -Value 0 -Type DWord
				SP -Path $Path -Name "ProtectYourPC" -Value 3 -Type DWord
				SP -Path $Path -Name "NetworkLocation" -Value "Home" 
			}
		}
	}
} -Name "OOBEs"
#
##
#
$WiFi2 	  = "\Config"
$WiFi3 	  = "\Features" 
$Shortcut = "WifFiSense"
$Values1  = "CredShared","Open"
$Values2  = "Allowed","CredShared","Open"
Start-Job -ArgumentList @($WiFi2,$WiFi3,$Shortcut,$Values1,$Values2) {
	Param ($WiFi2,$WiFi3,$Shortcut,$Values1,$Values2)
	$Path  = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager"
	$Path2 = $Path+$WiFi2
	$Path3 = $Path+$WiFi3	
	ForEach ($Value in $Values1) {
		Start-ThreadJob -ArgumentList @($Path,$Path3,$Shortcut,$Value) {
			Param ($Path,$Path3,$Shortcut,$Value)
			$Name = $Shortcut+$Value
			SP -Path $Path  -Name $Name -Value 0 -Type DWord
			SP -Path $Path3 -Name $Name -Value 0 -Type DWord 
		}
	}
	ForEach ($Value in $Values2) {
		Start-ThreadJob -ArgumentList @($Path,$Path2,$Shortcut,$Value) {
			Param ($Path,$Path2,$Shortcut,$Value)
			$Name = $Shortcut+$Value
			SP -Path $Path2 -Name $Name -Value 0 -Type DWord 
		}
	}
	SP -Path $Path2 -Name "AutoConnectAllowedOEM" -Value 0 	 -Type DWord 
	SP -Path $Path3 -Name "FeatureStates" 		  -Value 381 -Type DWord 
} -Name "WiFi Creds"
#
## Antisocials
#
$Banes 	= "ABCH","ABCH-SKYPE","FACEBOOK"
$Path 	= "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\SocialNetworks\"
Start-ThreadJob {
	ForEach ($Bane in $Banes) {
		$PathX = $Path+$Bane
		SP -Path $PathX -Name "OptInStatus" -Value 0 -Type DWord 
	}
} -Name "Antisocials"
#
## Telemetry
# 
$Keys = "AllowTelemetry","InkingAndTypingPersonalization",`
		"TailoredExperiencesWithDiagnosticDataEnabled"
$Path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\CPSS\DevicePolicy\"
Start-ThreadJob {
	ForEach ($Key in $Keys) {
		$PathX = $Path+$Key 
		SP -Path $PathX -Name "DefaultValue" -Value 0 -Type DWord 
	}
} -Name "Telemetry 1"
#
Start-ThreadJob {
	$Path2 = "HKLM:\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\"
	$PathX = $Path2+"AllowTelemetry"
	$PathY = $Path2+"UserLocationOverridePrivacySetting"
	$Path3 = "HKLM:\Software\Microsoft\PolicyManager\Default\System\AllowTelemetry"
	If (Test-Path -Path $PathX) { SP -Path $PathX -Name "Value" -Value 0 }
	If (Test-Path -Path $PathY) { SP -Path $PathY -Name "Value" -Value 0 }
	If (Test-Path -Path $Path3) { SP -Path $Path3 -Name "Value" -Value 0 }
} -Name "Telemetry 2"
#
## WindowsAI and Copilot
# 
$Hives = "HKCU","HKLM"
$Path = ":\Software\Policies\Microsoft\Windows\"
Start-ThreadJob {
	ForEach ($Hive in $Hives) {
		Start-ThreadJob -ArgumentList @($Hive,$Path) {
			Param ($Hive,$Path)
			$PathX  = $Hive+$Path
			$PathAI = $PathX+"WindowsAI"
			$PathCo = $PathX+"WindowsCopilot"
			SP -Path $PathAI -Name "AllowRecallEnablement" -Value 0 -Type DWord 
			SP -Path $PathAI -Name "DisableAIDataAnalysis" -Value 1 -Type DWord 
			SP -Path $PathCo -Name "TurnOffWindowsCopilot" -Value 1 -Type DWord 
		}
	}		
} -Name "AI+CoPilot"
#
## Don't Let apps on other devices open messages and apps on this device - Shared Experiences settings
# 
$Authz = "CDPSession","NearShare","RomeSDK"
$Path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\CDP"
Start-ThreadJob {
	ForEach ($Auth in $Authz) {
		SP -Path $Path -Name $Auth+"UserAuthzPolicy" -Value 0 -Type DWord
	} 
} -Name "CDP"
#
## Consent Store
#
$Roots  = "HKCU","HKLM"
$Path   = ":\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\"
$Allows = "wifiData","wiFiDirect","bluetooth","humanInterfaceDevice","microphone","serialCommunication","usb",`
		  "webcam"
$Denys  = "activity","appDiagnostics","appointments","bluetoothSync","broadFileSystemAccess","cellularData",`
		  "chat","contacts","documentsLibrary","downloadsFolder","email","gazeInput",`
		  "graphicsCaptureProgrammatic","graphicsCaptureWithoutBorder","graphicsCaptureWithoutBorder\NonPackaged","location","location\NonPackaged","musicLibrary","phoneCall","phoneCallHistory","picturesLibrary","radios","sensors.custom","userAccountInformation","userDataTasks","userNotificationListener","videosLibrary"
Start-ThreadJob {
	ForEach ($Root in $Roots) {
		ForEach ($Item in $Allows) {
			SP -Path $Root+$Path+$Item -Name "Value" -Value "Allow"
		}
		ForEach ($Item in $Denys) {
			SP -Path $Root+$Path+$Item -Name "Value" -Value "Deny"	
		}
		SP -Path $Path -Name $Auth+"UserAuthzPolicy" -Value 0 -Type DWord
	} 
} -Name "Consent Store"		
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


#
##
#
		  
#
##
#

#
## AMD telemetry 
#
$Roots  = "HKLM","HKCU"
$MSFT65 = "AMD\CN","AMD\CN\Performance","AMD\DVR","AMD\MOBILE","AUEP","AMDLOG",`
		  "ATI Technologies\Log","CN","WOW6432Node\ATI Technologies\Log"
Start-ThreadJob {
	ForEach ($Root in $Roots ) { 
		$Path = $Root+":\Software\AMD\"
		Start-ThreadJob -ArgumentList @($MSFT65) {
			Param ($MSFT65)
			ForEach ($MSFT in $MSFT65) { 
				$PathX = $Path+$MSFT
				DEL -Path $PathX -Recurse 
				SP  -Path $PathX -Name "DVRTrackingEnabledBuild" -Value 0 -Type DWord
			}				
		}
	}
} -Name "AMD Shit"
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


#
##
#





