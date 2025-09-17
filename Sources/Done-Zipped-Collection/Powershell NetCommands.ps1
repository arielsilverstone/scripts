#####           Network

## My Defaults


Set-NetConnectionProfile -InterfaceAlias * -NetworkCategory Private


Set-NetTCPSetting -SettingName Automatic -AutoTuningLevelLocal Normal  
Set-NetAdapterBinding -Name * -DisplayName "Internet Protocol Version 4 (TCP/IPv4)" -Enabled $True 
Set-NetAdapterBinding -Name * -DisplayName "Internet Protocol Version 6 (TCP/IPv6)" -Enabled $False

Enable-NetAdapterPowerManagement -Name * -WakeOnMagicPacket -WakeOnPattern -IncludeHidden
Enable-NetAdapterPowerManagement -Name "Ethernet 4" -DeviceSleepOnDisconnect  
Enable-NetAdapterPowerManagement -Name "Ethernet 5" -DeviceSleepOnDisconnect

Set-SmbServerConfiguration -EnableMultiChannel 1 -RequestCompression 1 -Confirm:0
Set-SmbClientConfiguration -EnableMultiChannel 1 -RequestCompression 1 -Confirm:0

Enable-NetAdapterRss -Name Ethernet

Enable-NetAdapterRDMA *
Enable-NetAdapterSRIOV * 
Set-NetAdapterSRIOV * -NumVFs 16 -IncludeHidden
# Problem with -NumQueuePairsForDefaultVPort 2 -NumQueuePairsForNonDefaultVPort 2 
Set-NetAdapterVmq * -Enabled $True
Set-NetAdapterRsc * IPv4Enabled $True -IPv6Enabled $False  

Set-NetOffloadGlobalSetting -NetworkDirect Enabled  -ReceiveSideScaling Enabled -ReceiveSegmentCoalescing Enabled  -TaskOffload Enabled -NetworkDirectAcrossIPSubnets Allowed  
Set-NetAdapterUso * -IPv4Enabled $True -IPv6Enabled $False  # (Offload UDP)
Set-NetAdapterChecksumOffload * -IpIPv4Enabled RxTxEnabled -TcpIpv4Enabled RxTxEnabled -UdpIpv4Enabled RxTxEnabled -TcpIpv6Enabled Disabled
Set-NetAdapterLso * -IPv4Enabled $True -IPv6Enabled $False

Set-NetAdapterAdvancedProperty * -DisplayName "Flow Control" -DisplayValue "Rx and Tx Enabled" -RegistryKeyword "*Flo*rol" -RegistryValue 0
Set-NetAdapterAdvancedProperty Ethernet -RegistryKeyword "*JumboPacket" -Registryvalue 9014 }

Set-VMHost -VirtualMachineMigrationPerformanceOption SMB




# Setup
New-NetIPAddress -InterfaceIndex 12 -IPAddress 192.168.0.1 -PrefixLength 24 -DefaultGateway 192.168.0.254

Set-NetIPInterface -InterfaceAlias "Ethernet 4" -DHCP Disabled

Set-DnsClientServerAddress -InterfaceAlias "Ethernet 4" -ServerAddresses 192.168.0.10


# Remove IP Address
Remove-NetIPAddress -InterfaceAlias "Ethernet 4" -AddressFamily IPv4 -Confirm:$false


# SMB
Set-SmbServerConfiguration -EnableMultiChannel 1 -RequestCompression 1 -Confirm:0
Set-SmbClientConfiguration -EnableMultiChannel 1 -RequestCompression 1 -Confirm:0
	
	
	

# Protocol Binding
Set-NetAdapterBinding -Name "Ethernet" -DisplayName "Internet Protocol Version 4 (TCP/IPv4)" -Enabled $True 

Set-NetAdapterBinding -Name "Ethernet" -DisplayName "Internet Protocol Version 6 (TCP/IPv6)" -Enabled $False


# Power
Enable-NetAdapterPowerManagement -Name "Ethernet" -WakeOnMagicPacket -WakeOnPattern #[-DeviceSleepOnDisconnect] 

# RDMA
Enable-NetAdapterRDMA -Name "Ethernet" -Enabled $True


