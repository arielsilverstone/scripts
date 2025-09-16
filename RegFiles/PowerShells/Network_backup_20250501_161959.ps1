<#
╔════════════════════════════════════════════════════════════════════════════╗
║                            Network.ps1  V. 0.4                             ║
║ File:    Network.ps1                                                       ║
║ Purpose: Configure and manage network settings, components, and features   ║
╚════════════════════════════════════════════════════════════════════════════╝
#>
. .\Functions.ps1
Track-Change -Name "Network"
Manage-Tracing -On

# ********************************* Global Variables
#
$CCS = "HKLM:\System\CurrentControlSet"
$CV  = "HKLM:\Software\Microsoft\Windows\CurrentVersion"
$CVN = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion"
$Pol = "HKLM:\Software\Policies\Microsoft\Windows"
##
## Basic Network Setup
#
## Assign a static IP address to the network interface
$Last = 40
#
##
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 1:   Assign Address                                                      ║
║ Purpose: Configure static IP address and network settings                    ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        $Addy = -Join ("192.168.0.", $Last)	
        New-NetIPAddress -AddressFamily Ipv4 -IPAddress $Addy -PrefixLength 24 -Type Unicast -DefaultGateway 192.168.0.254    
        Set-NetIPAddress -PrefixOrigin Manual -SuffixOrigin Manual
    } catch { Log-Error "Error assigning IP address: $_" }
} -Name "Assign Address"
#
## Network Configurations
#
# Configure basic network settings including profile and TCP settings
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 2:   Basic                                                          ║
║ Purpose: Configure basic network profile and TCP settings               ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        Set-NetConnectionProfile -InterfaceAlias * -NetworkCategory Private
        Set-NetTCPSetting -SettingName Automatic -AutoTuningLevelLocal Normal 
        Set-NetOffloadGlobalSetting -NetworkDirect Enabled -ReceiveSideScaling Enabled -ReceiveSegmentCoalescing Enabled -TaskOffload Enabled -NetworkDirectAcrossIPSubnets Allowed
    } catch { Log-Error "Error in basic network configurations: $_" }
} -Name "Basic"
#
##Net Adapter Settings
## Enable/disable IPv4 and IPv6 on network adapter
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 3:   Binding                                                            ║
║ Purpose: Configure IPv4 and IPv6 network adapter bindings                    ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        Set-NetAdapterBinding * -DisplayName "Internet Protocol Version 4 (TCP/IPv4)" -Enabled $True 
        Set-NetAdapterBinding * -DisplayName "Internet Protocol Version 6 (TCP/IPv6)" -Enabled $False
    } catch { Log-Error "Error setting network adapter bindings: $_" }
} -Name "Binding"
##
# Configure checksum offloading and large send offload settings
##
Start-Throt {
    try {
        Set-NetAdapterChecksumOffload * -IpIPv4Enabled RxTxEnabled -TcpIpv4Enabled RxTxEnabled -UdpIpv4Enabled RxTxEnabled -TcpIpv6Enabled Disabled
        Set-NetAdapterLso * -IPv4Enabled $True -IPv6Enabled $False
        Set-NetAdapterUso * -IPv4Enabled $True -IPv6Enabled $False 
    } catch { Log-Error "Error configuring network adapter offloads: $_" }
} -Name "Offloads"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 4:   Net Power                                                        ║
║ Purpose: Enable network adapter power management settings                  ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        Enable-NetAdapterPowerManagement * -WakeOnMagicPacket 1 -WakeOnPattern 1 -DeviceSleepOnDisconnect Disabled -IncludeHidden
    } catch { Log-Error "Error in network power management settings: $_" }
} -Name "Power"	
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 5:   SMB                                                              ║
║ Purpose: Configure SMB settings for server and client                     ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        Set-SmbServerConfiguration -EnableMultiChannel 1 -RequestCompression 1 -Confirm:$false
        Set-SmbClientConfiguration -EnableMultiChannel 1 -RequestCompression 1 -Confirm:$false
    } catch {
        Log-Error "Error configuring SMB settings: $_"
    }
} -Name "SMB"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 6:   Network Power                                                  ║
║ Purpose: Configure network adapter power management settings            ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        Set-NetAdapterPowerManagement * -SelectiveSuspend Disabled -WakeOnMagicPacket Enabled -WakeOnPattern Enabled -IncludeHidden
        Enable-NetAdapterPowerManagement * -WakeOnMagicPacket 1 -WakeOnPattern 1 -DeviceSleepOnDisconnect Disabled -IncludeHidden
    } catch { Log-Error "Error in network power management settings: $_" }
} -Name "Power"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 7:   QoS                                                            ║
║ Purpose: Enable network adapter Quality of Service                      ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-ThreadJob {
	Enable-NetAdapterQoS
	
} -Name "QoS"	
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 8:   RDMA                                                             ║
║ Purpose: Enable RDMA and PacketDirect features on adapters               ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        Enable-NetAdapterRDMA -Name *
        Enable-NetAdapterPacketDirect -Name *
    } catch { Log-Error "Error enabling RDMA and PacketDirect: $_" }
} -Name "RDMA"
#
##Hyper-V - Enable and configure SR-IOV on network adapters
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 9:   SRIOV                                                            ║
║ Purpose: Enable and configure SR-IOV on network adapters                ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        Enable-NetAdapterSRIOV *
        Set-NetAdapterSRIOV * -NumVFs 16 -IncludeHidden
    } catch {
        Log-Error "Error configuring SR-IOV: $_"
    }
} -Name "SRIOV"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 10:  VMQ                                                              ║
║ Purpose: Enable Virtual Machine Queue settings on network adapters        ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        Set-NetAdapterVmq * -Enabled $True
        Enable-NetAdapterVMQ *
    } catch {
        Log-Error "Error configuring VMQ: $_"
    }
} -Name "VMQ"
		
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 11:  VMHost                                                           ║
║ Purpose: Configure VM host migration performance settings                 ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
# Start-ThreadJob { 
# 	Set-VMHost -VirtualMachineMigrationPerformanceOption SMB
# } -Name "VMHost" | Out-Null
##
##Advanced Settings
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 12:  RSC                                                              ║
║ Purpose: Configure Receive Segment Coalescing and RSS settings           ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-ThreadJob { 
	Enable-NetAdapterRss *
	Set-NetAdapterRsc * -IPv4Enabled $True -IPv6Enabled $False  
} -Name "RSC"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 13:  Advanced Properties                                              ║
║ Purpose: Configure network adapter advanced settings                      ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-ThreadJob { 
	Set-NetAdapterAdvancedProperty -name * -DisplayName "DcbxMode" -DisplayValue "Host in Charge"
	Set-NetAdapterAdvancedProperty -name "Ethernet 13" -RegistryKeyword "*JumboPacket" -Registryvalue 9014 
} -Name "Adv Prop" | Out-Null	
#
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 14:  Disable-MiniPorts                                                ║
║ Purpose: Disable RAS and VPN miniport adapters                          ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$MiniPorts = "AGILEVPNMINIPORT","GREMINIPORT","L2TPMINIPORT","NDISWANBH","NDISWANIP", `
			 "NDISWANIPV6","PPPOEMINIPORT","PPTPMINIPORT","SSTPMINIPORT"
Start-Throt {
	ForEach ($MiniPort in $MiniPorts) {
		$Path = JP $CCS "Enum\SWD\MSRRAS\MS_" $MiniPort
		SP -Path $Path -Name "ConfigFlags" -Value 0 -EA 0 | Out-Null
	}
} -Name "Disable-MiniPorts"

<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 15:  Networks Private                                                 ║
║ Purpose: Set unknown networks to private category                         ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$NetworkSignatures = "10000000F0000F0C967A3100603AD745950DA7859329176EF5B87C875FA32DF219511000E807D7C24",`
		  "32000000F0000F0ABA0226324032107D469B778399BF3083A7EBB37586084F5B7A71A633E24B5AF","80000000F0000F04407FBA8F35F2D908A79CA8FF0EC5F395B8F008232F9AD518FCC9E5BEE5F4C25","80000000F0000F0F2CE0D3289DA55493A0F5834184C9100E61003AB294E095F3FEC308D1BD81E605"
