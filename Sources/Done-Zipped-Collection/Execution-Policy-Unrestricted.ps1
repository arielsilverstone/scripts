<#
╔══════════════════════════════════════════════════════════════════════════════╗
║                           Set-Unrestricted Function                          ║
║ Filename: Set-Unrestricted.ps1                                               ║
║ Purpose : Sets the ExecutionPolicy to Unrestricted	                        ║
╚══════════════════════════════════════════════════════════════════════════════╝
#>
#
Function Set-Unrestricted {
    Start-Job		 {
        $Registrypaths = @(
            'HKLM:\Software\Policies\Microsoft\Windows\PowerShell',
            'HKLM:\Software\Policies\Microsoft\PowerShellCore'
			'HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell' 
			'HKLM:\SOFTWARE\Microsoft\PowerShellCore\1\ShellIds\Microsoft.PowerShell'
        )

        $Registrypaths | ForEach {
            if (SP -Path $_ -Name 'ExecutionPolicy' -Value 'Unrestricted' -Force -EA 0) {
                Echo "SUCCESS $_" -ForegroundColor Green
            } else {
                Echo "FAILURE $_" -ForegroundColor Red
            }
        }
    }
} -Name "Set-Unrestricted"
#
#
Set-Unrestricted
#
##