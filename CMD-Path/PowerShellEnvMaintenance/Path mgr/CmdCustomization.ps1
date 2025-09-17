<#
╔════════════════════════════════════════════════════════════════════════════╗
║ File: CmdCustomization.ps1                                                 ║
║ Description: Functions to customize Command Prompt appearance and behavior ║
║ Date: May 19, 2025                                                         ║
╚════════════════════════════════════════════════════════════════════════════╝
#>

#
# Script should be saved as: CmdCustomization.ps1
# This script should be in the same directory as MainLauncher.ps1
#

# Fix banner and startup directory for Command Prompt
function Fix-CmdBanner {
    Show-StepHeader "CMD Banner and Startup Directory"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Registry path for Command Processor settings
        $regPath = "HKLM:\SOFTWARE\Microsoft\Command Processor"
        
        # Log start of operation
        Log-Message "Checking current registry settings..." -ForegroundColor Yellow
        
        # Create or modify the AutoRun value
        $currentValue = Get-RegistryProperty -Path $regPath -Name "AutoRun" -DefaultValue ""
        
        # Display current settings if they exist
        if ($currentValue) {
            Log-Message "Current AutoRun value: $currentValue" -ForegroundColor Yellow
        } else {
            Log-Message "No AutoRun value currently exists." -ForegroundColor Yellow
        }
        
        # Prompt user for action
        Log-Message "`nOptions:" -ForegroundColor Cyan
        Log-Message "1: Fix CMD Banner and Directory (cd to D:\Desktop and clear screen)" -ForegroundColor White
        Log-Message "2: Restore default (show banner, default directory)" -ForegroundColor White
        Log-Message "3: Return to main menu" -ForegroundColor White
        
        # Get user selection
        $option = Read-Host "`nSelect an option"
        
        # Process user selection
        switch ($option) {
            "1" {
                # Apply setting: change directory and clear screen
                Set-RegistryProperty -Path $regPath -Name "AutoRun" -Value "cd /d D:\\Desktop && cls" -Type String
                Log-Message "`nRegistry updated. Command Prompt will now:" -ForegroundColor Green
                Log-Message "- Start in D:\Desktop" -ForegroundColor Green
                Log-Message "- Hide the Windows version banner" -ForegroundColor Green
                Log-Message "The change will take effect when you open a new Command Prompt window." -ForegroundColor Green
                
                # Log the change
                $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] CMD Banner and Directory fix applied"
            }
            "2" {
                # Restore defaults
                Remove-ItemProperty -Path $regPath -Name "AutoRun" -ErrorAction SilentlyContinue
                Log-Message "`nRegistry restored to default. Command Prompt will:" -ForegroundColor Green
                Log-Message "- Show the Windows version banner" -ForegroundColor Green
                Log-Message "- Start in the default user profile directory" -ForegroundColor Green
                Log-Message "The change will take effect when you open a new Command Prompt window." -ForegroundColor Green
                
                # Log the change
                $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] CMD Banner and Directory settings restored to default"
            }
            "3" {
                # Return to main menu
                Log-Message "`nReturning to main menu..." -ForegroundColor Yellow
                return
            }
            default {
                # Handle invalid input
                Log-Message "`nInvalid option. No changes made." -ForegroundColor Red
                return
            }
        }
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        
        # Log the error
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] ERROR in Fix-CmdBanner: $_"
    }
    
    # Pause to let user read the message
    Pause-Script
}

# Set Command Prompt window size
function Set-CmdWindowSize {
    Show-StepHeader "CMD Window Size Configuration"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Registry path for console settings
        $consolePath = "HKCU:\Console"
        
        # Create the key if it doesn't exist
        if (-not (Test-Path $consolePath)) {
            New-Item -Path $consolePath -Force | Out-Null
        }
        
        # Define window size
        $width = 100  # Window width in characters
        $height = 27  # Window height in characters
        
        # Set window size (Width × Height)
        # The format is: (Height << 16) + Width as a DWORD
        Log-Message "Setting CMD window size to ${width}x${height}..." -ForegroundColor Yellow
        Set-RegistryProperty -Path $consolePath -Name "WindowSize" -Value (($height -shl 16) + $width) -Type DWord
        
        # Set screen buffer size (same width, but larger height for scrolling)
        # The buffer is what allows scrolling beyond what's visible
        Set-RegistryProperty -Path $consolePath -Name "ScreenBufferSize" -Value (($height * 5 -shl 16) + $width) -Type DWord
        
        Log-Message "`nCMD window size has been set to ${width}x${height}" -ForegroundColor Green
        Log-Message "Changes will take effect when you open a new Command Prompt window." -ForegroundColor Green
        
        # Log the change
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] CMD window size set to ${width}x${height}"
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        
        # Log the error
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] ERROR in Set-CmdWindowSize: $_"
    }
    
    # Pause to let user read the message
    Pause-Script
}

