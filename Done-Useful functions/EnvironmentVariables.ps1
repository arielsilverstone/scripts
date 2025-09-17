# EnvironmentVariables.ps1 - Additional Environment Variables Configuration
# Extracted from Unattend-2.xml and expanded with comprehensive telemetry opt-out settings

param(
    [switch]$WhatIf,
    [switch]$Verbose
)

$ErrorActionPreference = "Continue"
$ProgressPreference = "SilentlyContinue"

Write-Host "Environment Variables Configuration" -ForegroundColor Magenta
Write-Host "===================================" -ForegroundColor Magenta
Write-Host ""

$Results = @{
    VariablesSet = 0
    Failed = 0
}

# Helper function to set environment variables
function Set-EnvironmentVariable {
    param(
        [string]$Name,
        [string]$Value,
        [string]$Type = "REG_EXPAND_SZ"
    )

    try {
        if ($WhatIf) {
            Write-Host "  [WHATIF] Would set: $Name = $Value" -ForegroundColor Yellow
        } else {
            if ($Type -eq "REG_DWORD") {
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -Name $Name -Value ([int]$Value) -Type DWord -Force
            } else {
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -Name $Name -Value $Value -Type ExpandString -Force
            }

            if ($Verbose) {
                Write-Host "  ✓ Set: $Name = $Value" -ForegroundColor Cyan
            }
            $Results.VariablesSet++
        }
    } catch {
        if ($Verbose) {
            Write-Warning "Failed to set $Name`: $($_.Exception.Message)"
        }
        $Results.Failed++
    }
}

Write-Host "Setting additional environment variables..." -ForegroundColor Green

# Additional telemetry opt-out variables (from Unattend-2.xml)
Set-EnvironmentVariable -Name "DENO_NO_UPDATE_CHECK" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "DISABLE_OFFICE_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "DISABLE_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "DO_NOT_SEND_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "DO_NOT_TRACK" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "EDGE_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "INTEL_DISABLE_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "INTEL_DSA_DISABLE_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "INTEL_GPU_TELEMETRY_DISABLE" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "INTEL_ONEAPI_DISABLE_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "INTEL_TELEMETRY_OPT_OUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "MICROSOFT_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "MS_DISABLE_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "MS_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "NEXT_TELEMETRY_DISABLED" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "NGX_ENABLE_PRIVACY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "NV_CUDA_DISABLE_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "NV_TELEMETRY_DISABLED" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "OFFICE_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "PSMODULE_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "REALTEK_DISABLE_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "TELEMETRY_DISABLED" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "VSCODEIUM_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "WINDOWS_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "WINUSER_DISABLE_TELEMETRY" -Value "1" -Type "REG_DWORD"
Set-EnvironmentVariable -Name "WIN_TELEMETRY_OPTOUT" -Value "1" -Type "REG_DWORD"

# Development tool configurations
Set-EnvironmentVariable -Name "VSCODE_EXTENSIONS" -Value "D:\Program Files\Dev\Settings\Extensions"
Set-EnvironmentVariable -Name "VSCODE_PORTABLE" -Value "D:\Program Files\Dev\Settings"
Set-EnvironmentVariable -Name "VSCODE_SYSTEMDATA" -Value "D:\Program Files\Dev\Settings\System"
Set-EnvironmentVariable -Name "WINDSURF_PORTABLE" -Value "D:\Program Files\Dev\Tools\Windsurf"

# LLM and AI tool configurations
Set-EnvironmentVariable -Name "OLLAMA_MODELS" -Value "D:\Program Files\Dev\Tools\LLMs"

# Network and storage configurations
Set-EnvironmentVariable -Name "MLNX_WINMFT" -Value "D:\Program Files\Mellanox\WinMFT\"

# Service port configurations
Set-EnvironmentVariable -Name "ACSvcPort" -Value "0"
Set-EnvironmentVariable -Name "RlsSvcPort" -Value "0"

Write-Host ""
Write-Host "Environment Variables Configuration Complete" -ForegroundColor Magenta
Write-Host "=============================================" -ForegroundColor Magenta
Write-Host "Variables Set: $($Results.VariablesSet)" -ForegroundColor Green
Write-Host "Failed: $($Results.Failed)" -ForegroundColor $(if ($Results.Failed -gt 0) { "Red" } else { "Green" })

if (-not $WhatIf) {
    Write-Host ""
    Write-Host "Environment Configuration Summary:" -ForegroundColor Cyan
    Write-Host "Comprehensive telemetry opt-out configured (25+ vendors)" -ForegroundColor Green
    Write-Host "Development tool environment paths set" -ForegroundColor Green
    Write-Host "AI/LLM tool configurations applied" -ForegroundColor Green
    Write-Host "Network and system service ports configured" -ForegroundColor Green
    Write-Host ""
    Write-Host " System restart required for environment variables to take effect" -ForegroundColor Yellow
}

# Export results for other scripts
return $Results
