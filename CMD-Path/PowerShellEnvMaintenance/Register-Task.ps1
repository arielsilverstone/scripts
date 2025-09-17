<#
.SYNOPSIS
  Registers or updates the scheduled task for PowerShell environment maintenance
.DESCRIPTION
  This script reads the Task Scheduler XML definition and registers
  the task under the specified path. It also ensures the event source
  exists for logging purposes.
.PARAMETER Force
  Switch to force re-registration of the task even if it already exists.
.EXAMPLE
  .\Register-Task.ps1 -Force
  Registers the task, overwriting any existing definition.
#>

param([switch]$Force)

# --- Begin Script ---
<# Get the directory where this script resides #>
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
<# Build the full path to the XML file describing the task #>
$xmlPath = Join-Path $scriptDir 'EnvChecker.xml'

<# Abort if the XML file is missing #>
if (-not (Test-Path $xmlPath)) {
    Write-Error "EnvChecker.xml not found in $scriptDir"
    exit 1
}

<# Ensure the 'Ariel' event source exists for writing to the Application log #>
if (-not [System.Diagnostics.EventLog]::SourceExists('Ariel')) {
    New-EventLog -LogName Application -Source 'Ariel'
    Write-Host "EventLog source 'Ariel' created" -ForegroundColor Green
}

<# Prepare parameters for Register-ScheduledTask #>
$params = @{
    Xml      = Get-Content $xmlPath -Raw  # Read XML content
    TaskName = 'PSEnvMaintenance'         # Name of the scheduled task
    TaskPath = '\Ariel\'                 # Folder path in Task Scheduler
}

<# Add -Force if requested by user #>
if ($Force) { $params.Force = $true }

<# Register or update the scheduled task with error handling #>
try {
    Register-ScheduledTask @params -ErrorAction Stop
    Write-Host "Scheduled task 'PSEnvMaintenance' registered under \Ariel\" -ForegroundColor Green
} catch {
    Write-Error "Task registration failed: $_"
    exit 1
}
