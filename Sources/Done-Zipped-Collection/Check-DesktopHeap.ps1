###############################################################################
# File:      Check-DesktopHeap.ps1                                            #
# Purpose:   Verify SharedSection settings and show Explorer GDI/USER usage   #
###############################################################################
# Section 1: Global VARs and Configurations                                   #
###############################################################################
#
param(
    [switch] $Watch,
    [int]    $IntervalSeconds = 60
)
#
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\SubSystems'
#
###############################################################################
# Section 2: Type Definitions                                                  #
###############################################################################
# Add-Type 2.1: Provide Interop.Gui.GetGuiResources for snapshot function     #
###############################################################################
# Only add the P/Invoke once per PS session
#
if (-not ('Interop.Gui' -as [type])) {
    Add-Type -Namespace Interop -Name Gui -MemberDefinition @'
         /*
         ********************************************************************************
         *  Member 2.2: GetGuiResources
         *  Purpose: Expose Win32 GetGuiResources via P/Invoke for querying per-
         *           process GDI/USER object counts from PowerShell.
         ********************************************************************************
         */
         [System.Runtime.InteropServices.DllImport("user32.dll", SetLastError=true)]
         public static extern int GetGuiResources(System.IntPtr hProcess, int uiFlags);
'@
}
#
###############################################################################
# Function 2.3: Get-ExplorerSnapshot                                          #
# Purpose: Return explorer.exe GDI/USER counts and memory/handle snapshot.    #
###############################################################################
#
function Get-ExplorerSnapshot {
    # Get all explorer.exe (can be multiple); pick one deterministically
    $processes = Get-Process -Name explorer -EA Stop
    $target    = $processes | Where-Object { $_.MainWindowHandle -ne 0 } | Sort-Object StartTime | Select-Object -First 1

    if (-not $target) { 
         $target = $processes | Sort-Object StartTime | Select-Object -First 1 
    }

    # Cast a single handle to IntPtr; never pass an array
    [IntPtr] $hProcess = [IntPtr] $target.Handle
    $gdi  = [Interop.Gui]::GetGuiResources($hProcess, 0)
    $user = [Interop.Gui]::GetGuiResources($hProcess, 1)

    # Build and return a structured snapshot object of Explorer resource usage
    New-Object psobject -Property @{
         Time         = Get-Date
         PID          = $target.Id
         Handles      = $target.Handles
         GDIObjects   = $gdi
         UserObjects  = $user
         PrivateKB    = [int]($target.PrivateMemorySize64 / 1KB)
         WorkingSetKB = [int]($target.WorkingSet64 / 1KB)
    }
}
#
###############################################################################
# Section 3: Registry Read and SharedSection Parse                            #
###############################################################################
#
try {
    $WindowsValue = (Get-ItemProperty -Path $RegistryPath -Name Windows -EA Stop).Windows
    Write-Host "Current 'Windows' value:"
    Write-Host $WindowsValue
    Write-Host ""

    if ($WindowsValue -match 'SharedSection=(\d+),(\d+),(\d+)') {
         Write-Host "SharedSection settings:"
         Write-Host "  System-wide heap         = $($matches[1]) KB"
         Write-Host "  Interactive desktop heap = $($matches[2]) KB"
         Write-Host "  Non-interactive desktop  = $($matches[3]) KB"
         Write-Host ""
    }
} catch {
    Write-Warning "Failed to read SubSystems\Windows value: $($_.Exception.Message)"
}
#
###############################################################################
# Section 4: Main Entry                                                       #
###############################################################################
#
# Control: gate on watch mode
if ($Watch) {
    Write-Host "Watching explorer.exe every $IntervalSeconds seconds. Ctrl+C to stop."
    # 
    # Control: infinite sample loop
    while ($true) {
         # 
         # Control: guarded sample to keep loop alive on transient errors
         try {
              $explorerSnapshot = Get-ExplorerSnapshot
              #
              # Console table output
              $explorerSnapshot | Format-Table Time,PID,Handles,GDIObjects,UserObjects,PrivateKB,WorkingSetKB -AutoSize
              #
              # Append compact line to log file in script folder
              $logLine = "{0:u} PID={1} Handles={2} GDI={3} USER={4} WS={5}KB" -f `
                   $explorerSnapshot.Time, $explorerSnapshot.PID, $explorerSnapshot.Handles, `
                   $explorerSnapshot.GDIObjects, $explorerSnapshot.UserObjects, $explorerSnapshot.WorkingSetKB
              
              Add-Content -Path (Join-Path $PSScriptRoot "Check-DesktopHeap.log") -Value $logLine
         } catch {
              Write-Warning "Sampling failed: $($_.Exception.Message)"
         }
         Start-Sleep -Seconds $IntervalSeconds
    }
} else {
    # 
    # something here.  
    try {
         Get-ExplorerSnapshot | Format-List *
    } catch {
         Write-Warning "Snapshot failed: $($_.Exception.Message)"
    }
}
#
#
## End of Check-DesktopHeap.ps1
