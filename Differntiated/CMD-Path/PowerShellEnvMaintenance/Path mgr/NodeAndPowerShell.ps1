<#
╔════════════════════════════════════════════════════════════════════════════╗
║ File: NodeAndPowerShell.ps1                                                ║
║ Description: Configure Node.js paths and PowerShell environment            ║
║ Author: Claude                                                             ║
║ Date: May 19, 2025                                                         ║
╚════════════════════════════════════════════════════════════════════════════╝
#>

#
# Script should be saved as: NodeAndPowerShell.ps1
# This script should be in the same directory as MainLauncher.ps1
#

# Configure Node.js paths
function Configure-NodeJS {
    Show-StepHeader "Configuring Node.js Paths"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Define Node.js paths
        $nodePath = "D:\program files\dev\tools\node"
        $npmPrefix = "D:\program files\dev\tools\node"
        $npmCache = "D:\program files\dev\tools\node\cache"
        
        # Check if Node.js directory exists or can be created
        if (-not (Test-Path $nodePath)) {
            # Check for backup
            $nodeBackupPath = "$nodePath.backup"
            if (Test-Path $nodeBackupPath) {
                Log-Message "Found Node.js backup at $nodeBackupPath" -ForegroundColor Yellow
                $restoreBackup = Read-Host "Would you like to restore it? (y/n)"
                
                if ($restoreBackup -eq "y") {
                    # Restore backup
                    Rename-Item -Path $nodeBackupPath -NewName $nodePath
                    Log-Message "Restored Node.js from backup." -ForegroundColor Green
                } else {
                    # Create new directory
                    New-Item -Path $nodePath -ItemType Directory -Force | Out-Null
                    Log-Message "Created new Node.js directory at $nodePath" -ForegroundColor Green
                }
            } else {
                # Check alternative location
                $altNodePath = "H:\dev\tools\node"
                if (Test-Path $altNodePath) {
                    Log-Message "Found Node.js at $altNodePath" -ForegroundColor Yellow
                    Log-Message "Creating junction to $nodePath..." -ForegroundColor Yellow
                    
                    # Create the directory structure
                    New-Item -Path (Split-Path $nodePath) -ItemType Directory -Force | Out-Null
                    
                    # Create junction
                    cmd /c mklink /J "$nodePath" "$altNodePath" 2>&1 | Out-Null
                    Log-Message "Created junction: $nodePath -> $altNodePath" -ForegroundColor Green
                } else {
                    # No Node.js installation found
                    Log-Message "Node.js installation not found." -ForegroundColor Red
                    Log-Message "Please install Node.js first and then run this script again." -ForegroundColor Red
                    Pause-Script
                    return
                }
            }
        }
        
        # Verify Node.js exists
        $nodeExe = Join-Path $nodePath "node.exe"
        if (-not (Test-Path $nodeExe)) {
            Log-Message "Node.js executable not found at $nodeExe" -ForegroundColor Red
            Log-Message "Please install Node.js first and then run this script again." -ForegroundColor Red
            Pause-Script
            return
        }
        
        Log-Message "`nSetting up Node.js paths..." -ForegroundColor Cyan
        
        # Ensure both system and user variables are properly set
        $systemPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
        $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
        
        # Default system path if not set
        $defaultSystemPath = "%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SystemRoot%\System32\WindowsPowerShell\v1.0\"
        
        # Update System PATH if needed
        if (-not $systemPath) {
            [Environment]::SetEnvironmentVariable("Path", "$defaultSystemPath;$nodePath", "Machine")
            Log-Message "Set System PATH to include Node.js" -ForegroundColor Green
        } elseif ($systemPath -notlike "*$nodePath*") {
            [Environment]::SetEnvironmentVariable("Path", "$systemPath;$nodePath", "Machine")
            Log-Message "Added Node.js to System PATH" -ForegroundColor Green
        } else {
            Log-Message "System PATH already includes Node.js" -ForegroundColor Green
        }
        
        # Create npm cache directory if it doesn't exist
        if (-not (Test-Path $npmCache)) {
            New-Item -Path $npmCache -ItemType Directory -Force | Out-Null
            Log-Message "Created npm cache directory at $npmCache" -ForegroundColor Green
        }
        
        # Set NODE_PATH for both System and User
        [Environment]::SetEnvironmentVariable("NODE_PATH", $nodePath, "Machine")
        [Environment]::SetEnvironmentVariable("NODE_PATH", $nodePath, "User")
        Log-Message "Set NODE_PATH environment variable" -ForegroundColor Green
        
        # Configure npm prefix and cache
     try {
         # Need to use Start-Process to capture output
         # Fix: Properly quote and escape the paths with spaces
         $npmCliPath = Join-Path $nodePath 'npm-cli.js'
         
         # Fix for setting prefix
         $prefixArgs = "`"$npmCliPath`" config set prefix `"$npmPrefix`""
         $npmConfigSetPrefix = Start-Process -FilePath "$nodeExe" -ArgumentList $prefixArgs -NoNewWindow -Wait -PassThru
         
         # Fix for setting cache
         $cacheArgs = "`"$npmCliPath`" config set cache `"$npmCache`""
         $npmConfigSetCache = Start-Process -FilePath "$nodeExe" -ArgumentList $cacheArgs -NoNewWindow -Wait -PassThru
         
         Log-Message "Configured npm prefix and cache" -ForegroundColor Green
     } catch {
          Log-Message "Warning: Could not configure npm settings: $_" -ForegroundColor Yellow
     }
        # Verify changes
        Log-Message "`nNode.js configuration complete!" -ForegroundColor Green
        Log-Message "System PATH: $([Environment]::GetEnvironmentVariable('Path', 'Machine'))" -ForegroundColor Gray
        Log-Message "NODE_PATH (System): $([Environment]::GetEnvironmentVariable('NODE_PATH', 'Machine'))" -ForegroundColor Gray
        Log-Message "NODE_PATH (User): $([Environment]::GetEnvironmentVariable('NODE_PATH', 'User'))" -ForegroundColor Gray
        
        try {
            # Try to get Node.js and npm versions
            $nodeVersion = & "$nodeExe" --version
            Log-Message "Node version: $nodeVersion" -ForegroundColor Green
            
            $npmVersion = & "$nodeExe" "$(Join-Path $nodePath 'npm-cli.js')" --version
            Log-Message "npm version: $npmVersion" -ForegroundColor Green
        } catch {
            Log-Message "Could not determine Node.js/npm versions: $_" -ForegroundColor Yellow
        }
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        Log-Message "Error details: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Pause-Script
}

