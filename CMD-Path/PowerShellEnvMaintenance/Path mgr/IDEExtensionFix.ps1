<#
╔════════════════════════════════════════════════════════════════════════════╗
║ File: IDEExtensionFix.ps1                                                  ║
║ Description: Fix IDE extension directories to prevent cross-contamination  ║
║ Author: Claude                                                             ║
║ Date: May 19, 2025                                                         ║
╚════════════════════════════════════════════════════════════════════════════╝
#>

#
# Script should be saved as: IDEExtensionFix.ps1
# This script should be in the same directory as MainLauncher.ps1
#

# Fix IDE extension directories
function Fix-IDEExtensionDirectories {
    Show-StepHeader "Fixing IDE Extension Directories"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Helper function to safely create a junction
        function Create-Safe-Junction {
            param(
                [string]$junctionPath,
                [string]$targetPath,
                [string]$backupSuffix = ".backup"
            )
            
            # First check if target exists
            if (-not (Test-Path $targetPath)) {
                Log-Message "WARNING: Target does not exist: $targetPath" -ForegroundColor Yellow
                Log-Message "Creating target directory: $targetPath" -ForegroundColor Yellow
                New-Item -Path $targetPath -ItemType Directory -Force | Out-Null
            }
            
            if (Test-Path $junctionPath) {
                # Backup existing directory
                $backupPath = $junctionPath + $backupSuffix
                Log-Message "Backing up $junctionPath to $backupPath"
                
                # Remove old backup if it exists
                if (Test-Path $backupPath) {
                    Remove-Item -Path $backupPath -Force -Recurse
                }
                
                # Rename existing to backup
                Rename-Item -Path $junctionPath -NewName ($junctionPath + $backupSuffix)
            }
            
            # Create the junction
            cmd /c mklink /J "$junctionPath" "$targetPath" 2>&1 | Out-Null
            Log-Message "Created junction: $junctionPath -> $targetPath" -ForegroundColor Green
        }
        
        # Ensure base directories exist
        $extensionsBaseDir = "D:\program files\dev\settings\extensions"
        $userSettingsDir = "D:\program files\dev\settings\user"
        
        if (-not (Test-Path $extensionsBaseDir)) {
            New-Item -Path $extensionsBaseDir -ItemType Directory -Force | Out-Null
            Log-Message "Created directory: $extensionsBaseDir" -ForegroundColor Green
        }
        
        if (-not (Test-Path $userSettingsDir)) {
            New-Item -Path $userSettingsDir -ItemType Directory -Force | Out-Null
            Log-Message "Created directory: $userSettingsDir" -ForegroundColor Green
        }
        
        # Define IDE-specific extension directories
        $ides = @(
            "trae",
            "windsurf",
            "windsurf-next",
            "vscodium"
        )
        
        # Create extension directories for each IDE
        foreach ($ide in $ides) {
            $extensionDir = Join-Path $extensionsBaseDir $ide
            
            if (-not (Test-Path $extensionDir)) {
                New-Item -Path $extensionDir -ItemType Directory -Force | Out-Null
                Log-Message "Created extension directory: $extensionDir" -ForegroundColor Green
            }
        }
        
        # Now create symlinks from common extensions to IDE-specific directories
        $commonExtensionsDir = "D:\program files\dev\settings\extensions\_common"
        
        if (-not (Test-Path $commonExtensionsDir)) {
            New-Item -Path $commonExtensionsDir -ItemType Directory -Force | Out-Null
            Log-Message "Created common extensions directory: $commonExtensionsDir" -ForegroundColor Green
            
            # Prompt to copy existing extensions to common directory
            Log-Message "`nWould you like to copy existing extensions to the common directory?" -ForegroundColor Yellow
            Log-Message "This will help consolidate your extensions." -ForegroundColor Yellow
            $copyExtensions = Read-Host "Copy extensions? (y/n)"
            
            if ($copyExtensions -eq "y") {
                # Check for existing extensions in usual locations
                $possibleExtensionPaths = @(
                    "$env:USERPROFILE\.vscode\extensions",
                    "$env:USERPROFILE\.vscode-oss\extensions",
                    "D:\program files\dev\Trea\data\extensions",
                    "D:\program files\dev\Windsurf\data\extensions"
                )
                
                foreach ($path in $possibleExtensionPaths) {
                    if (Test-Path $path) {
                        Log-Message "Found extensions at: $path" -ForegroundColor Green
                        Log-Message "Copying to common directory..." -ForegroundColor Yellow
                        
                        # Get all extension directories
                        $extensionDirs = Get-ChildItem -Path $path -Directory
                        
                        foreach ($extDir in $extensionDirs) {
                            $targetDir = Join-Path $commonExtensionsDir $extDir.Name
                            
                            if (-not (Test-Path $targetDir)) {
                                Log-Message "  Copying $($extDir.Name)..." -ForegroundColor Gray
                                Copy-Item -Path $extDir.FullName -Destination $targetDir -Recurse -Force
                            }
                        }
                    }
                }
            }
        }
        
        # Create junction points for each IDE extension directory
        foreach ($ide in $ides) {
            $extensionDir = Join-Path $extensionsBaseDir $ide
            $commonLink = Join-Path $extensionDir "_common"
            
            Create-Safe-Junction -junctionPath $commonLink -targetPath $commonExtensionsDir
        }
        
        # Create a README.md file in the extensions base directory
        $readmeContent = @"
# IDE Extension Directories

This directory contains separated extension directories for each IDE:

- `trae` - Extensions for Trae IDE
- `windsurf` - Extensions for Windsurf IDE
- `windsurf-next` - Extensions for Windsurf-Next IDE
- `vscodium` - Extensions for VSCodium

Each IDE-specific directory contains a junction point `_common` which points to
the shared common extensions directory.

## How to Use

Launch each IDE using the corresponding batch file in D:\Links:

- `trae.bat`
- `windsurf.bat`
- `windsurf-next.bat`
- `vscodium.bat`

These batch files are configured to use the correct extension directories.

## Directory Structure
D:\program files\dev\settings
├── extensions
│   ├── _common\         # Shared extensions
│   ├── trae
│   │   └── _common\     # Junction to _common
│   ├── windsurf
│   │   └── _common\     # Junction to _common
│   ├── windsurf-next
│   │   └── _common\     # Junction to _common
│   └── vscodium
│       └── _common\     # Junction to _common
└── user\                # Shared user settings

Last updated: $(Get-Date -Format "yyyy-MM-dd")
"@
        
        $readmePath = Join-Path $extensionsBaseDir "README.md"
        Set-Content -Path $readmePath -Value $readmeContent
        Log-Message "Created README.md in $extensionsBaseDir" -ForegroundColor Green
        
        Log-Message "`nIDE extension directories have been set up successfully!" -ForegroundColor Green
        Log-Message "Each IDE will now use its own extension directory with access to common extensions." -ForegroundColor Green
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        Log-Message "Error details: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Pause-Script
}