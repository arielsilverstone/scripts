
# Optional 
$VMName = 'Testing Machine 7','Testing Machine 8','Testing Machine 9','Testing Machine 10','Testing Machine 11',
'Testing Machine 12','Testing Machine 13','Testing Machine 14','Testing Machine 15','Testing Machine 16',
'Testing Machine 17','Testing Machine 18','Testing Machine 19','Testing Machine 20','Testing Machine 21',
'Testing Machine 22','Testing Machine 23'


# Create VMs
Foreach($vm in $VMName) {   New-VM 
								-Name $VM 
								-Generation 2 
								-Path "V:\HV Machines\$VM" 
								-DynamicMemory 
									-MemoryMinimumByte 512MB 
									-MemoryMaximumBytes 4GB 
								-Set-VMProcessor $VM -Count 2 
								-SwitchName "ExSwitch" 
								-NewVHDPath "$VMLOC\$VM\$vm.vhdx" 
									-Dynamic 
									-NewVHDSizeBytes 50GB 
								-BootDevice VHD 
								-AutomaticCheckpointsEnabled 1  
									-CheckpointType Production 
								-LockOnDisconnect 0 
								-Reserve 75 
								-Maximum 75 
								-CompatibilityForMigrationEnabled 1 
								-ExposeVirtualizationExtensions 1 
							-asjob
						}


# Boot order
Set-VMFirmware -VMName $vm -FirstBootDevice ((Get-VMFirmware -VMName $vm).BootOrder | Where-Object Device -like *-C*).Device    [ Possible -- HardDiskDrive]
Set-VMFirmware -VMName $vm  -bootOrder  (Get-VMFirmware -VMName $vm ).bootorder[1]
      

# Processor
Set-VMSecurity -VMName $vm -VirtualizationBasedSecurityOptOut $true
Set-VMMemory -VMName $VM -DynamicMemoryEnabled $false
Set-VMNetworkAdapter -VMName $VM -MacAddressSpoofing On
Set-VMProcessor -VMName $VM  -ExposeVirtualizationExtensions $true -CompatibilityForMigrationEnabled $true 


# Display   (Machine must be off)
Set-VMVideo -VMName $vm  -HorizontalResolution 1880 -VerticalResolution 800

# Network
Set-VMNetworkAdapter -VMName $VM -VrssEnabled:$true -VmmqEnabled:$true -VmmqQueuePairs 8


# VMGroups 
## 	Set up New Group
New-VMGroup -Name SDNGroup -GroupType VMCollectionType
## 	Add VM to group
Add-VMGroupMember -Name SDNGroup -VM (get-vm $vm  )



# Add Drives	
## 	Create Differencing disks
1..4 | % { New-VHD -Path "G:\HV\SDN\SDN-Ben-$_\Virtual Hard Disks\SDN-Ben-$_-C.VHD"  -ParentPath "G:\HV\Disks\Ben-C.vhd" -Differencing}

##	Add DVD Drive
Add-VMDvdDrive -VMName $vm -Path $ISOpath

##	Existing Drives
1..4 | % { ADD-VMHardDiskDrive -VMName SDN-Ben-$_ -Path "G:\HV\SDN\SDN-Ben-$_\Virtual Hard Disks\SDN-Ben-$_-C.VHD"}
1..4 | % { ADD-VMHardDiskDrive -VMName SDN-Ben-$_ -Path "G:\HV\SDN\SDN-Ben-$_\Virtual Hard Disks\SDN-Ben-$_-D.VHD"}

##	Display disks
Get-PhysicalDisk | sort-object SlotNumber | select SlotNumber, FriendlyName, Manufacturer, Model, PhysicalSectorSize, LogicalSectorSize | ft


# Restart VMs
Foreach($vm in $VMName) {  Restart-vm -VM $vm -confirm 0 }

# Install windows features
Invoke-Command -VMName $vm -Credential $RunAs -ScriptBlock {Install-WindowsFeature -IncludeManagementTools}


 
# Compare-VM
## Compares a virtual machine and a virtual machine host for compatibility, returning a compatibility report.
#
#
 
 
 
 
 
 
 
 
 