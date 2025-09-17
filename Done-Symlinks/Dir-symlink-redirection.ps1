<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Script:       sort-redir.ps1                                                ║
║ Purpose:      Safely redirect folders with validation and error handling    ║
║ Date:         06JUL25                                                       ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>

#region Section 1: Global Variables and Initialization

# Paths to redirect (example placeholders, customize as needed)
$RedirectPaths = @{
    'Desktop'    = 'D:\Desktop'
    'Personal'   = 'D:\Desktop'
    'Documents'  = 'D:\Null'
    'Music'      = 'D:\Null'
    'Pictures'   = 'D:\Null'
    'Videos'     = 'D:\Null'
    'Downloads'  = 'D:\Desktop'  # Per your request
    'Cache'      = 'D:\temp'
    'IEHistory'  = 'D:\Null'
    'StartMenu'  = "D:\Users\$env:USERNAME\StartMenu"
}

#endregion Section 1

#region Section 2: Helper Functions

function Validate-Path {
    param([string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) {
        Write-Warning "Validate-Path: Path is null or empty"
        return $false
    }
    return $true
}

function Ensure-Directory {
    param([string]$Path)
    if (-not (Validate-Path $Path)) {
        throw "Ensure-Directory: Invalid path parameter"
    }
    if (-not (Test-Path $Path)) {
        try {
            New-Item -ItemType Directory -Path $Path -Force | Out-Null
        }
        catch {
            throw "Failed to create directory '$Path': $_"
        }
    }
}

function Redirect-Folder {
    param(
        [string]$KnownFolderGuid,
        [string]$TargetPath
    )
    if (-not (Validate-Path $TargetPath)) {
        Write-Warning "Redirect-Folder: TargetPath is invalid"
        return
    }
    # Confirm target folder exists or create it
    Ensure-Directory -Path $TargetPath

    # Using registry-based folder redirection method (example)
    $RegBase = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"

    if (-not (Get-ItemProperty -Path $RegBase -ErrorAction SilentlyContinue)) {
        Write-Warning "Redirect-Folder: Registry path not found: $RegBase"
        return
    }

    try {
        Set-ItemProperty -Path $RegBase -Name $KnownFolderGuid -Value $TargetPath
        Write-Output "Redirected folder GUID '$KnownFolderGuid' to '$TargetPath'"
    }
    catch {
        Write-Warning "Failed to redirect folder $KnownFolderGuid to $TargetPath: $_"
    }
}

#endregion Section 2

#region Section 3: Main Redirection Logic

# Mapping known folder GUID names to friendly names; modify as needed
$FolderGuidMapping = @{
    'Desktop' = '{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}'
    'Documents' = '{F42EE2D3-909F-4907-8871-4C22FC0BF756}'
    'Music' = '{4BD8D571-6D19-48D3-BE97-422220080E43}'
    'Pictures' = '{33E28130-4E1E-4676-835A-98395C3BC3BB}'
    'Videos' = '{18989B1D-99B5-455B-841C-AB7C74E4DDFC}'
    'Downloads' = '{374DE290-123F-4565-9164-39C4925E467B}'
    'Cache' = ''  # no direct GUID for cache; handle separately
    'IEHistory' = ''  # no direct GUID; handle separately
    'StartMenu' = '{A77F5D77-2E2B-44C3-A6A2-ABA601054A51}'
}

foreach ($key in $RedirectPaths.Keys) {
    $target = $RedirectPaths[$key]
    if ($FolderGuidMapping.ContainsKey($key) -and $FolderGuidMapping[$key]) {
        $guid = $FolderGuidMapping[$key]
        try {
            Redirect-Folder -KnownFolderGuid $guid -TargetPath $target
        }
        catch {
            Write-Warning "Error redirecting $key: $_"
        }
    }
    else {
        # Handle folders without GUID redirection separately here (cache, IEHistory)
        Write-Output "No GUID redirection for $key; manual handling may be required."
    }
}

#endregion Section 3

#region Section 4: Additional Folder/Cache/History Moves

# Example: Move browser cache folders if needed (custom logic)

# Add any additional logic for special cases here

#endregion Section 4

Write-Output "Folder redirection complete."
