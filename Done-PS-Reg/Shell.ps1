##
##
# 	Change Tracking
Start-Throt { 
	$Name="Shell"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "21FEB25" | Out-Null
} -Name "$Name.ps1 Changed" 
#
#
#
## Global VARs
#
NAL NIP New-ItemProperty
NAL STD Start-Throt  # Alias for Start-Throt
NAL	JP	Join-Path
##
#
$MSFT20 = "3GP","ADTS","AIFF","ASF","ASX","AU","AVI","FLAC","M2TS","m3u","M4A","MIDI","MK3D","MKA",`
		  "MKV","MOV","MP3","MP4","MPE","TTS","WAV","WAX","WMA","WMV","WPL","WVX"
$MSFT21 = "Audio","Stack.Image","Stack.Audio","WMP.DVR-MSFile","WMP.WTVFile","MediaCenter.WTVFile",`
		  "Directory.Audio","Directory.Image","SystemFileAssociations\audio"
Start-Job { 
	Start-Throt {	
		ForEach ($MSFT in $MSFT20) { 
			$Path = JP "HKCR:\WMP11.AssocFile." $MSFT "shell\Enqueue"
			DEL -Path $Path  -Recurse 
		}	
	}				
	Start-Throt { 	
		ForEach ($MSFT in $MSFT21) { 
			$PathY = JP "HKCR:" $MSFT "shell\Enqueue"
			$PathX = JP "HKCR:" $MSFT "shell\Play"	
			DEL -Path $Paths -Recurse 
			DEL -Path $PathX -Recurse
		} 
	} 
} -Name "Audios" 
#
##
# OneDrive Shell Icons
Start-Throt { 
	1..7 | ForEach {
		$Test= JP "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\ OneDrive" $_
		If (Test-Path $($Test)) { 	
			Start-Throt -InputObject $Test { 
				DEL -Path $Test -Recurse 
			} -Name "Removing OneDrive $_"
		}
	} 
} -Name "OneDrive ShellIcon"
#
##  Shell Service Objects
#
$MSFT34 = "{68ddbb56-9d1d-4fd9-89c5-c0da2a625392}","{78DE489B-7931-4f14-83B4-C56D38AC9FFA}",
		  "{DA67B8AD-E81B-4c70-9B91-B417B5E33527}","{EF4D1E1A-1C87-4AA8-8934-E68E4367468D}",
		  "{fbeb8a05-beee-4442-804e-409d6c4515e9}","{ff363bfe-4941-4179-a81c-f3f1ca72d820}"