# SR-IOV 
Enable-NetAdapterSRIOV -Name "Ethernet" -Enabled $True -NumVFs 16 #[-NumQueuePairsForDefaultVPort 2 -NumQueuePairsForNonDefaultVPort 2]


# VMQ
Set-NetAdapterVmq -Name "Ethernet" -Enabled $True
Enable-NetAdapterVMQ *

# RSS - receive side scaling 
Enable-NetAdapterRss *


# RSC - receive segment coalescing        
Set-NetAdapterRsc -Name "Ethernet" IPv4Enabled $True -IPv6Enabled $False  


# Advanced
##	Offloading
	Set-NetOffloadGlobalSetting -NetworkDirect Enabled  -ReceiveSideScaling Enabled
 -ReceiveSegmentCoalescing Enabled  -TaskOffload Enabled -NetworkDirectAcrossIPSubnets Allowed
	# (Offload UDP)
	Set-NetAdapterUso -Name "Ethernet" -IPv4Enabled $True -IPv6Enabled $False   
	Set-NetAdapterChecksumOffload -Name "Ethernet" -IpIPv4Enabled RxTxEnabled -TcpIpv4Enabled RxTxEnabled -UdpIpv4Enabled RxTxEnabled
	
	Set-NetAdapterLso -Name "Ethernet" -IPv4Enabled $True -IPv6Enabled $False
	
##	Properties
	Get-NetAdapterAdvancedProperty
	New-NetAdapterAdvancedProperty
Example:
	# Set-NetAdapterAdvancedProperty -Name Ethernet -DisplayName "Flow Control" -DisplayValue "Rx and Tx Enabled" -RegistryKeyword "*Flo*rol" -RegistryValue 0
	
Example 2:
	Set-NetAdapterAdvancedProperty -Name "$iSCSI" -RegistryKeyword "*JumboPacket" -Registryvalue 9014 }
	
	Get-NetAdapterHardwareInfo
	Get-NetAdapterSriovVf (virtual functions and partitions)


# Misc
Rename-NetAdapter

Set-NetAdapter -IncludeHidden -Name Ethernet .....

Set-NetConnectionProfile -InterfaceAlias "Ethernet1" -NetworkCategory Private


# Switch Teams
New-NetSwitchTeam -Name "SwitchTeam01" -TeamMembers "Ethernet 2","Ethernet 3"



# QoS
Get-NetQosPolicy
Enable-NetAdapterQOS

New-NetQosPolicy "DEFAULT" -store Activestore -Default -PriorityValue8021Action 3 

New-NetQosPolicy "TCP" -store Activestore -IPProtocolMatchCondition TCP -PriorityValue8021Action 1
New-NetQosPolicy "UDP" -store Activestore -IPProtocolMatchCondition UDP -PriorityValue8021Action 1

New-NetQosPolicy "Cluster" -store Activestore -Cluster -Priority 6
Set-NetQosPolicy "Cluster" -IPDstPort 3343  –Priority 6
New-NetQosTrafficClass "Cluster BandWidth" -Algorithm ETS -Priority 6

New-NetQosPolicy "Management" -Default -Priority 2
New-NetQosTrafficClass "Mgt BandWidth" -Algorithm ETS -Priority 2

New-NetQosPolicy -"SCSI" -PolicyStore Activestore -iSCSI -PriorityValue8021Action 2 
New-NetQosTrafficClass "ISCSI BandWidth" -Algorithm ETS -Priority 2

New-NetQosPolicy "SMB" -SMB -PriorityValue8021Action 3 –Priority 3 
New-NetQosTrafficClass "SMB BandWidth" -Algorithm ETS -Priority 3

New-NetQosPolicy "SMBDirect" -store Activestore -NetDirectPortMatchCondition 445 -PriorityValue8021Action 3 
New-NetQosTrafficClass "SMBDirect" -Algorithm ETS -Priority 3
New-NetQosPolicy "RDMA" -NetDirectPortMatchCondition 10000 - PriorityValue8021Action 3

Enable-NetAdapterQos "Name of DCB-capable 10Gbe NIC"

Enable-NetQosFlowControl -Priority 3  3,5


# 
# 
# 
# 
# 
# 