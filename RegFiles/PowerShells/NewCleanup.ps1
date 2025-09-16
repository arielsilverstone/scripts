##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="NewCleanup"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "15FEB25" | Out-Null
} -Name "$Name.ps1 Changed"
#
# Powershell setup
Start-ThreadJob { 
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
	#
	Set-PSRepository PSGallery -InstallationPolicy Trusted 
	Install-Module 	 -Name 		PSWindowsAdminCenter 
} -Name "PSGallery"
#			
#Network Section
## Basic Setup
Start-ThreadJob { 
	Set-NetConnectionProfile 	-InterfaceAlias * 		-NetworkCategory 				Private 
	Set-NetTCPSetting 			-SettingName Automatic 	-AutoTuningLevelLocal 			Normal  
	Set-NetOffloadGlobalSetting -NetworkDirect Enabled  -ReceiveSideScaling 			Enabled `
														-ReceiveSegmentCoalescing 		Enabled `
														-TaskOffload 					Enabled `
														-NetworkDirectAcrossIPSubnets	Allowed 
} -Name "Basic"			
#
## Net Adapter Settings
Start-ThreadJob { 
	Set-NetAdapterBinding * -DisplayName "Internet Protocol Version 4 (TCP/IPv4)" -Enabled $True
	Set-NetAdapterBinding * -DisplayName "Internet Protocol Version 6 (TCP/IPv6)" -Enabled $False 
} -Name "Binding"
#	
Start-ThreadJob { 
	Set-NetAdapterChecksumOffload * -IpIPv4Enabled RxTxEnabled  -TcpIpv4Enabled RxTxEnabled `
									-UdpIpv4Enabled RxTxEnabled -TcpIpv6Enabled Disabled
} -Name "Checksum"

Start-ThreadJob { 
	Set-NetAdapterLso * -IPv4Enabled $True -IPv6Enabled $False
	Set-NetAdapterUso * -IPv4Enabled $True -IPv6Enabled $False 
}  -Name "LSO+USO"
#	
### Power
Start-ThreadJob {
	Enable-NetAdapterPowerManagement * -WakeOnMagicPacket -WakeOnPattern -IncludeHidden 
} -Name "AdapterPower"
#	
### SMB
Start-ThreadJob {
	<# Not sure if needed: Install-WindowsFeature FS-SMB1, FS-SMB1-CLIENT, FS-SMB1-SERVER #>	
	Set-SmbServerConfiguration -EnableMultiChannel 1 -RequestCompression 1 -Confirm:$False
	Set-SmbClientConfiguration -EnableMultiChannel 1 -RequestCompression 1 -Confirm:$False
} -Name "SMBs"
#			
### Advanced Settings
Start-ThreadJob { Enable-NetAdapterRss * } -Name "RSS"
Start-ThreadJob { Set-NetAdapterRsc    * -IPv4Enabled $True -IPv6Enabled $False } -Name "RSC"


Start-ThreadJob { 
	Set-NetAdapterAdvancedProperty -Name * -DisplayName "DcbxMode" -DisplayValue "Host in Charge" 
	Set-NetAdapterAdvancedProperty -Name * -RegistryKeyword  "*JumboPacket" -Registryvalue 9014
} -Name "Advanced"
#			
#### RDMA
Start-ThreadJob { Enable-NetAdapterRDMA         -Name * } -Name "RDMA"
Start-ThreadJob { Enable-NetAdapterPacketDirect -Name * } -Name "PacketDirect"
#
#### Hyper-V
Start-ThreadJob { 
	Enable-NetAdapterSRIOV 	-Name *
	Set-NetAdapterSRIOV	   	-Name * -NumVFs 16 -IncludeHidden
} -Name "SR-IOV"
#			
Start-ThreadJob { 
	Enable-NetAdapterVMQ 	-Name * 
	Set-NetAdapterVmq	 	-Name * -Enabled $True
} -Name "VMQ"
#		
Start-ThreadJob { 
	Set-VMHost -VirtualMachineMigrationPerformanceOption SMB
}  -Name "VM SMB"
#
##