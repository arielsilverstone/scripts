# Create System Registry Backups Task
$TaskName = "AutoRegBackup"
$Description = "Create System Registry Backups"
$TaskPath = "\"

# Create trigger (Daily at 1:30 AM)
$Trigger = New-ScheduledTaskTrigger -At "01:30" -Daily

# Set principal (SYSTEM with least privilege)
$Principal = New-ScheduledTaskPrincipal -UserId "S-1-5-18" -RunLevel LeastPrivilege

# Create the action
$Action = New-ScheduledTaskAction -Execute "schtasks" -Argument '/run /i /tn "\Microsoft\Windows\Registry\RegIdleBackup"'

# Configure settings
$Settings = New-ScheduledTaskSettingsSet `
    -MultipleInstances IgnoreNew `
    -DisallowStartIfOnBatteries `
    -StopIfGoingOnBatteries `
    -AllowHardTerminate `
    -StartWhenAvailable:$false `
    -RunOnlyIfNetworkAvailable:$false `
    -IdleDuration "PT10M" `
    -IdleWaitTimeout "PT1H" `
    -ExecutionTimeLimit "PT72H" `
    -Priority 7

# Register the task
Register-ScheduledTask `
    -TaskName $TaskName `
    -TaskPath $TaskPath `
    -Action $Action `
    -Trigger $Trigger `
    -Settings $Settings `
    -Principal $Principal `
    -Description $Description `
    -Force