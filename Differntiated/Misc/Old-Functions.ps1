<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 6: Set-RegistrySetting                                             ║
║ Purpose: Sets a registry value with validation                              ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
#
Function Set-RegistrySetting {
    Param (
        [string] $Path,
        [string] $Name,
        [int]    $Value
    )
    TPSP -Path $Path -Name $Name -Value $Value
    WRL  -Message "[INFO] Set registry setting for path: $Path"
}
#
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 7: Get-RegistryOwnership                                           ║
║ Purpose: Retrieves ownership information for a registry key                 ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
Function Get-RegistryOwnership {
    Param (
        [string] $Path
    )
    Try {
        $ACL = GAL -Path $Path
        WRL  -Message "[INFO] Retrieved ownership for path: $Path"
        Return $ACL.Owner
    }
    Catch {
        WRL -Message "[ERROR] Failed to get ownership for path: $Path. Error: $_"
        Return $Null
    }
}
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 8: Set-RegistryOwnership                                           ║
║ Purpose: Sets ownership for a registry key                                  ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
Function Set-RegistryOwnership {
    Param (
        [string] $Path,
        [string] $NewOwner
    )
    Try {
        $ACL = GAL -Path $Path
        $ACL.SetOwner([System.Security.Principal.NTAccount] $NewOwner)
        SACl -Path $Path -ACLObject $ACL
        WRL  -Message "[INFO] Set ownership for path: $Path"
    }
    Catch {
        WRL -Message "[ERROR] Failed to set ownership for path: $Path. Error: $_"
    }
}
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 9: Validate-Registry                                               ║
║ Purpose: Validates a registry path exists or creates it                     ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
Function Validate-Registry {
    Param (
        [string] $Path
    )
    Try {
        TPSP -Path $Path
        WRL  -Message "[SUCCESS] Validated registry path: $Path"
        return $True
    }
    Catch {
        WRL -Message "[ERROR] Failed to validate registry path: $Path. Error: $_"
        return $False
    }
}
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 11: Ensure-Path                                                    ║
║ Purpose: Ensures a path exists or deletes it if specified                   ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
#
Function Ensure-Path {
    Param (
        [string] $Path,
        [switch] $Delete
    )

    Try {
        TPSP -Path $Path -Delete:$Delete
        WRL  -Message "[INFO] Path operation completed: $Path"
        Return $True
    }
    Catch {
        WRL -Message "[ERROR] Ensure-Path failed for: $Path. Error: $_"
        Return $False
    }
}