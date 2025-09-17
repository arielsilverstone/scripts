# Create directory index and monitor resource usage
$indexFile = "directory_index.json"
$excludedDirs = @('.git', 'node_modules', '__pycache__', '.vscode')

# Create index structure
$directoryIndex = @{
    timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    directories = @{}
    files = @{}
    statistics = @{
        totalDirs = 0
        totalFiles = 0
        totalSize = 0
    }
}

# Index creation function
function Update-DirectoryIndex {
    param($path)
    
    Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue | 
    Where-Object { $_.FullName -notmatch ($excludedDirs -join '|') } | 
    ForEach-Object {
        if ($_.PSIsContainer) {
            $directoryIndex.directories[$_.FullName] = @{
                name = $_.Name
                lastModified = $_.LastWriteTime
            }
            $directoryIndex.statistics.totalDirs++
        } else {
            $directoryIndex.files[$_.FullName] = @{
                name = $_.Name
                size = $_.Length
                lastModified = $_.LastWriteTime
                extension = $_.Extension
            }
            $directoryIndex.statistics.totalFiles++
            $directoryIndex.statistics.totalSize += $_.Length
        }
    }
}

# Create index
Update-DirectoryIndex -path "."

# Save index
$directoryIndex | ConvertTo-Json -Depth 10 | Set-Content $indexFile

Write-Host "Directory index created successfully!" -ForegroundColor Green
Write-Host "Total Directories: $($directoryIndex.statistics.totalDirs)" -ForegroundColor Cyan
Write-Host "Total Files: $($directoryIndex.statistics.totalFiles)" -ForegroundColor Cyan
Write-Host "Total Size: $([math]::Round($directoryIndex.statistics.totalSize / 1MB, 2)) MB" -ForegroundColor Cyan