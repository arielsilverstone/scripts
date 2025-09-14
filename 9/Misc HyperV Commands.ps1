 
$parameters = @{ `
	AdministrativeAccessPoint = DNS `
	IgnoreNetwork = 192.168.56.0/24 `
	Name = SDNCluster `                    
	Node = "Ben-1","Ben-2","Ben-3","Ben-4","GW-1","GW-2","NC-1","NC-2" `
	StaticAddress = "192.168.0.220","192.168.1.220","192.168.5.220","192.168.6.220","192.168.7.220" `
}
New-Cluster	-AdministrativeAccessPoint DNS -IgnoreNetwork "192.168.56.0/24" -Name "SDNCluster" -Node "Ben-1","Ben-2","Ben-3","Ben-4","GW-1","GW-2","NC-1","NC-2" -StaticAddress "192.168.0.220","192.168.1.220","192.168.5.220","192.168.6.220","192.168.7.220" 

 
Set-ClusterOwnerNode Ben-1
Set-ClusterStorageSpacesDirect -CacheModeHDD ReadWrite -CacheModeSSD WriteOnly -CacheState Enabled 

Enable-ClusterS2D -CacheState Disabled -AutoConfig 1 -SkipEligibilityChecks -Confirm:$false
Set-ClusterS2D -CacheState Enabled -Verbose

Update-StorageProviderCache -DiscoveryLevel Full

New-Volume -FriendlyName "Mirror-3-Vol1" -FileSystem CSVFS_ReFS -StoragePoolFriendlyName "S2DPool" -Size 1GB -ResiliencySettingName Mirror -PhysicalDiskRedundancy 3
 
 
new-cluster	-AdministrativeAccessPoint DNS -IgnoreNetwork "192.168.56.0/24" -Name "SDNCluster" -Node "Ben-1","Ben-2","Ben-3","Ben-4","GW-1","GW-2","NC-1","NC-2" -StaticAddress "192.168.0.220","192.168.1.220","192.168.5.220","192.168.6.220","192.168.7.220" 



New-SelfSignedCertificate -DnsName Ben-1.2300 -CertStoreLocation Cert:\LocalMachine\My -Type Custom -Subject "CN=Ben-1" -TextExtension @( '2.5.29.37={text}1.3.6.1.5.5.7.3.2,1.3.6.1.5.5.7.3.1' ) -KeyUsage DigitalSignature -KeyLength 2048 -NotAfter (Get-Date).AddYears(10) 


# Misc.
$iSCSIs = (Get-NetAdapter -Name "*iSCSI*").Name
$Syncs = (Get-NetAdapter -Name "*Sync*").Name
foreach ($iSCSI in $iSCSIs) {
Set-NetAdapterAdvancedProperty -Name "$iSCSI" -RegistryKeyword "*JumboPacket" -Registryvalue 9014 }
foreach ($Sync in $Syncs) {
Set-NetAdapterAdvancedProperty -Name "$Sync" -RegistryKeyword "*JumboPacket" -Registryvalue 9014  }

Set-NetAdapterAdvancedProperty -Name "Adapter Name" -DisplayName "DcbxMode" -DisplayValue "Host in Charge"


# Cluster Disks

Start-ClusterNode -ClearQuarantine

Set-ClusterQuorum -NodeMajority

(Get-Cluster).QuarantineThreshold=60
(Get-Cluster).QuarantineDuration=3600



# when machine running
$RunAs = (Get-Credential)

Foreach($vm in $VMName) { 	
	Enter-PSSession -VMName $vm  -Credential $RunAs
	Copy \\192.168.0.32\desktop\copy\* * -y 
	D:\Desktop\SIDCHG64-3.0j.exe /F /R /KEY=7rq1f-#R!ZE-g#f4O-tZ
	Exit-PSSession 
}       




#Alternative 

	Invoke-Command -VMName $vm -Credential $RunAs -ScriptBlock {D:\Desktop\SIDCHG64-3.0j.exe /F /R /KEY=7rq1f-#R!ZE-g#f4O-tZ}
	}
	
	


$RunAs = (Get-Credential)

workflow parallelcopy {
  param ([string[]]$VMName)
  foreach -parallel ($VMN in $VMName) {
     InlineScript {
       $NewSess = New-PSSession -vmname $using:vmn -Credential $RunAs
       Copy \\ben\desktop\copy\* * -y  -ToSession $NewSess
	   D:\Desktop\SIDCHG64-3.0j.exe /F /R /KEY="7rq1f-#R!ZE-g#f4O-tZ}"
       Remove-PSSession -Session $NewSess                                          new-psse
     }
  }
}

