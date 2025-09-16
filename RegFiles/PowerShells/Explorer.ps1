##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="Explorer"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "11FEB25" | Out-Null
} -Name "$Name.ps1 Changed" 
#
##
#										Explorer\Delegates
#
$MSFT11 = "MusicSearch","CollectionResult","Search.Appointment","Search.Contact","Search.Message", `
		  "Search.Note","Search.ReadMail","Search.UnreadMail"
$MSFT12 = "AudioDescription","Blind Access","HighContrast","Keyboard Preference","MouseKeys","On", `
		  "ShowSounds","SlateLaunch","SoundSentry","StickyKeys","TimeOut","ToggleKeys"
Start-Job { 
	ForEach ($MSFT in $MSFT11) {
		Start-ThreadJob -InputObject $MSFT {
			$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\`
					 ExecuteTypeDelegates\"+$Input 
			DEL -Path $Path -Recurse 
		}
	}
} -Name "ExecuteTypeDelegates"
#
##										Explorer\NameSpace
#
$Base	 =  "HKLM:\Software"
$Middles =  "\","\Wow6432Node\"
$End	 =  "Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\"
$End2 	 =  "Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\"
$End3	 =  "Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\`
			 NameSpace\DelegateFolders\"
$End4	 =  "Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_41040327\"
$Ends	 =  $End,$End2,$End3,$End4
$MSFT13  =  "{F82DF8F7-8B9F-442E-A48C-818EA735FF9B}", <# Pen & Touch CPL  	#> 
			"{80F3F1D5-FECA-45F3-BC32-752C152E456E}", <# Tablet CPL	      	#> 
			"{D17D1D6D-CC3F-4815-8FE3-607E7D5D10B3}", <# Text to Speech   	#> 
			"{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}", <# Desktop Folder   	#> 
			"{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}", <# Documents folder 	#> 
			"(D3162B92-9365-467A-956B-92703ACA08AF}", <# Documents folder 	#> 
			"{088E3905-0323-4B02-9826-5D99428E115F}", <# Downloads folder 	#> 
			"{374DE290-123F-4565-9164-39C4925E467B}", <# Downloads folder 	#> 
			"{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}", <# 3D Objects folder	#> 
			"{1CF1260C-4DD0-4ebb-811F-33C572699FDE}", <# Music folder     	#> 
			"{3DFDF296-DBEC-4FB4-81D1-6A3438BCF4DE}", <# Music folder     	#> 
			"{24AD3AD4-A569-4530-98E1-AB02F9417AA8}", <# Pictures folder  	#> 
			"{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}", <# Pictures folder  	#> 
			"{A0953C92-50DC-43bf-BE83-3742FED03C9C}", <# Videos folder    	#> 
			"{F86FA3AB-70D2-4FC7-9C99-FCBF05467F3A}", <# Videos folder    	#> 
			"{9113A02D-00A3-46B9-BC5F-9C04DADDD5D7}", <# Enhanced Storage 	#> 
			"{3134ef9c-6b18-4996-ad04-ed5912e00eb5}", <# Favorites folder 	#> 
			"{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}"  <# Gallery folder   	#> 
Start-ThreadJob { 
	ForEach ($Middle in $Middles) {
		ForEach ($End in $Ends) {
			ForEach ($MSFT in $MSFT13) 	{
				$Path = $Base+$Middle+$End+$Msft
				DEL -Path $Path -Recurse -EA 0  | Out-Null
			}
		}
	}			
} -Name "Explorer and Control Panel Namespaces"
#
##
# Folders
$MSFT29  = "HKCU","HKLM"
$Key	 = ":\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\"
$MSFT30  = "AutoCheckSelect","DesktopProcess","Hidden\SHOWALL","HideDrivesWithNoMedia",`
		   "HideMergeConflicts","PersistBrowsers","SharingWizardOn","ShowDriveLetters",`
		   "ShowFullPath","ShowInfoTip","ShowStatusBar","ShowSyncProviderNotifications",`
		   "UseCompactMode"
Start-ThreadJob { 
	ForEach ($Root in $Roots) {
		ForEach ($MSFT in $MSFT30) { 
			$Path = $Root+$Key+$MSFT
			SP -Path $Path -Name "CheckedValue" -Value 1 -Type DWord 
		}
	} 
} -Name "Folders"
#
$MSFT31 = "ShowNetwork","ShowAllFolders","ShowLibraries"
$MSFT32 = "Hidden\NOHIDDEN","HideFileExt"
$MSFT33 = "SharingWizardOn","ShowFullPath","ShowPreviewHandlers","SuperHidden",`
		  "SuperHidden\Policy\SuperHidden"
$Path 	= "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\"
$Path1  = $Path+"NavPane\"
$Path2  = $Path+"Folder\"
SaJb {
	$Name = "CheckedValue"
	Start-ThreadJob -ArgumentList @($MSFT31,$Path1) {
		ForEach ($MSFT in $MSFT31) {
			$Path = $Path1+$MSFT
			SP -Path $Path -Name $Name 		-Value 1 -Type DWord 
		}
	}
	Start-ThreadJob -ArgumentList @($MSFT32,$Path1) {
		ForEach ($MSFT in $MSFT32) {
			$Path = $Path1+$MSFT
			SP -Path $Path -Name $Name 		-Value 2 -Type DWord 
		}
	}
	Start-ThreadJob -ArgumentList @($MSFT33,$Path2) { 
		ForEach ($MSFT in $MSFT33) {
			$Path = $Path2+$MSFT
			SP -Path $Path -Name $Name 		-Value 0 -Type DWord 			
			SP -Path $Path -Name "Un"+$Name -Value 1 -Type DWord 
		} 
	}
	Start-ThreadJob {
		$PathX	= ("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\`
					Folder\SuperHidden\Policy\DontShowSuperHidden")		
		If (Test-Path ($PathX) {
			DEL -Path $PathX -Recurse 
		}
	} -Name "SuperHidden"
} -Name "More Explorer Folders"
#
##
# Visual Effects - Animate Windows when minimizing and maximizing
$MSFT35	=	"AnimateMinMax","ComboBoxAnimation","ControlAnimations","TooltipAnimation", `
			"SelectionFade","MenuAnimation"
$MSFT36 = 	"DropShadow","DragFullWindows","FontSmoothing","ListBoxSmoothScrolling", `
			"ListviewAlphaSelect","ListviewShadow","TaskbarAnimations"
$Key	= 	"HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\"
# Change to dword:00000001 to enable the appropriate option
Start-ThreadJob { 
	$DV	= "DefaultValue"
	$DA	= "DefaultApplied"
	ForEach ($MSFT in $MSFT35) {
		$Path = $Key+$MSFT
		SP 	-Path $Path  -Name $DV -Value 0 -Type DWord
		SP 	-Path $Path  -Name $DA -Value 0 -Type DWord 
	}
	ForEach ($MSFT in $MSFT36) {
		$Path = $Key+$MSFT
		SP 	-Path $Path  -Name $DV -Value 1 -Type DWord  
	}
	$PathX = $Key+"CursorShadow"
	SP 		-Path $PathX -Name $DA -Value 0 -Type DWord 
} -Name "VisualEffects 1,2,3"	
# 
## FolderDescriptions
#
$MSFT37 = 	"{0ddd015d-b06c-45d5-8c4c-f59713854639}", <# My Pictures		#>
			"{31C0DD25-9439-4F12-BF41-7FF4EDA38722}", <# 3D Objects folder	#>
			"{35286a68-3c57-41a1-bbb1-0eae73d76c95}", <# Local Videos		#>
			"{7d83ee9b-2244-4e70-b1f5-5393042af1e4}", <# Downloads		 	#>
			"{a0c69a99-21c8-4671-8703-7934162fcf1d}", <# Music			 	#>
			"{f42ee2d3-909f-4907-8871-4c22fc0bf756}"  <# Documents		 	#>
$MSFT38 = 	"{A302545D-DEFF-464b-ABE8-61C8648D939B}", <# Folder Redirect 	#>
			"{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"  <# Desktop Folder  	#>
$Path 	= 	"HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\"
$PB		=	"\PropertyBag"
# Hide Certain Folders
Start-ThreadJob { 
	ForEach ($MSFT in $MSFT37) { 
		$PathY = $Path+$MSFT+$PB
		SP -Path $PathY -Name "ThisPCPolicy" -Value "Hide" 
	}
} -Name "ThisPC"
	ForEach ($MSFT in $MSFT38) {
		$PathX = $Path+$MSFT+$PB
		SP -Path $PathX -Name "NoCustomize"  -Value 0 -Type DWord 
	} 
} -Name "FolderDescriptions"
#
# Toasts
$MSFT39 = ".htm",".html",".svg",".webp",".xht",".xhtml",".xml","ftp","http","https", `
		  "microsoft-edge","microsoft-edge-holographic","ms-xbl-3d8b930f"
$MSFT47 = "AppX3xxs313wwkfjhythsb8q46xdsq8d2cvv_microsoft-edge-holographic", `
		  "AppX7rm9drdg8sk7vqndwj3sdjw11x96jc0y_microsoft-edge","AppX90nv6nhay5n6a98fnetv7tpk64pp35es_https","AppXq0fevzme2pys62n3e0fbqa7peapykr8v_http","MSEdgeMHT_.mht","MSEdgeMHT_.mhtml","MSEdgePDF_.pdf"
$Path 	= "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"
Start-ThreadJob {
	ForEach ($MSFT in $MSFT39) {
		DEL -Path $Path 	-Name "MSEdgeHTM_"+$MSFT
	}
	ForEach ($MSFT in $MSFT47) {
		SP  -Path $Path  	-Name 			   $MSFT -Value "-" 
	}			
} -Name "Application Toasts"
#
##
# Icons
$Icons = "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}", <# Desktop - 183			#>		
		 "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}", <# Videos - Orig 189 	#>	
		 "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}", <# Pictures - Orig 113 	#>	
		 "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}", <# Music - Orig 108 		#> 	
		 "{d3162b92-9365-467a-956b-92703aca08af}", <# Documents - Orig 112 	#>	
		 "{088e3905-0323-4b02-9826-5d99428e115f)"  <# Downloads - Orig 184 	#> 
$Value = ([byte[]](0x25,0x00,0x53,0x00,0x79,0x00,0x73,0x00,0x74,0x00,0x65,0x00,0x6d,0x00,0x52, `
				   0x00,0x6f,0x00,0x6f,0x00,0x74,0x00,0x25,0x00,0x5c,0x00,0x73,0x00,0x79,0x00,0x73,0x00, `
				   0x74,0x00,0x65,0x00,0x6d,0x00,0x33,0x00,0x32,0x00,0x5c,0x00,0x69,0x00,0x6d,0x00,0x61, `
				   0x00,0x67,0x00,0x65,0x00,0x72,0x00,0x65,0x00,0x73,0x00,0x2e,0x00,0x64,0x00,0x6c,0x00, `
				   0x6c,0x00,0x2c,0x00,0x2d,0x00,0x31,0x00,0x38,0x00,0x33,0x00,0x00,0x00))
Start-ThreadJob { 
	ForEach ($Icon in $Icons) {
		$Path = "HKCR:\SOFTWARE\Classes\CLSID\"+$Icon+"\DefaultIcon"
		SP -Path $Path -Name "Default" -Value $Value	-Type Binary
	} 
} -Name "Icons"
#
##
# StartUp Values
$StartUps0 		= "AzureArcSetup","OODITRAY.EXE","SecurityHealth","OneDrive"
$StartUps2		= "Reflect UI","RtkAudUService"
$StartUps32 	= "Intel$([char]0x00AE) Arc$([char]0x2122) Control","SecurityHealth"
$StartUpFolders = "WinMFT Cleanup.lnk","SecurityHealth"
$Path 			= "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\"
$Value			= ",0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))"
$Value2			= "([byte[]](0x02"+$Value 
$Value0			= "([byte[]](0x00"+$Value
Start-ThreadJob {
	$PathRun    = $Path+"Run"
	ForEach ($Startup in $Startups0) {
		SP -Path $PathRun -Name $Startup -Value $Value0
	}
	ForEach ($Startup in $Startups2) {
		SP -Path $PathRun -Name $Startup -Value $Value2
	}
	ForEach ($Startup in $Startups32) {
		$PathX = $PathRun+"32"
		SP -Path $PathX   -Name $Startup -Value $Value0
	}
	ForEach ($Startup in $StartupsFolders) {
		$PathY = $Path+"StartupFolder"
		SP -Path $PathY   -Name $Startup -Value $Value0
	}
} -Name "Approved Runs"
#
##
# Software\Policies
$Roots   = 	"HKCU","HKLM"
$Key     = 	":\Software\Policies\Microsoft\Windows\Explorer"
$Deletes = 	<# Stop having a target for the "More Information" link when a program blocked by policy #> 
			"admininfourl","TaskbarNoMultimon"
$Blahs   = 	"**del.StartPinAppsWhenInstalled"
$Zeros   =  "DisableContextMenusInStart",
			"DisableThumbsDBOnNetworkFolders",
		    <# Disabling heap termination on corruption allows apps to function w/o terminating
			   Explorer #> 
		    "NoHeapTerminationOnCorruption",
			"AddSearchInternetLinkInStartMenu",
			"DesktopAppsFirstInAppsView",
			"DisableControlCenter",
			"DisableNotificationCenter",
			"EnableLegacyBalloonNotifications",
			"HideTaskViewButton",
			"NoRemoteDestinations",
			"NoStartMenuHomegroup",
			"ShowHibernateOption",
			"ShowLockOption",
			"ShowSleepOption",
			"TaskbarGlomming",
			"TryHarderPinnedOpenSearch" 
$Ones 	 =  "DisableGraphRecentItems",		<#  Turn off insights, recent, favs and recommended files #> 
			"DisableIndexedLibraryExperience",
		    "DisableMotWOnInsecurePathCopy",		<#  Disable "Mark of the Web" on files  #>  
			"DisableNotificationCenter",
			"DisableSearchBoxSuggestions",
			"DisableSearchHistory",
		    "EnableShellShortcutIconRemotePath",	<#  allow use of unc path in shortcuts  #> 			   
		    <#  When opening files w/unknown ext, don't ask 'Look for an app in the Store?' #> "NoUseStoreOpenWith",
		    "NoWindowMinimizingShortcuts",			<#  disable aeroshake 					#> 
		    "ClearTilesOnExit",
			"DisableGlobalSearchOnAppsView",
			"GoToDesktopOnSignIn",
			"HidePeopleBar",
			"HideRecentlyAddedApps",
			"HideRecommendedPersonalizedSites",
			"HideRecommendedSection",
			"HideSCAHealth",
			"HideSCAMeetNow",
			"NoBalloonFeatureAdvertisements",
			"NoDataExecutionPrevention",
			"NoInternetOpenWith",
			"NoNewAppAlert",
			"NoPinningStoreToTaskbar",
			"NoSearchEverywhereLinkInStartMenu",
			"NoSearchInternetInStartMenu",
			"NoSearchInternetTryHarderButton",
			"NoSMHelp",
			"NoSMMyPictures",
			"NoStartMenuDownloads",
			"NoStartMenuMyGames",
			"NoStartMenuMyMusic",
			"NoStartMenuRecordedTV",
			"NoStartMenuVideos",
			"NoTaskGrouping",
			"StartPinAppsWhenInstalled",
			"ShowRunAsDifferentUserInStart",
			"ShowStartOnDisplayWithForegroundOnWinKey",
			"Turn off user tracking"
$Twos    = "ShowOrHideMostUsedApps","ShowWindowsStoreAppsOnTaskbar" 
$Fours   = "ExplorerRibbonStartsMinimized"
Start-Job {
	ForEach ($Root in $Roots) {
		Start-ThreadJob -ArgumentList @($Root,$Key,$Deletes,$Ones,$Zeros,$Twos,$Fours,$Blahs) {
			Param ($Root,$Key,$Deletes,$Ones,$Zeros,$Twos,$Fours,$Blahs)
			$Path = $Root+$Key
			ForEach ($Item in $Deletes) {
				DEL -Path $Path -Name $Item -Recurse
			}
			ForEach ($Item in $Blahs) {
				SP -Path $Key -Name $Item -Value " "
			}
			ForEach ($Item in $Zeros) {
				SP -Path $Path -Name $Item -Value
			}
			ForEach ($Item in $Ones) {
				SP -Path $Path -Name $Item -Value 1 -Type DWord
			}
			ForEach ($Item in $Twos) {
				SP -Path $Path -Name $Item -Value 2 -Type DWord
			}
			ForEach ($Item in $Fours) {
				SP -Path $Path -Name $Item -Value 4 -Type DWord
			}
		}
	}		
} -Name "Explorer Settings"
#
# ; **********   CurrentVersion \ Policies
$Roots    	 =  "HKCU","HKLM"
$Key		 = 	":\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$Deletes 	 = 	"DisableThumbnails","TaskbarLockAll"
$Zeros	 	 = 	"AllowOnlineTips",
				"ConfirmFileDelete",
				"DisableThumbnailCache",
				"ForceActiveDesktopOn",
				"ForceRunOnStartMenu",
				"GreyMSIAds",
				"HideSCANetwork",
				"HideSCAPower",
				"HideSCAVolume",
				"IsWUHidden",
				"LockTaskbar",
				"NoAutoUpdate",
				"NoChangeStartMenu",
				"NoClose",
				"NoControlPanel",
				"NoDrivesInSendToMenu",
				"NoFolderOptions",
				"NoLowDiskSpaceChecks",
				"NoRecentDocsHistory",
				"NoRecentDocsNetHood",
				"NoSearchProgramsInStartMenu",
				"NoSecurityTab",
				"NoSetTaskbar",
				"NoStartMenuMorePrograms",
				"NoStartMenuPinnedList",
				"NoStartMenuSubFolders",
				"NoTrayContextMenu",
				"NoViewContextMenu",
				"NoViewOnDrive",
				"NoWinkeys",
				"StartMenuFavorites",
				"StartMenuLogOff",
				"Start_ShowHelp",
				"Start_ShowRun",
				"NoTrayItemsDisplay",			<# Make Sure System Tray Shows 			 #> 
				"UseDesktopIniCache"			<# stop the ridic desktop.ini, in theory #> 
$Ones     	 =  "AlwaysShowClassicMenu",
				"DisableIndexedLibraryExperience",
				"DisableSearchBoxSuggestions",
				"DisableSearchHistory",
				"DisallowRun",
				"ForceStartMenuLogOff",
				"HideSCAHealth",
				"HideSCAMeetNow",
				"Intellimenus",
				"LinkResolveIgnoreLinkInfo",
				"NoActiveDesktop",
				"NoActiveDesktopChanges",
				"NoAutorun",
				"NoCDBurning",
				"NoCommonGroups",
				"NoEncryptOnMove",
				"NoFavoritesMenu",
				"NoFind",
				"NoInstrumentation",
				"NoInternetIcon",
				"NoInternetOpenWith",
				"NoMSAppLogo5ChannelNotify",
				"NoOnlinePrintsWizard",
				"NoPreviewPane",
				"NoPublishingWizard",
				"NoReadingPane",
				"NoRecentDocsMenu",
				"NoRemoteRecursiveEvents",
				"NoResolveSearch",
				"NoResolveTrack",
				"NoSearchCommInStartMenu",
				"NoSearchComputerLinkInStartMenu",
				"NoSearchFilesInStartMenu",
				"NoSearchInternetInStartMenu",
				"NoShellSearchButton",
				"NoSimpleNetIDList",
				"NoSimpleStartMenu",
				"NoSMBalloonTip",
				"NoSMConfigurePrograms",
				"NoSMHelp",
				"NoSMMyDocs",
				"NoSMMyPictures",
				"NoStartMenuEjectPC",
				"NoStartMenuMFUprogramsList",
				"NoStartMenuMyGames",
				"NoStartMenuMyMusic",
				"NoTaskGrouping",
				"NoThumbnailCache",
				"NoUserFolderInStartMenu",
				"NoUserNameInStartMenu",
				"NoWebServices",
				"NoWelcomeScreen",
				"RestrictWelcomeCenter",
				"ShowSuperHidden",
				"Start_ShowMyComputer",
				"StartMenuMorePrograms",
				"TaskbarNoNotification",
				"TurnOffSPIAnimations",
				"NoRemoteChangeNotify"					<# Speedup network refersh on file shares #>
$TwoFiftySix = 	"NoDriveTypeAutoRun"
$Other       = 	"hide:appsforwebsites; cortana; cortana-windowssearch; datausage; deviceencryption; `
				 easeofaccess-eyecontrol; easeofaccess-narrator; easeofaccess-speechrecognition; gaming-broadcasting; gaming-gamebar; gaming-gamedvr; gaming-gamemode; gaming-xboxnetworking; holographic-audio; holographic-headset; holographic-management; maps; mobile-devices; network-airplanemode; network-cellular; network-dialup; network-mobilehotspot; network-vpn; network-wificalling; nfctransactions; pen; privacy-automaticfiledownloads; privacy-feedback; privacy-holographic-environment; regionlanguage-chsime-pinyin; regionlanguage-chsime-wubi; regionlanguage-jpnime; regionlanguage-korime; search-moredetails; search-permissions; speech; tabletmode; videoplayback; workplace"
ForEach ($Root in $Roots) {
	$Path = $Root+$Key
	Start-ThreadJob {
		ForEach ($Item in $Deletes) {
			DEL -Path $Path -Name $Item -Recurse
		}
		ForEach ($Item in $Zeros) {
			SP  -Path $Path -Name $Item -Value
		}
		ForEach ($Item in $Ones) {
			SP  -Path $Path -Name $Item -Value 1 	-Type DWord
		}
		ForEach ($Item in $TwoFiftySix) {
			SP  -Path $Path -Name $Item -Value 256 	-Type DWord
		}
	SP -Path $Path -Name "SettingsPageVisibility" -Value $Other
	} -Name "Explorer 2"
	$PathX = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer\StartPinAppsWhenInstalled"
	SP -Path $PathX -Name "**delvals." -Value " " 
}	
#
# Misc. Explorer Policies
Start-ThreadJob {
#HKLM
	$PathA  = "\Software\Microsoft\Windows\CurrentVersion\"
		$PathB = "HKLM:"+$PathA
			$PathC  = $PathB+"Policies\Explorer"
				$PathD	= $PathC+"\Disallow"
					$PathE1 = $PathD+"Cpl"
					$PathE2 = $PathD+"Run"
							
			$PathC2 = $PathB+"Policies\Windows\Sidebar"								
				
			$PathC3 = $PathB+"Explorer"
				$PathD2 = $PathC3+"\AutoplayHandlers"
				$PathD3 = $PathC3+"\FlyoutMenuSettings"
				$PathD6 = $PathC3+"\Ribbon"
				$PathDA = $PathC3+"\Shell Icons"
				$PathDB = $PathC3+"\SharedTaskScheduler"
			
			$PathC5 = $PathB+"ActionCenvter\Quick Actions\All\SystemSettings_Launcher_QuickNote"
# HKCU:		
		$PathB2 = "HKCU:"+$PathA
			$PathC4  = $PathB2+"Explorer"
				$PathD4 = $PathC4+"\Accent"
				$PathD5 = $PathC4+"\CabinetState"
				$PathD7 = $PathC4+"\Wallpapers"
				$PathD9 = $PathC4+"\VisualEffects"
				$PathDC = $PathC4+"\Serialize" 
				
			$PathC6 = $PathB2+"BackgroundAccessApplications"
			$PathC7 = $PathB2+"CuratedTileCollections\Migration"
			$PathC8 = $PathB2+"Themes"
				$PathD8 = $PathC8+"\Personalize"

				
	$Hex1 	= ([byte[]](0x99,0xEB,0xFF,0x00,0x4C,0xC2,0xFF,0x00,0x00,0x91,0xF8,0x00,0x00,0x78,0xD4,`
						0x00,0x00,0x67,0xC0,0x00,0x00,0x3E,0x92,0x00,0x00,0x1A,0x68,0x00,0xF7,0x63,`
						0x0C,0x00))
	$Hex2	= ([byte[]](0x0C,0x00,0x02,0x00,0x2B,0x01,0x00,0x00,0x60,0x00,0x00,0x00))

	SP -Path $PathC2 -Name "TurnOffSidebar"  			 	-Value 1 		  -Type DWord
	SP -Path $PathC2 -Name "TurnOffUserInstalledGadgets" 	-Value 1 		  -Type DWord
#
	SP -Path $PathC5 -Name "Type"							-Value 0 		  -Type DWord
	SP -Path $PathC6 -Name "GlobalUserDisabled"  			-Value 1 		  -Type DWord#
	SP -Path $PathC7 -Name "MigrationPending"  			 	-Value 0 		  -Type DWord
#
	SP -Path $PathD2 -Name "DisableAutoplay"			 	-Value 1 		  -Type DWord
	SP -Path $PathD2 -Name "SearchboxTaskbarMode" 	 		-Value 0 		  -Type DWord
	SP -Path $PathD2 -Name "AllowSearchToUseLocation" 		-Value 0 		  -Type DWord
																			  
	SP -Path $PathD3 -Name "ShowLockOption" 				-Value 0 		  -Type DWord
	SP -Path $PathD3 -Name "ShowSleepOption"				-Value 0 		  -Type DWord	
#
	SP -Path $PathD4 -Name "AccentPalette" 	 				-Value $Hex1	  -Type Binary
	SP -Path $PathD4 -Name "StartColorMenu"  				-Value 4289551881 -Type DWord
	SP -Path $PathD4 -Name "AccentColorMenu" 				-Value 4291196160 -Type DWord
#							                                                  
	SP -Path $PathD5 -Name "FullPath"	    				-Value 1 		  -Type DWord
	SP -Path $PathD5 -Name "FullPathAddress"				-Value 1 		  -Type DWord
	SP -Path $PathD5 -Name "Settings" 						-Value $Hex2	  -Type Binary	
#
	SP -Path $PathD6 -Name "MinimizedStateTabletModeOff"	-Value 0 		  -Type DWord
	SP -Path $PathD7 -Name "BackgroundType"					-Value 0 		  -Type DWord
	SP -Path $PathD9 -Name "VisualFXSetting"				-Value 3		  -Type DWord	
#
	SP -Path $PathD8 -Name "AppsUseLightTheme"				-Value 1		  -Type DWord	
	SP -Path $PathD8 -Name "ColorPrevalence"				-Value 1		  -Type DWord
	SP -Path $PathD8 -Name "EnableTransparency"				-Value 0		  -Type DWord
	SP -Path $PathD8 -Name "SystemUsesLightTheme"			-Value 1		  -Type DWord
#
	SP -Path $PathDA -Name "4"								-Value "%SystemRoot%\system32\imageres.dll,-5100"
	SP -Path $PathDA -Name "77"								-Value "C:\ProgramData\empty.ico"
	SP -Path $PathDA -Name "179"							-Value "C:\ProgramData\empty.ico"
<#	SP -Path $PathDA -Name "29"								-Value "%windir%\System32\Shell32.dll,-50" #>
#
	SP -Path $PathDB -Name "MaxWorkerThreadsPerScheduler"	-Value 255		  -Type DWord
	SP -Path $PathDC -Name "Startupdelayinmsec"				-Value 0		  -Type DWord
#
	SP -Path $PathD8 -Name "SystemUsesLightTheme"			-Value 1		  -Type DWord
#
	SP -Path $PathE1 -Name "1" -Value "Microsoft.IndexingOptions"
#
	SP -Path $PathE2 -Name "1" -Value "skypesetup.exe"
	SP -Path $PathE2 -Name "3" -Value "Groove.exe"
	SP -Path $PathE2 -Name "4" -Value "Teams.exe"
	SP -Path $PathE2 -Name "5" -Value "Software_reporter_tool.exe"
	SP -Path $PathE2 -Name "6" -Value "LicensingUI.exe"
	SP -Path $PathE2 -Name "7" -Value "C:\Windows\System32\Smartscreen.exe"
	SP -Path $PathE2 -Name "8" -Value "nada*.exe"
	<#	SP -Path $PathE2 -Name "2" -Value "Onedrive.exe" #>
} -Name "Explorer 3"
#
##
# CurrentVesion Explorer
$Roots 	 = 	"HKCU","HKLM"
$Key 	 = 	":\Software\Microsoft\Windows\CurrentVersion\Explorer"
$Deletes = 	"EnableAutoTray"			<# Don't show all items in System Tray #>
$Zeros   = 	"ExplorerStartupTraceRecorded","IrisClientRefresh","NoPreviousVersionsPage",`
			"NoSaveSettings","ShowRecent","ShowRecommendations","TelemetrySalt", `		 
			"ShowFrequent"				<# Disable listing recently opened files in "Quick Access" #> 
$Ones 	 = 	"AltTabSettings","AlwaysUnloadDLL","AppReadinessLogonComplete","DesktopProcess", `
			"DisallowCpl","FirstRunTelemetryComplete", `
			"DisableEdgeDesktopShortcutCreation", <# Disable Edge desktop shortcut	  #> 
			"HubMode",	                          <# Hide quick access from Explorer  #> 
			"PostAppInstallTasksCompleted"        <# Simulate tasks done post install #>
$Fours 	 = 	"ShowDriveLettersFirst"
$Hex 	 = 	[byte[]](0x24,0x00,0x00,0x00,0x3f,0xa0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,`
					 0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x13,0x00,00,0x00,0x00,0x00,0x00,`
					 0x00,0x4b,0x00,0x00,0x00)
					   
$OneOffs = 	@("Max Cached Icons"="8192 -Type DWord"; `
			  "Browse For Folder Height"="333 -Type DWord"; `
			  "Browse For Folder Width" ="318 -Type DWord"; `
			  "ShellState"=$Hex+" -Type Binary"; `
			  "Link"="0x0"; `
			  "ShortcutNameTemplate"=""\"%s.lnk\"""; `
			  "SmartScreenEnabled"="Off" `
			  <# allow more than 15 files selected #> 
			  "MultipleInvokePromptMinimum"="768 -Type DWord"
			 )
Start-ThreadJob {
	ForEach ($Root in $Roots) {
		Start-ThreadJob -ArgumentList @($Root,$Key,$Delete,$Ones,$Zeros,$Fours,$OneOffs) {
			Param ($Root,$Key,$Delete,$Ones,$Zeros,$Fours,$OneOffs)
			$Path = $Root+$Key
			ForEach ($Item in $Deletes) {
				DEL -Path $Path -Name $Item -Recurse
			}
			ForEach ($Item in $Zeros) {
				SP -Path $Path -Name $Item -Value 0 -Type DWord
			}
			ForEach ($Item in $Ones) {
				SP -Path $Path -Name $Item -Value 1 -Type DWord
			}
			ForEach ($Item in $Fours) {
				SP -Path $Path -Name $Item -Value 4 -Type DWord
			}
			ForEach ($Item in $OneOffs.Keys) {
				SP -Path $Path -Name $Item -Value $Item.Value
			}
		}
	}	
} -Name "Explorer 4"
#
##
# Explorer Advanced
$Roots   =	"HKCU","HKLM"
$Base    =	":\Software\"
$Middles =	"Microsoft\","Wow6432Node\Microsoft\"
$End     =	"Windows\CurrentVersion\Explorer\Advanced"
$Deletes =	"FullPath"							# Cleanup of fullpath	
$Zeros   =	"DesktopLivePreviewHoverTime",
			"AllowGameDVR",
			"DisablePreviewDesktop",
			"DisableThumbnailCache",
			"DontPrettyPath",
			"EnableBalloonTips",
			"EnableSnapAssistFlyout",
			"EncryptionContextMenu",
			"ExtendedUIHoverTime",
			"NavPaneShowAllCloudStates",
			"NavPaneShowAllFolders",
			"NoThumbnailCache",
			"SharingWizardOn",
			"ShowCortanaButton",
			"ShowCopilotButton",
			"ShowInfoTip",
			"ShowPreviewHandlers",
			"ShowSecondsInSystemClock",
			"ShowSyncProviderNotifications",
			"ShowTypeOverlay",
			"SilentInstalledAppsEnabled",
			"SnapFill",
			"StartShownOnUpgrade",
			"Start_AccountNotifications",
			"Start_SearchFiles",
			"HideIcons",
			"Start_TrackDocs",
			"Start_TrackProgs",
			"StartMenuAdminTools",
			"SuperHidden",
			"TaskbarAnimations",
			"TaskbarFlashing",
			"TaskbarSmallIcons",
			"WebView",
			"HideFileExt",						# Enable show File Extensions 		
			"IconsOnly",                        # allow thumbnails 					
		    "ListviewShadow",                   # No Shadow to Screen Fonts 			
		    "TaskbarAl",                        # Align taskbar to the Left 			
		    "TaskbarDa",                        # Remove Widgets from Taskbar  		
		    "TaskbarMn",                        # Remove "Chat" item from taskbar 	
			"NoNetCrawling", 					# Don't Disable Automatic Search for Network Folders
												# and Printers
			"Start_ShowMyGames",        		# Don't add a Games shortcut to the startmenu 
			"Start_IrisRecommendations",		# Remove "recommendations tips,shortcuts,new apps,and
												# more" in start menu 
			"Start_NotifyNewApps"				# Do not show most used apps, nor show recently opened
												# items in Jump Lists on  Start or Taskbar  				
$Ones    =  "displayIconThumb",
			"DisableNotificationCenter",
			"DisableThumbsDBOnNetworkFolders",
			"DisallowShaking",
			"DontUsePowerShellOnWinX",
			"FolderContentsInfoTip",
			"FullPath",
			"fullPathAddress",
			"HideDrivesWithNoMedia",
			"HideMergeConflicts",
			"JointResize",
			"MapNetDrvBtn",
			"OnboardUnpinCortana",
			"SeparateProcess",					# Launch folder windows in a separate process
			"ServerAdminUI",
			"ShowEncryptCompressedColor",
			"ShowStatusBar",
			"ShowSuperHidden",
			"ShowSystrayDateTimeValueName",
			"ShowTaskViewButton",
			"StartMenuAdminTools",
			"Start_SearchPrograms",
			"useCheckBoxes",
			"UseOLEDTaskbarTransparency",
			"useSharingWizard",
			"AlwaysShowMenus", 					# Always show explorer menus							
		    "AutoCheckSelect",                 	# Allow checkboxes										
		    "Hidden",                          	# Enable show  Hidden Files. 2-don't show hidden files, 
												#  1-show hidden
		    "LastActiveClick",                	# Return to previous window						
		    "LaunchTo",                       	# Launch to This PC								
		    "ListviewAlphaSelect",            	# Show and dont hide the mouse drag selection Windows
		    "PersistBrowsers",                	# Restore open folders at logon					
		    "ShowCompColor",                  	# Show compressed in color							
		    "SnapAssist",                     	# Disable autosnap									
		    "TaskbarSizeMove",                	# Allow move and enlarge Taskbar						
		    "TaskbarSn",                     	# Allow sharing of any window							
		    "UseCompactMode"                   	# enables compact view						
$Twos    =  "MMTaskbarGlomLevel",
			"TaskbarGlomLevel", 
		    "MMTaskbarMode", 					# Show window on taskbar monitor where opened			
		    "TaskbarSi"                         # this is medium sized.  0 and 2 possible)	
			
Start-ThreadJob {
	ForEach ($Root in $Roots) {
		Start-ThreadJob -ArgumentList @($Root,$Base,$Middle,$End,$Deletes,$Zeros,$Ones,$Twos) {
			Param = ($Root,$Base,$Middle,$End,$Deletes,$Zeros,$Ones,$Twos)
			ForEach ($Middle in $Middles) {
				$Path = $Root+$Base+$Middle+$End
				ForEach ($Item in $Deletes) {
					DEL -Path $Path -Name $Item -Recurse
				}
				ForEach ($Item in $Zeros) {
					SP  -Path $Path -Name $Item -Value 0 -Type DWord
				}
				ForEach ($Item in $Ones) {
					SP  -Path $Path -Name $Item -Value 1 -Type DWord
				}
				ForEach ($Item in $Twos) {
					SP  -Path $Path -Name $Item -Value 2 -Type DWord
				}
			SP -Path $Path -Name "CopyBufferSize" -Value 100000 -Type DWord
			<# Allow auto filling of folder search boxes #>
			SP -Path $Path -Name "TypeAhead"	  -Value 10 	-Type DWord
			}
		}
	}
	$PathX ="HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\"
	<# Seems that just creating these two key makes classic menus and window per process happen #>
	NI -Path $PathX+"AlwaysShowMenus\Policy\AlwaysShowClassicMenu" -Value ""
	NI -Path $PathX+"DesktopProcess\Policy\SeparateProcess"		   -Value ""
} -Name "Explorer Advanced 1"
#
##
# Show full address in Folder bar
$Path 	  = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState"
$Ones 	  = "FullPath","FullPathAddress" 
$Settings = ([byte[]](0x0C,0x00,0x02,0x00,0x2B,0x01,0x00,0x00,0x60,0x00,0x00,0x00))
Start-ThreadJob {
	ForEach ($Item in $Ones) {
		SP 	-Path $Path -Name $Item  	 -Value 1 			-Type DWord
	}
	SP 		-Path $Path -Name "Settings" -Value $Settings	-Type Binary 
} -Name "full address"
#
##
# AutoComplete
$Roots 	= "HKCU","HKLM"
$Key	= ":\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete"
$Yeses	= "AutoSuggest","Append Completion"
Start-ThreadJob {
	ForEach ($Root in $Roots) {
		$Path = $Root+$Key
		ForEach ($Item in $Yeses) {
			SP -Path $Path -Name $Item -Value "Yes" 
		}
	}
} -Name "AutoComplete"
#
##
#  ********* DWM
$Roots = "HKCU","HKLM"
$Paths = ":\Software\Microsoft\Windows\DWM",":\Software\Policies\Microsoft\Windows\DWM"
$Zeros = "AlwaysHibernateThumbnails"
$Ones  = "ColorPrevalence","ColorizationBlurBalance","ColorizationGlassAttribute","Composition", `
		 "DisallowAnimations","DisallowColorizationColorChanges","DisallowFlip3d","EnableAeroPeek","EnableWindowColorization","ForceDisableModeChangeAnimation"
$Pairs = @{ "AccentColor"="4291196160";
			"ColorizationColor"="3288364486"; 
			"ColorizationAfterglow"="3288364486"; 
		    "ColorizationColorBalance"="59";
			"ColorizationAfterglowBalance"="10" }
Start-Job -ArgumentList @($Roots,$Paths,$Ones,$Zeros,$Pairs) {
	Param ($Roots,$Paths,$Ones,$Zeros,$Pairs)
	ForEach ($Root in $Roots) {
		Start-ThreadJob -ArgumentList @($Root,$Paths,$Ones,$Zeros,$Pairs) {
			Param ($Root,$Paths,$Ones,$Zeros,$Pairs)
			ForEach ($Path in $Paths) {
				ForEach ($Item in $Zeros) {
					SP -Path $Root$Path -Name $Item -Value 0 			 -Type DWord 
				}                                   
				ForEach ($Item in $Ones) {          
					SP -Path $Root+$Key  -Name $Item -Value 1 			 -Type DWord  
				}                                   
				ForEach ($Pair in $Pairs.Keys) {    
					SP -Path $Root+$Key  -Name $Pair -Value $Pair.Value  -Type DWord  
				}
			}
		} -Name "DWM ThreadJob"
	}
} -Name "DWM"
<# 	The below exist, but not sure what they do.
	"DisableDrawListCaching"=dword:00000000			#(0)
	"DisableHologramCompositor"=dword:00000001 		#VR/Steam Hololens?
	"DisallowNonDrawListRendering"=dword:00000000 	#(0)
	"EnableCpuClipping"=dword:00000000				#(1)
	"EnableDrawToBackbuffer"=dword:0000001 			#(0)
	"EnableImageProcessing"=dword:0000001 			#(0)
	"EnableMPCPerfCounter"=dword:00000000
	"EnableShadow"=dword:0000001 					#(0)
	"ForceEffectMode"=dword:00000001				#opaque windows, transparant taskbar `
													 (UseOLEDTaskbarTransparency 0/1 dark/light)
	"ImageProcessing8bit"=dword:0000001				#(0)
	"MouseWheelScrollingMode"=dword:0000001			#0/1/2
	"ParallelModePolicy"=dword:00000001				#4 2 0 ?
	"ResampleInLinearSpace"=dword:0000000			#0/1
	"SuperWetEnabled"=dword:00000000				#(1) ink/tablet?
	"TelemetryFramesSequenceMaximumPeriodMilliseconds"=dword:000001f4		#(1000) 500
	"UseHWDrawListEntriesOnWARP"=dword:00000001		(0)  #>
#
##
# CloudContent
$Path 	= "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$Zeros 	= "IncludeEnterpriseSpotlight"
$Ones 	= "CloudOptimizedContent","ConsumerAccountStateContent","SoftLanding", `
		  "SpotlightCollectionOnDesktop","TailoredExperiencesWithDiagnosticData",`
		  "ThirdPartySuggestions","WindowsConsumerFeatures","WindowsSpotlightFeatures","WindowsSpotlightOnActionCenter","WindowsSpotlightOnSettings","WindowsSpotlightWindowsWelcomeExperience"
$Twos 	= "ConfigureWindowsSpotlight" 
Start-ThreadJob {
	ForEach ($Item in $Zeros) {
		SP -Path $Path -Name 		   $Item -Value 0 -Type DWord
	}
	ForEach ($Item in $Ones) {
		SP -Path $Path -Name "Disable"+$Item -Value 1 -Type DWord
	}
	ForEach ($Item in $Twos) {
		SP -Path $Path -Name 		   $Item -Value 2 -Type DWord
	}
} -Name "CloudContent"
#
## WinLogon
# 
$Begining = "HKLM:\Software"
$Middles  = "\","\Wow6432Node\"
$End 	  = "Microsoft\Windows NT\CurrentVersion\Winlogon"
$Zeros	  = "ARSOUserConsent","ReportBootOk","EnableFirstLogonAnimation"
$Ones	  = "DisableCAD","AutoRestartShell","AutoAdminLogon"
$OnesOff  = @{"CachedLogonsCount"="10";"DefaultPassword"="";"DefaultUserName"="Ariel"}
Start-ThreadJob {
	ForEach ($Middle in $Middles) {
		$Path = $Begining+$Middle+$End
		ForEach ($Item in $Zeros) {
			SP -Path $Path -Name $Item -Value 0 -Type DWord
		}                              
		ForEach ($Item in $Ones) {     
			SP -Path $Path -Name $Item -Value 1 -Type DWord
		}		                       
		ForEach ($Item in $OnesOff.Keys) {
			SP -Path $Path -Name $Item -Value $Item.Value
		}
	} 
} -Name "WinLogon"
#
##						CPL International
# 
$Path  =	"HKCU:\Control Panel\International"
$Zeros =	"BlockCleanupOfUnusedPreInstalledLangPacks"
$Ones  =	"TurnOffAutocorrectMisspelledWords","TurnOffHighlightMisspelledWords",`
			"TurnOffInsertSpace","TurnOffOfferTextPredictions"
$Pairs =	@{ "iCalendarType"="1";"iCountry"="1";"iCurrDigits"="2";"iCurrency"="0";`
			   "iDate"="1";"iDigits"="2";"iFirstDayOfWeek"="6";"iFirstWeekOfYear"="0";`
			   "iLZero"="1";"iMeasure"="1";"iNegCurr"="0";"iNegNumber"="1";"iPaperSize"="1";`
			   "iTime"="1";"iTimePrefix"="0";"iTLZero"="1";"Locale"="00000809";"LocaleName"="en-VI";`
			   "NumShape"="1";"s1159"="AM";"s2359"="PM";"sCurrency"="$";"sDate"="/";"sDecimal"=".";"sGrouping"="3;0";"sLanguage"="ENG";"sList"=",";`
			   "sLongDate"="dddd, MMMM d, yyyy";"sMonDecimalSep"=".";"sMonGrouping"="3;0";`
			   "sMonThousandSep"=",";"sNativeDigits"="0123456789";"sNegativeSign"="-";`
			   "sPositiveSign"="";"sShortDate"="M/d/yyyy";"sShortTime"="h:mm tt";`
			   "sThousand"=",";"sTime"=":";"sTimeFormat"="h:mm:ss tt";"sYearMonth"="MMMM yyyy" }	
Start-ThreadJob {
	ForEach ($Item in $Zeros) {
		SP -Path $Path -Name $Item 		-Value 0 -Type DWord
	}					                 
	ForEach ($Item in $Ones) {			 	
		SP -Path $Path -Name $Item 		-Value 1 -Type DWord
	}
	ForEach ($Item in $Pairs.Keys) {
		SP -Path $Path -Name $Item -Value $Item.Value 
	}		
} -Name "CPL Intl"
#
Start-ThreadJob {
	$Path	= "HKCU:\Control Panel\International\"
	$PathY  = $Path+"Geo"
	SP -Path  $PathY  -Name "Nation" 		   		-Value "252"
	SP -Path  $PathY  -Name "Name" 			   		-Value "VI"

	$PathX = $Path+"User Profile System Backup"
	$Ones  = "ShowAutoCorrection","ShowCasing","ShowShiftLock" 
	SP -Path  $PathX  -Name "ShowTextPrediction"	-Value 0 -Type DWord
	SP -Path  $PathX  -Name "Languages" 		   	-Value "en-GB,en-vi,en-US,he-IL,en-IL"
	ForEach ($Item in $Ones) {
		SP -Path $PathX -Name $Item   				-Value 1 -Type DWord 
	}
} -Name "CPL Intl 2"
#
##
# 
$Path  = "HKLM:\Software\Microsoft\Windows\CurrentVersion\"
$Pairs = @{	"BottomMarginPx"="16";"Favorites"="255";"FavoritesChanges"="91";`
			"FavoritesRemovedChanges"="15";"FavoritesVersion"="3";"LeftMarginPx"="16";`
			"MaxThumbSizePx"="200";"MinThumbSizePx"="200";"NumThumbnails"="10";"RightMarginPx"="16";"ThumbSpacingXPx"="1";"ThumbSpacingYPx"="20";"TopMarginPx"="16";"pageTaskbarThumbnails"="5" }
SaJb {
	Start-ThreadJob -ArgumentList @($Path) {
		Param ($Path)
		$PathX = $Path+"Feeds"
		SP -Path $PathX 	-Name "EnShellFeedsTaskbarViewMode" 	-Value 2281193128 -Type DWord
		SP -Path $PathX 	-Name "ShellFeedsTaskbarOpenOnHover" 	-Value 0 		  -Type DWord
		SP -Path $PathX 	-Name "ShellFeedsTaskbarViewMode" 		-Value 2		  -Type DWord
	} -Name "Feeds"
#	
	Start-ThreadJob -ArgumentList @($Path,$Pairs) {
		Param ($Path,$Pairs)
		$PathX = $Path+"Explorer\Taskband"
		ForEach ($Item in $Pairs.Key) {
			SP -Path $PathX -Name $Item 		-Value $Item.Value 	-Type DWord
		}
	} -Name "TaskBand"
#	
	Start-ThreadJob -ArgumentList @($Path) {
		Param ($Path)
		$PathX = $Path+"Explorer\Taskband\AuxilliaryPins"
		$PathZ = $Path+"Explorer\MultiTaskingView\AllUpView"
		$PathZ = $Path+""
		$PathZ = $Path+""
		$PathZ = $Path+""
		SP -Path $PathX 	-Name "MailPin" 	-Value 0 -Type DWord
		SP -Path $PathX 	-Name "TFLPin" 		-Value 0 -Type DWord		
		
		SP -Path $PathZ 	-Name "AllUpView" 	-Value 1 -Type DWord
		SP -Path $PathZ 	-Name "Enabled" 	-Value 1 -Type DWord
	} -Name "AuxPins"
#	
	SP -Path $Path+"Communications" 		-Name "ConfigureChatAutoInstall" 	-Value 0	-Type DWord
	<# Hide certain annoyances #>                                  	
	SP -Path $Path+"DontShowMeThisDialogAgain" -Name "WarnBeforeCloseBand" 		-Value "No"	
	<# Show more details when copying files #>                     	
	SP -Path $Path+"OperationStatusManager" -Name EnthusiastMode"" 				-Value 1	-Type DWord
	<# Disable the -Shortcut #>
	SP -Path $Path+"NamingTemplates" 		-Name "ShortcutNameTemplate" 		-Value ""="\"%s.lnk\""
}
#
## Name Spaces
# 	
@=
$Path 	  = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\"
SaJb {
	Start-ThreadJob -ArgumentList @($Path) {
		Param ($Path)
		$SectionC = "ControlPanel"
			$PathX = $Path+$SectionC+"NameSpace\"+"{9cd0827e-0ad1-4c27-93d0-29f4c4ecd3b2}"
				SP -Path $PathX -Name "Default" 		-Value "Local Group Policy Editor" 
				
			$PathY = $Path+$SectionC+"NameSpace\"+"{e23fd76f-5b20-40e5-a9b2-1be8f0416c26}"
				SP -Path $PathX -Name "Default" 		-Value "Hyper-V Manager" 
			
		$SectionM = "MyComputer"
			$PathM = $Path+$SectionM+"NameSpace\"+"{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"
				<# Make sure that the Desktop shows on Nav Pane #>
				SP -Path $PathM -Name "HideIfEnabled" 	-Value 0 -Type DWord	
			
			<#
			SP -Path $Path -Name "" 					-Value 0 -Type DWord
			SP -Path $Path -Name "" 					-Value 2 -Type DWord  #>
	} -Name " "
	


;	
	
}
#
## Software\Policies
# 
$Path = "HKLM:\Policies\Microsoft\"
SaJb {
	Start-ThreadJob -ArgumentList @($Path) {
		Param ($Path)
		<# Make sure previous version pages show #>
		SP -Path $Path+"PreviousVersions" 	  -Name "DisableLocalPage" 	-Value 0 -Type DWord
		
		<# Disable chat from taskbar #>
		SP -Path $Path+"Windows\Windows Chat" -Name "ChatIcon" 			-Value 3 -Type DWord		
		SP -Path $Path+"Windows\Windows Chat" -Name "Link" 				-Value 0 -Type DWord	

		SP -Path $Path+"Conferencing" 		  -Name "**del.NoRDS" 		-Value ""			
		SP -Path $Path+"Conferencing" 		  -Name "NoChat" 			-Value 1 -Type DWord			
		SP -Path $Path+"Conferencing" 		  -Name "NoNewWhiteBoard" 	-Value 1 -Type DWord					
		
	}
}
#
## HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
# 
$Path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\"
SaJb {
	Start-ThreadJob -ArgumentList @($Path) {
		Param ($Path)
		<# don't show People on Taskbar #>
		SP -Path $Path+"People" 				  -Name "PeopleBand" 	 -Value 0 -Type DWord		
		SP -Path $Path+"People\ShoulderTap" 	  -Name "ShoulderTap" 	 -Value 0 -Type DWord
			
		SP -Path $Path+"TaskbarDeveloperSettings" -Name "TaskbarEndTask" -Value 1 -Type DWord		
		
		
<#		
		SP -Path $Path -Name $Run -Value -Type DWord		
		SP -Path $Path -Name $Run -Value -Type DWord		
		SP -Path $Path -Name $Run -Value -Type DWord		
		 
		ForEach ($CPL in $CPLs) {
			SP -Path $Path -Name $Run -Value -Type DWord
		}   #>
	}
} -Name ""
#
## HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""
#
##
# 
$Path  = ""
$Zeros = ""
$Ones  = ""
$Pairs = @{}
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		SP -Path $Path -Name $Run -Value -Type DWord
	} 
} -Name ""

























##

#
##
#
Start-ThreadJob {
	ForEach ($CPL in $CPLs) {
		Start-ThreadJob {
			SP -Path $Path -Name $Run -Value -Type DWord
		}
	} 
} -Name "Approved Runs 2"
#
##
#








