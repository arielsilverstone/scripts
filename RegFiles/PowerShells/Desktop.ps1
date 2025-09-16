##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="Desktop"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "16FEB25" | Out-Null
} -Name "$Name.ps1 Changed"
#
#
## Global
#
$PathC = ":\SOFTWARE\Microsoft\Windows\CurrentVersion\"
$PathD = "HKCU:\Control Panel\Desktop"
#
## Remove "Set as Desktop Background"
# 
$MSFT18 = "avif","bmp","dds","dib","gif","heic","heif","ico","jfif","jpe","jpeg","jpg","jxr","png","rle",`
		  "tif","tiff","wdp","webp"
Start-ThreadJob { 
	ForEach ($MSFT in $MSFT18) {
		$PathY = "HKCR:\SystemFileAssociations\."+$MSFT+"\Shell\setdesktopwallpaper\"	
		$PathX = "HKCR:\Software\Classes\SystemFileAssociations\."+$MSFT+"\Shell\3D Edit"
		$PathZ = "HKLM:\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"	
		$Value = "PhotoViewer.FileAssoc."+$MSFT			
		DEL -Path $PathY -Recurse
<# Remove 3D Edit #>
		DEL -Path $PathX -Recurse 
		SP  -Path $PathZ -Name $MSFT -Value $Value
	} 
} -Name "Images 1"
#
##
# SystemProfile Desktop
$Folder = "C:\Windows\System32\Config\systemprofile"
Start-ThreadJob { 
	if (!(Test-Path -Path $Folder+"\Desktop")) {
		NI -Path $Folder -Name "Desktop" -ItemType "Directory" 
	}
} -Name "SystemProfile"
#
##
# ActiveDesktop
$Roots = "HKCU","HKLM"
$Path  = $PathC+"Policies\ActiveDesktop"
$Zeros = "NoChangingWallpaper"
$Ones  = "NoAddingComponents","NoComponents"
Start-ThreadJob {
	ForEach ($Root in $Roots) {
		$Path = $Root+$Path
		Start-ThreadJob -ArgumentList @($Zeros,$Ones) {
			ForEach ($Item in $Zeros) {
				SP -Path $Path -Name $Item -Value 0 -Type DWord
			}
			ForEach ($Item in $Ones) {
				SP -Path $Path -Name $Item -Value 1 -Type DWord
			}
		}
	}
} -Name "ActiveDesktop Pol"
#
##
# HideMyComputerIcons
$Ones = "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}","{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",`
		"{088e3905-0323-4b02-9826-5d99428e115f}","{24ad3ad4-a569-4530-98e1-ab02f9417aa8}","{d3162b92-9365-467a-956b-92703aca08af}"
$Path = "HKCU"+$PathC+"Explorer\HideMyComputerIcons"
Start-ThreadJob {
	ForEach ($Item in $Ones) {
		SP -Path $Path -Name $Item -Value 1 -Type DWord
	}
} -Name "HideMyComputerIcons"
#
##
#   Hide(1)  or Show (0) on Desktop
$Roots =  "HKCU","HKLM"
$Middle = $PathC+"Explorer\HideDesktopIcons\"
$Ends =   "NewStartPanel","ClassicStartMenu"
$Zeros = <# Put "This PC" icon on the desktop for everyone #> "{20D04FE0-3AEA-1069-A2D8-08002B30309D}",`
		 <# Recycle Bin #>   "{645FF040-5081-101B-9F08-00AA002F954E}",`
		 <# This Network #>  "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" 
$Ones =  <# Libraries #>     "{031E4825-7B94-4dc3-B131-E946B44C8DD5}",`
		 <# Control Panel #> "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}",`
		 <# User Folder #>   "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
Start-Job -ArgumentList @($Roots,$Middle,$Ends,$Zeros,$Ones) {
	Param ($Roots,$Middle,$Ends,$Zeros,$Ones)
	ForEach ($Root in $Roots) {
		Start-ThreadJob -ArgumentList @($Root,$Middle,$Ends,$Zeros,$Ones) {
			Param ($Root,$Middle,$Ends,$Zeros,$Ones)
			ForEach ($End in $Ends) {
				$Path = $Root+$Middle+$End 
				ForEach ($Item in $Zeros) {
					SP -Path $Path -Name $Item -Value 0 -Type DWord 
				}
				ForEach ($Item in $Ones) {
					SP -Path $Path -Name $Item -Value 1 -Type DWord  
				}
			}
		} -Name "Show on Desktop - Inner"
	}
} -Name "Show on Desktop "
#
##				Control Panel\Desktop
# 
$PathX 	 =  "HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop"

$Zeros 	 = 	"AutoColorization","LockScreenAutoLockActive","MenuShowDelay","WindowArrangementActive",`
			"ForegroundFlashCount",`
			<# remember (0) Windows affinity to screens #> 	"RestorePreviousStateRecalcBehavior",`
			<# attempt to stop autosnap #>					"DockMoving"
			
$Ones	 =	"SmoothScroll",`
			<# Auto End Tasks on Shutdown/Reboot #> 		"AutoEndTasks",`
			<# Show win content while dragging #> 			"DragFullWindows"
			
$Twos 	 =	"FontSmoothing","MouseWheelRouting"
$ThreeCs =	"WaitToKillServiceTimeout","WaitToKillAppTimeout"

