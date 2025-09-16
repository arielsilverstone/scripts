<#
╔════════════════════════════════════════════════════════════════════════════╗
║ File: SymlinkSetup.ps1                                                     ║
║ Description: Create symbolic links for config files and executables        ║
║ Author: Claude                                                             ║
║ Date: May 19, 2025                                                         ║
╚════════════════════════════════════════════════════════════════════════════╝
#>

#
# Script should be saved as: SymlinkSetup.ps1
# This script should be in the same directory as MainLauncher.ps1
#

# Create common file symbolic links (settings.json, etc.)
function Create-CommonFileLinks {
    Show-StepHeader "Creating Common File Symbolic Links"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Create directory if it doesn't exist
        if (-not (Test-Path "D:\Links")) {
            New-Item -Path "D:\Links" -ItemType Directory -Force | Out-Null
            Log-Message "Created directory: D:\Links" -ForegroundColor Green
        }
        
        # Define symlinks to create
        $symlinks = @(
            # Format: @{Name = "LinkName"; Target = "TargetPath"}
            @{Name = "settings.json"; Target = "D:\Program Files\Dev\Settings\General\Master-settings.json"},
            @{Name = "ai.json"; Target = "D:\Program Files\Dev\Settings\General\ai.json"},
            @{Name = "PSScriptAnalyzerSettings.psd1"; Target = "D:\Program Files\Dev\Settings\General\PSScriptAnalyzerSettings.psd1"}
        )
        
        # Create each symlink
        foreach ($link in $symlinks) {
            $linkPath = Join-Path "D:\Links" $link.Name
            $targetPath = $link.Target
            
            # Check if target exists
            if (Test-Path $targetPath) {
                # Check if link already exists
                if (Test-Path $linkPath) {
                    Log-Message "Link already exists: $linkPath" -ForegroundColor Yellow
                    Log-Message "  Would you like to recreate it? (y/n)" -ForegroundColor Yellow
                    $recreate = Read-Host
                    
                    if ($recreate -eq "y") {
                        Remove-Item -Path $linkPath -Force
                    } else {
                        Log-Message "  Skipping: $linkPath" -ForegroundColor Yellow
                        continue
                    }
                }
                
                # Create hard link using cmd.exe
                $result = cmd /c mklink /H "$linkPath" "$targetPath" 2>&1
                Log-Message "Created link: $linkPath -> $targetPath" -ForegroundColor Green
            } else {
                Log-Message "Target path does not exist: $targetPath" -ForegroundColor Red
                Log-Message "Skipping creation of link: $linkPath" -ForegroundColor Red
            }
        }
        
        Log-Message "`nCommon file symbolic links creation complete!" -ForegroundColor Green
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        Log-Message "Error details: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Pause-Script
}

