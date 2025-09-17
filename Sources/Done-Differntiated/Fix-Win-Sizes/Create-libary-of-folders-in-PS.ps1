# create D:\Desktop\Holder with junction-linked folders A and B (replace SOURCE_A and SOURCE_B with your actual paths)
#
#
## Final recommendations
#
<#
.SYNOPSIS
Creates a real-time merged view of two folders using hardlinks with system-level storage
#>

# ========== CONFIGURATION (MODIFY THESE) ==========
# CHANGE REQUIRED: Replace with your source folders
$sourceA = "C:\Path\To\FolderA"  # <-- CHANGE THIS
$sourceB = "C:\Path\To\FolderB"  # <-- CHANGE THIS

# OPTIONAL: Change these paths if you prefer different locations
$holderPath = "$env:PUBLIC\Desktop\MergedView"  # Public desktop location
$stagingPath = "$env:ProgramData\MergedView\Working"  # System-hidden storage

# ========== SETUP ==========
# Create hidden working directory (system-wide)
if (-not (Test-Path $stagingPath)) {
    New-Item -Path $stagingPath -ItemType Directory -Force | Out-Null
    attrib +s +h $stagingPath  # System+hidden attributes
}

# Create visible junction point (admin required)
if (-not (Test-Path $holderPath)) {
    cmd /c mklink /J "$holderPath" "$stagingPath" | Out-Null
    Write-Host "Access merged files at: $holderPath"
}

# ========== SYNC ENGINE ==========
function Update-MergedView {
    # Track existing links to detect changes
    $existingLinks = @{}
    Get-ChildItem $stagingPath -File | Where-Object { 
        $_.Attributes -match "ReparsePoint" 
    } | ForEach-Object {
        $existingLinks[$_.Name] = $_.Target
    }

# Phase 1: Sync new/changed files
    Get-ChildItem $sourceA, $sourceB -File | ForEach-Object {
        $linkPath = "$stagingPath\$($_.Name)"
        $needsUpdate = $true

	# Check if existing link matches current file
        if ($existingLinks.ContainsKey($_.Name)) {
            if ($existingLinks[$_.Name] -eq $_.FullName) {
                $needsUpdate = $false
            }
            $existingLinks.Remove($_.Name)  # Mark as processed
        }

        if ($needsUpdate) {
	# Remove old link if exists
            if (Test-Path $linkPath) { Remove-Item $linkPath -Force }
	# Create hardlink (preserves original file attributes)
            $null = fsutil hardlink create $linkPath $_.FullName  # More reliable than New-Item
        }
    }

# Phase 2: Clean up deleted files
    $existingLinks.Keys | ForEach-Object {
        Remove-Item "$stagingPath\$_" -Force -ErrorAction SilentlyContinue
    }
}

# ========== REAL-TIME MONITORING ==========
# Using Windows Management Instrumentation for more reliable events
$query = @"
SELECT * FROM __InstanceOperationEvent 
WITHIN 2 												<-- 2 second polling, change.
WHERE TargetInstance ISA 'CIM_DataFile' 
AND (TargetInstance.Drive='$(($sourceA -replace ':.*$',''))' 
OR TargetInstance.Drive='$(($sourceB -replace ':.*$',''))')
"@

Register-WmiEvent -Query $query -Action {
    Update-MergedView
} -Namespace "root\cimv2" | Out-Null

# Initial sync
Update-MergedView

# ========== PERSISTENCE ==========
# Create scheduled task for auto-start (admin required)
$taskAction = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$PSCommandPath`""
$taskTrigger = New-ScheduledTaskTrigger -AtLogOn
$taskSettings = New-ScheduledTaskSettingsSet -StartWhenAvailable -DontStopOnIdleEnd

Register-ScheduledTask -TaskName "MergedFolderSync" `
                      -Action $taskAction `
                      -Trigger $taskTrigger `
                      -Settings $taskSettings `
                      -RunLevel Highest | Out-Null

Write-Host "Monitoring $sourceA and $sourceB for changes..."
Write-Host "Merged view available at: $holderPath"
Write-Warning "Run as Admin for full functionality"
#
## Below, non recommended, yet discussed, methods.
#
#
## another method
#
# Define paths
$holderPath = "D:\Desktop\Holder"
$sourceA = "FULL_PATH_TO_FOLDER_A"  # ← REPLACE THIS
$sourceB = "FULL_PATH_TO_FOLDER_B"  # ← REPLACE THIS

# Create Holder directory (force if needed)
New-Item -ItemType Directory -Path $holderPath -Force

# Create junctions (admin required)
cmd /c mklink /J "$holderPath\A" "$sourceA"
cmd /c mklink /J "$holderPath\B" "$sourceB"

# Verify
Write-Host "`nCreated virtual merged structure at: $holderPath"
Get-ChildItem $holderPath | Select-Object Name, Target

