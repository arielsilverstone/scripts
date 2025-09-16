#
# ════════════════════════════════════════════════════════════════════════════════
# Script: format-scripts.ps1
# Applies formatting rules to all PowerShell scripts per style guidelines
# ════════════════════════════════════════════════════════════════════════════════
#
. "D:\Desktop\New\Functions.ps1"
Track-Change     -Name "format-scripts.ps1"
Manage-Tracing   -On
Set-GlobalAliases
#
# ════════════════════════════════════════════════════════════════════════════════
# Job 1: Locate All PS1 Files
# Gathers all .ps1 files recursively from the Dev tree
# ════════════════════════════════════════════════════════════════════════════════
$ScriptRoot = "D:\Program Files\Dev"
$AllScripts = Get-ChildItem -Path $ScriptRoot -Recurse -Filter *.ps1 -EA 0
#
# ════════════════════════════════════════════════════════════════════════════════
# Job 2: Format Each Script
# Applies consistent banner/header structure, alignment, and syntax clean-up
# ════════════════════════════════════════════════════════════════════════════════
ForEach ($Script in $AllScripts) {
    Write-Log -Msg "Formatting: $($Script.FullName)"

    $Content = Get-Content $Script.FullName -Raw

    # Apply header/banner rules
    $Content = $Content -replace "(?m)^\s*#\s*═+.*?═+\s*$", ""
    $Content = $Content -replace "(?m)^[ \t]*#(?!\s╔|\s══).*?$", ""

    # Insert standard banner if missing
    If ($Content -notmatch "# Script:.*?\n# SYNOPSIS") {
        $Header  = "#\n"
        $Header += "# ════════════════════════════════════════════════════════════════════════════════\n"
        $Header += "# Script: $($Script.Name)\n"
        $Header += "# SYNOPSIS\n"
        $Header += "#     [Insert brief purpose here]\n"
        $Header += "# ════════════════════════════════════════════════════════════════════════════════\n"
        $Header += "#"

        $Content = "$Header`r`n$Content"
    }

    # Enforce aligned equals signs for declarations
    $Content = ($Content -split "\r?\n") | ForEach-Object {
        If ($_ -match "^\s*\$\w+\s*=.*") {
            $_ -replace "=", " = "
        } Else {
            $_
        }
    } | Out-String

    # Remove excess blank lines before banners
    $Content = $Content -replace "(?ms)(\r?\n){2,}(# ═+)", "`r`n$2"

    # Save file
    $Content | Set-Content $Script.FullName -Encoding UTF8
    Write-Log -Msg "✅ Formatted: $($Script.Name)"
}
#
# ════════════════════════════════════════════════════════════════════════════════
# Job 3: Finalize
# Ends tracing and confirms formatting complete
# ════════════════════════════════════════════════════════════════════════════════
Write-Log -Msg "✅ All formatting complete."
Manage-Tracing -Off
