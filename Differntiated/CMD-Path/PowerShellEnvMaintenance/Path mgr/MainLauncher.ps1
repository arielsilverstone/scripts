<#
╔════════════════════════════════════════════════════════════════════════════╗
║ Development Environment Setup Script   Version: 1.0                        ║
║ Description: Main launcher for the development environment setup scripts   ║
║ Author: Claude                                                             ║
║ Date: May 19, 2025                                                         ║
╚════════════════════════════════════════════════════════════════════════════╝
#>

#
# Script should be saved as: MainLauncher.ps1
# This script can be located in any directory as long as the other scripts
# are in the same relative locations (same directory)
#

# Ensure script runs with elevated privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script as Administrator to ensure all functions work properly." -ForegroundColor Red
    Write-Host "Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Get the directory this script is in
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Define paths to other scripts - All relative to this script
$commonFunctionsScript = Join-Path $scriptPath "CommonFunctions.ps1"
$cmdCustomizationScript = Join-Path $scriptPath "CmdCustomization.ps1"
$pathEnvironmentScript = Join-Path $scriptPath "PathEnvironment.ps1"
$symlinkSetupScript = Join-Path $scriptPath "SymlinkSetup.ps1"
$ideExtensionFixScript = Join-Path $scriptPath "IDEExtensionFix.ps1"
$nodeAndPowerShellScript = Join-Path $scriptPath "NodeAndPowerShell.ps1"

# Verify all scripts exist before running
$requiredScripts = @(
    $commonFunctionsScript,
    $cmdCustomizationScript,
    $pathEnvironmentScript,
    $symlinkSetupScript,
    $ideExtensionFixScript,
    $nodeAndPowerShellScript
)