#
#
# # Creating a Custom Library via PowerShell/Registry That Merges Two Folders
#
# Create the lib
#
# Load Shell COM object
$shell = New-Object -ComObject Shell.Application

# Get Libraries namespace
$libraries = $shell.Namespace("shell:Libraries")

# Create a new library (may prompt in GUI)
$newLib = $libraries.Self
$newLib.InvokeVerb("New")  # This opens a GUI prompt to name it

#
#
# Add Folders to the Library (PowerShell)
#
# Define paths
$libraryName = "MergedBC"  # Must match what you named it
$folderB = "C:\B"
$folderC = "C:\C"

# Get the library
$lib = $shell.Namespace("shell:Libraries").Items() | Where-Object { $_.Name -eq $libraryName }

# Add folders to the library (if library exists)
if ($lib) {
    $lib.GetFolder.Items()  # Forces library to load
    $lib.Add($folderB)
    $lib.Add($folderC)
    Write-Host "Folders added to library '$libraryName'!"
} else {
    Write-Warning "Library '$libraryName' not found. Did you manually create it?"
}
#
#
#
### Method 2 - Direct Registry Manipulation
#
#
#
# Libraries store their config in:
	HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders
	HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders

But the real library definitions are in .library-ms files stored in:

	%APPDATA%\Microsoft\Windows\Libraries

# Therefore: 
#
# Step 1: Create a .library-ms File Manually
#
# Define library name and folders
$libraryName = "MergedBC.library-ms"
$libraryPath = "$env:APPDATA\Microsoft\Windows\Libraries\$libraryName"
$folderB = "C:\B"
$folderC = "C:\C"

# XML template for the library
$libraryXml = @"
<?xml version="1.0" encoding="UTF-8"?>
<libraryDescription xmlns="http://schemas.microsoft.com/windows/2009/library">
  <name>@windows.storage.dll,-34582</name>
  <version>1</version>
  <isLibraryPinned>true</isLibraryPinned>
  <iconReference>imageres.dll,-1003</iconReference>
  <templateInfo>
    <folderType>{7d49d726-3c21-4f05-99aa-fdc2c9474656}</folderType>
  </templateInfo>
  <searchConnectorDescriptionList>
    <searchConnectorDescription>
      <isDefaultSaveLocation>true</isDefaultSaveLocation>
      <isSupported>false</isSupported>
      <simpleLocation>
        <url>$folderB</url>
      </simpleLocation>
    </searchConnectorDescription>
    <searchConnectorDescription>
      <isSupported>false</isSupported>
      <simpleLocation>
        <url>$folderC</url>
      </simpleLocation>
    </searchConnectorDescription>
  </searchConnectorDescriptionList>
</libraryDescription>
"@

# Save the XML file
$libraryXml | Out-File -FilePath $libraryPath -Encoding UTF8

# Refresh Explorer
Stop-Process -Name explorer -Force
#
#
## : Rename a .library-ms File
#
#
powershell
Copy
$oldPath = "$env:APPDATA\Microsoft\Windows\Libraries\New Library.library-ms"
$newPath = "$env:APPDATA\Microsoft\Windows\Libraries\MergedBC.library-ms"

if (Test-Path $oldPath) {
    Rename-Item -Path $oldPath -NewName "MergedBC.library-ms"
    Write-Host "Library renamed to 'MergedBC'!"
} else {
    Write-Warning "'New Library.library-ms' not found. Did the GUI prompt appear?"
}
#
# 
## My idea 
#
# Step 1: Create a PSDrive Merging Both Folders
# Define paths
$psDriveRoot = "C:\Temp\MergedView"  # Temporary staging area
$sourceA = "FULL_PATH_TO_FOLDER_A"    # ← REPLACE
$sourceB = "FULL_PATH_TO_FOLDER_B"    # ← REPLACE

