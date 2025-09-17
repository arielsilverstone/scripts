<#
.SYNOPSIS
  Interactive menu for PowerShell Environment Maintenance.
.DESCRIPTION
  Provides a simple text-based menu to perform:
    1) Task registration or update
    2) Check scheduled task status
    3) View maintenance event logs
    4) Exit the menu
.EXAMPLE
  .\PS-EnvMenu.ps1
  Starts the interactive menu.
#>

# Main menu loop; continues until user selects Exit
do {
    Clear-Host  # Clear the console for a fresh menu display
    Write-Host "=== PowerShell Environment Maintenance Menu ===" -ForegroundColor Cyan
    Write-Host "1) Register scheduled task"   # Option to register/update the task
    Write-Host "2) Check scheduled task status"  # Option to view task state
    Write-Host "3) View Ariel logs"             # Option to display log entries
    Write-Host "4) Exit"                        # Option to close the menu

    # Prompt for user selection
    $choice = Read-Host "Enter choice (1-4)"

    switch ($choice) {
        '1' {
            # Invoke the registration script with Force
            Write-Host "Registering scheduled task..." -ForegroundColor Green
            & "$PSScriptRoot\Register-Task.ps1" -Force
            Pause  # Wait for user to press a key before returning to menu
        }
        '2' {
            # Show current task status in table format
            Write-Host "Scheduled task status:" -ForegroundColor Green
            Get-ScheduledTask -TaskName 'PSEnvMaintenance' -TaskPath '\Ariel\' |
                Format-Table TaskName, State, LastRunTime -AutoSize
            Pause
        }
        '3' {
            # Display logs by invoking the Show-Logs script
            Write-Host "Displaying Ariel event logs..." -ForegroundColor Green
            & "$PSScriptRoot\Show-Logs.ps1"
            Pause
        }
        '4' {
            Write-Host "Exiting menu..." -ForegroundColor Yellow
        }
        default {
            Write-Host "Invalid selection, please choose 1-4." -ForegroundColor Red
            Pause
        }
    }
} while ($choice -ne '4')
# End of menu loop