$missingScripts = $requiredScripts | Where-Object { -not (Test-Path $_) }
if ($missingScripts.Count -gt 0) {
    Write-Host "The following required scripts are missing:" -ForegroundColor Red
    $missingScripts | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    Write-Host "Please ensure all scripts are in the same directory as this script." -ForegroundColor Red
    Write-Host "Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Dot-source the common functions script first
. $commonFunctionsScript

# Create log directory if it doesn't exist
$logDir = Join-Path $scriptPath "Logs"
if (-not (Test-Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory -Force | Out-Null
}
$logFile = Join-Path $logDir "DevEnvSetup_$(Get-Date -Format 'yyyyMMdd-HHmmss').log"

# Initialize log
Start-Transcript -Path $logFile -Append

# Display the main menu
function Show-MainMenu {
    Clear-Host
    Write-Host "====================== SYSTEM TOOLS MENU ======================" -ForegroundColor Cyan
    Write-Host "1: Fix CMD Settings - Banner and Startup Directory" -ForegroundColor White
    Write-Host "2: Set CMD Window Size (100x27 for 4K resolution)" -ForegroundColor White
    Write-Host "3: Set CMD Font Size (Consolas 20)" -ForegroundColor White
    Write-Host "4: Fix PATH Environment Variables" -ForegroundColor White
    Write-Host "   [Consolidates tool paths and cleans up both System and User PATH]" -ForegroundColor Gray
    Write-Host ""
    Write-Host ""
    Write-Host "A: Apply All CMD Fixes (Options 1-3)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "B: Development Environment Setup" -ForegroundColor Green
    Write-Host "   B1: Create Common File Symbolic Links (settings.json, etc.)" -ForegroundColor White
    Write-Host "   B2: Set Up IDE Symbolic Links" -ForegroundColor White
    Write-Host "   B3: Fix IDE Extension Directories" -ForegroundColor White
    Write-Host "   B4: Configure Node.js Paths" -ForegroundColor White
    Write-Host "   B5: Configure PowerShell Registry Settings" -ForegroundColor White
    Write-Host "   B6: Apply All Development Environment Fixes (B1-B5)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "C: Install PowerShell Modules" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "Q: Quit" -ForegroundColor Red
    Write-Host "==============================================================" -ForegroundColor Cyan
}

# Process main menu selection
function Process-MainSelection {
    param (
        [string]$Selection
    )

    switch ($Selection.ToUpper()) {
        "1" {
            Write-Host "Executing: Fix CMD Banner and Startup Directory..." -ForegroundColor Cyan
            . $cmdCustomizationScript
            Fix-CmdBanner
        }
        "2" {
            Write-Host "Executing: Set CMD Window Size..." -ForegroundColor Cyan
            . $cmdCustomizationScript
            Set-CmdWindowSize
        }
        "3" {
            Write-Host "Executing: Set CMD Font Size..." -ForegroundColor Cyan
            . $cmdCustomizationScript
            Set-CmdFontSize
        }
        "4" {
            Write-Host "Executing: Fix PATH Environment Variables..." -ForegroundColor Cyan
            . $pathEnvironmentScript
            Fix-PathEnvironment
        }
        "A" {
            Write-Host "Executing: Apply All CMD Fixes..." -ForegroundColor Yellow
            . $cmdCustomizationScript
            Apply-AllCmdFixes
        }
        "B" {
            Show-DevelopmentMenu
        }
        "B1" {
            Write-Host "Executing: Create Common File Symbolic Links..." -ForegroundColor Cyan
            . $symlinkSetupScript
            Create-CommonFileLinks
        }
        "B2" {
            Write-Host "Executing: Set Up IDE Symbolic Links..." -ForegroundColor Cyan
            . $symlinkSetupScript
            Create-IDESymlinks
        }
        "B3" {
            Write-Host "Executing: Fix IDE Extension Directories..." -ForegroundColor Cyan
            . $ideExtensionFixScript
            Fix-IDEExtensionDirectories
        }
        "B4" {
            Write-Host "Executing: Configure Node.js Paths..." -ForegroundColor Cyan
            . $nodeAndPowerShellScript
            Configure-NodeJS
        }
        "B5" {
            Write-Host "Executing: Configure PowerShell Registry Settings..." -ForegroundColor Cyan
            . $nodeAndPowerShellScript
            Configure-PowerShellRegistry
        }
        "B6" {
            Write-Host "Executing: Apply All Development Environment Fixes..." -ForegroundColor Yellow
            . $symlinkSetupScript
            Create-CommonFileLinks
            Create-IDESymlinks
            
            . $ideExtensionFixScript
            Fix-IDEExtensionDirectories
            
            . $nodeAndPowerShellScript
            Configure-NodeJS
            Configure-PowerShellRegistry
            
            Write-Host "`nAll Development Environment fixes have been applied." -ForegroundColor Green
            Pause-Script
        }
        "C" {
            Write-Host "Executing: Install PowerShell Modules..." -ForegroundColor Magenta
            . $nodeAndPowerShellScript
            Install-PowerShellModules
        }
        "Q" {
            Write-Host "`nExiting program. Goodbye!`n" -ForegroundColor Green
            return $false  # Return false to exit the main loop
        }
        default {
            Write-Host "`nInvalid selection. Please try again.`n" -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
    
    return $true  # Continue the main loop for any other selection
}

# Show development environment submenu
function Show-DevelopmentMenu {
    Clear-Host
    Write-Host "=============== DEVELOPMENT ENVIRONMENT SETUP ================" -ForegroundColor Green
    Write-Host "B1: Create Common File Symbolic Links (settings.json, etc.)" -ForegroundColor White
    Write-Host "B2: Set Up IDE Symbolic Links" -ForegroundColor White
    Write-Host "B3: Fix IDE Extension Directories" -ForegroundColor White
    Write-Host "B4: Configure Node.js Paths" -ForegroundColor White
    Write-Host "B5: Configure PowerShell Registry Settings" -ForegroundColor White
    Write-Host "B6: Apply All Development Environment Fixes (B1-B5)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "M: Return to Main Menu" -ForegroundColor Cyan
    Write-Host "Q: Quit" -ForegroundColor Red
    Write-Host "==============================================================" -ForegroundColor Green
    
    $devSelection = Read-Host "`nSelect an option"
    
    if ($devSelection -eq "M") {
        return  # Return to main menu
    }
    
    if ($devSelection -eq "Q") {
        Write-Host "`nExiting program. Goodbye!`n" -ForegroundColor Green
        Stop-Transcript
        exit
    }
    
    $devSelection = "B" + $devSelection  # Add "B" prefix to selection
    Process-MainSelection -Selection $devSelection
}

# Main program loop
try {
    # Initialize and start logging
    Log-Message "======================= SESSION STARTED ======================="
    Log-Message "Script started by user: $([Environment]::UserName)"
    Log-Message "Computer name: $([Environment]::MachineName)"
    Log-Message "Running as Administrator: $([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)"
    
    do {
        # Display the main menu
        Show-MainMenu
        
        # Get user selection
        $selection = Read-Host "`nSelect an option"
        
        # Process the selection
        $continueLoop = Process-MainSelection -Selection $selection
        
    } while ($continueLoop)
    
    # End logging
    Log-Message "======================= SESSION ENDED ========================"
}
catch {
    Write-Host "An error occurred: $_" -ForegroundColor Red
    Write-Host "Error details: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Stack trace: $($_.ScriptStackTrace)" -ForegroundColor Red
    Log-Message "ERROR: $_"
    Log-Message "Error details: $($_.Exception.Message)"
    Log-Message "Stack trace: $($_.ScriptStackTrace)"
}
finally {
    # Ensure transcript is stopped
    try {
        Stop-Transcript
    }
    catch {
        # Transcript might not be started
    }
}