# Create symbolic links for IDE executables
function Create-IDESymlinks {
    Show-StepHeader "Creating IDE Symbolic Links"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Create directory if it doesn't exist
        if (-not (Test-Path "D:\Links")) {
            New-Item -Path "D:\Links" -ItemType Directory -Force | Out-Null
            Log-Message "Created directory: D:\Links" -ForegroundColor Green
        }
        
        # Helper function to safely create a symbolic link
        function Create-Safe-SymLink {
            param(
                [string]$linkPath,
                [string]$targetPath,
                [string]$backupSuffix = ".backup"
            )
            
            # First check if target exists
            if (-not (Test-Path $targetPath)) {
                Log-Message "WARNING: Target does not exist: $targetPath" -ForegroundColor Yellow
                Log-Message "Skipping creation of link: $linkPath" -ForegroundColor Yellow
                return
            }
            
            if (Test-Path $linkPath) {
                # Backup existing file/directory
                $backupPath = $linkPath + $backupSuffix
                Log-Message "Backing up $linkPath to $backupPath"
                
                # Remove old backup if it exists
                if (Test-Path $backupPath) {
                    Remove-Item -Path $backupPath -Force -Recurse
                }
                
                # Rename existing to backup
                Rename-Item -Path $linkPath -NewName ($linkPath + $backupSuffix)
            }
            
            # Create the symbolic link
            cmd /c mklink "$linkPath" "$targetPath" 2>&1 | Out-Null
            Log-Message "Created symbolic link: $linkPath -> $targetPath" -ForegroundColor Green
        }
        
        # Define paths to check
        $pathsToCheck = @{
            "Python" = "D:\program files\dev\tools\python\python.exe"
            "Pip" = "D:\program files\dev\tools\python\Scripts\pip.exe"
            "Trae" = "D:\program files\dev\Trea\trae.exe"
            "Windsurf" = "D:\program files\dev\Windsurf\windsurf.exe"
            "Windsurf-Next" = "D:\del\Windsurf-1.7.102\windsurf - next.exe"
            "VSCodium" = "D:\pr\dev\VSCodium-1.100.23258\vscodium.exe"
            "Node" = "D:\program files\dev\tools\node\node.exe"
        }
        
        # Verify paths and create links
        Log-Message "Checking executable paths..." -ForegroundColor Cyan
        
        foreach ($key in $pathsToCheck.Keys) {
            $path = $pathsToCheck[$key]
            if (Test-Path $path) {
                Log-Message "Found: $key at $path" -ForegroundColor Green
                $linkPath = "D:\Links\$($key.ToLower()).exe"
                Create-Safe-SymLink -linkPath $linkPath -targetPath $path
            } else {
                Log-Message "Not found: $key at $path" -ForegroundColor Red
                
                # For Node, check if it exists in other locations or if there's a backup
                if ($key -eq "Node") {
                    $nodeDir = "D:\program files\dev\tools\node"
                    $nodeBackupDir = $nodeDir + ".backup"
                    
                    if (Test-Path $nodeBackupDir) {
                        Log-Message "  Found a Node.js backup at $nodeBackupDir" -ForegroundColor Green
                        $restoreBackup = Read-Host "  Would you like to restore Node.js from backup? (y/n)"
                        
                        if ($restoreBackup -eq "y") {
                            # If there's an existing node directory, remove it
                            if (Test-Path $nodeDir) {
                                Remove-Item -Path $nodeDir -Force -Recurse
                            }
                            
                            # Rename backup to original name
                            Rename-Item -Path $nodeBackupDir -NewName $nodeDir
                            Log-Message "  Restored Node.js from backup at $nodeDir" -ForegroundColor Green
                            
                            # Try creating the link again
                            $nodeBinPath = Join-Path $nodeDir "node.exe"
                            if (Test-Path $nodeBinPath) {
                                $linkPath = "D:\Links\node.exe"
                                Create-Safe-SymLink -linkPath $linkPath -targetPath $nodeBinPath
                            }
                        }
                    }
                }
            }
        }
        
        # Create batch files for IDEs
        Log-Message "`nCreating IDE launcher batch files..." -ForegroundColor Cyan
        
        $ides = @{}
        if (Test-Path $pathsToCheck["Trae"]) { $ides["trae"] = $pathsToCheck["Trae"] }
        if (Test-Path $pathsToCheck["Windsurf"]) { $ides["windsurf"] = $pathsToCheck["Windsurf"] }
        if (Test-Path $pathsToCheck["Windsurf-Next"]) { $ides["windsurf-next"] = $pathsToCheck["Windsurf-Next"] }
        if (Test-Path $pathsToCheck["VSCodium"]) { $ides["vscodium"] = $pathsToCheck["VSCodium"] }
        
        foreach ($ide in $ides.Keys) {
            $batchPath = "D:\Links\$ide.bat"
            $batchContent = "@echo off`r`nstart """" ""$($ides[$ide])"" --extensions-dir=""D:\program files\dev\settings\extensions\$ide"" --user-data-dir=""D:\program files\dev\settings\user"""
            
            # Backup existing batch file if needed
            if (Test-Path $batchPath) {
                $backupPath = $batchPath + ".backup"
                if (Test-Path $backupPath) {
                    Remove-Item -Path $backupPath -Force
                }
                Rename-Item -Path $batchPath -NewName ($batchPath + ".backup")
            }
            
            Set-Content -Path $batchPath -Value $batchContent
            Log-Message "Created $ide.bat launcher in D:\Links" -ForegroundColor Green
        }
        
        Log-Message "`nIDE symbolic links creation complete!" -ForegroundColor Green
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        Log-Message "Error details: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Pause-Script
}