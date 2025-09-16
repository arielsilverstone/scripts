

# Net Adapter Script   
# 11JAN24


Enable-NetAdapterChecksumOffload * 					-TcpIPv4 -UdpIPv4 -IpIPv4 -AsJob
Enable-NetAdapterEncapsulatedPacketTaskOffload * 	-AsJob
Enable-NetAdapterLso * 								-IPv4 -AsJob
Enable-NetAdapterRss * 								-Confirm:$False -AsJob
Enable-NetAdapterUso * 								-IPv4 -AsJob

Set-NetAdapterRdma * 								-Enabled $True -AsJob
Set-NetAdapterSriov * 								-Enabled $True -AsJob
Set-NetAdapterVmq *									-Enabled $True -AsJob

Disable-NetAdapterBinding * 						-ComponentID "ms_tcpip6" -AsJob
Set-NetAdapterBinding *								-ComponentID "ms_netbios"  -AllBindings -IncludeHidden -AsJob  

Set-SmbClientConfiguration -RequestCompression $True -EnableMultiChannel $True -Force -AsJob
Set-SmbServerConfiguration -RequestCompression $True -EnableMultiChannel $True -MaxChannelPerSession 16 -AnnounceServer $True -EnableSMBQUIC $False -Confirm:$False -Force -AsJob


************************************************

#
# Define 2D Array
$Props = @( 
			@("EEE"; "Disabled"),
			@("Advanced EEE";"Disabled"),
			@("Power Saving Mode";"Disabled"),
			@("Shutdown Wake-On-Lan";"Enabled"),
			@("WOL & Shutdown Link Speed";"Not Speed Down"),
			@("Flow Control";"Disabled"),
			@("Gigabit Lite";"Disabled"),
			@("Green Ethernet";"Disabled"),			
			@("Interrupt Moderation";"Disabled"),
			@("Interrupt Moderation Rate";"Rx & Tx Enabled"),
			@("IPv4 Checksum Offload";"Rx & Tx Enabled"),
			@("TCP Checksum Offload (IPv4)";"Rx & Tx Enabled"),
			@("UDP Checksum Offload (IPv4)";"Rx & Tx Enabled"),
			@("Large Send Offload V2 (IPv4)";"Enabled"),
			@("Jumbo Packet";"9014 Bytes"),
			@("Log Link State Event";"Disabled"),
			@("RSS load balancing profile";"NUMAScaling"),
			@("Receive Side Scaling";"Enabled"),
			@("Maximum Number of RSS Processors";"16"),
			@("MaxRSSProcessors";"16"),
			@("Maximum Number of RSS Queues";"8 Queues"),
			@("NumRSSQueues";"8 Queues"),
			@("Priority & VLAN";"Priority & VLAN Disabled"),
			@("Packet Priority & VLAN";"Packet Priority & VLAN Disabled"),
			@("VLAN ID";"0"),
			@("Receive Buffers";"2048"),
			@("Transmit Buffers";"2048"),
			@("Recv Segment Coalescing (IPv4)";"Enabled"),
			@("SR-IOV";"Enabled"),
			@("Virtual Machine Queues";"Enabled"),
			@("Wake on Magic Packet";"Enabled"),
			@("Wake on pattern match";"Enabled")
		  )
#
# Define 2D Array
$Props2 = @( 
			@("802.11a/b/g Wireless Mode";"6. Dual Band 802.11a/b/g"),
			@("802.11n/ac/ax Wireless Mode";"4. 802.11ax"),
			@("Channel Width for 2.4GHz";"Auto"),
			@("Channel Width for 5GHz";"Auto"),
			@("Fat Channel Intolerant";"Disabled"),
			@("Mixed Mode Protection";"RTS/CTS Enabled"),
			@("Preferred Band";"3. Prefer 5GHz band"),
		 	@("ARP offload for WoWLAN";"Enabled"),
			@("NS offload for WoWLAN";"Enabled"),
			@("GTK rekeying for WoWLAN";"Disabled"),
			@("Sleep on WoWLAN Disconnect";"Disabled"),  
			@("MIMO Power Save Mode";"No SMPS"),
			@("Transmit Power";"5. Highest"),
			@("Packet Coalescing";"Enabled"),			  
			@("Roaming Aggressiveness";"1. Lowest"),
			@("Throughput Booster";"Enabled"),
			@("U-APSD support";"Disabled"),
			@("Wake on Magic Packet";"Enabled"),
			@("Wake on Pattern Match";"Enabled")
		   )
		   
$SETP = "Set-NetAdapterAdvancedProperty * -DisplayName "
$SETP2 = "Set-NetAdapterAdvancedProperty -Name 'Wi-Fi*' -DisplayName "
$Minas = " -DisplayValue "
$AsAJob = " -AsJob"

ForEach ($Prop in $Props)
			{ $Command = ForEach ($Prop in $Props) {Write-Host "$SetP" ($Prop[,0]) $Minas ($Prop[,1]) $AsAJob} }	
			
ForEach ($Prop2 in $Props2)
			{ $Command = {ForEach ($Prop2 in $Props2) {Write-Host "$SetP" ($Prop2[,0]) $Minas ($Prop2[,1]) $AsAJob}} }		

			
************************************************

# Standby