# Set Command Prompt font size
function Set-CmdFontSize {
    Show-StepHeader "CMD Font Configuration"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Registry path for console settings
        $consolePath = "HKCU:\Console"
        
        # Create the key if it doesn't exist
        if (-not (Test-Path $consolePath)) {
            New-Item -Path $consolePath -Force | Out-Null
        }
        
        # Define font size
        $fontSize = 20  # Font size in points
        
        # Set font size - the format is (Width << 16) + Height
        # For a square font, width and height are the same
        Log-Message "Setting CMD font size to $fontSize..." -ForegroundColor Yellow
        Set-RegistryProperty -Path $consolePath -Name "FontSize" -Value (($fontSize -shl 16) + $fontSize) -Type DWord
        
        # Set font to Consolas (a modern monospace font)
        Set-RegistryProperty -Path $consolePath -Name "FaceName" -Value "Consolas" -Type String
        
        # Set font family to TrueType (0x36 = 54 = modern font with stroke weight)
        Set-RegistryProperty -Path $consolePath -Name "FontFamily" -Value 0x00000036 -Type DWord
        
        Log-Message "`nCMD font has been set to Consolas $fontSize" -ForegroundColor Green
        Log-Message "Changes will take effect when you open a new Command Prompt window." -ForegroundColor Green
        
        # Log the change
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] CMD font set to Consolas $fontSize"
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        
        # Log the error
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] ERROR in Set-CmdFontSize: $_"
    }
    
    # Pause to let user read the message
    Pause-Script
}

# Apply all CMD fixes at once
function Apply-AllCmdFixes {
    Show-StepHeader "Applying All CMD Customizations"
    
    # Check if running with admin privileges
    if (-not (Test-Administrator)) {
        Log-Message "This operation requires administrative privileges." -ForegroundColor Red
        Log-Message "Please run this script as Administrator and try again." -ForegroundColor Red
        Pause-Script
        return
    }
    
    try {
        # Registry paths
        $cmdProcessorPath = "HKLM:\SOFTWARE\Microsoft\Command Processor"
        $consolePath = "HKCU:\Console"
        
        # Create the Console key if it doesn't exist
        if (-not (Test-Path $consolePath)) {
            New-Item -Path $consolePath -Force | Out-Null
        }
        
        # 1. Fix banner and startup directory
        # Changes directory and clears screen which hides the banner
        Log-Message "Setting startup directory and hiding banner..." -ForegroundColor Yellow
        Set-RegistryProperty -Path $cmdProcessorPath -Name "AutoRun" -Value "cd /d D:\\Desktop && cls" -Type String
        
        # 2. Set window size (100 columns by 27 rows)
        # The format is: (Height << 16) + Width as a DWORD
        $width = 100
        $height = 27
        Log-Message "Setting window size to ${width}x${height}..." -ForegroundColor Yellow
        Set-RegistryProperty -Path $consolePath -Name "WindowSize" -Value (($height -shl 16) + $width) -Type DWord
        Set-RegistryProperty -Path $consolePath -Name "ScreenBufferSize" -Value (($height * 5 -shl 16) + $width) -Type DWord
        
        # 3. Set font size (Consolas 20pt)
        # FontSize is (Width << 16) + Height as a DWORD
        $fontSize = 20
        Log-Message "Setting font to Consolas $fontSize..." -ForegroundColor Yellow
        Set-RegistryProperty -Path $consolePath -Name "FontSize" -Value (($fontSize -shl 16) + $fontSize) -Type DWord
        Set-RegistryProperty -Path $consolePath -Name "FaceName" -Value "Consolas" -Type String
        Set-RegistryProperty -Path $consolePath -Name "FontFamily" -Value 0x00000036 -Type DWord
        
        # 4. Enable QuickEdit and Insert modes
        # These improve text selection and input behavior
        Log-Message "Enabling QuickEdit and Insert modes..." -ForegroundColor Yellow
        Set-RegistryProperty -Path $consolePath -Name "QuickEdit" -Value 1 -Type DWord
        Set-RegistryProperty -Path $consolePath -Name "InsertMode" -Value 1 -Type DWord
        Set-RegistryProperty -Path $consolePath -Name "Options" -Value 0x0060 -Type DWord
        
        Log-Message "`nAll CMD fixes have been applied:" -ForegroundColor Green
        Log-Message "$([char]0x2713) `"CMD`" will start in D:\Desktop with banner hidden" -ForegroundColor Green
        Log-Message "$([char]0x2713) Window size set to ${width}x${height}" -ForegroundColor Green
        Log-Message "$([char]0x2713) Font set to Consolas $fontSize" -ForegroundColor Green
        Log-Message "$([char]0x2713) QuickEdit and Insert modes enabled" -ForegroundColor Green
        Log-Message "`nChanges will take effect when you open a new Command Prompt window." -ForegroundColor Green
        
        # Log the change
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] All CMD fixes applied"
    }
    catch {
        # Error handling
        Log-Message "`nAn error occurred: $_" -ForegroundColor Red
        
        # Log the error
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path "$env:TEMP\launcher_log.txt" -Value "[$timestamp] ERROR in Apply-AllCmdFixes: $_"
    }
    
    # Pause to let user read the message
    Pause-Script
}