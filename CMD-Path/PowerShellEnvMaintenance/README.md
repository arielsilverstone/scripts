# PowerShell Environment Maintenance Task

This directory contains all scripts and configuration files for automating the validation and repair of the PowerShell execution environment.

## Contents

- **EnvChecker.xml**: Task Scheduler XML definition.
- **Register-Task.ps1**: Script to register or update the scheduled task.
- **Show-Logs.ps1**: Script to view recent event log entries tagged with 'Ariel'.
- **Fix-PowerShellEnv.ps1**: Script that performs quick or full environment maintenance checks and logs results.
- **PS-EnvMenu.ps1**: Interactive menu interface to orchestrate tasks.

## Usage

1. **Register the task**
   ```powershell
   .\Register-Task.ps1 -Force
   ```
2. **Run quick check**
   ```powershell
   .\Fix-PowerShellEnv.ps1 -QuickCheck
   ```
3. **View logs**
   ```powershell
   .\Show-Logs.ps1 -Last ([TimeSpan]::FromDays(1))
   ```
4. **Use menu**
   ```powershell
   .\PS-EnvMenu.ps1
   ```

## Notes

- Ensure you run PowerShell with appropriate permissions when registering tasks or creating event sources.
- Event logs are written to the Application log under the source 'Ariel'.
- Customize schedule or script paths by editing EnvChecker.xml and scripts as needed.