$NetworkProperties = "CategoryReadOnly","","IconReadOnly","NameReadOnly","NetworkName"
Start-ThreadJob {
	ForEach ($Signature in $NetworkSignatures) {
		$Path = JP "$Pol NT" "CurrentVersion\NetworkList\Signatures\010103000F0000F00" $Signature
		ForEach ($Property in $NetworkProperties) {
			SP -Path $Path -Name $Property 		-Value 0 
		}
		SP -Path $Path 	   -Name "Category" -Value 1 
	}
}-Name "Nets Private"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 16:  Cell Access                                                      ║
║ Purpose: Configure cellular data access for applications                  ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$Apps = "","_UserInControlOfTheseApps","_ForceAllowTheseApps","_ForceDenyTheseApps"
Start-ThreadJob {
	$Path = JP $Pol "WwanSvc\CellularDataAccess"
	ForEach ($Item in $Apps) {
		$Name = JP "LetAppsAccessCellularData" $Item
		SP -Path $Path -Name $Name    	-Value 0 
	}
} -Name "Cell Access"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 17:  NetCache                                                       ║
║ Purpose: Configure offline files sync and caching settings              ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
	$Path 	= JP $Pol "NetCache"
	$BS		= "BackgroundSync"
	$Pairs1 = @{
	    "$BSBlockOutDurationMin" = 8;
	    "$BSBlockOutStartTime" = 32;
	    "$BSEnabled" = 1;
	}
	$Pairs2 = @{
	    'noconfigcache' = '-'
	    'nomakeavailableoffline' = '-'
	    'ExcludeExtensions' = '*.lnk;*.tmp;*.log;*.temp;*.crdownload'
	}

	# Apply settings
	ForEach ($Item in $Pairs1.Keys) {
		SP -Path $Path -Name $Item -Value $Pairs1[$Item]
	}

	# Apply additional settings
	ForEach ($Item in $Pairs2.Keys) {
		SP -Path $Path -Name $Item -Value $Pairs2[$Item]
	}
} -Name "NetCache"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 18:  NetCache Offline                                               ║
║ Purpose: Configure offline folder paths and sync parameters              ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
	# Configure offline folders and slow link parameters
	SP -Path (JP $Pol "NetCache\AssignedOfflineFolders")	-Name "\\\\msi\\d$\\Desktop"	-Value ""
	SP -Path (JP $Pol "NetCache\SlowLinkParams") 			-Name "*"						-Value "Throughput=10000,Latency=50"
} -Name "NetCache-Offline"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 19:  Internet Settings                                               ║
║ Purpose: Configure Internet and browser security settings                ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$Path 	= JP $Pol "CurrentVersion\Internet Settings"
$Pairs3 = @{
    "CertificateRevocation" = 1;
    "CallLegacyWCMPolicies" = 1;
    "DisableCachingOfSSLPages" = 0;
    "EnableNegotiate" = 1;
    "EnablePunyCode" = 1;
    "EnableSSL3Fallback" = 1;
    "MaxConnectionsPer1_0Server" = 32;
    "MaxConnectionsPerServer" = 32;
    "MigrateProxy" = 1;
    # Set Internet printing defaults
    "PageOrientation" = 1;
    "PaperSize" = 1;
    "PreventIgnoreCertErrors" = 1;
    "PrivacyAdvanced" = 1;
    "PrintQuality" = 0;
    "ProxyEnable" = 0;
    "Security_HKLM_only" = 0;  # Don't use ONLY HKLM security Zone levels
    "TcpAutotuning" = 1;
    "WarnOnIntranet" = 0;
    "WarnOnZoneCrossing" = 0;
}
Start-ThreadJob {
	ForEach ($Item in $Pairs3.Keys) {
		SP -Path $Path -Name $Item	-Value $Pairs3[$Item]	
	}
} -Name "Inet Settings"
##
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 20:  Internet Settings 2                                              ║
║ Purpose: Configure additional Internet and browser settings               ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$Paths	= "HKLM:\SOFTWARE\Wow132Node","HKLM:\SOFTWARE"
$Tail	= "Microsoft\Windows\CurrentVersion\Internet Settings"
$Pairs4 = @{
    "CertificateRevocation" = 1;
    "DisableCachingOfSSLPages" = 0;
    "EnableNegotiate" = 1;
    "EnablePunycode" = 1;
    "MaxConnectionsPer1_0Server" = 20;
    "MaxConnectionsPerServer" = 20;
    "PrivacyAdvanced" = 1;
    "ProxyEnable" = 0;
    "SecureProtocols" = 10240;
    "TcpAutotuning" = 1
}
$Pairs5 = @{
    # 0 = Local Machine Zone
    # 1 = Local Intranet Zone
    # 2 = Trusted sites Zone
    # 3 = Internet Zone
    # 4 = Restricted Sites Zone
    "http" = 3;
    "https" = 3;
    "ftp" = 3;
    "file" = 0;
    "shell" = 0;
    "knownfolder" = 0;
    "@ivt" = 1;
}

