# Register-PythonMonitor.ps1
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -File D:\Program Files\Dev\Scripts\Monitor-PythonDirs.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
$settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -WakeToRun
Register-ScheduledTask -TaskName "Monitor Python Installations" -Action $action -Trigger $trigger -Settings $settings -RunLevel Highest