<#
╔════════════════════════════════════════════════════════════════════════════╗
║ File: CommonFunctions.ps1                                                  ║
║ Description: Shared utility functions for all development setup scripts    ║
║ Author: Claude                                                             ║
║ Date: May 19, 2025                                                         ║
╚════════════════════════════════════════════════════════════════════════════╝
#>

#
# Script should be saved as: CommonFunctions.ps1
# This script should be in the same directory as MainLauncher.ps1
#

# Log a message to the console and log file
function Log-Message {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Message,
        
        [Parameter(Mandatory=$false)]
        [string]$ForegroundColor = "White"
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] $Message"
    
    # Write to console with color
    Write-Host $logMessage -ForegroundColor $ForegroundColor
    
    # Write to log file is handled by Start-Transcript in the main script
}

# Display a step header
function Show-StepHeader {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Title
    )
    
    Write-Host "`n=== $Title ===" -ForegroundColor Cyan
}

# Pause execution and wait for user input
function Pause-Script {
    Write-Host "`nPress any key to continue..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Verify a path exists and create it if it doesn't
function Ensure-PathExists {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$false)]
        [switch]$AsFile
    )
    
    # If creating a file, get the directory path
    if ($AsFile) {
        $dirPath = Split-Path -Parent $Path
    } else {
        $dirPath = $Path
    }
    
    # Create directory if it doesn't exist
    if (-not (Test-Path $dirPath)) {
        try {
            New-Item -Path $dirPath -ItemType Directory -Force | Out-Null
            Log-Message "Created directory: $dirPath" -ForegroundColor Green
            return $true
        } catch {
            Log-Message "Failed to create directory: $dirPath" -ForegroundColor Red
            Log-Message "Error: $_" -ForegroundColor Red
            return $false
        }
    }
    
    return $true
}

# Create a backup of a file or directory
function Backup-Item {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$false)]
        [string]$BackupSuffix = ".backup"
    )
    
    if (Test-Path $Path) {
        $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
        $backupPath = "$Path.$timestamp$BackupSuffix"
        
        try {
            Copy-Item -Path $Path -Destination $backupPath -Recurse -Force
            Log-Message "Created backup: $backupPath" -ForegroundColor Green
            return $backupPath
        } catch {
            Log-Message "Failed to create backup: $backupPath" -ForegroundColor Red
            Log-Message "Error: $_" -ForegroundColor Red
            return $null
        }
    } else {
        Log-Message "Cannot backup nonexistent item: $Path" -ForegroundColor Yellow
        return $null
    }
}

# Test if running as administrator
function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Safe registry property setter
function Set-RegistryProperty {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$false)]
        [string]$Name,
        
        [Parameter(Mandatory=$false)]
        $Value,
        
        [Parameter(Mandatory=$false)]
        [string]$Type = "String"
    )
    
    try {
        # Create the key if it doesn't exist
        if (-not (Test-Path $Path)) {
            New-Item -Path $Path -Force | Out-Null
            Log-Message "Created registry key: $Path" -ForegroundColor Green
        }
        
        # If just creating the key without setting a property
        if (-not $Name) {
            return $true
        }
        
        # Set the property
        Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type
        Log-Message "Set registry property: $Path\$Name = $Value" -ForegroundColor Green
        return $true
    } catch {
        Log-Message "Failed to set registry property: $Path\$Name" -ForegroundColor Red
        Log-Message "Error: $_" -ForegroundColor Red
        return $false
    }
}

# Safe registry property getter
function Get-RegistryProperty {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$true)]
        [string]$Name,
        
        [Parameter(Mandatory=$false)]
        $DefaultValue = $null
    )
    
    try {
        if (Test-Path $Path) {
            $item = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue
            if ($item -ne $null -and $item.$Name -ne $null) {
                return $item.$Name
            }
        }
        return $DefaultValue
    } catch {
        Log-Message "Failed to get registry property: $Path\$Name" -ForegroundColor Red
        Log-Message "Error: $_" -ForegroundColor Red
        return $DefaultValue
    }
}

# Join registry path segments
function Join-RegistryPath {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ParentPath,
        
        [Parameter(Mandatory=$true)]
        [string]$ChildPath
    )
    
    if ($ParentPath.EndsWith("\")) {
        return $ParentPath + $ChildPath
    } else {
        return $ParentPath + "\" + $ChildPath
    }
}

# Clean up paths (handle trailing slashes, normalize)
function Clean-Path {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )
    
    # Normalize slashes
    $result = $Path.Replace('/', '\')
    
    # Remove trailing slashes
    while ($result.EndsWith('\')) {
        $result = $result.Substring(0, $result.Length - 1)
    }
    
    return $result
}

# Check if a string is contained in another (case-insensitive)
function Contains-String {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Text,
        
        [Parameter(Mandatory=$true)]
        [string]$Value
    )
    
    return $Text.ToLower().Contains($Value.ToLower())
}

# Export functions for use in other scripts
# Only export members if we're being imported as a module
if ($MyInvocation.Line -match 'Import-Module') {
    Export-ModuleMember -Function * -Alias *
}