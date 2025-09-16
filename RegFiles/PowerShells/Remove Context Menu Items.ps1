##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="RemoveContext"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "11FEB25" | Out-Null
} -Name "$Name.ps1 Changed"
#
#
## Shell and ShellEX Item Removal
#
$Branches      	= 						"\*",
										"\AllFilesystemObjects",
										"\Directory",
										"\Drive",
										"\Folder",
										"\DesktopBackground",
										"\LibraryFolder"
$Backgrounds	= 						"\", `
				  <# #>					"\Background\"
				  
$ShellItems   	= 						"3D Edit", `
				  <# Access Control #>	"ACE", `
										"ANotepad++64", `
										"AnyCode", `
										"Change-passphrase", `
										"Change-pin", `
										"Cmd"
										"Compatibility", ` `
										"CreateRestorePoint", `
										"EditStickers", `
										"encrypt-bde", `
										"encrypt-bde-elev", `
										"EncryptionMenu", `
				  <# Media Player #>	"Enqueue", `
										"Find", `
										"GrepWin", `
				  <# ImDisk Mounter#>	"ImDiskMountFile", `
										"IntelArcControl", `
										"manage-bde", `
										"NSuDo", `
										"OpenElevatedPS", `
										"pintohome", `
										"Pintohomefile", `
				  <# Media Player #>	"Play", `
										"PowerShell", `
										"PowerShellAsAdmin", `
										"Removeproperties", `
										"resume-bde", `
										"resume-bde-elev", `
										"Shell from Commands", `
										"TakeOwnership", `
										"TaskManager", `
										"unlock-bde", `
										"UpdateEncryptionSettings", `
										"UpdateEncryptionSettingsWork", `
										"WForceDelete", `
										"Windows.EnhancedStorage.Lock", `
										"Windows.EnhancedStorage.Unlock", `
				  <# Windows Linux #>	"WSL"		  
$ShellExItems  	= 						"7-Zip", `
										"CopyAsPathMenu", `
										"CryptoSignMenu", `
				  <# Daemon Tools #>	"DaemonShellExtDriveUltra", `
										"DesktopSlideshow", `
										"EncryptionMenu", `
										"EnhancedStorageShell", `
				  <# Defender #>	 	"EPP", `
				  <# PowerToys #>	 	"FileLocksmithExt", `
				  <# PowerToys #>		"ImageResizer", `
										"Library Location", `
										"Offline Files", `
										"Open With EncryptionMenu", `
										"PinToHome", `
										"PintoStartScreen", `
				  <# PowerToys #>		"PowerRenameExt", `
										"ShellImagePreview", `
										"UnlockerShellExtension", `
										"Windows.EnhancedStorage.Lock", `
										"Windows.EnhancedStorage.Unlock", `
										"WorkFolders"
										
$ShellExCLSIDs	= <# Scan w Defender		#>	"{09A47860-11B0-4DA5-AFA5-26D86198A780}",`
				  <# Group shell context    #>	"{16C2C29D-0E5F-45F3-A445-03E03F587B7D}",`			
				  <# 7Zip 			   		#>	"{23170F69-40C1-278A-1000-000100020000}",`
				  <# NVIDIA Play On My TV	#>  "{3D1975AF-48C6-4f8e-A182-BE0E08FA86A9}",`		
				  <# Pin to Start 			#>	"{470C0EBD-5D73-4d58-9CED-E91E22E23282}",`
				  <# Encryption settings   	#>	"{5B6D1451-B1E1-4372-90F5-88E541B4DAB9}",`
				  <# Burn to CD    			#>	"{596AB062-B4D2-4215-9F74-E9109B0A8153}",`
				  <# Contact Shell Handler  #>	"{8082C5E6-4C27-48EC-A809-B8E1122E8F97}",`	
				  <# Tablet CPL	   			#>  "{80F3F1D5-FECA-45F3-BC32-752C152E456E}",`
				  <# Preview Mime 			#>	"{92DBAD9F-5025-49B0-9078-2D78F935E341}",`		
				  <# Find					#>	"{a015411a-f97d-4ef3-8425-8a38d022aebc}",`		
				  <# C8 Start Menu Pin		#>	"{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}",`
				  <# C9 					#>	"{a2a9545d-a0c2-42b4-9708-a0b2badd77c9}",` 
				  <# Encryption Menu		#>	"(A470F8CF-A1E8-4f65-8335-227475AA5C46)",`
				  <# nVidia CPL				#>	"{A70C977A-BF00-412C-90B7-034C51DA2439}",`
				  <# NvAppShExt 			#>	"{A929C4CE-FD36-4270-B4F5-34ECAC5BD63C}",`			  
				  <# Subscription Mgr"		#>	"{ABBE31D0-6DAE-11D0-BECA-00C04FD940BE}",` 
				  <# WinRAR					#>	"{B41DB860-8EE4-11D2-9906-E49FADC173CA}",`	
				  <# Preview Email			#>	"{B9815375-5D7F-4CE2-9245-C9D4DA436930}",`		
				  <# 7Zip 	 		   		#>	"{BD472F60-27FA-11cf-B8B4-444553540000}",`
				  <# Preview URL			#>	"{BFD468D2-D0A0-4BDC-878C-E69C2F5B435D}",`  
				  <# EnhancedStorage  		#>	"{CC55EE92-FE67-43C9-95E7-E646918A4A04}",`
				  <# .Contact shell  		#>	"{CF67796C-F57F-45F8-92FB-AD698826C602}",`	
				  <# Portable Devices Menu 	#> 	"{D6791A63-E7E2-4fee-BF52-5DED8E86E9B8}",`