# Set-NetAdapterAdvancedProperty * -DisplayName "Advanced EEE" -DisplayValue "Disabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Power Saving Mode" -DisplayValue "Disabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Shutdown Wake-On-Lan" -DisplayValue "Enabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "WOL & Shutdown Link Speed" -DisplayValue "Not Speed Down" -AsJob
# Flow Control is disabled beacause TCP/IP has its own flow control
# Set-NetAdapterAdvancedProperty * -DisplayName "Flow Control" -DisplayValue "Disabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Gigabit Lite" -DisplayValue "Disabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Green Ethernet" -DisplayValue "Disabled" -AsJob
# Consider changing this for 10GB adapters 
# Set-NetAdapterAdvancedProperty * -DisplayName "Interrupt Moderation" -DisplayValue "Disabled" -AsJob
# Consider changing this for 10GB adapters to "Extreme" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Interrupt Moderation Rate" -DisplayValue "Adaptive" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "IPv4 Checksum Offload" -DisplayValue "Rx & Tx Enabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "TCP Checksum Offload (IPv4)" -DisplayValue "Rx & Tx Enabled" -AsJob 
# Set-NetAdapterAdvancedProperty * -DisplayName "UDP Checksum Offload (IPv4)" -DisplayValue "Rx & Tx Enabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Large Send Offload V2 (IPv4)" -DisplayValue "Enabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Jumbo Packet" -DisplayValue "9014 Bytes"  
# Set-NetAdapterAdvancedProperty * -DisplayName "Log Link State Event" -DisplayValue "Disabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "RSS load balancing profile" -DisplayValue "NUMAScaling" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Receive Side Scaling" -DisplayValue "Enabled"\
# Set-NetAdapterAdvancedProperty * -DisplayName "Maximum Number of RSS Processors" -DisplayValue "16" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "MaxRSSProcessors" -DisplayValue "16" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Maximum Number of RSS Queues" -DisplayValue "8 Queues" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "NumRSSQueues" -DisplayValue "8 Queues"  -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Priority & VLAN" -DisplayValue "Priority & VLAN Disabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Packet Priority & VLAN" -DisplayValue "Packet Priority & VLAN Disabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "VLAN ID" -DisplayValue "0" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Receive Buffers" -DisplayValue "2048" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Transmit Buffers" -DisplayValue "2048" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Recv Segment Coalescing (IPv4)" -DisplayValue "Enabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "SR-IOV" -DisplayValue "Enabled"  -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Virtual Machine Queues" -DisplayValue "Enabled" -AsJob
# Set-NetAdapterAdvancedProperty * -DisplayName "Wake on Magic Packet" -DisplayValue "Enabled" -AsJob
#
# Set-NetAdapterAdvancedProperty * -IncludeHidden -AllProperties -RegistryKeyword "PnPCapabilities" -RegistryValue "24" -AsJob
#
#
# Set-NetAdapterAdvancedProperty * -DisplayName "Adaptive Inter-Frame Spacing" -DisplayValue "Disabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "Energy Efficient Ethernet" -DisplayValue "Off"
# Set-NetAdapterAdvancedProperty * -DisplayName "Reduce Speed On Power Down" -DisplayValue "Disabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "System Idle Power Saver" -DisplayValue "Disabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "Ultra Low Power Mode" -DisplayValue "Disabled"
# Power Management Enable = PME - required for Wake On LAN.   My Setting:
# Set-NetAdapterAdvancedProperty * -DisplayName "Enable PME" -DisplayValue "Enabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "Gigabit PHY Mode" -DisplayValue "Auto Detect"
# Set-NetAdapterAdvancedProperty * -DisplayName "Protocol ARP Offload" -DisplayValue "Enabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "Protocol NS Offload" -DisplayValue "Enabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "PTP Hardware Timestamp" -DisplayValue "Enabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "Software Timestamp" -DisplayValue "Disabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "Wake on Link Settings" -DisplayValue "Enabled"
# Set-NetAdapterAdvancedProperty * -DisplayName "Wait for Link" -DisplayValue "off"
# 
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Global BG scan blocking" -DisplayValue "On Good RSSI"
# 
# Disable-NetAdapterBinding -name * -componentid "ms_pacer"	
#
#
# 
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "802.11a/b/g Wireless Mode" -DisplayValue "6. Dual Band 802.11a/b/g" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "802.11n/ac/ax Wireless Mode" -DisplayValue "4. 802.11ax" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Channel Width for 2.4GHz" -DisplayValue "Auto" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Channel Width for 5GHz" -DisplayValue "Auto" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Fat Channel Intolerant" -DisplayValue "Disabled" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Mixed Mode Protection" -DisplayValue "RTS/CTS Enabled" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Preferred Band" -DisplayValue "3. Prefer 5GHz band" -AsJob

# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "ARP offload for WoWLAN" -DisplayValue "Enabled" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "NS offload for WoWLAN" -DisplayValue "Enabled" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "GTK rekeying for WoWLAN" -DisplayValue "Disabled" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Sleep on WoWLAN Disconnect" -DisplayValue "Disabled" -AsJob

# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "MIMO Power Save Mode" -DisplayValue "No SMPS"-AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Transmit Power" -DisplayValue "5. Highest"-AsJob

# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Packet Coalescing" -DisplayValue "Enabled" -AsJob

# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Roaming Aggressiveness" -DisplayValue "1. Lowest" -AsJob

# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Throughput Booster" -DisplayValue "Enabled" -AsJob

# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "U-APSD support" -DisplayValue "Disabled" -AsJob

# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Wake on Magic Packet" -DisplayValue "Enabled" -AsJob
# Set-NetAdapterAdvancedProperty -Name "Wi-Fi*" -DisplayName "Wake on Pattern Match" -DisplayValue "Enabled" -AsJob