# Create a PSDrive that dynamically merges A and B
New-PSDrive -Name "Merged" -PSProvider "FileSystem" -Root $psDriveRoot -Scope Global

# Function to sync files (run this periodically)
function Update-MergedView {
    # Clear existing links
    Remove-Item "$psDriveRoot\*" -Force -ErrorAction SilentlyContinue

    # Create new symlinks for all files
    Get-ChildItem $sourceA, $sourceB -File | ForEach-Object {
        $linkPath = "$psDriveRoot\$($_.Name)"
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $_.FullName -Force
    }
}

# Initial sync
Update-MergedView
#
## Step 2: Expose the PSDrive in Explorer via Junction
# Create a junction to the PSDrive in your desired location
$holderPath = "D:\Desktop\Holder"
mklink /J $holderPath $psDriveRoot  # Requires admin
#
##Step 3: COM Object for Root Access
$shell = New-Object -ComObject Shell.Application
$folderObj = $shell.Namespace("shell:Downloads")  # Example for Downloads
$folderObj.Self  # Returns COM object representing the folder root
#
## Key properties for above
<#	$folderObj.Self.Name       # Folder name
	$folderObj.Self.Path       # Full path
	$folderObj.Self.GetFolder  # COM folder object  #>
#
## Step 4: Final Workflow
<# 	Run Update-MergedView to refresh links.
	Access D:\Desktop\Holder in Explorer (shows merged content).
	Use COM to interact programmatically						 #>
#
$shell.Namespace($holderPath).Items() | Select-Object Name
#
#
## True Merged Folder with Real-Time Sync (PowerShell + Junctions)
#
# CONFIGURATION
$holderPath = "D:\Desktop\Holder"       # Final visible merged folder
$sourceA = "FULL_PATH_TO_FOLDER_A"      # ← REPLACE
$sourceB = "FULL_PATH_TO_FOLDER_B"      # ← REPLACE
$stagingPath = "C:\Temp\MergedStaging"  # Hidden working directory

# REQUIREMENTS:
# 1. Run as Administrator
# 2. NTFS filesystem
# 3. PowerShell 5.1+

# ========== SETUP ==========
# Create staging area (hidden)
New-Item -Path $stagingPath -ItemType Directory -Force
attrib +h $stagingPath

# Create visible junction point
if (-not (Test-Path $holderPath)) {
    cmd /c mklink /J $holderPath $stagingPath | Out-Null
}

# ========== SYNC ENGINE ==========
function Update-MergedView {
    # Track existing links to detect deletions
    $existingLinks = Get-ChildItem $stagingPath -File | Where-Object {
        $_.Attributes -match "ReparsePoint"
    } | Select-Object Name,Target

    # Phase 1: Add/Update files from both sources
    Get-ChildItem $sourceA, $sourceB -File | ForEach-Object {
        $linkPath = "$stagingPath\$($_.Name)"
        $shouldCreate = $true
        
        # Check if link exists and points to correct target
        if ($existingLink = $existingLinks | Where-Object { $_.Name -eq $_.Name }) {
            if ($existingLink.Target -eq $_.FullName) {
                $shouldCreate = $false
            } else {
                Remove-Item $linkPath -Force
            }
        }

        if ($shouldCreate) {
            New-Item -ItemType HardLink -Path $linkPath -Target $_.FullName -Force | Out-Null
        }
    }

    # Phase 2: Remove dead links
    Get-ChildItem $stagingPath -File | Where-Object {
        $_.Attributes -match "ReparsePoint" -and 
        -not (Test-Path $_.Target)
    } | Remove-Item -Force
}

# ========== REAL-TIME MONITORING ==========
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $sourceA,$sourceB
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

Register-ObjectEvent $watcher "Changed" -Action { Update-MergedView }
Register-ObjectEvent $watcher "Created" -Action { Update-MergedView }
Register-ObjectEvent $watcher "Deleted" -Action { Update-MergedView }

# Initial sync
Update-MergedView

