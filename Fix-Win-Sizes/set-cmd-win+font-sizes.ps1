# Function to set CMD window size and font size
function Set-CmdWindowAndFont {
    param (
        [int]$Width = 100,
        [int]$Height = 27,
        [int]$FontSize = 20
    )

    # Registry path for console settings
    $consolePath = "HKCU:\Console"
    
    # Create the key if it doesn't exist
    if (-not (Test-Path $consolePath)) {
        New-Item -Path $consolePath -Force | Out-Null
    }
    
    # Set window size (Width × Height)
    Write-Host "Setting CMD window size to ${Width}x${Height}..." -ForegroundColor Cyan
    Set-ItemProperty -Path $consolePath -Name "WindowSize" -Value (($Height -shl 16) + $Width) -Type DWord
    
    # Set screen buffer size (same width, but larger height for scrolling)
    Set-ItemProperty -Path $consolePath -Name "ScreenBufferSize" -Value (($Height * 5 -shl 16) + $Width) -Type DWord
    
    # Set font size
    Write-Host "Setting CMD font size to $FontSize..." -ForegroundColor Cyan
    Set-ItemProperty -Path $consolePath -Name "FontSize" -Value (($FontSize -shl 16) + $FontSize) -Type DWord
    
    # Set font to Consolas
    Set-ItemProperty -Path $consolePath -Name "FaceName" -Value "Consolas" -Type String
    
    # Set font family to TrueType
    Set-ItemProperty -Path $consolePath -Name "FontFamily" -Value 0x00000036 -Type DWord
    
    Write-Host "Settings applied. Please open a new CMD window to see the changes." -ForegroundColor Green
}

# Run the function with default values
Set-CmdWindowAndFont