# Configure PowerShell registry settings
function Configure-PowerShellRegistry {
    Show-StepHeader "Configuring PowerShell Registry Settings"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Define registry paths
        $WinPSPolicy = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell"
        $CorePSPolicy = "HKLM:\Software\Policies\Microsoft\PowerShellCore"
        $AllPSPolicies = @($WinPSPolicy, $CorePSPolicy)
        
        $WinPSProduct = "HKLM:\Software\Microsoft\PowerShell"
        $CorePSProduct = "HKLM:\SOFTWARE\Microsoft\PowerShellCore"
        $AllPSProducts = @($WinPSProduct, $CorePSProduct)
        
        # Create all required registry paths
        $Paths = @(
            $WinPSPolicy,
            "$WinPSPolicy\ModuleLogging",
            "$WinPSPolicy\ScriptBlockLogging",
            "$WinPSPolicy\Transcription",
            $CorePSPolicy,
            "$CorePSPolicy\ModuleLogging",
            "$CorePSPolicy\ScriptBlockLogging",
            "$CorePSPolicy\Transcription",
            $WinPSProduct,
            "$CorePSProduct\InstallerProperties"
        )
        
        foreach ($path in $Paths) {
            if (-not (Test-Path $path)) {
                New-Item -Path $path -Force | Out-Null
                Log-Message "Created registry path: $path" -ForegroundColor Green
            }
        }
        
        # Configure PowerShell policies
        Log-Message "`nConfiguring PowerShell policies..." -ForegroundColor Cyan
        
        foreach ($policyPath in $AllPSPolicies) {
            # Module logging
            $modPath = Join-Path $policyPath "ModuleLogging"
            Set-RegistryProperty -Path $modPath -Name "EnableModuleLogging" -Value 0 -Type DWord
            
            # Script block logging
            $sblPath = Join-Path $policyPath "ScriptBlockLogging"
            Set-RegistryProperty -Path $sblPath -Name "EnableScriptBlockLogging" -Value 0 -Type DWord
            Set-RegistryProperty -Path $sblPath -Name "EnableScriptBlockInvocationLogging" -Value 0 -Type DWord
            
            # Transcription
            $trnPath = Join-Path $policyPath "Transcription"
            Set-RegistryProperty -Path $trnPath -Name "EnableTranscripting" -Value 0 -Type DWord
        }
        
        # Configure PowerShell products
        Log-Message "Configuring PowerShell product settings..." -ForegroundColor Cyan
        
        foreach ($productPath in $AllPSProducts) {
            Set-RegistryProperty -Path $productPath -Name "EnableScripts" -Value 0 -Type DWord
            Set-RegistryProperty -Path $productPath -Name "DisablePromptToUpdateHelp" -Value 0 -Type DWord
            Set-RegistryProperty -Path $productPath -Name "ExecutionPolicy" -Value "Unrestricted" -Type String
        }
        
        # Configure PowerShell Core to use Windows PowerShell policy settings
        foreach ($section in @("ModuleLogging", "ScriptBlockLogging", "Transcription")) {
            $corePath = Join-Path $CorePSPolicy $section
            Set-RegistryProperty -Path $corePath -Name "UseWindowsPowerShellPolicySetting" -Value 1 -Type DWord
        }
        
        # Configure execution policy in Shell IDs
        $shellPath = "HKLM:\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell"
        Set-RegistryProperty -Path $shellPath -Name "ExecutionPolicy" -Value "Unrestricted" -Type String
        
        Log-Message "`nPowerShell registry settings have been configured:" -ForegroundColor Green
        Log-Message "$([char]0x2713) Module logging disabled" -ForegroundColor Green
        Log-Message "$([char]0x2713) Script block logging disabled" -ForegroundColor Green
        Log-Message "$([char]0x2713) Transcription disabled" -ForegroundColor Green
        Log-Message "$([char]0x2713) Execution policy set to Unrestricted" -ForegroundColor Green
        Log-Message "$([char]0x2713) Help update prompts disabled" -ForegroundColor Green
        Log-Message "$([char]0x2713) PowerShell Core configured to use Windows PowerShell policies" -ForegroundColor Green
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        Log-Message "Error details: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Pause-Script
}
# Install PowerShell modules
function Install-PowerShellModules {
    Show-StepHeader "Installing PowerShell Modules"
    
    try {
        # Skip trying to use PowerShellGet/PackageManagement entirely
        Log-Message "PowerShell module installation using alternative method..." -ForegroundColor Cyan
        
        # List of modules to check
        $modules = @(
            @{Name = "PSWindowsAdminCenter"; Force = $true},
            @{Name = "PSFramework"; Force = $true},
            @{Name = "PSScriptAnalyzer"; Force = $true}
        )
        
        # Check which modules are already installed
        Log-Message "Checking installed modules..." -ForegroundColor Cyan
        
        foreach ($module in $modules) {
            $moduleName = $module.Name
            $installedModule = Get-Module -Name $moduleName -ListAvailable -ErrorAction SilentlyContinue
            
            if ($null -ne $installedModule) {
                Log-Message "Module $moduleName is already installed (version $($installedModule.Version))." -ForegroundColor Green
            } else {
                Log-Message "Module $moduleName is not installed." -ForegroundColor Yellow
            }
        }
        
        # Offer manual installation instructions
        Log-Message "`nTo install these modules manually, run the following commands in an elevated PowerShell window:" -ForegroundColor Cyan
        foreach ($module in $modules) {
            Log-Message "Install-Module -Name $($module.Name) -Force -AllowClobber -Scope AllUsers" -ForegroundColor White
        }
        
        # Ask if user wants to continue with automated installation
        $continue = Read-Host "`nDo you want to continue with automated installation attempt? (y/n)"
        
        if ($continue -ne "y") {
            Log-Message "Skipping module installation. Please install modules manually as shown above." -ForegroundColor Yellow
            return
        }
        
        # Try an alternative installation method
        Log-Message "`nAttempting alternative installation method..." -ForegroundColor Cyan
        
        # Create a temporary script to install modules
        $tempScriptPath = Join-Path $env:TEMP "InstallModules.ps1"
        
        $scriptContent = @'
# Script to install PowerShell modules
Write-Host "Installing PowerShell modules..." -ForegroundColor Cyan

$modules = @(
    "PSWindowsAdminCenter",
    "PSFramework",
    "PSScriptAnalyzer"
)

foreach ($moduleName in $modules) {
    Write-Host "Installing module: $moduleName" -ForegroundColor Yellow
    try {
        # Using basic Install-Module command
        Install-Module -Name $moduleName -Force -AllowClobber -Scope AllUsers -SkipPublisherCheck -ErrorAction Stop
        Write-Host "Successfully installed module: $moduleName" -ForegroundColor Green
    } catch {
        Write-Host "Failed to install module: $moduleName" -ForegroundColor Red
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "Installation complete!" -ForegroundColor Green
'@
        
        Set-Content -Path $tempScriptPath -Value $scriptContent
        
        # Execute the script in a new PowerShell process with elevated privileges
        Log-Message "Launching new PowerShell window to install modules..." -ForegroundColor Cyan
        Log-Message "Please respond to any User Account Control prompts." -ForegroundColor Yellow
        
        $process = Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$tempScriptPath`"" -Wait -PassThru -Verb RunAs
        
        # Check the result
        if ($process.ExitCode -eq 0) {
            Log-Message "Module installation process completed successfully." -ForegroundColor Green
        } else {
            Log-Message "Module installation process failed with exit code $($process.ExitCode)." -ForegroundColor Red
        }
        
        # Clean up
        Remove-Item -Path $tempScriptPath -Force -ErrorAction SilentlyContinue
        
        # Final check of installed modules
        Log-Message "`nVerifying installed modules:" -ForegroundColor Cyan
        foreach ($module in $modules) {
            $moduleName = $module.Name
            $installedModule = Get-Module -Name $moduleName -ListAvailable -ErrorAction SilentlyContinue
            
            if ($null -ne $installedModule) {
                Log-Message "Module $moduleName is installed (version $($installedModule.Version))." -ForegroundColor Green
            } else {
                Log-Message "Module $moduleName is not installed." -ForegroundColor Red
            }
        }
    }
    catch {
        $errorMsg = $_.Exception.Message
        Log-Message "`nAn error occurred: $errorMsg" -ForegroundColor Red
    }
}