Start-Throt {
	ForEach ($Path in $Paths) {
		$PathX = JP $Path $Tail
		ForEach ($Item in $Pairs4.Keys) {
			SP 	-Path $PathX					-Name $Item				-Value $Pairs4[$Item]	
		}
		SP 		-Path $PathX					-Name "ActiveXCache"	-Value "D:\Temp"
		SP 		-Path (JP $PathX "Cache\Paths")	-Name "Directory"		-Value "D:\Temp"
		SP 		-Path (JP $PathX "WinHTTP")		-Name "TcpAutotuning"	-Value 1				
	}
	$PathY	= JP "HKCU:\Software" $Tail "ZoneMap\ProtocolDefaults"
	ForEach ($Item in $Pairs5.Keys) {
		SP 		-Path $PathY 					-Name $Item				-Value $Pairs5[$Item]	
	}
	$PathZ	= JP "HKCU:\Software" $Tail "Zones"
	"SelfHealCount"=1
	SP 			-Path $PathZ 					-Name "SelfHealCount"	-Value 1 				
} -Name "Inet Settings 2"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 21:  Interfaces                                                      ║
║ Purpose: Clean up and remove unused network interfaces                   ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$Path		= "HKLM:\SYSTEM\CurrentControlSet\Control\NetworkSetup2\Interfaces"
$Interfaces	= @("{07374750-E68B-490E-9330-9FD785CD71B6}",
				"{2EE2C70C-A092-4D88-A654-98C8D7645CD5}",
				"{93123211-9629-4E04-82F0-EA2E4F221468}",
				"{D58CF048-611B-4812-A6FC-26D6106086E3}",
				"{C13C1F5C-DDC1-426B-939F-0E4684C3DD87}"		)
