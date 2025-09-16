##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="Edge"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "17FEB25" | Out-Null
} -Name "$Name.ps1 Changed"
#
#
##  Edge
#
$Roots	  = "HKCU","HKLM:"
$DEL1 	  = "Edge","Edge Beta","Edge Dev","Edge Update","Internet Explorer","MediaPlayer", `
			"Windows Mail"
$CurrentVersion = "MicrosoftEdge","UnInstall\Microsoft Edge","GameDVR","GameInput","GameInstaller",`
				  "XboxGaming","GameUX","WINEVT\Publishers\{3a5f2396-5c8f-4f1f-9b67-6cca6c990e61}"
				  
$xEdge 	  = "Edge","Edge Update","EdgeWebView"

$Policies = "AutofillCreditCardEnabled","BackgroundModeEnabled","MetricsReportingEnabled", `
			"PersonalizationReportingEnabled","PreventSmartScreenPromptOverride","PreventSmartScreenPromptOverrideForFiles","SendSiteInfoToImproveServices","SmartScreenDnsRequestsEnabled","SmartScreenEnabled","SmartScreenPuaEnabled","StartupBoostEnabled","UserFeedbackAllowed","SmartScreenForTrustedDownloadsEnabled"
Start-ThreadJob { 
	ForEach ($DEL in $DEL1) { 
		$PathX =  "HKCU:\Software\Microsoft\"
		$PathY =  "HKLM:\Software\Microsoft\"
		$PathZ -  "HKLM:\Software\WOW6432Node\Microsoft\MSN Apps"		
		DEL -Path $PathX+$DEL 			-Recurse
		DEL -Path $PathY+$DEL 			-Recurse
		DEL -Path $PathY+"MSN Apps" 	-Recurse
		DEL -Path $PathZ	 			-Recurse 
	}
} -Name "Del-1"	

Start-ThreadJob { 
	ForEach ($DEL in $CurrentVersion) { 
		ForEach ($Root in $Roots) { 
			$Path = ":\Software\Microsoft\Windows\CurrentVersion\"
			DEL -Path $Root+$Path+$DEL 	-Recurse
		}
	}
} -Name "Delete from CurrentVersion\MSFT"
#
Start-ThreadJob { 
	ForEach ($DEL in $xEdge) { 
		$Path = "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\UnInstall\Microsoft"
		DEL -Path $Path+$DEL 			-Recurse
	} 
} -Name "Delete from Uninstall" 	
#
Start-ThreadJob { 
	ForEach ($Policy in $Policies) {
		$Path = "HKLM:\Software\Policies\Microsoft\Edge"
		SP -Path $Path -Name $Policy 	-Value 0 STW
	} 
} -Name "Pol\Edge"
#
##
#

#
## StartUp
#
Start-ThreadJob {
	$Path	 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\"
	$PathR	 = $Path+"Run"
	$PathR32 = $Path+"Run32"
	$PathSF	 = $Path+"StartupFolder"
	$Z		 = 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

	SP -Path $PathR 	-Name "AMDNoiseSuppression" -Value`
			([Byte[]](0x03,0x00,0x00,0x00,0x60,0x34,0xEF,0xE8,0xDD,0x6E,0xDB,0x010)	-Type Binary 
	SP -Path $PathR 	-Name "RtkAudUService"  	-Value	([Byte[]](0x02,$Z)		-Type Binary 
	SP -Path $PathR 	-Name "Reflect UI"  		-Value	([Byte[]](0x02,$Z)		-Type Binary 
	SP -Path $PathR 	-Name "AzureArcSetup"  		-Value 	([Byte[]](0x00,$Z)		-Type Binary
	SP -Path $PathR 	-Name "SecurityHealth"  	-Value`
			([Byte[]](0x05,0x00,0x00,0x00,0xcd,0x0a,0x1d,0x9e,0xd1,0xde,0xd9,0x01) 	-Type Binary 	
	SP -Path $PathR 	-Name "OODITRAY.EXE" 		-Value "-" 
							   
	SP -Path $PathR32 	-Name "Intel® Arc™ Control" -Value "-"
	
	SP -Path $PathSF 	-Name "WinMFT Cleanup.lnk"  -Value "-"
} -Name "Startups"
#
## Policy Manager
#
Start-ThreadJob {
	$Root  = "HKLM:\Software\Microsoft\PolicyManager\Default\"
	SP -Path $Root+"Browser\AllowSmartScreen" 	-Name "Value"  -Value 0 STW
	
	$Smart = $Root+"SmartScreen\EnableSmartScreenInShell"
	SP -Path $Smart	-Name "Behavior"  				-Value 73760 STW
	SP -Path $Smart	-Name "GPBlockingRegKeyPath"  	-Value "Software\Policies\Microsoft\Windows\System"
	SP -Path $Smart	-Name "GPBlockingRegValueName"  -Value "EnableSmartScreen"
	SP -Path $Smart	-Name "Value"  					-Value 0 STW
	
<#	
	SP -Path $Root+"" 	-Name ""  -Value ""
	SP -Path $Root+"" 	-Name ""  -Value ""
	SP -Path $Root+"" 	-Name ""  -Value ""
	SP -Path $Root+"" 	-Name ""  -Value ""
	SP -Path $Root+"" 	-Name ""  -Value ""
	SP -Path $Root+"" 	-Name ""  -Value ""
	SP -Path $Root+"" 	-Name ""  -Value ""
#>




#
## Smart Screen
#
;Hide-Privacy and Settings Notifications
[HKCU:\Software\Microsoft\Windows\CurrentVersion\Notanager\Default\Browser\AllowSmartScreenows.immersiveControlpanel_cw5n1h2txyewy!Microsoft.Windows.immersiveControlpanel]
"Enabled"	0
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
