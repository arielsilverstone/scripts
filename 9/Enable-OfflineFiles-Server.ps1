###############################################################################
# File: Enable-OfflineFiles-Server.ps1                                        #
# Purpose:   Enable CSC (Offline Files) on Server with stability policies     #
###############################################################################
# Section 1: Global VARs and Configurations                                   #
###############################################################################
#
$PolicyKeyHKLM = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetCache'
$CSC           = 'CscService'
#
###############################################################################
# Section 2: Functions                                                        #
###############################################################################
# Function 2.1: Ensure-RegistryDword                                          #
# Purpose: Set or create a policy DWORD value safely                          #
###############################################################################
#
function Ensure-RegistryDword {
    
    param(
         [Parameter(Mandatory)][string] $Path,
         [Parameter(Mandatory)][string] $Name,
         [Parameter(Mandatory)][int]    $Value
    )

    # If the registry key does not exist, create it
    if (-not (Test-Path -Path $Path)) {
         NI -Path $Path -Force | Out-Null
    }

 
    $existing = (Get-ItemProperty -Path $Path -EA 0 |
                 Select -ExpandProperty $Name -EA 0)

    # If the DWORD is missing or has a different value, write/update it
    if ($null -eq $existing -or $existing -ne $Value) {
         $prop = Get-ItemProperty -Path $Path -EA 0

         # Ensure correct type even if an old value exists with a wrong type
         if ($prop.PSObject.Properties.Match($Name).Count -gt 0) {
              Remove-ItemProperty -Path $Path -Name $Name -EA 0
         }
         New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null
    }
}
#
###############################################################################
# Section 3: Apply Policies and Enable Service                                #
###############################################################################
#
# Enable Offline Files through policy (machine-wide)
Ensure-RegistryDword -Path $PolicyKeyHKLM -Name 'Enabled'             -Value 1

# Configure background sync behaviors (logon/logoff/suspend) and lock down user config
Ensure-RegistryDword -Path $PolicyKeyHKLM -Name 'SyncAtLogon'         -Value 0
Ensure-RegistryDword -Path $PolicyKeyHKLM -Name 'SyncAtLogoff'        -Value 0
Ensure-RegistryDword -Path $PolicyKeyHKLM -Name 'SyncAtSuspend'       -Value 0
Ensure-RegistryDword -Path $PolicyKeyHKLM -Name 'BackgroundSync'      -Value 1
Ensure-RegistryDword -Path $PolicyKeyHKLM -Name 'NoConfigAtUserLevel' -Value 0

# Obtain the Offline Files service object
$svc = Get-Service -Name $CSC -EA 0

# If the service object was not found, Desktop Experience is likely missing
if ($null -eq $svc) {
    Write-Warning "Offline Files service (CSC) not found. Desktop Experience is required."

} else {
    
    # If start type is not Automatic, set it
    if ($svc.StartType -ne 'Automatic') {
         Set-Service -Name 'CscService' -StartupType Automatic | Out-Null
    } 

    # If the service is not running, start it with error handling
    if ($svc.Status -ne 'Running') {
         try {
              Start-Service -Name $CSC -EA 1
         }
         catch {
              Write-Warning "Failed to start CSC: $($_.Exception.Message)"
         }
    }
}

Write-Host "Offline Files policies applied and CSC ensured Automatic/Running."
Write-Host "Next: on this machine, mark \\B\ToDo as 'Always available offline' (Explorer → share → right-click)."
#
#
## End of Enable-OfflineFiles-Server.ps1