Start-ThreadJob {
	ForEach ($Interface in $Interfaces) {
        $InterfacePath = Join-Path -Path $Path -ChildPath $Interface
		If (Test-Path -Path $InterfacePath) {
			Del -Path $InterfacePath -Recurse
		}
	}
} -Name "Interfaces"          #EndJob
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 22:  WinRM                                                            ║
║ Purpose: Configure WinRM service and remote shell settings              ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        $Path = JP $Pol "WinRM\Service\WinRS"
        $Pairs = @{
            "AllowRemoteShellAccess" = 1;
            "MaxConcurrentUsers" = 100;
            "MaxShellsPerUser" = 120
        }
        ForEach ($Item in $Pairs.Keys) {
            SP -Path $Path -Name $Item -Value $Pairs[$Item] 
        }
    } catch { Log-Error "Error configuring WinRM settings: $_" }
} -Name "WinRM"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 23:  Network List                                                   ║
║ Purpose: Configure network list policies and WiFi hotspot settings      ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$Path 	= "HKCU:\Software\Classes\Local Settings\MuiCache\83\417C44EB"
Start-Throt {
	SP $Path "@C:\\Windows\\System32\\nlmgp.dll,-200" "Network List Manager Policies"
	$PathX 	= "HKLM:\Software\Microsoft\PolicyManager\Default\WiFi"
	$Joint1	= Join-Path $PathX "AllowWiFiHotSpotReporting"
	$Joint2	= Join-Path $PathX "AllowAutoConnectToWiFiSenseHotspots"
	
	$Joint1,$Joint2 | % {
		SP	$_	"Value"	0		
	}
} -Name "Network List"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 24:  SNMP                                                           ║
║ Purpose: Configure SNMP communities and parameters                      ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$Path 	= "HKLM:\Software\Policies\SNMP\Parameters\ValidCommunities"
$Names	= "2300","Local"
Start-Throt {
	$Names | % {
		SP 	$Path	$_				10
	}
} -Name "SNMP Communities"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 25:  iSCSI                                                              ║
║ Purpose: Configure iSCSI initiator service and settings                    ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    try {
        $Path 	= JP $Pol "iSCSI"
        $Names 	= ("ChangeIQNName","RestrictAdditionalLogins","RequireIPSec","RequireMutualCHAP","RequireOneWayCHAP")
        $Names | % {
            SP 	$Path	$_	0
        }
    } catch { Log-Error "Error configuring iSCSI settings: $_" }
} -Name "iSCSI"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 26:  Network Connections                                              ║
║ Purpose: Configure network connection naming and settings                 ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
$Path 	= JP $Pol "Network Connections"
$Names	= "NC_RenameAllUserRasConnection","NC_RenameConnection","NC_RenameLanConnection"
Start-Throt {
	$Names | % {
		SP 	$Path	$Name						1
	}
	SP 		$Path	"NC_PersonalFirewallConfig"	0
} -Name "Net Conn"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 27:  Congestion Control                                             ║
║ Purpose: Configure TCP congestion control settings                      ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
	$PathX	= JP $CCS "Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}"

	# Key Endings
	$Zero		= JP $PathX "0"
	$20Six		= JP $PathX "26"
	# the "01" in place 6 (7th location) is ECN=on
	$Begin0 	= "([Byte[](0x00,0x00,0x01,0x01,0x00,0x00,0x01,"
	$Begin26	- "([Byte[](0x00,0x00,0x00,0x00,0x00,0x00,0xff,"
	$Mid1		= "0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x1e,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,`
				   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,`
				   0x00,0x00,0x00,0x"
	$After0		= "0xff,0xff,"
	$After26	= "0x00,0x00,"
	$Mid2		= "0x00,0xff,0xff,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00,`
				   0x00,0x00,0x00,0x00,0x00,0x"
	$End		= "0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))"	
	
	#Sums	
	$Total1		= JP $Begin0	$Mid1	$After0		$Mid2	"0xff"	$End
	$Total2		= JP $Begin26	$Mid1	$After26	$Mid2	"0x00"	$End
	$Total3		= ([Byte[]](0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x00,`
							0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff,0x00,0x00,0x00,`
							0x00,0x00,0x00,0x00))
							
	SP	$Zero	"200"		$Total1	
	SP	$Zero	"1700"		$Total2
	
	# Turns on CTCP congestion Control (netsh int tcp set supplemental custom congestionprovider = ctcp)
	SP	$20Six	"00000000"	$Total3
	SP	$20Six	"04000000"	$Total3
} -Name "Congestion Control"
#

	$Joint1,$Joint2 | % {
		SP	$_	"Value"	0		
	}
} -Name "Network List"
#
# [-HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition\IPHTTPS]
# The below causes spooler not to run.
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 28:  Congestion Control                                                  ║
║ Purpose: Configure network congestion control settings                        ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    # Congestion control settings
    $congestionSettings = @{
        "EnableCongestionControl" = 1
        "EnableECN" = 1
        "EnableTCPChimney" = 0
        "EnableRSS" = 1
    }

    foreach ($setting in $congestionSettings.GetEnumerator()) {
        TPSP -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Name $setting.Key -Value $setting.Value -EA 0
    }
} -Name "CongestionControl"
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 29:  NetCache                                                       ║
║ Purpose: Configure offline files sync and caching settings              ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    # Define the NetCache settings
    $NetCacheSettings = @{
        "BackgroundSyncBlockOutDurationMin" = 800
        "BackgroundSyncBlockOutStartTime" = 2000
        "BackgroundSyncEnabled" = 1
        "BackgroundSyncEnabledForForcedOffline" = 1
        "BackgroundSyncIgnoreBlockOutAfterMin" = 0
        "BackgroundSyncMaxStartMin" = 60
        "BackgroundSyncPeriodMin" = 360
        "EconomicalAdminPinning" = 1
        "Enabled" = 1
        "EncryptCache" = 0
        "EventLoggingLevel" = 0
        "ExcludeExtensions" = "*.lnk;*.tmp;*.log;*.temp;*.crdownload"
        "GoOfflineAction" = 0
        "NoCacheViewer" = 0
        "noconfigcache" = $null
        "nomakeavailableoffline" = $null
        "NoReminders" = 1
        "OnlineCachingLatencyThreshold" = 100
        "PeerCachingLatencyThreshold" = 80
        "SlowLinkEnabled" = 1
        "SlowLinkSpeed" = 1000000
        "SyncEnabledForCostedNetwork" = 1
        "SyncAtLogoff" = 0
        "SyncAtLogon" = 0
        "SyncAtSuspend" = 0
        "WorkOfflineDisabled" = 0
    }

    # Set the NetCache settings for HKLM
    foreach ($name in $NetCacheSettings.Keys) {
        $value = $NetCacheSettings[$name]
        TPSP -Path "HKLM:\Software\Policies\Microsoft\Windows\NetCache" -Name $name -Value $value -EA 0
    }
} -Name "ApplyNetCacheSettings"



