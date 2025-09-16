##
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="Main"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "16FEB25" | Out-Null
} -Name "$Name.ps1 Changed" 
#
##
#
#
Start-ThreadJob { $PSScriptRoot/ControlPanel.ps1 }

Start-ThreadJob { $PSScriptRoot/Defender.ps1 
	$PSScriptRoot/Disable-Windows-Defender.ps1 }

Start-ThreadJob { $PSScriptRoot/Desktop.ps1 }

Start-ThreadJob { $PSScriptRoot/Edge.ps1 }

Start-ThreadJob { $PSScriptRoot/Explorer }

Start-ThreadJob { $PSScriptRoot/NewCleanup.ps1 }

Start-ThreadJob { $PSScriptRoot/Power.ps1 }

Start-ThreadJob { $PSScriptRoot/Privacy.ps1 }
Start-ThreadJob { $PSScriptRoot/Search.ps1 }


Start-ThreadJob { $PSScriptRoot/Services.ps1
	$PSScriptRoot/Disable-MiniPorts.ps1 }
	
Start-ThreadJob { $PSScriptRoot/Shell.ps1 }

Start-ThreadJob { $PSScriptRoot/StartIsBack.ps1 }







Start-ThreadJob { $PSScriptRoot/.ps1 }
Start-ThreadJob { $PSScriptRoot/.ps1 }
Start-ThreadJob { $PSScriptRoot/.ps1 }
Start-ThreadJob { $PSScriptRoot/.ps1 }
#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

#
##
#

