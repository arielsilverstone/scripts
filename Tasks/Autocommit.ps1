#
# ════════════════════════════════════════════════════════════════
# Name: Autocommit.ps1
# Location: D:\Program Files\Dev\Settings\Tasks\Autocommit.ps1
# Purpose: Automatically commits changes every 5 minutes between 8 AM and 8 PM, if there are changes.
# ════════════════════════════════════════════════════════════════
#
Start-ThreadJob {
    $Dev         = "D:\Program Files\Dev"
    $ScriptPath  = "$Dev\Settings\Tasks\Autocommit.ps1"
    $LogFile     = "$Dev\Settings\Logs\Autocommit.log"
    $GitLocation = "$Dev\git\bin\git.exe"

    $CommitCount = 0
    $LastCommitTime = Get-Date

    while ($true) {
        # Get the current time
        $CurrentTime = Get-Date

        # Check if the current time is between 8 AM and 8 PM
        if ($CurrentTime.Hour -ge 8 -and $CurrentTime.Hour -lt 20) {
            Sleep -s 300  # Wait for 5 minutes

            # Check for changes
            $Changes = & $GitLocation status --porcelain $ScriptPath | ? { $_ -ne "" }

            if ($Changes) {
                $CommitCount++

                # Commit changes if 5 changes have been made or 5 minutes have passed since the last commit
                if ($CommitCount -ge 5 -or (Get-Date) -gt $LastCommitTime.AddMinutes(5)) {
                    & $GitLocation add $ScriptPath
                    & $GitLocation commit -m (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
                    $LastCommitTime = Get-Date
                    $CommitCount = 0  # Reset the change count

                    Write-EventLog -LogName "Ariel Jobs Channel" -Source "Autocommit" -EntryType Information -EventId 1 -Message "Successfully committed changes."

                    AC -Path $LogFile -Value "[$(Get-Date)] Successfully committed changes."

                }
            } Else {

                # Log failure to detect changes
                AC -Path $LogFile -Value "[$(Get-Date)] No changes detected."
            }
        } else {
            # If outside of working hours, wait until the next day
            Sleep -h 5  # Check every 5 hours
        }
    }
} -Name "Autocommit"