# ********************************* End Networking
#
##
#

"HKLM:\Software\Policies\Microsoft\Windows\Wireless\NetCost"


# ********************************* Network Components Management
#
<#
╔═════════════════════════════════════════════════════════════════════════╗
║                                                 Function 1: Get-NetworkComponents ║
║ Purpose: List all network-related Windows features and their current state                ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
function Get-NetworkComponents {
    Start-Throt {
        try {
            # Get all network-related components
            $netComponents = Get-WindowsOptionalFeature -Online | 
                Where-Object { $_.FeatureName -like "*Network*" -or 
                              $_.FeatureName -like "*Net*" } |
                Select-Object @{Name='Name';Expression={$_.FeatureName}}, State

            # Save to output file
            $outputPath = "d:\Desktop\trea\net_components.txt"
            $netComponents | Format-Table -AutoSize | Out-File $outputPath -Force
            Write-Host "Network components saved to: $outputPath"
        } catch {
            Log-Error "Error getting network components: $_"
        }
    } -Name "Get-NetworkComponents"
}

<#
╔═══════════════════════════════════════════════════════════════════════════╗
║ Function: Disable-NetworkFeatures                                         ║
║ Purpose: Disable specific network-related Windows features                ║
╚═══════════════════════════════════════════════════════════════════════════╝
#>
function Disable-NetworkFeatures {
    Start-Throt {
        try {
            $networkFeatures = @(
                "NetworkVirtualization",
                "NetworkControllerTools",
                "NetworkDeviceEnrollmentServices",
                "NetworkController",
                "NetworkLoadBalancingFullServer",
                "NetworkLoadBalancingManagementClient",
                "NetworkATC"
            )

            foreach ($feature in $networkFeatures) {
                Write-Host "Disabling: $feature"
                Disable-WindowsOptionalFeature -Online -FeatureName $feature -NoRestart
            }
        } catch {
            Log-Error "Error disabling network components: $_"
        }
    } -Name "Disable-NetworkComponents"
}