<# My Addition #> <# UnlockerShelExt		#>	"{DDE4BEEB-DDE6-48fd-8EB5-035C09923F83}",`
				  <# WorkFolders			#>	"{E61BF828-5E63-4287-BEF1-60B1A4FDE0E3}",`
				  <# WebChecker				#>	"{E6FB5E20-DE35-11CF-9C87-00AA005127ED}",` 
				  <# Burn to CD				#>	"{fbeb8a05-beee-4442-804e-409d6c4515e9}",`
				  <# Subscription Folder	#>	"{F5175861-2688-11D0-9C5E-00AA00A45957}",`
				  <# Pen & Touch CPL        #>  "{F82DF8F7-8B9F-442E-A48C-818EA735FF9B}",`	
				  <# Preview HTML			#>	"{F8B8412B-DEA3-4130-B36C-5E8BE73106AC}" 	

$ShellExSheets 	= "ContextMenuHandlers\","PropertySheetHandlers\","DragDropHandlers\",`
				  "CopyHookHandlers\"
$Manuals 	    = ".ahk\ShellNew","Remove","AutoHotkeyScript",".ahk"
Start-Job -ArgumentList @($Branches,$Backgrounds,$ShellItems,$ShellExSheets,$ShellExItems,$Manuals, `
						  ShellExItems) {
	Param ($Branches,$Backgrounds,$ShellItems,$ShellExSheets,$ShellExItems,$ShellExCLSIDs)
	ForEach ($Branch in $Branches) {
		$BaseHKLM 	= "HKLM:\SOFTWARE\Classes\"+$Branch
		$BaseHKCR 	= "HKCR:\"+$Branch
		$Bases		= $BaseHKLM,$BaseHKCR
		Start-ThreadJob -ArgumentList @($Backgrounds,$Bases,$ShellItems,$ShellExSheets,$ShellExItems, `
										$ShellExCLSIDs) {			
			Param ($Backgrounds,$Bases,$ShellItems,$ShellExSheets,$ShellExItems,$ShellExCLSIDs)
			ForEach ($Background in $Backgrounds ) {
				ForEach ($Base in $Bases) {
					$Combo = $Base$Background
					Start-ThreadJob -ArgumentList @($ShellItems,$Combo)) {					
						Params ($ShellItems,$Combo)
						ForEach ($Item in $ShellItems) {
							$Combo2 = $Combo+"\Shell\"
							Del -Path $Combo2$Item -Recurse -Force -EA 0 | Out-Null
						}
					} -Name "Shell"
					
					$ShellExJoint   = $ShellExItems+$ShellExCLSIDs
					Start-ThreadJob -ArgumentList @($ShellExSheets,$Combo,$ShellExJoint) {		
						Params ($ShellExSheets,$Combo,$ShellExJoint)
						ForEach ($Sheet in $ShellExSheets) {
							ForEach ($Item in $ShellExJoint) {
								$Combo3 = $Combo+"\ShellEx\"
								$Combo4 = $Sheet$Item
								$Combo5 = $Combo3$Combo4
								Del -Path $Combo5  -Recurse -Force -EA 0 | Out-Null
							}
						}
					} -Name "ShellEx"
					
					Start-ThreadJob -ArgumentList @{
						ForEach ($Item in $ShellExCLSIDs) {
							$Combo6 = "HKCR:\CLSID\"+$Item
							Del -Path $Combo6  -Recurse -Force -EA 0 | Out-Null
						}
					} -Name "ShellEx CLSIDs"
				} <# Bases #>
			} <# Backgrounds #>
		}  -Name "Backgrounds"     # End Thread   
	} <# Branches #>
	ForEach ($Manual in $Manuals) {
		$PathX = "HKCR:\"+$Manual
		Del -Path $PathX -Recurse -Force -EA 0 | Out-Null
	}  <# Manuals #>
	
} -Name "Remove Context Menu Items" #End Job

Start-ThreadJob {
	$Others	 = 	"\.library-ms\ShellNew"
	$BDEs	 = 	"Shell\encrypt-bde","encrypt-bde-elev","manage-bde","resume-bde","resume-bde-elev",`
				"unlock-bde"
	ForEach ($Item in $Others) {	
		$Path = "HKCR:\"+$Item
		DEL -Path $Path -Force -Recurse -EA 0 | Out-Null
	} 
	ForEach ($Item in $BDEs) {	
		$Path = "HKCR:\Shell\"+$Item
		DEL -Path $Path -Force -Recurse -EA 0 | Out-Null
	} 
} -Name "Others"

##
		 <#  #> "", `
		 <#  #> "", `
		 <#  #> "", `
		 <#  #> "", `
		 <#  #> "", `
		 <#  #> "", `
		 <#  #> "", `
		 <#  #> "", `
		 <#  #> "", `
		 <# 
Start-ThreadJob {
	ForEach ($Item in $Items) {
		$PathX = $Path+$Item
		DEL -Path $PathX -Force -EA 0 -Confirm 0
	} 
} -Name "remove ones off"	
	


;

;

#>












