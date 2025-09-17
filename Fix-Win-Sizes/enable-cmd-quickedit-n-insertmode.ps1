# Function to enable QuickEdit and Insert modes for CMD
function Enable-CmdQuickEditAndInsert {
    # Registry path for console settings
    $consolePath = "HKCU:\Console"
    
    # Create the key if it doesn't exist
    if (-not (Test-Path $consolePath)) {
        New-Item -Path $consolePath -Force | Out-Null
    }
    
    # QuickEdit mode is bit 0x0040, Insert mode is bit 0x0020 in the Options DWORD
    # Setting both = 0x0060 (96 in decimal)
    Set-ItemProperty -Path $consolePath -Name "QuickEdit" -Value 1 -Type DWord
    Set-ItemProperty -Path $consolePath -Name "InsertMode" -Value 1 -Type DWord
    
    # The old way (still works in some Windows versions) is to use the Options value
    # where both modes are bits in the same value
    $options = 0x0060
    Set-ItemProperty -Path $consolePath -Name "Options" -Value $options -Type DWord
    
    Write-Host "QuickEdit and Insert modes have been enabled for Command Prompt." -ForegroundColor Green
    Write-Host "Please open a new CMD window to see the changes." -ForegroundColor Green
}

# Run the function
Enable-CmdQuickEditAndInsert