Write-Host "Merged folder active at: $holderPath"
Write-Host "Monitoring $sourceA and $sourceB for changes..."
#
#
## For persistent background operation, convert to task or service [below]

#
## Step 2: Install the Service
.\MergedFolderService.ps1 -Install
# Verify the service is running
Get-Service MergedFolderService
#
## Step 3: Alternative (More Reliable) - Use NSSM
#
# Download NSSM (https://nssm.cc/download)
# Install nssm:
nssm install MergedFolderService "powershell.exe" "-File `"C:\path\to\MergedFolderWorker.ps1`""
nssm start MergedFolderService
#


# Save this as 'MergedFolderService.ps1'
param(
    [switch]$Install,
    [switch]$Uninstall
)

$serviceName = "MergedFolderService"
$scriptPath = Join-Path $PSScriptRoot "MergedFolderWorker.ps1"

if ($Install) {
    # Create the worker script
@'
# CONFIGURATION - EDIT THESE
$holderPath = "D:\Desktop\Holder"
$sourceA = "FULL_PATH_TO_FOLDER_A"
$sourceB = "FULL_PATH_TO_FOLDER_B"
$stagingPath = "C:\Temp\MergedStaging"

# SERVICE CORE
function Update-MergedView {
    # (Paste the entire Update-MergedView function from previous script here)
}

# Main loop
while ($true) {
    Update-MergedView
    Start-Sleep -Seconds 5
}
'@ | Out-File $scriptPath -Encoding utf8

    # Create the service
    New-Service -Name $serviceName `
                -BinaryPathName "powershell.exe -File `"$scriptPath`"" `
                -DisplayName "Merged Folder Service" `
                -StartupType Automatic `
                -Description "Maintains merged view of $sourceA and $sourceB"
	# Start the service
    Start-Service $serviceName
    Write-Host "Service installed and started!"
}
elseif ($Uninstall) {
    Stop-Service $serviceName -Force
    Remove-Service $serviceName
    Remove-Item $scriptPath
    Write-Host "Service removed!"
}
else {
    Write-Host "Usage: .\MergedFolderService.ps1 -Install | -Uninstall"
}



# Hard link implementation (best balance)
$holderPath = "D:\Desktop\Holder"
New-Item -ItemType Directory -Path $holderPath -Force

Get-ChildItem "C:\FolderA", "C:\FolderB" -File | ForEach-Object {
    $linkPath = "$holderPath\$($_.Name)"
    if (-not (Test-Path $linkPath)) {
        New-Item -ItemType HardLink -Path $linkPath -Target $_.FullName
    }
}
#
#
## 1. Running FSW at Boot (Hidden) via Task Scheduler
#Step 1: Create a Persistent PowerShell Script
# Save this as C:\Scripts\FolderWatcher.ps1:
# Silent launch (no window)
[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Stop"

# FileSystemWatcher setup
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "C:\FolderA", "C:\FolderB"  # Replace with your paths
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

# Action when changes are detected
$action = {
    $event = $EventArgs
    $changeType = $event.ChangeType
    $file = $event.Name
    "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') | $changeType | $file" | Out-File "C:\Logs\FileChanges.log" -Append
}

# Register events
Register-ObjectEvent $watcher "Created" -Action $action
Register-ObjectEvent $watcher "Changed" -Action $action
Register-ObjectEvent $watcher "Deleted" -Action $action

# Keep the script running indefinitely
while ($true) { Start-Sleep -Seconds 10 }
#
## Step 2: Create a Scheduled Task
#
$action = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument "-WindowStyle Hidden -File C:\Scripts\FolderWatcher.ps1"

$trigger = New-ScheduledTaskTrigger -AtStartup
$settings = New-ScheduledTaskSettingsSet -Hidden -DontStopOnIdleEnd -StartWhenAvailable

Register-ScheduledTask `
    -TaskName "FSW Monitor" `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -RunLevel Highest  # Ensures it runs even if user isn't logged in
#
##  Option:  Run as system
#
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount
Register-ScheduledTask -TaskName "FSW Monitor" -Action $action -Trigger $trigger -Settings $settings -Principal $principal
#
#
## Option: Auto-Restart on Crash
#
$settings = New-ScheduledTaskSettingsSet -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 3
#
###


