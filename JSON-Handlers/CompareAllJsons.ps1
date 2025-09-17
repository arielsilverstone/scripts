param(
    [string]$JsonFolder = "D:\Desktop\Temp",
    [int]$Depth = 2
)

# Dot-source the NLevelComparison script
. "$JsonFolder\NLevelComparison.ps1"

# Collect all .json files in the folder
$jsonFiles = Get-ChildItem -Path $JsonFolder -Filter *.json -File | Sort-Object -Property Name

Write-Host "# Found $($jsonFiles.Count) JSON files in $JsonFolder"
if ($jsonFiles.Count -lt 2) {
    Write-Host "# Not enough files to compare."
    return
}

# Create an output directory for diffs
$outputDir = Join-Path $JsonFolder "AllDiffs"
if (-not (Test-Path $outputDir)) {
    New-Item -Path $outputDir -ItemType Directory | Out-Null
}

# Pairwise compare
for ($i = 0; $i -lt $jsonFiles.Count - 1; $i++) {
    for ($j = $i + 1; $j -lt $jsonFiles.Count; $j++) {

        $fileA = $jsonFiles[$i]
        $fileB = $jsonFiles[$j]

        # Construct a short ID for each file for naming
        $baseA = [IO.Path]::GetFileNameWithoutExtension($fileA.Name) -replace '[^a-zA-Z0-9_-]', '_'
        $baseB = [IO.Path]::GetFileNameWithoutExtension($fileB.Name) -replace '[^a-zA-Z0-9_-]', '_'

        $diffName = "${baseA}_vs_${baseB}_depth${Depth}.txt"
        $diffPath = Join-Path $outputDir $diffName

        Write-Host "# Comparing $($fileA.Name) vs $($fileB.Name) => $diffName"
        
        Compare-JsonNLevel -PathA $fileA.FullName -PathB $fileB.FullName -Depth $Depth -Output $diffPath
    }
}

Write-Host "# All comparisons complete."
Write-Host "# Check results in $outputDir."