$Path 	= "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects"
Start-Throt { 
	ForEach ($MSFT in $MSFT34) { 
		$PathX = JP $Path $MSFT
		DEL -Path $PathX -Recurse -EA 0 | Out-Null
	}
} -Name "Shell Service Objects"
#
## Block Shell Extensions
# 
$MSFT40=  @{"{02DB545A-3E20-46DE-83A5-1329B1E88B6B}"="OpeninWindowsTerminal";
			"{04731B67-D933-450A-90E6-4ACD2E9408FE}"="SearchFolder";
			"{08165EA0-E946-11CF-9C87-00AA005127ED}"="WebCheckCrawler";
			"{09A47860-11B0-4DA5-AFA5-26D86198A780}"="ScanwDefender";
			"{0AF96EDE-AEBF-41ED-A1C8-CF7A685505B6}"="LibraryFolderContextMenu";
			"{0BF754AA-C967-445C-AB3D-D8FDA9BAE7EF}"="SlideshowContextMenu";
			"{0F8604A5-4ECE-4DE1-BA7D-CF10F8AA4F48}"="ContactsFolder";
			"{13D3C4B8-B179-4EBB-BF62-F704173E7448}"="ContactReadingPane";
			"{14074E0B-7216-4862-96E6-53CADA442A56}"="LibraryIconExtractExtension";
			"{169A0691-8DF9-11D1-A1C4-00C04FD75D13}"="In-panesearch";
			"{16C2C29D-0E5F-45F3-A445-03E03F587B7D}"="Groupshellcontext";
			"{1D27F844-3A1F-4410-85AC-14651078412D}"="Troubleshootcompatibility";
			"{1E589E9D-8A8D-46D9-A2F9-E6D4F8161EE9}"="MFMPEGPropertyHandler";			
			"{23170F69-40C1-278A-1000-000100020000}"="7zip";
			"{2854F705-3548-414C-A113-93E27C808C85}"="EnhancedStorageContextMenuHandlerClass";
			"{3D1975AF-48C6-4F8E-A182-BE0E08FA86A9}"="NVIDIAPlayOnMyTV";
			"{3F30C968-480A-4C6C-862D-EFC0897BB84B}"="PhotoExtractImage";
			"{470C0EBD-5D73-4D58-9CED-E91E22E23282}"="PintoStart";
			"{487BA7B8-4DB0-465F-B122-C74A445A095D}"="MF Media Source Pack Property Handler";
			"{4A7DED0A-AD25-11D0-98A8-0800361B1103}"="MyFolder menu and properties";
			"{4F58F63F-244B-4C07-B29F-210BE59BE9B4}"="Mail - .group Shell extension handler";
			"{53BEDF0B-4E5B-4183-8DC9-B844344FA104}"="MAPI Mail Previewer";
			"{596AB062-B4D2-4215-9F74-E9109B0A8153}"="BurntoCD";
			"{5B6D1451-B1E1-4372-90F5-88E541B4DAB9}"="Encryptionsettings";
			"{5FA29220-36A1-40F9-89C6-F4B384B7642E}"="ShellMessageHandler";
			"{606B3777-3051-401F-974A-E66ACA82A3A3}"="Superseded Updates Cleanup";
			"{66275315-BFA5-451B-88B6-E56EBC8D9B58}"="Library Property Handler";
			"{68B07BFF-CB50-4D60-A7D5-02B1A523BC8C}"="SearchConnectorIconExtract";	
			"{70E40788-9F0F-4041-BD49-5A332150A83C}"="UNKNOWN";
			"{7444C717-39BF-11D1-8CD9-00C04FC29D45}"="Crypto";
			"{7988B573-EC89-11cf-9C00-00AA00A14F56}"="Microsoft Disk Quota UI";
			"{7AD84985-87B4-4A16-BE58-8B72A5B390F7}"="Casttodevice";
			"{7D559C10-9FE9-11D0-93F7-00AA0059CE02}"="CodeDownloadAgent";
			"{7FC0B86E-5FA7-11D1-BC7C-00C04FD929DB}"="WebCheckSyncMgrHandler";
			"{8082C5E6-4C27-48EC-A809-B8E1122E8F97}"="ContactShellHandler";
			"{888DCA60-FC0A-11CF-8F0F-00C04FD7D062}"="SendToZip";
			"{889900c3-59f3-4c2f-ae21-a409ea01e605}"="Shared Bitmap Object";
			"{89D83576-6BD1-4C86-9454-BEB04E94C819}"="WindowsSearch mssvp.dll";
			"{8A734961-C4AA-4741-AC1E-791ACEBF5B39}"="WindowsMediaPlayer";
			"{92DBAD9F-5025-49B0-9078-2D78F935E341}"="PreviewMime";
			"{9343812E-1C37-4A49-A12E-4B2D810D956B}"="WindowsSearch";
			"{9421DD08-935F-4701-A9CA-22DF90AC4EA6}"="EpsonEasyPhotoPrint2:Blockedby
													  {6AF39996-9C88-459B-9282-DA18B14E4402}";
			"{96B9DAE3-CF15-45E9-9719-57285348225E}"="WindowsSearch mssvp.dll";
			"{9B0EFD60-F7B0-11D0-BAEF-00C04FC308C9}"="Temporary Internet Files Cleaner";
			"{9C60DE1E-E5FC-40F4-A487-460851A8D915}"="AutoPlay";
			"{9E56BE60-C50F-11CF-9A2C-00A0C90A90CE}"="MailService";
			"{9F156763-7844-4DC4-B2B1-901F640F5155}"="OpenInWindowsTerminal";
			"{A015411A-F97D-4EF3-8425-8A38D022AEBC}"="Find";
			"(A470F8CF-A1E8-4F65-8335-227475AA5C46)"="EncryptionMenu";
			"{A0953C92-50DC-43BF-BE83-3742FED03C9C}"="Videos";
			"{A2A9545D-A0C2-42B4-9708-A0B2BADD77C8}"="C8StartMenuPin";
			"{A2A9545D-A0C2-42B4-9708-A0B2BADD77C9}"="C9";
			"{A70C977A-BF00-412C-90B7-034C51DA2439}"="nVidiaCPL";
			"{A929C4CE-FD36-4270-B4F5-34ECAC5BD63C}"="NvAppShExt";
			"{A9B48EAC-3ED8-11D2-8216-00C04FB687DA}"="ContentIndexerCleaner";
			"{ABBE31D0-6DAE-11D0-BECA-00C04FD940BE}"="SubscriptionMgr";
			"{AEB16279-B750-48F1-8586-97956060175A}"="Subscriptions";
			"{B41DB860-8EE4-11D2-9906-E49FADC173CA}"="WinRAR";
			"{B8CDCB65-B1BF-4B42-9428-1DFDB7EE92AF}"="ExtractAll";
			"{B9815375-5D7F-4CE2-9245-C9D4DA436930}"="PreviewEmail";
			"{BD472F60-27FA-11CF-B8B4-444553540000}"="7Zip";
			"{BD7A2E7B-21CB-41B2-A086-B309680C6B7E}"="WindowsSearch mssvp.dll";
			"{BFD468D2-D0A0-4BDC-878C-E69C2F5B435D}"="PreviewURL";
			"{C10E23A2-BFF0-4113-BCE8-C91BE754E281}"="FLAC PropertyHandler";
			"{C120DE80-FDE4-49F5-A713-E902EF062B8A}"="MP3  PropertyHandler";
			"{C591F150-4106-4141-B5C1-30B2101453BD}"="MKV Property Handler";
			"{CF67796C-F57F-45F8-92FB-AD698826C602}"=".Contactshell";
			"{CFBFAE00-17A6-11D0-99CB-00C04FD64497}"="UrlSearchHook";
			"{D8B8412B-DEA3-4130-B36C-5E8BE73106AC}"="MicrosoftWindowsMailHtmlPreviewHandler";
			"{D9144DCD-E998-4ECA-AB6A-DCD83CCBA16D}"="EnhancedStorageIcon";
			"{DDE4BEEB-DDE6-48fd-8EB5-035C09923F83}"="UnlockerShellExtension";
			"{E2BF9676-5F8F-435C-97EB-11607A5BEDF7}"="Modern Sharing";
			"{E2FB4720-F45F-4A3C-8CB2-2060E12425C3}"="AVI PropertyHandler";
			"{E37A73F8-FB01-43DC-914E-AAEE76095AB9}"="WTV PropertyHandler";
			"{E46787A1-4629-4423-A693-BE1F003B2742}"="WAV PropertyHandler";
			"{E61BF828-5E63-4287-BEF1-60B1A4FDE0E3}"="WorkFolders";
			"{E6FB5E20-DE35-11CF-9C87-00AA005127ED}"="WebChecker";
			"{ECF03A32-103D-11D2-854D-006008059367}"="MyDocs";
			"{EDC3A8B5-2E25-466A-A1AD-21E2F19414AC}"="AC3PropertyHandler";
			"{EDC978D6-4D53-4B2F-A265-5805674BE568}"="StreamBackedFolder";
			"{F5175861-2688-11D0-9C5E-00AA00A45957}"="SubscriptionFolder";
			"{F81B1B56-7613-4EE4-BC05-1FAB5DE5C07E}"="MPEG-4PropertyHandler";
			"{F81E9010-6EA4-11CE-A7FF-00AA003CA9F6}"="ShareWith/GiveAccessto";
			"{F8B8412B-DEA3-4130-B36C-5E8BE73106AC}"="MicrosoftWindowsMailHtmlPreviewHandler";
			"{F9A7AB61-C0BC-490E-A7FE-BFF26B327A3F}"="OpenSearchResultContextMenu";
			"{FBEB8A05-BEEE-4442-804E-409D6C4515E9}"="BurntoCD";
			"{FBF23B40-E3F0-101B-8488-00AA003E56F8}"="IEFrameInternetShortcut";
			"{FF393560-C2A7-11CF-BFF4-444553540000}"="IEFrameHistory"
			
<#			"{289AF617-1CC3-42A6-926C-E6A863F0E3BA}"="DLNAMediaServerSource";
			"{58E3C745-D971-4081-9034-86E34B30836A}"="Speech Recognition";
			"{606B3777-3051-401F-974A-E66ACA82A3A3}"="Updates Cleanup";
			"{66275315-BFA5-451B-88B6-E56EBC8D9B58}"="Control Panel";	
			"{70E40788-9F0F-4041-BD49-5A332150A83C}"="Unknown";		
			"{7988B571-EC89-11CF-9C00-00AA00A14F56}"="Quota";          
			"{7988B573-EC89-11CF-9C00-00AA00A14F56}"="Quota";			
			"{889900C3-59F3-4C2F-AE21-A409EA01E605}"="Shared Bitmap Object";
			"{8E6E6079-0CB7-11D2-8F10-0000F87ABD16}"="OfflinePagesFiles";
			"{9B0EFD60-F7B0-11D0-BAEF-00C04FC308C9}"="Temp Internet File Cleaner";						
			"{CB3D0F55-BC2C-4C1A-85ED-23ED75B5106B}"="MovetoOneDrive";	
			"{D12E3394-DE4B-4777-93E9-DF0AC88F8584}"="ArchiveDragDropHandler";
			"{D6791A63-E7E2-4FEE-BF52-5DED8E86E9B8}"="PortableDevicesMenu";
			"{EE07CEF5-3441-4CFB-870A-4002C724783A}"="CompressedArchiveFolderContextMenu";			#>
			}		
