###############################################################################
# File: MenuFixer.ps1                                                         #
# Purpose: PowerShell 5.1 menu; implements E.7.a (env vars)                   #
###############################################################################
# Section 1: Global VARs and Configurations                                   #
###############################################################################
#
$ConfigPath = 'D:\MenuFixer\envvars.json'
#
###############################################################################
# Section 2: Functions                                                        #
###############################################################################
# Function 2.1: Ensure-EnvVar                                                 #
# Purpose: Create/update an environment variable in User or Machine scope     #
###############################################################################
#
function Ensure-EnvVar {
    param(
        [Parameter(Mandatory)][ValidateSet('User','Machine')] [string] $Scope,
        [Parameter(Mandatory)][ValidatePattern('^[A-Za-z_][A-Za-z0-9_]*$')] [string] $Name,
        [Parameter(Mandatory)] [string] $Value
    )
    # Determine target registry path for the scope
    if ($Scope -eq 'Machine') {
        $regPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment'
    } else {
        $regPath = 'HKCU:\Environment'
    }
    # Create the key if missing
    if (-not (Test-Path -Path $regPath)) { New-Item -Path $regPath -Force | Out-Null }
    # Read existing value (if any)
    $existing = (Get-ItemProperty -Path $regPath -ErrorAction SilentlyContinue |
                 Select-Object -ExpandProperty $Name -ErrorAction SilentlyContinue)
    # If missing or different, set it (REG_EXPAND_SZ if contains %...%)
    if ($null -eq $existing -or $existing -ne $Value) {
        $type = ($Value -like '*%*') ? 'ExpandString' : 'String'
        New-ItemProperty -Path $regPath -Name $Name -Value $Value -PropertyType $type -Force | Out-Null
        [Environment]::SetEnvironmentVariable($Name, $Value, $Scope)
        Write-Host ("Set {0} env var: {1}={2}" -f $Scope, $Name, $Value)
    }
}
#
###############################################################################
# Function 2.2: Load-EnvConfig                                                #
# Purpose: Load JSON {Machine:{},User:{}} if present                          #
###############################################################################
#
function Load-EnvConfig {
    if (Test-Path -Path $ConfigPath) {
        try {
            $json = Get-Content -Path $ConfigPath -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
            return @{ Machine = @{} + ($json.Machine | ForEach-Object { $_ }); User = @{} + ($json.User | ForEach-Object { $_ }) }
        } catch {
            Write-Warning ("Failed to load env config: {0}" -f $_.Exception.Message)
            return @{ Machine = @{}; User = @{} }
        }
    } else { return @{ Machine = @{}; User = @{} } }
}
#
###############################################################################
# Function 2.3: Invoke-EnvVariables                                           #
# Purpose: Implement E.7.a using config file or inline sample map             #
###############################################################################
#
function Invoke-EnvVariables {
    # Load config map (Machine/User)
    $map = Load-EnvConfig
    # Example defaults if file missing (edit/remove as needed)
    if (($map.Machine.Count -eq 0) -and ($map.User.Count -eq 0)) {
        $map = @{ Machine = @{ 'MY_TOOL_HOME' = 'D:\Tools\MyTool'; 'PATH' = '%PATH%;D:\Tools\MyTool\bin' }; User = @{ 'MY_PROJECT' = 'D:\Projects\Current' } }
    }
    # Apply Machine env vars
    foreach ($kv in $map.Machine.GetEnumerator()) { Ensure-EnvVar -Scope 'Machine' -Name $kv.Key -Value $kv.Value }
    # Apply User env vars
    foreach ($kv in $map.User.GetEnumerator()) { Ensure-EnvVar -Scope 'User' -Name $kv.Key -Value $kv.Value }
    Write-Host "Environment variable updates complete."
}
#
###############################################################################
# Function 2.4: Invoke-ApplyRegFile                                           #
# Purpose: Implement E.7.b by importing a user-specified .reg file            #
###############################################################################
#
function Invoke-ApplyRegFile {
    # Prompt for file path
    $regFile = Read-Host 'Enter the full path to the .reg file'

    # Validate path and extension
    if (-not (Test-Path -Path $regFile)) {
        Write-Warning "File not found: $regFile"
        return
    }
    if ($regFile -notlike '*.reg') {
        Write-Warning "Invalid file type. Please provide a .reg file."
        return
    }

    # Execute reg import
    try {
        Write-Host "Importing registry file: $regFile"
        # Using Start-Process to handle elevation if required
        Start-Process reg.exe -ArgumentList "import `"$regFile`"" -Wait -Verb RunAs -WindowStyle Hidden
        Write-Host "Registry file import completed successfully."
    } catch {
        Write-Error "Failed to import registry file. Error: $_.Exception.Message"
    }
}
#
###############################################################################
# Section 3: Menu                                                             #
###############################################################################
#
function Show-Menu {
    Clear-Host
    Write-Host '================ MenuFixer (PS 5.1) ================'
    Write-Host ' a. E.7.a  Create/update/correct environment variables'
    Write-Host ' b. E.7.b  Apply .reg file'
    Write-Host ' q. Quit'
}
# Main Loop
Do {
    Show-Menu
    $sel = Read-Host 'Select option'
    switch ($sel) {
        'a' { Invoke-EnvVariables }
        'b' { Invoke-ApplyRegFile }
        'q' { break }
        Default { Write-Host 'Invalid selection' }
    }
    if ($sel -ne 'q') { Read-Host 'Press Enter to continue' | Out-Null }
} While ($true)
#
#
## End of MenuFixer.ps1
