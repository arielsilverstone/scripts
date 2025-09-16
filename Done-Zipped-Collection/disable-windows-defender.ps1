#   Description:
# This script disables Windows Defender. Run it once (will throw errors), then
# reboot, run it again (this time no errors should occur) followed by another
# reboot.



# Disable Microsoft Defender Exploit Guard network protection
Function DisableNetworkProtection {
	Write-Output "Disabling Network Protection ..."
	if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
	{
		Set-MpPreference -EnableNetworkProtection Disabled
	}
}

# Disable detection for potentially unwanted applications and block them
Function DisablePUAppsDetection {
	Write-Output "Disabling PU Apps Detection ..."
	if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
	{
		Set-MpPreference -PUAProtection Disabled
	}
}

# Disable sandboxing for Microsoft Defender
Function DisableDefenderSandbox {
	Write-Output "Disabling Defender Sandbox ..."
	if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
	{
		setx /M MP_FORCE_USE_SANDBOX 0
	}
}