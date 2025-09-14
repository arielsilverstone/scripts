Start-ThreadJob { 
	$Name="Power"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed" 
	}
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "15FEB25" 
} -Name "$Name.ps1 Changed" | Out-Null


###  					CPU




###  					Processes





###  					Network
## Allow the computer to turn off the network adapters to save power
# 
Function EnableNetworkAdaptersSavePower {
	Write-Output "Enabling Network Adapters Save Power ..."
	$Adapters = Get-NetAdapter -Physical | Get-NetAdapterPowerManagement | Where-Object -FilterScript {$_.AllowComputerToTurnOffDevice -ne "Unsupported"}
	forEach ($Adapter in $Adapters)
	{
		$Adapter.AllowComputerToTurnOffDevice = ""+$E
		$Adapter | Set-NetAdapterPowerManagement
	}
}