$PairsW	 =	@{	"HungAppTimeout"="300";`
				"MenuShowDelay"="0";`
				"WheelScrollChars"="3";`
				"WheelScrollLines"="3";`
				"WindowArrangementActive"="0";`
				"UserPreferencesMask"="([Byte[]](0x9E,0x12,0x07,0x80,0x10,0x00,0x00,0x00))"`
			  <# Below equivalent to "en-GB en-VI en-US he-IL en-IL" #>
				"PreferredUILanguages"=`
				"([Byte[]]( 0x65,0x00,0x6e,0x00,0x2d,0x00,0x47,0x00,0x42,0x00,0x00,0x00,0x65,0x00,0x6e,0x00,`
							0x2d,0x00,0x56,0x00,0x49,0x00,0x00,0x00,0x65,0x00,0x6e,0x00,0x2d,0x00,0x55,0x00,`
							0x53,0x00,0x00,0x00,0x68,0x00,0x65,0x00,0x2d,0x00,0x49,0x00,0x4c,0x00,0x00,0x00,`
							0x65,0x00,0x6e,0x00,0x2d,0x00,0x49,0x00,0x4c,0x00,0x00,0x00,0x00,0x00))" }
						
$PairsD	 =	@{"LowLevelHooksTimeout"="1024";"DpiScalingVer"="4096";"ForegroundLockTimeout"="116000";`
			  "JPEGImportQuality"="598";"MaxVirtualDesktopDimension"="7680";"MaxMonitorDimension"="11520";"ActiveWndTrkTimeout"="336";`
			  <# Wait 60 years before auto logout #>"DelayLockInterval"="137438953472" }
			  
$PairsP	 =	@{"EnablePerProcessSystemDPI"="1";"JPEGImportQuality"="598";"ScreenSaverIsSecure"="0" }

Start-ThreadJob {
	ForEach ($Item in $Zeros) {
		SP -Path $PathD  -Name $Item 	-Value 0 	-Type DWord
	}					            	
	ForEach ($Item in $Ones) {				
		SP -Path $PathD  -Name $Item 	-Value 1 	-Type DWord
	}					            	
	ForEach ($Item in $Twos) {				
		SP -Path $PathD  -Name $Item 	-Value 2 	-Type DWord
	}		                        	
	ForEach ($Item in $ThreeCs) {		
		SP -Path $PathD  -Name $Item 	-Value 300 	-Type DWord
	}                                    
	ForEach ($Item in $PairsW.Keys) {
		SP -Path $PathD  -Name $Item	-Value $Item.Value
	}	
	ForEach ($Item in $PairsD.Keys) {	
		SP -Path $PathD  -Name $Item	-Value $Item.Value -Type DWord
	}	
	ForEach ($Item in $PairsP.Keys) {	
		SP -Path $PathX -Name $Item		-Value $Item.Value -Type DWord
	}
} -Name "CPL Desktop"
#
##
# CPL Desktop WindowMetrics
$Path  = $PathD+"\WindowMetrics"
$Pairs = @{"CaptionWidth"="-330";"CaptionHeight"="-330";"SmCaptionWidth"="-330";"SmCaptionHeight"="-330";`
		   "BorderWidth"="-15";"PaddedBorderWidth"="-15";"ScrollHeight"="-285";"ScrollWidth"="-285";"MenuWidth"="-285";"MenuHeight"="-285";"IconSpacing"="-1000";"IconVerticalSpacing"="-1125";"MinAnimate"="0" }
Start-ThreadJob {
	ForEach ($Item in $Pairs.Keys) {
		SP -Path $Path -Name $Item 	  -Value $Item.Value 
	}
	SP -Path $Path -Name "AppliedDPI" -Value 192 -Type DWord
} -Name "WindowMetrics"
#
# Lang and MUI
# 
Start-ThreadJob {
	$PathA  = $PathS+ "\LanguageConfiguration"            	
	$PathB  = $PathS+ "\MuiCached"                        	
	SP -Path  $PathA -Name "en-GB"							-Value "en-GB,en-vi,en-US,he-IL"
	SP -Path  $PathB -Name "MachinePreferredUILanguages"	-Value "en-GB he-IL"	
} -Name "Lang and MUI"
#
## Shell Bags
# 
$Path   = "HKCU:\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop"
$Pairs  = @{"FFlags"="1210057252";"GroupByDirection"="1";"GroupByKey:PID"="0";"GroupView"="0";`
			"IconNameVersion"="1";"LogicalViewMode"="3";"Mode"="1";`
			<# I use 59. "96" is Large Icons, "256" Extra Large, "48" Medium, "32" small #> "IconSize"="59"}
$Pairs2 = @{"GroupByKey:FMTID"="{00000000-0000-0000-0000-000000000000}";`
			"Sort"="([Byte[]](0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,`
							  0x00,0x00,0x00,0x00,0x00,0x00))"} 
Start-ThreadJob {
	ForEach ($Item in $Pairs.Keys) {
		SP -Path $Path -Name $Item -Value $Item.Value 				-Type DWord
	}
	ForEach ($Item in $Pairs2.Keys) {
		SP -Path $Path -Name $Item -Value $Item.Value 
	}
} -Name "Shell Bags"
#
##
# Desktop SpotLight
$Path  = "HKLM"+$PathC+"\DesktopSpotlight\Settings"
Start-ThreadJob {
	SP -Path $Path    -Name "EnabledState"     -Value 0 			-Type DWord
} -Name "SpotLight"
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

