#
#
# Remove miniports
#
$Miniports = @( "SWD\MSRRAS\MS_GREMINIPORT",
				"SWD\MSRRAS\MS_AGILEVPNMINIPORT",
				"SWD\MSRRAS\MS_NDISWANIP",
				"SWD\MSRRAS\MS_NDISWANIP6",
				"SWD\MSRRAS\MS_L2TPMINIPORT",
				"SWD\MSRRAS\MS_NDISWANBH",
				"SWD\MSRRAS\MS_PPPOEMINIPORT",
				"SWD\MSRRAS\MS_PPTPMINIPORT",
				"SWD\MSRRAS\MS_SSTPMINIPORT" )
				
ForEach ($Miniport in $Miniports) {
	 $RemoveKey = "HKLM:\SYSTEM\CurrentControlSet\Enum\$Miniport"
	 Disable-PnpDevice -InstanceId $Miniport -Confirm $False -asjob}
#
#
# First, get CD Drive Letter:
$DriveL = (Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType = 5").deviceId
$Path = $DriveL\sources\sxs
Install-WindowsFeature -Name "NetFX3","NetFXServerFeatures" -Source $Path -IncludeAllSubFeature 
#
#
# Shares
#
New-SmbShare Jud22-C -Path C:\ -FullAccess "Everyone"
New-SmbShare Jud22-D -Path D:\ -FullAccess "Everyone"
New-SmbShare Jud22-E -Path E:\ -FullAccess "Everyone"
New-SmbShare Jud22-F -Path F:\ -FullAccess "Everyone"
New-SmbShare Jud22-G -Path G:\ -FullAccess "Everyone"
New-SmbShare Jud22-J -Path J:\ -FullAccess "Everyone"
New-SmbShare Jud22-O -Path O:\ -FullAccess "Everyone"
New-SmbShare Jud22-T -Path T:\ -FullAccess "Everyone"
# 
New-SmbMapping -LocalPath 'B:' -RemotePath '\\192.168.0.123\Baks' -CompressNetworkTraffic $True -GlobalMapping -Persistent $True -UserName admin -Password ttttt1
New-SmbMapping -LocalPath 'H:' -RemotePath '\\192.168.0.123\Software' -CompressNetworkTraffic $True -GlobalMapping -Persistent $True -UserName admin -Password ttttt1
New-SmbMapping -LocalPath 'I:' -RemotePath '\\192.168.0.123\ISOs' -CompressNetworkTraffic $True -GlobalMapping -Persistent $True -UserName admin -Password ttttt1
New-SmbMapping -LocalPath 'U:' -RemotePath '\\192.168.0.123\OneDrive' -CompressNetworkTraffic $True -GlobalMapping -Persistent $True -UserName admin -Password ttttt1
#New-SmbMapping -LocalPath 'Q:' -RemotePath '\\192.168.0.123\RAID01' -CompressNetworkTraffic $True -GlobalMapping -Persistent $True -UserName admin -Password ttttt1
#
# 
#
Enable-Dedupvolume D:
Set-Dedupvolume D: -MinimumFileAgeDays 0 -OptimizeInUseFiles
Start-Dedupjob Optimization D: -asjob
#
#
# Password policy remove complexity requirments
secedit /export /cfg "c:\new.cfg"
((get-content "c:\new.cfg") -replace ('PasswordComplexity = 1', 'PasswordComplexity = 0')) | Out-File c:\new.cfg
secedit /configure /db $env:windir\security\new.sdb /cfg c:\new.cfg /areas SECURITYPOLICY
Rename-Item c:\new.cfg c:\new.cfg.txt
rm c:\new.cfg.txt
#
#
###
$Features = Get-Content -Path $PSScriptRoot\EnableFeaturesList.txt
ForEach ($Feature in $Features)
	{ Install-WindowsFeature -Name $Feature -Online -All -IncludeManagementTools } 
###
$Features = Get-Content -Path $PSScriptRoot\RemoveFeaturesList.txt
ForEach ($Feature in $Features)
	{ Uninstall-WindowsFeature -Name $Feature -Online -All -Confirm $False -IncludeManagementTools -Remove } 
###
$Features = Get-Content -Path $PSScriptRoot\UninstallFeaturesList.txt
ForEach ($Feature in $Features)
	{ Uninstall-WindowsFeature -Name $Feature -Online -All -Confirm $False -IncludeManagementTools } 
###
$Caps = Get-Content -Path $PSScriptRoot\RemoveCaps.txt
ForEach ($Cap in $Caps)
	{ Remove-WindowsCapability -Name $Cap -Online } 
###
$Packages = Get-Content -Path $PSScriptRoot\RemovePkgsList.txt
ForEach ($Package in $Packages)
	{ 	Uninstall-Package -Name $Package -AllVersions -Force } 
###
$Apps = Get-Content -Path $PSScriptRoot\RemoveAppsList.txt
ForEach ($App in $Apps)
	{ {Get-AppxPackage  | where-object {$_.packagename –like $app} | Remove-AppxPackage -Allusers -Confirm $False}} 
###
$ServicesDisabled = Get-Content -Path $PSScriptRoot\DisableServicesList.txt
ForEach ($Service in $ServicesDisabled) 
	{ Set-Service -Name $Service -StartupType Disabled | Stop-Service -nowait } 
###	
$ServicesDel = Get-Content -Path $PSScriptRoot\DeleteServicesList.txt
ForEach ($Service in $ServicesDel) 
	{ sc.exe delete $Service }	
###
$ServicesManual = Get-Content -Path $PSScriptRoot\ManualServicesList.txt
ForEach ($Service in $ServicesManual) 
	{ Set-Service -Name $Service -StartupType Manual | Stop-Service -nowait }
###
$ServicesAuto = Get-Content -Path $PSScriptRoot\AutoServicesList.txt
ForEach ($Service in $ServicesAuto) 
	{ Set-Service -Name $Service -StartupType Automatic | Start-Service }	
#
#
# Remove Garbage lang directories
#
Remove-item -path "c:\windows" -Recurse -Include bcastdvr*.*,*DiagTrack*.*,HelpPane*.*,compat*.*,LicensingUI.EXE,*tpm*.*,*game*.*,*Geo*.*,*telem*.*,*smart*.*,sensor*.*,amdef*.*,MicrosoftEdge*.*,narrator*.*,*bing*.*,InputMethod*.*,af-za,am-et,ar-SA,as-IN,az-latn-az,be-BY,BG-BG,bn-IN,bs-latn-ba,ca-es,ca-Es-VALENCIA,chr-Cher-US,cs-CZ,cy-gb,da-DK,de,de-DE,en-ae,el-GR,es,es-ES,es-MX,et-EE,eu-es,fa-ir,ff-Adlm-SN,fi-FI,fil-PH,fr,fr-CA,fr-FR,fr-ma,ga-IE,gd-gb,gu-IN,gl-es,hi-in,hr-HR,hu-HU,hy-AM,id-id,is-is,it,it-IT,ja-JP,ka-ge,kk-kz,km-KH,kn-IN,ko-KR,kok-IN,ky-KG,lb-LU,lo-LA,lt-LT,lv-LV,mi-NZ,mk-MK,ml-IN,mr-IN,ms-my,mt-MT,my-mm,nb-NO,ne-NP,nl-NL,nn-no,or-IN,pa-IN,PL,pl-PL,pt-BR,pt-PT,quz-PE,ro-RO,ru,ru-RU,si-lk,sk-SK,sl-SI,sl-sl,sq-al,sr-Cyrl-BA,sr-latn-cs,sr-cyrl-rs,sr-Latn-RS,sv-SE,ta-in,ta-lk,te-IN,th-TH,ti-et,tr-TR,tt-RU,ug-CN,uk-UA,ur-PK,uz-Latn-UZ,vi-vn,zh-CN,zh-hk,zh-TW,arm,arm64 -exclude "C:\windows\system32\winevt\*.*" -force
#
#




#
#
#
# Copy Policy Definitions
#
Copy-Item -Path $PSScriptRoot\\Policies\PolicyDefinitions\* -Destination "C:\Windows\Policies\PolicyDefinitions" -Recurse	
#



















#
# For Judea
# Enable-WindowsOptionalFeature -Online -FeatureName WorkFolders-Server -All -limitaccess  -NoRestart
#
# Enable-WindowsOptionalFeature -Online -FeatureName ActiveDirectory-PowerShell All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName DNS-Server-Tools -All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName iSCSITargetServer-PowerShell -All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName "BranchCache" -All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName "FS-BranchCache" -All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName "Containers" -All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName "FS-DFS-Namespace" -All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName "FS-DFS-Replication" -All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName "RSAT-DFS-Mgmt-Con" -All -limitaccess  -NoRestart
# Enable-WindowsOptionalFeature -Online -FeatureName "WDS" -All -limitaccess  -NoRestart	
  
 
 
 
 