<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 26:  Network Connections                                            ║
║ Purpose: Configure network connection settings and policies             ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    # Network Connection settings
    $networkSettings = @{
        "NC_AllowNetBridge" = 0
        "NC_AllowAdvancedTCPIPConfig" = 0
        "NC_ShowSharedAccessUI" = 0
        "NC_ShowLANProperties" = 1
    }

    foreach ($setting in $networkSettings.GetEnumerator()) {
        TPSP -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Name $setting.Key -Value $setting.Value -EA 0
    }
} -Name "NetworkConnectionSettings"

<#
╔═════════════════════════════════════════════════════════════════════════╗
║ Job 27:  Congestion Control                                            ║
║ Purpose: Configure network congestion control settings                  ║
╚═════════════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    # Congestion control settings
    $congestionSettings = @{
        "EnableCongestionControl" = 1
        "EnableECN" = 1
        "EnableTCPChimney" = 0
        "EnableRSS" = 1
    }

    foreach ($setting in $congestionSettings.GetEnumerator()) {
        TPSP -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Name $setting.Key -Value $setting.Value -EA 0
    }
} -Name "CongestionControl"
<#
╔═══════════════════════════════════════════════════════════════════╗
║ Job 24:  Cleanup                                                        ║
║ Purpose: Remove old network settings and configurations                  ║
╚═══════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    $paths = @(
        "HKLM:\Software\Policies\Microsoft\Windows\iSCSI",
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network",
        "HKLM:\Software\Policies\Microsoft\Windows\Network Connections",
        "HKLM:\Software\Policies\Microsoft\Windows NT\CurrentVersion\Network\Persistent Connections",
        "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost"
    )
    foreach ($p in $paths) {
        Remove-Item -Path $p -Recurse -Force -ErrorAction SilentlyContinue
    }
} -Name "Cleanup-NetworkKeys"

