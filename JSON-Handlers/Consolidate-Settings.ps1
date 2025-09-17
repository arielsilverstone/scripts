param(
    [Parameter(Mandatory=$true)]
    [string]$SourcePath = "D:\Desktop\Temp",
    [Parameter(Mandatory=$true)]
    [string]$ConsolidatedFile = "D:\Desktop\Temp\consolidated_settings.json",
    [Parameter(Mandatory=$true)]
    [string]$DiffFile = "D:\Desktop\Temp\diff_settings.json"
)

function Load-JsonFile($Path) {
    try {
        return (Get-Content $Path -Raw | ConvertFrom-Json)
    } catch {
        return $null
    }
}

# Gather .json files from the SourcePath
$jsonFiles = Get-ChildItem -Path $SourcePath -Filter *.json -File

$consolidatedData = @()
foreach ($file in $jsonFiles) {
    $content = Load-JsonFile -Path $file.FullName
    if ($content -ne $null) {
        $consolidatedData += [PSCustomObject]@{
            file_name = $file.Name
            content   = $content
        }
    }
}

# Write the consolidated content
$consolidatedData | ConvertTo-Json -Depth 32 | Out-File -FilePath $ConsolidatedFile -Encoding UTF8

# If there's more than one file, create a diff from the first and last
if ($consolidatedData.Count -gt 1) {
    $first = $consolidatedData[0]
    $last  = $consolidatedData[-1]

    $diffContent = @{
        first_file          = $first.file_name
        last_file           = $last.file_name
        first_file_content  = ($first.content | ConvertTo-Json -Depth 32)
        last_file_content   = ($last.content  | ConvertTo-Json -Depth 32)
    }

    ($diffContent | ConvertTo-Json -Depth 32) | Out-File -FilePath $DiffFile -Encoding UTF8
}

Write-Host "Consolidated -> $ConsolidatedFile"
Write-Host "Diff -> $DiffFile"
