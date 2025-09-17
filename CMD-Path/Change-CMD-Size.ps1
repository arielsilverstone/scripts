<#
FLAWLESS CONSOLE CONFIGURATOR
Base Size: 35 rows × 130 columns
Font: 24pt Lucida Console
#>

function Set-PerfectConsole {
    $cols = 130
    $lines = 35
    $retryCount = 0

    # 1. REGISTRY CONFIG
    try {
        $consolePath = "HKCU:\Console"
        if (-not (Test-Path $consolePath)) { New-Item -Path $consolePath -Force | Out-Null }

        $props = @{
            "FontSize"   = 0x00180000  # 24pt
            "FaceName"   = "Lucida Console"
            "WindowSize" = 0x00230082  # 35x130 in hex
            "ScreenBufferSize" = 0x00230082
            "FontFamily" = 0x00000036  # TrueType
        }

        foreach ($prop in $props.GetEnumerator()) {
            Set-ItemProperty -Path $consolePath -Name $prop.Key -Value $prop.Value -Force
        }
    }
    catch {
        Write-Host "Registry config failed: $_" -ForegroundColor Yellow
    }

    # 2. CONSOLE SIZE ENFORCEMENT
    do {
        # A. Apply via mode command
        $null = cmd /c "mode con: cols=$cols lines=$lines 2>&1"
        
        # B. New verification method (works on all Windows versions)
        $widthOk = $Host.UI.RawUI.WindowSize.Width -eq $cols
        $heightOk = $Host.UI.RawUI.WindowSize.Height -eq $lines
        
        if ($widthOk -and $heightOk) {
            Write-Host "Console locked to ${cols}x${lines}" -ForegroundColor Green
            return $true
        }
        
        $retryCount++
        Start-Sleep -Milliseconds 200
    } while ($retryCount -lt 3)

    # 3. FINAL FALLBACK
    Write-Host "Using alternative sizing method..." -ForegroundColor Yellow
    $Host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size($cols, $lines)
    return $false
}

# MAIN EXECUTION
if (Set-PerfectConsole) {
    cmd /k "title CONFIGURED_35x130 && echo Success! Check Properties → Font tab && prompt $P$G"
}
else {
    cmd /k "title FALLBACK_35x130 && echo Manual configuration needed && prompt $P$G"
}