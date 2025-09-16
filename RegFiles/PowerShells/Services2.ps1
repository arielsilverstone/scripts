

# Change Tracking
If ((Get-ItemProperty "HKCU:\Changes")."Service2.ps1 Changed" ) {
	Start-ThreadJob { RP -Path "HKCU:\Changes" -Name "Service2.ps1 Changed" } -Name "If-RP" 
	}
Start-ThreadJob { SP -Path "HKCU:\Changes" -Name "Service2.ps1 Changed" -Value "26JAN25" }  -Name "Changed"

# Remove per-user processes

# Get-ChildItem
Dir "HKLM:\SYSTEM\CurrentControlSet\Services" |`
	ForEach {
		Get-ItemProperty $_.pspath |`
			Where {$_.userserviceflags -eq 3} |`
# Set-Itemproperty
			SP -name userserviceflags -value 0 |`
			Del -force -Recurse |`
# Format-Table
				FT PSChildName, Type, UserServiceFlags
	}
#
#




	
	
	