# Environment Variables Task Setup
$TaskName = "Env Vars"
$TaskPath = "\Ariel\"
$Author = "BEN\Ariel"

# Create logon trigger for specific user
$Trigger = New-ScheduledTaskTrigger -AtLogOn -User $Author

# Set principal (specific user with least privilege)
$Principal = New-ScheduledTaskPrincipal `
    -UserId "BEN\Ariel" `
    -LogonType Interactive `
    -RunLevel LeastPrivilege

# Create the action
$Action = New-ScheduledTaskAction `
    -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" `
    -Argument '-ExecutionPolicy Bypass -File "D:\Desktop\New\Env.ps1"' `
    -WorkingDirectory "D:\Desktop\New"

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