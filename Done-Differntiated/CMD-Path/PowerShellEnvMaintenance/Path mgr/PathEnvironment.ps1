<#
╔════════════════════════════════════════════════════════════════════════════╗
║ File: PathEnvironment.ps1                                                  ║
║ Description: Fix PATH environment variables for both System and User       ║
║ Author: Claude                                                             ║
║ Date: May 19, 2025                                                         ║
╚════════════════════════════════════════════════════════════════════════════╝
#>

#
# Script should be saved as: PathEnvironment.ps1
# This script should be in the same directory as MainLauncher.ps1
#

# Fix PATH environment variables for both System and User
function Fix-PathEnvironment {
    Show-StepHeader "PATH Environment Variables Cleanup"
    
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Get current PATH values
        Log-Message "Current PATH Environment Variables:" -ForegroundColor Cyan
        Log-Message "System PATH:" -ForegroundColor Cyan
        $systemPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")
        $systemPathEntries = $systemPath.Split(';') | Where-Object { $_ -ne "" } | ForEach-Object { $_.Trim() }
        $systemPathEntries | ForEach-Object { Log-Message "  $_" -ForegroundColor Gray }

        Log-Message "`nUser PATH:" -ForegroundColor Cyan  
        $userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
        $userPathEntries = $userPath.Split(';') | Where-Object { $_ -ne "" } | ForEach-Object { $_.Trim() }
        $userPathEntries | ForEach-Object { Log-Message "  $_" -ForegroundColor Gray }

        # Ask for confirmation
        Log-Message "`nThis operation will clean up both System and User PATH environment variables." -ForegroundColor Yellow
        Log-Message "It will consolidate tool paths to D:\Links and remove duplicates." -ForegroundColor Yellow
        $confirmation = Read-Host "Continue? (y/n)"
        
        if ($confirmation -ne "y") {
            Log-Message "Operation cancelled by user." -ForegroundColor Red
            Pause-Script
            return
        }

        # Define essential system directories that should be in the System PATH
        $essentialSystemDirs = @(
            "C:\Windows\System32",
            "C:\Windows",
            "C:\Windows\System32\Wbem",
            "C:\Windows\System32\WindowsPowerShell\v1.0"
        )

        # Define tool directories that should be consolidated to D:\Links
        $toolDirPatterns = @(
            "*python*",
            "*node*",
            "*dev\tools*",
            "*dev\bin*",
            "*dev\windsurf\bin*",
            "*windsurf*\bin*",
            "*vscodium*\bin*"
        )

        # Process System PATH
        Log-Message "`nProcessing System PATH..." -ForegroundColor Cyan

        # Remove tool directories and duplicates from system path 
        $newSystemEntries = @()
        $seenSystemEntries = @{}

        # First add D:\Links
        $newSystemEntries += "D:\Links"
        $seenSystemEntries["d:\links"] = $true

        # Then add essential system directories
        foreach ($dir in $essentialSystemDirs) {
            $normalizedDir = $dir.ToLower()
            if (-not $seenSystemEntries.ContainsKey($normalizedDir)) {
                $newSystemEntries += $dir
                $seenSystemEntries[$normalizedDir] = $true
            }
        }

        # Add remaining directories that aren't tools and aren't duplicates
        foreach ($entry in $systemPathEntries) {
            $normalizedEntry = $entry.ToLower()
            
            # Skip if already seen
            if ($seenSystemEntries.ContainsKey($normalizedEntry)) {
                Log-Message "  Skipping duplicate: $entry" -ForegroundColor Yellow
                continue
            }
            
            # Skip if it's a tool directory pattern
            $isToolDir = $false
            foreach ($pattern in $toolDirPatterns) {
                if ($normalizedEntry -like $pattern) {
                    $isToolDir = $true
                    Log-Message "  Moving to D:\Links: $entry" -ForegroundColor Yellow
                    break
                }
            }
            
            if (-not $isToolDir) {
                $newSystemEntries += $entry
                $seenSystemEntries[$normalizedEntry] = $true
            }
        }

        # Process User PATH
        Log-Message "`nProcessing User PATH..." -ForegroundColor Cyan

        # For User PATH, we'll keep any unique entries that aren't in System PATH or tool directories
        $newUserEntries = @()
        $seenUserEntries = @{}

        foreach ($entry in $userPathEntries) {
            $normalizedEntry = $entry.ToLower()
            
            # Skip if already in system path
            if ($seenSystemEntries.ContainsKey($normalizedEntry)) {
                Log-Message "  Skipping (already in System PATH): $entry" -ForegroundColor Yellow
                continue
            }
            
            # Skip if already seen in user path
            if ($seenUserEntries.ContainsKey($normalizedEntry)) {
                Log-Message "  Skipping duplicate: $entry" -ForegroundColor Yellow
                continue
            }
            
            # Skip if it's a tool directory pattern
            $isToolDir = $false
            foreach ($pattern in $toolDirPatterns) {
                if ($normalizedEntry -like $pattern) {
                    $isToolDir = $true
                    Log-Message "  Moving to D:\Links: $entry" -ForegroundColor Yellow
                    break
                }
            }
            
            if (-not $isToolDir) {
                $newUserEntries += $entry
                $seenUserEntries[$normalizedEntry] = $true
            }
        }

        # Update Environment Variables
        $newSystemPath = $newSystemEntries -join ';'
        $newUserPath = $newUserEntries -join ';'

        Log-Message "`nNew System PATH:" -ForegroundColor Green
        $newSystemEntries | ForEach-Object { Log-Message "  $_" -ForegroundColor Green }

        Log-Message "`nNew User PATH:" -ForegroundColor Green
        $newUserEntries | ForEach-Object { Log-Message "  $_" -ForegroundColor Green }

        # Ask for confirmation before making changes
        Log-Message "`nReady to update PATH environment variables." -ForegroundColor Yellow
        $confirmUpdate = Read-Host "Update PATH variables? (y/n)"
        
        if ($confirmUpdate -ne "y") {
            Log-Message "Operation cancelled by user." -ForegroundColor Red
            Pause-Script
            return
        }

        # Update the environment variables
        [Environment]::SetEnvironmentVariable("PATH", $newSystemPath, "Machine")
        [Environment]::SetEnvironmentVariable("PATH", $newUserPath, "User")

        Log-Message "`nPATH environment variables have been updated successfully!" -ForegroundColor Green
        Log-Message "For the changes to take effect in Command Prompt or other applications, you may need to restart them." -ForegroundColor Yellow
        
        Pause-Script
    }
    catch {
        Log-Message "An error occurred: $_" -ForegroundColor Red
        Log-Message "Error details: $($_.Exception.Message)" -ForegroundColor Red
        Log-Message "Stack trace: $($_.ScriptStackTrace)" -ForegroundColor Red
        Pause-Script
    }
}