
Function EnableNetworkAdaptersSavePower {
	Write-Output "Enabling Network Adapters Save Power ..."
	$Adapters = Get-NetAdapter -Physical | Get-NetAdapterPowerManagement | Where-Object -FilterScript {$_.AllowComputerToTurnOffDevice -ne "Unsupported"}
	forEach ($Adapter in $Adapters)
	{
		$Adapter.AllowComputerToTurnOffDevice = ""+$E
		$Adapter | Set-NetAdapterPowerManagement
	}
}
