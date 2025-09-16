
$VMMachine Read-Host -Prompt 'Hyper-V Machine Name?'

$VMMachine = *
 
Get-VMProcessor * | Set-VMProcessor -CompatibilityForMigrationEnabled $true -ExposeVirtualizationExtensions $true
Get-VM * | Set-VMMemory -DynamicMemoryEnabled $true 
Get-VM * | Set-VMSecurity -VirtualizationBasedSecurityOptOut $true
 
CMD "d:\Program Files\VirtualBox\VBoxManage.exe" modifyvm $VM-Machine --nested-hw-virt=on --hwvirtex=on