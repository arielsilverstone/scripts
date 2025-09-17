<#
.SYNOPSIS
    Forcefully removes all ETW and OneDrive related scheduled tasks
.DESCRIPTION
    Enhanced version that handles stubborn tasks and verifies complete removal
.NOTES
    Must be run as Administrator
    Version: 2.0
#>

#Requires -RunAsAdministrator

###############################################################################
# Section 1: Force Remove ALL ETW Tasks
###############################################################################

Write-Output "=== FORCE REMOVING ETW TASKS ==="

# Discover all ETW-related tasks across all task paths
$ETWTasks = @(
    Get-ScheduledTask -TaskPath "\Microsoft\Windows\" -ErrorAction SilentlyContinue | 
        Where-Object { $_.TaskName -match 'ETW|Event Tracing|Diagnostics|SvcRestartTask' }
    Get-ScheduledTask -TaskPath "\" -ErrorAction SilentlyContinue | 
        Where-Object { $_.TaskName -match 'ETW' }
)

if ($ETWTasks.Count -gt 0) {
    $ETWTasks | ForEach-Object {
        Write-Output "[+] Removing task: $($_.TaskPath)$($_.TaskName)"
        
        # Triple-action removal
        $_ | Stop-ScheduledTask -ErrorAction SilentlyContinue
        $_ | Disable-ScheduledTask -ErrorAction SilentlyContinue
        $_ | Unregister-ScheduledTask -Confirm:$false -ErrorAction SilentlyContinue
        
        # Backup task file before deletion
        $taskFile = "$env:Windir\System32\Tasks\$($_.TaskPath)$($_.TaskName)"
        if (Test-Path $taskFile) {
            Copy-Item $taskFile "$taskFile.bak" -Force
            Remove-Item $taskFile -Force
        }
    }
} else {
    Write-Output "[!] No ETW tasks found"
}

###############################################################################
# Section 2: Nuclear Option for OneDrive Tasks
###############################################################################

Write-Output "`n=== FORCE REMOVING ONEDRIVE TASKS ==="

# Find all OneDrive tasks including hidden/system ones
$OneDriveTasks = schtasks /query /fo list | 
    Where-Object { $_ -match 'OneDrive' } | 
    ForEach-Object { 
        if ($_ -match 'TaskName:\s*(.*)') { 
            $matches[1] 
        }
    }

if ($OneDriveTasks.Count -gt 0) {
    $OneDriveTasks | ForEach-Object {
        Write-Output "[+] Force removing task: $_"
        
        # Native command for stubborn tasks
        schtasks /delete /tn $_ /f
        
        # Direct filesystem cleanup
        $taskFile = "$env:Windir\System32\Tasks\$_"
        if (Test-Path $taskFile) {
            Remove-Item $taskFile -Force -ErrorAction SilentlyContinue
        }
    }
} else {
    Write-Output "[!] No OneDrive tasks found"
}

###############################################################################
# Section 3: Post-Removal Verification
###############################################################################

Write-Output "`n=== VERIFICATION ===`n"

# Check for any remaining ETW tasks
Write-Output "Remaining ETW tasks:"
Get-ScheduledTask | Where-Object { 
    $_.TaskName -match 'ETW|Event Tracing|Diagnostics|SvcRestartTask' 
} | Format-Table TaskName, State -AutoSize

# Check for any remaining OneDrive tasks
Write-Output "`nRemaining OneDrive tasks:"
schtasks /query /fo list | Where-Object { $_ -match 'OneDrive' }

# Final system check
Write-Output "`n=== SYSTEM STATUS ==="
Write-Output "Last ETW/OneDrive task removal attempted at: $(Get-Date)"
Write-Output "Recommend reboot to clear any locked task files"

Read-Host "`nPress Enter to exit"