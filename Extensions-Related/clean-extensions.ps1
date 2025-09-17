# Clean up duplicate extension folders
$extensions = Get-ChildItem -Directory | Where-Object { $_.Name -match "-universal$" }
foreach ($ext in $extensions) {
    $nonUniversal = $ext.Name -replace "-universal$", ""
    if (Test-Path $nonUniversal) {
        "Removing duplicate: $nonUniversal" | Out-File "clean-log.txt" -Append
        Remove-Item $nonUniversal -Recurse -Force
    }
}

# Merge extensions.json files
$jsonFiles = @(
    "PAIR-AI-extensions.json",
    "trae-extensions.json",
    "windsurf-extensions.json"
)

$merged = @()

foreach ($file in $jsonFiles) {
    if (Test-Path $file) {
        $content = Get-Content $file | ConvertFrom-Json
        foreach ($ext in $content) {
            $id = $ext.identifier.id
            $version = $ext.version
            $path = $ext.relativeLocation
            
            # Check if extension exists
            if (Test-Path $path) {
                # Add to merged list if not already present or if newer version
                $existing = $merged | Where-Object { $_.identifier.id -eq $id }
                if (-not $existing -or [version]$version -gt [version]$existing.version) {
                    $merged += $ext
                }
            }
        }
    }
}

# Save merged extensions
$merged | ConvertTo-Json -Depth 10 | Set-Content "merged-extensions.json"

# Update report
"Extensions Clean and Merge Report - $(Get-Date)" | Out-File "merge-report.txt"
"Total Extensions Processed: $($merged.Count)" | Out-File "merge-report.txt" -Append
"`nExtensions in merged file:" | Out-File "merge-report.txt" -Append
$merged | ForEach-Object { "- $($_.identifier.id) v$($_.version)" } | Out-File "merge-report.txt" -Append
