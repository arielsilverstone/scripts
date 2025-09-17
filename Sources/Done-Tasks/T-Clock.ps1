# T-Clock Startup Task Setup
$TaskName = "T-Clock"
$TaskPath = "\Ariel\"
$Author = "BEN\Ariel"

# Create boot trigger
$Trigger = New-ScheduledTaskTrigger -AtStartup

# Set principal (specific user with least privilege)
$Principal = New-ScheduledTaskPrincipal `
    -UserId "BEN\Ariel" `
    -LogonType Interactive `
    -RunLevel LeastPrivilege

# Create the action
$Action = New-ScheduledTaskAction `
    -Execute "D:\PO\T-Clock\Clock64.exe"

# Configure settings
$Settings = New-ScheduledTaskSettingsSet `
    -MultipleInstances IgnoreNew `
    -DisallowStartIfOnBatteries `
    -StopIfGoingOnBatteries `
    -AllowHardTerminate `
    -StartWhenAvailable:$false `
    -RunOnlyIfNetworkAvailable:$false `
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
    -Force