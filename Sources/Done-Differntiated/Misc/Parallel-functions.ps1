#
# ════════════════════════════════════════════════════════════════════════════════
# Script: Parallel-functions.ps1
#
# SYNOPSIS
#     Executes multiple function scripts concurrently in isolated Start-Throt jobs.
#
# DESCRIPTION
#     This script loads function definitions from individual script files, then
#     launches each function in a separate throttled job. The jobs run independently,
#     unload automatically, and clean up after execution.
#     Optionally, you can limit the number of concurrent jobs. Each job logs memory
#     and CPU usage before and after execution.
#
# HOW TO USE
#     - Place all function scripts (e.g., F01.ps1, F02.ps1) in the Dev folder
#     - Each script must define a function named the same as its filename (F01.ps1 → Function F01)
#     - Customize the $FuncList and $FuncArgs as needed
#     - Set $ThrottleLimit to control concurrency
#     - Run the script to execute all functions in parallel
#
# VARIABLES
#     $FuncList       → Array of function names (corresponding to script filenames)
#     $FuncArgs       → Common arguments passed to each function
#     $JobData        → Hashtable of per-function script, name, args, and display name
#     $ThrottleLimit  → Maximum number of concurrent jobs
#
# EXAMPLE
#     # Run F01 through F05 in parallel with a max of 2 concurrent jobs
#     $FuncList = @("F01", "F02", "F03", "F04", "F05")
#     $ThrottleLimit = 2
#     .\Parallel-functions.ps1
#
# ════════════════════════════════════════════════════════════════════════════════
#
. "D:\Desktop\New\Functions.ps1"
##
# Track changes
$ScriptName = "$(Split-Path $MyInvocation.MyCommand.Path -Leaf)"
Write-Log -Msg "Start $ScriptName"
Track-Change -Name "$ScriptName"
# Enable tracing
Manage-Tracing -On
Set-GlobalAliases
#
#
$1
# Job 1: Parallel Function Execution
# Runs a set of individual function scripts concurrently in throttled jobs
# ════════════════════════════════════════════════════════════════════════════════

$FuncList      = @("F01", "F02", "F03", "F04", "F05")
$FuncArgs      = @("Arg1", "Arg2")
$ThrottleLimit = 4

$JobData = $FuncList | ForEach-Object {
    $ScriptFile = JP -Dev ("$_.ps1")
    $FuncName   = $_

    @{
        Script = $ScriptFile
        Func   = $FuncName
        Args   = $FuncArgs
        Name   = "Job_$FuncName"
    }
}

$RunningJobs = @()

$JobData | ForEach-Object {
    While ($RunningJobs.Count -ge $ThrottleLimit) {
        $RunningJobs = $RunningJobs | Where-Object { $_.State -eq 'Running' }
        Start-Sleep -Milliseconds 500
    }

    $BeforeMem = (Get-Process -Id $PID).PrivateMemorySize64
    $BeforeCPU = (Get-Process -Id $PID).CPU

    $Job = Start-Throt @{
        Path = $_.Script
    } -Name $_.Name -Arg {
        . $using:_.Script
        & $using:_.Func @($using:_.Args)
    } -EA 0

    $RunningJobs += $Job

    $Job | Wait-Job
    $AfterMem = (Get-Process -Id $PID).PrivateMemorySize64
    $AfterCPU = (Get-Process -Id $PID).CPU

    $DeltaMemMB = [math]::Round(($AfterMem - $BeforeMem) / 1MB, 2)
    $DeltaCPU   = [math]::Round(($AfterCPU - $BeforeCPU), 2)

    Write-Log -Msg "$($_.Name): ΔMem ${DeltaMemMB}MB, ΔCPU ${DeltaCPU}%"
    $Job | Receive-Job | Write-Log -Msg
    $Job | Remove-Job
}

# Disable tracing
Manage-Tracing -Off