$MSFT41 = 	"business","creative","entertainment","family","gaming","schoolwork"
$MSFT42 = 	"202913","202914","280797","280812","280813","280814","280815","310091","310092","310093","310094",
			"314558","314559","314562","314563","314566","314567","338380","338381","338382","338386","338387","338388","338389","338393","353698","346480","346481","353694","353695","353696","353697","353698","353699","88000044","88000045","88000105","88000106","88000163","88000164","88000165","88000166","88000326"
Start-Job -ArgumentList @($MSFT40,$MSFT41,$MSFT42) {
	Param ($MSFT40,$MSFT41,$MSFT42)
	Start-Throt -ArgumentList @($MSFT40) {	
		Param ($MSFT40)
		$Path  = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Shell Extensions"
		$PathW = JP $Path "Approved"
		$PathV = JP $Path "Blocked"
		$PathU = JP $Path "Cached"
		ForEach ($MSFT in $MSFT40.Keys) {
			RP -Path $PathW -Name $MSFT | Out-Null
			RP -Path $PathU -Name $MSFT	| Out-Null		
			SP -Path $PathV -Name $MSFT -Value $MSFT40[$MSFT]
		}
	} -Name "Shell Extension"
	#
	Start-Throt -ArgumentList @($MSFT41) {	
		Param ($MSFT41)
		$PathY = "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudExperienceHost\Intent\"
		ForEach ($MSFT in $MSFT41) {
			$PathX = JP $PathY $MSFT
			SP -Path $PathX -Name "Intent" -Value 0 -Type DWord 
		} 
	} -Name "Cloud Host"
	#
	Start-Throt -ArgumentList @($MSFT42) {
		Param ($MSFT42)
		$PathZ = "HKLM:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\"
		ForEach ($MSFT in $MSFT42) {
			$Name  = JP "SubscribedContent-" $MSFT "Enabled"
			SP -Path $PathZ -Name $Name -Value 0 -Type DWord 
		}
	} -Name "CDM"
} -Name "Shell, Cloud and CDM" #EndJob
#
## Shell Folders
#
Start-Job {
	$Roots 	  = "HKLM","HKCU"
	$Desktops = "Desktop","Documents","My Documents","My Music","My Pictures","My Video"`
			    <# Downloads #>	"{374DE290-123F-4565-9164-39C4925E467B}"
	ForEach ($Root in $Roots) {
		Start-Throt -ArgumentList @($Root,$Desktops) {
			Param ($Root,$Desktops)
			$Vars = ":\Software\Wow6432Node\",":\Software\"
			ForEach ($Var in $Vars) {
				$Path = JP $Root $Var "Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
				ForEach ($Desktop in $Desktops) {
					SP -Path $Path	    		-Name $Desktop	 -Value "D:\Desktop"
					SP -Path (JP $Path $Var)  	-Name "Personal" -Value "D:\Users\Ariel"
				}
			}
		} -Name "Personal Desktops"
	}
#
	Start-Throt {
		$Root	  	= "HKLM:"
		$Desktops 	= "Common Desktop","Common Documents","CommonMusic","CommonPictures","CommonVideo"
		$Vars 		= "\Wow6432Node\","\"
		ForEach ($Var in $Vars) {
			$Path = JP "HKLM:\SOFTWARE" $Var "Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
			ForEach ($Desktop in $Desktops) {
				SP -Path $Path -Name $Desktop 	-Value "D:\Desktop"
				SP -Path $Path -Name "Personal" -Value "D:\Users\%Username%"
			}
		}
	} -Name "Common Desktop"
} -Name "Desktops"
#
## Shell Service Objects
#
$Path  = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\!"
$Pairs = @{ "{68ddbb56-9d1d-4fd9-89c5-c0da2a625392}"="UnexpectedShutdownReason";
			"{78DE489B-7931-4f14-83B4-C56D38AC9FFA}"="OneDrive SSO";
		    "{DA67B8AD-E81B-4c70-9B91-B417B5E33527}"="Shell Search";
		    "{EF4D1E1A-1C87-4AA8-8934-E68E4367468D}"="Web Search";
		    "{fbeb8a05-beee-4442-804e-409d6c4515e9}"="CD Burning";
		    "{ff363bfe-4941-4179-a81c-f3f1ca72d820}"="HomeGroup SSO"}
Start-Throt {
	ForEach ($Item in $Pairs.Keys) {
		$Branch = JP $Path $Item
		SP -Path $Branch -Name $Item -Value $Item.Value
	}
} -Name "Shell Service Objects"
#
## Shell Folders 2
#
$Base 	 = "HKLM:\Software\Classes"
$Middles = "CLSID","WOW6432Node\CLSID"
$End 	 = "ShellFolder"
$Values  = @{ "{d3162b92-9365-467a-956b-92703aca08af}"="";					<# Documents Folder #>			
			  "{088e3905-0323-4b02-9826-5d99428e115f}"="";                  <# Downloads Folder #>			
			  "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}"="";                  <# Pictures Folder 	#>			
			  "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}"="";                  <# Music Folder 	#>			
			  "{323CA680-C24D-4099-B94D-446DD2D7249E}"="2696937728";        <# Favorites		#>			
			  "{679f85cb-0220-4080-b29b-5540cc05aab6}"="2689597440";        <# Quick Access		#>			
			  "{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}"="";                  <# Gallery 			#> 			
			  "{f874310e-b6b7-47dc-bc84-b9e6b38f5903}"="";                  <# CLSID_MSGraphHomeFolder #> 	
			  "{031E4825-7B94-4dc3-B131-E946B44C8DD5}"="2962227469"		}	<# remove libraries #>				
Start-Throt {
	ForEach ($Middle in $Middles ) {
		ForEach ($Value in $Values.Keys) {
			$Path  = JP $Base $Middle $Name $End
			$PathX = JP "HKCU:\Software\Classes" $Middle $Value
			SP -Path $Path  -Name "Attributes" -Value $Value.Value -Type DWord
			SP -Path $PathX -Name "System.IsPinnedToNameSpaceTree" -Value 0 -Type DWord
		}
	}
	$PathY = "HKLM:\Software\Classes\CLSID"
	$End   = "{031E4825-7B94-4dc3-B131-E946B44C8DD5}"
	<# Rename to ! #>
	REN -Path (JP $PathY $End) -NewName "!$End"
} -Name "ShellFolder 2"	
#
##
# Removed Folders
Start-Throt {
	$Path 	 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\RemovedFolders"
	$Folders = "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",						<# Videos Folder 	#>	
			   "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",                        <# Music Folder  	#>	
			   "{088e3905-0323-4b02-9826-5d99428e115f}",                        <# Downloads Folder #>	
			   "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",                        <# Pictures Folder 	#>	
			   "{d3162b92-9365-467a-956b-92703aca08af}"                         <# Documents Folder #>	
	If (Test-Path $Path) {
		ForEach ($Item in $Folders) {
		 SP -Path $Path -Name $Item -Value ""
		}
	} 
} -Name "Removed Folders"
#
## Add'l folder settings
#
Start-Throt {
	$Path  = "HKLM:\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell\`
			 {885A186E-A440-4ADA-812B-DB871B942259}" <# Downloads #>
	<# NEVER Group files in explorer and clear all folder settings #>
	SP -Path $Path  -Name "GroupView" 					-Value 0	 -Type DWord
	SP -Path $Path  -Name "Mode" 						-Value 4	 -Type DWord	
#
	$PathA = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell"
	SP -Path $PathA -Name "BagMRU Size" 				-Value 86016 -Type DWord
#
	$PathB = JP $PathA "Bags\AllFolders\Shell"	
	<# Set all folders type to "Unspecified" #>
	SP -Path $PathB -Name "FolderType" 					-Value "NotSpecified"
	<# Set Default Folder View To Detailed #>
#
	$PathE = JP $PathB "{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}"		 			<# Generic Folder #>
	SP -Path $PathE -Name "FileOpenDialog"				-Value 4 	 -Type DWord
#
	$PathC = JP $PathA "BagMRU"
	SP -Path $PathC -Name "NodeSlots" 					-Value "([Byte[]](0x02,0x02))"
#
	$PathD = "HKLM:\Software\Microsoft\Shell\ActionCenter\Quick Actions"
	SP -Path $PathD -Name "PinnedQuickActionSlotCount" 	-Value 0 	 -Type DWord
#
	$PathF = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Shell\Update\Packages"
	<# Get context menu cleaner #>
	SP -Path $PathF -Name "UndockingDisabled" 			-Value 0 	 -Type DWord
	
} -Name "Various"	
#
## ProgrammaticAccessOnly
# 
$Tail  = "Shell\ShellCreateVideo"
$Items = "AppX43hnxtbyyps62jhe9sqpdzxn1790zetc$Tail",`					<# Remove "Create New Video" #> 
		 "AppXk0g4vb8gvt7b93tg50ybcy892pge6jmt$Tail"                    <# and also 		     	 #> 
Start-Throt {
	ForEach ($Item in $Items) {
		$Path = JP "HKCR:" $Item
		SP -Path $Path -Name "ProgrammaticAccessOnly" -Value ""
	}
} -Name "ProgrammaticAccessOnly"
#
## Approve Shell Extensions
#
$Path =	  "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"
$Z	  =	  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
$Pairs =  @{"AzureArcSetup"	= ([byte[]](0x00,$Z));
		    "OneDrive"		= ([byte[]](0x00,$Z));
			"ReflectUI"		= ([byte[]](0x02,$Z));
		    "RtkAudUService"= ([byte[]](0x02,$Z));
		    "SecurityHealth"= ([byte[]](0x00,$Z))}
Start-Throt {
	ForEach ($Item in $Pairs.Keys ) {
		SP -Path $Path -Name $Item -Value $Pairs[$Item]
	}	
} -Name "Approve Shell"	
#
## Adding certain approved extentions
# 

Start-Throt {
	$PairsA	= "{DDE4BEEB-DDE6-48fd-8EB5-035C09923F83}"="UnlockerShellExtension";
			  "{DEBB9B79-B3DD-47F4-9E5C-EA6975BAB611}"="ReflectShellExt extension";
			  <# TEST ADDING BACK IN-PANE SEARCH #>
			  "{169A0691-8DF9-11D1-A1C4-00C04FD75D13}"="{169A0691-8DF9-11D1-A1C4-00C04FD75D13}"
	$PathA	= "HKLM:\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved"	
	ForEach ($Item in $PairsA.Keys) {
		SP -Path $PathA -Name $Item -Value $PairsA[$Item]
	}
	$Hex	= ([byte[]](0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xd1,0x4e,0x74,0xec,0x3e,0x4a,0xd9,0x01))
	$PairsP	= "{E37E2028-CE1A-4F42-AF05-6CEABC4E5D75}"={"000214FA-0000-0000-C000-000000000046};"0xFFFF"=$Hex;
			  <# Search Folder" #>
			  "{04731B67-D933-450A-90E6-4ACD2E9408FE}"="-"
	$PathP	= "HKCU:\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Cached"	
	ForEach ($Item in $PairsP.Keys) {
		SP -Path $PathP -Name $Item -Value $PairsP[$Item]
	}
} -Name "Approved Exts"
#
## Start Menu
# 
$Path	=	"HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Start"
$Vis	= 	([byte[]](0X44,0x81,0x75,0xFE,0x0D,0x08,0xAE,0x42,0x8B,0xDA,0x34,0xED,0x97,0xB6,0x63,0x94))
Start-Throt {
	SP -Path $Path -Name "ShowRecentList"			-Value 0	-Type DWord
	SP -Path $Path -Name "VisiblePlaces"			-Value $Vis	-Type Binary
} -Name "Start Menu"
#
## Shell switcher
# 
$Path	= "HKCU:\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\Switcher"
$Tail	= "CloseThresholdPercent"
Start-Throt {
	If (!(Test-Path $Path)) {
		NI	$Path
	}
	SP -Path $Path 						"CloseDwellTimeout"	  300
	"Mouse$Tail","Touch$Tail"| % {
		SP 	$Path $_ 			  80  
	}
} -Name "Shell switcher"
#
#
Start-Throt {
# Narrator
	$PathX	= "HKCU:\SOFTWARE\Microsoft\Narrator\NoRoam"
	"DetailedFeedback","ScriptingEnabled"  <# Stop Narrator #>,"WinEnterLaunchEnabled"  <# Disable key combo starting Narrator #>
	| % { SP $PathX $_ 			  0 -T D }
	$PathY	= "HKCU:\Software\Microsoft\LiveCaptions\UI"
	SP $PathY "ProfanityFilterOn" 0 -T D
} -Name Narrator
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