<#
╔═══════════════════════════════════════════════════════════════════╗
║ Job 25:  NetCache                                                       ║
║ Purpose: Configure offline files sync and caching settings              ║
╚═══════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    # Define the NetCache settings
    $NetCacheSettings = @{
        "BackgroundSyncBlockOutDurationMin" = 800
        "BackgroundSyncBlockOutStartTime" = 2000
        "BackgroundSyncEnabled" = 1
        "BackgroundSyncEnabledForForcedOffline" = 1
        "BackgroundSyncIgnoreBlockOutAfterMin" = 0
        "BackgroundSyncMaxStartMin" = 60
        "BackgroundSyncPeriodMin" = 360
        "EconomicalAdminPinning" = 1
        "Enabled" = 1
        "EncryptCache" = 0
        "EventLoggingLevel" = 0
        "ExcludeExtensions" = "\"*.lnk\";\"*.tmp\";\"*.log\";\"*.temp\";\"*.crdownload\""
        "GoOfflineAction" = 0
        "NoCacheViewer" = 0
        "noconfigcache" = $null
        "nomakeavailableoffline" = $null
        "NoReminders" = 1
        "OnlineCachingLatencyThreshold" = 100
        "PeerCachingLatencyThreshold" = 80
        "SlowLinkEnabled" = 1
        "SlowLinkSpeed" = 1000000
        "SyncEnabledForCostedNetwork" = 1
        "SyncAtLogoff" = 0
        "SyncAtLogon" = 0
        "SyncAtSuspend" = 0
        "WorkOfflineDisabled" = 0
    }

    # Set the NetCache settings for HKLM
    foreach ($name in $NetCacheSettings.Keys) {
        $value = $NetCacheSettings[$name]
        TPSP -Path "HKLM:\Software\Policies\Microsoft\Windows\NetCache" -Name $name -Value $value -EA 0
    }
} -Name "ApplyNetCacheSettings"

<#
╔═══════════════════════════════════════════════════════════════════╗
║ Job 24:  Cleanup                                                        ║
║ Purpose: Remove old network settings and configurations                  ║
╚═══════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    $paths = @(
        "HKLM:\Software\Policies\Microsoft\Windows\iSCSI",
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network",
        "HKLM:\Software\Policies\Microsoft\Windows\Network Connections",
        "HKLM:\Software\Policies\Microsoft\Windows NT\CurrentVersion\Network\Persistent Connections",
        "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost"
    )
    foreach ($p in $paths) {
        Remove-Item -Path $p -Recurse -Force -ErrorAction SilentlyContinue
    }
} -Name "Cleanup-NetworkKeys"

<#
╔═══════════════════════════════════════════════════════════════════╗
║ Job 26:  Network Connections                                            ║
║ Purpose: Configure network connection settings and policies             ║
╚═══════════════════════════════════════════════════════════════════╝
#>
Start-Throt {
    # Network Connection settings
    $networkSettings = @{
        "NC_AllowNetBridge" = 0
        "NC_AllowAdvancedTCPIPConfig" = 0
        "NC_ShowSharedAccessUI" = 0
        "NC_ShowLANProperties" = 1
    }

    foreach ($setting in $networkSettings.GetEnumerator()) {
        TPSP -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Name $setting.Key -Value $setting.Value -EA 0
    }
} -Name "NetworkConnectionSettings"



# ********************************* End of File
#
##
#
