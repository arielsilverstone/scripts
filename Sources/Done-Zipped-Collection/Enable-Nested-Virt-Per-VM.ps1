# run a vm in nexted virt enabled. 

$vmName = Read-Host "Enter VM name"
Set-VMProcessor -VMName $vmName -ExposeVirtualizationExtensions 1 -Count 4
Set-VMFirmware -VMName $vmName -EnableSecureBoot Off

Set-VM -VMName $vmName -CheckpointType Standard -AutomaticCheckpointsEnabled $true

Enable-VMIntegrationService -VMName $vmName -Name "Guest Service Interface"

# do for all current:
# Get-VM | ForEach-Object { Stop-VM -Name $_.Name -Force; Set-VMProcessor -VMName $_.Name -ExposeVirtualizationExtensions $true; ## Start-VM -Name $_.Name }