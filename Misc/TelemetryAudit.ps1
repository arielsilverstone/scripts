# Scans env vars for telemetry flags, shows duplicates and suggestions

$knownTelemetryKeys = @(
    "DOTNET_CLI_TELEMETRY_OPTOUT",
    "DISABLE_TELEMETRY_OPTOUT",
    "DISABLE_OFFICE_TELEMETRY",
    "DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT",
    "DO_NOT_SEND_TELEMETRY",
    "INTEL_DSA_DISABLE_TELEMETRY",
    "INTEL_GPU_TELEMETRY_DISABLE",
    "INTEL_TELEMETRY_OPT_OUT",
    "MS_TELEMETRY_OPTOUT",
    "NEXT_TELEMETRY_DISABLED",
    "NGX_ENABLE_PRIVACY",
    "NV_CUDA_DISABLE_TELEMETRY",
    "NV_TELEMETRY_DISABLED",
    "OFFICE_TELEMETRY_OPTOUT",
    "POWERSHELL_TELEMETRY_OPTOUT",
    "TELEMETRY_DISABLED"
)

function Get-EnvVars([string]$Scope) {
    switch ($Scope) {
        "User"   { return [System.Environment]::GetEnvironmentVariables("User") }
        "System" { return [System.Environment]::GetEnvironmentVariables("Machine") }
    }
}

$userVars = Get-EnvVars -Scope "User"
$systemVars = Get-EnvVars -Scope "System"

Write-Output "---- TELEMETRY VARIABLES AUDIT ----`n"

foreach ($key in $knownTelemetryKeys) {
    $userVal   = $userVars[$key]
    $systemVal = $systemVars[$key]
    if ($userVal -or $systemVal) {
        Write-Host "$key"
        if ($userVal)   { Write-Host "  User:   $userVal" -ForegroundColor Yellow }
        if ($systemVal) { Write-Host "  System: $systemVal" -ForegroundColor Green }
        if ($userVal -and $systemVal) {
            Write-Host "  ⚠ Consider removing from User if System defines it." -ForegroundColor Red
        }
    }
}
