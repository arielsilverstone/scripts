##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="Search"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "15FEB25" | Out-Null
} -Name "$Name.ps1 Changed" 
#
#
##
#
Write-Output 			 "Defuse Windows search settings"
Set-WindowsSearchSetting -EnableWebResultsSetting $false
#
## For all below
#  
$PathV = "HKLM:\Software\Microsoft\Windows\CurrentVersion"
$PathS = $PathV+"\Explorer\Search"
#
## SearchPlatform
#
$Path = $PathS+"\Platform\Preferences" 				#  SearchPlatform
$Set1 = "DisableAutoNavigateURL","DisableAutoResolveEmailAddrs","DisableResultsInNewWindow",`
		"DisableTabbedBrowsing","EditSavedSearch"
$Set2 = "BreadCrumbBarSearchDefault","IEAddressBarSearchDefault"
Start-ThreadJob {
	ForEach ($Item in $Set1) {
		SP -Path $Path -Name $Item -Value 0 -Type DWord
	}
	ForEach ($Item in $Set2) {
		SP -Path $Path -Name $Run  -Value ""
	} 	
} -Name "Search 1"
#
# Search 2
$Path  = $PathS+"\Preferences"
$Zeros = "EnableNaturalQuerySyntax","WholeFileSystem","SystemFolders","ArchivedFiles"
$Ones  = "AutoWildCard"
Start-ThreadJob {
	ForEach ($Item in $Zeros) {
		SP -Path $Path -Name $Item -Value 0 -Type DWord
	}
	ForEach ($Item in $Ones) {
		SP -Path $Path -Name $Item -Value  -Type DWord
	}
	$PathX = $PathS+"\PrimaryProperties\UnindexedLocations"
	<# Make sure that clicking inside a folder goes to the filename and not search box #>
	SP -Path $PathX -Name "SearchOnly" -Value 0 -Type DWord
} -Name "Search 2"
#
# Search 3
$Roots 	= "HKCU","HKLM"
$Paths  = ":\Software\Policies\Microsoft\Windows\Windows Search",`
		  ":\Software\Microsoft\Windows\CurrentVersion\Search"
$Zeros 	= "AllowCloudSearch","AllowCortana","AllowCortanaAboveLock","AllowCortanaInAAD",`
		  "AllowCortanaInAADPathOOBE","AllowIndexingEncryptedStoresOrItems","AllowSearchToUseLocation","AlwaysUseAutoLangDetection","AnyAboveLockAppsActive","AutoIndexSharedFolders",`
		  "BackgroundAppGlobalToggle","BingSearchEnabled","CanCortanaBeEnabled","ConnectedSearchUseWeb","ConnectedSearchUseWebOverMeteredConnections","CortanaCapabilities","CortanaConsent","CortanaInAmbientMode","DeviceHistoryEnabled","EnableIndexingDelegateMailboxes",`
		  "HasAboveLockTips","IndexUserProfilesRoot","IsWindowsHelloActive","SearchboxTaskbarMode",`
		  "EnableDynamicContentInWSB"`				# Disable Search highlights
		  
$Ones   = "CortanaIsReplaced"	  
Start-ThreadJob {
	ForEach ($Root in $Roots) {
		ForEach ($Path in $Paths) {
			$PathX = $Root+$Path
			ForEach ($Item in $Zeros) {
				SP -Path $PathX -Name $Item -Value 0 -Type DWord
			}
			ForEach ($Item in $Ones) {
				SP -Path $PathX -Name $Item -Value 1 -Type DWord
			}
		}
	}
} -Name "Search 3"
# 
# Search 4
$Path	= $PathS+"\Settings"
$Zeros	= "IsAADCloudSearchEnabled","IsDeviceSearchHistoryEnabled","IsDynamicSearchBoxEnabled",`
		  "IsMSACloudSearchEnabled","SafeSearchMode" 
		  
$Ones	= "AllowUsingDiacritics","CortanaIsReplaced","DisableAutomaticRemovableDriveIndexing",`
		  "DisableCheckUrlWPSystem","DisableEDPVolumeProtection","DisableFindMyFilesExperimentOverride","DisableRemovableDriveIndexing","DisableSearch","DisableSoftReset","DisableWebSearch","FindMyFilesExperimentOverride","PreventIndex","PreventIndexingPublicFolders","PreventIndexOnBattery" 
		  
$Threes	= "ConnectedSearchPrivacy","ConnectedSearchSafeSearch" 

Start-ThreadJob {
	ForEach ($Item in $Zeros) {
		SP -Path $Path -Name $Item -Value 0 -Type DWord
	}
	ForEach ($Item in $Ones) {
		SP -Path $Path -Name $Item -Value 1 -Type DWord
	}
	ForEach ($Item in $Threes) {
		SP -Path $Path -Name $Item -Value 3 -Type DWord
	}
} -Name "Search 4"
#
##
# Search 5 - Just create leaves
$Path 	= "HKLM:\Software\Microsoft\PolicyManager\Default\Experience\"
$Leaves = "AllowCortana","AllowSyncMySettings"
Start-ThreadJob {
	ForEach ($Item in $Leaves) {
		NI -Path $Path -Name $Item
	}
} -Name "Search 5"
#
##
# Search 6
$PathX = $PathV								# \CurrentVersion
	$PathA = $PathX+"Explorer\Search\PrimaryProperties\UnindexedLocations"
	$PathB = $PathX+"ConnectedSearch"
$PathY = "HKLM:\Software\Microsoft\PolicyManager\Default\Search\DisableSearch"
$PathZ = "HKLM:\Software\Policies\Microsoft\SearchCompanion"
$PathW = "HKLM:\SOFTWARE\Microsoft\Windows Search"
	$PathC = $PathW+"\Gather\Windows\SystemIndex"
	$PathD = $PathW+"\Gathering Manager"
	$PathE = $PathW+"\SemanticIndexer"	
	$PathF = $PathW+"\CurrentPolicies"
	
Start-ThreadJob {
	SP -Path $PathY -Name "Value"								-Value 1 -Type DWord
	SP -Path $PathZ -Name "DisableContentFileUpdates"			-Value 1 -Type DWord
			
	SP -Path $PathA -Name "SearchOnly"	 						-Value 1 -Type DWord
	SP -Path $PathB -Name "ConnectedSearchUseWeb"				-Value 0 -Type DWord
		
	SP -Path $PathC -Name "LogDisabled"							-Value 1 -Type DWord
	SP -Path $PathC -Name "StreamLogsDirectory"					-Value "D:\Temp"
			
	SP -Path $PathD -Name "TempPath"							-Value "D:\Temp"
	SP -Path $PathE -Name "EnableSemanticIndexing"				-Value 0 -Type DWord
	
	SP -Path $PathF -Name "AllowIndexingEncryptedStoresOrItems"	-Value 0 -Type DWord
	SP -Path $PathF -Name "DisableRemovableDriveIndexing"		-Value 1 -Type DWord
	SP -Path $PathF -Name "PreventIndexingPublicFolders"		-Value 1 -Type DWord
} -Name "Search 6"

#
##
#


<#


# Search 7
$Pairs = @{}
$Path = 
$Zeros =
$Ones = 
Start-ThreadJob {
	ForEach ($Item in $Zeros) {
		SP -Path $Path -Name $Item -Value 0 -Type DWord
	}
	ForEach ($Item in $Ones) {
		SP -Path $Path -Name $Item -Value 1 -Type DWord
	}
} -Name "Search 7"
#>
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
