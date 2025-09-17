# Directory Configuration
$tempDir = "D:\temp\3"  # Direct path to D:\temp\3
$logFile = Join-Path $tempDir "download_errors.log"

# Error handling function
function Write-ErrorLog {
    param(
        [string]$toolName,
        [string]$errorMessage
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] $toolName : $errorMessage"
    
    Add-Content -Path $logFile -Value $logEntry
    Write-Host $logEntry -ForegroundColor Red
    
    $notification = New-Object -ComObject WScript.Shell
    $notification.Popup("Download Error: $toolName`n$errorMessage", 0, "Download Error", 48)
}

# Download function
function Download-File {
    param (
        [string]$url,
        [string]$outFile,
        [string]$toolName
    )
    
    try {
        Write-Host "Starting download of $toolName from $url" -ForegroundColor Cyan
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
        $webClient.Headers.Add("Accept", "*/*")
        
        Write-Host "Downloading to: $outFile" -ForegroundColor Yellow
        $webClient.DownloadFile($url, $outFile)
        
        if (Test-Path $outFile) {
            $fileSize = (Get-Item $outFile).Length
            if ($fileSize -gt 0) {
                Write-Host "$toolName downloaded successfully: $([math]::Round($fileSize/1MB, 2)) MB" -ForegroundColor Green
                return $true
            }
        }
        Write-ErrorLog -toolName $toolName -errorMessage "Download failed or file is empty"
        return $false
    }
    catch {
        Write-ErrorLog -toolName $toolName -errorMessage $_.Exception.Message
        return $false
    }
    finally {
        if ($webClient) { $webClient.Dispose() }
    }
}

# Main execution function
function Start-Downloads {
    if (-not (Test-Path $tempDir)) {
        New-Item -Path $tempDir -ItemType Directory -Force | Out-Null
        Write-Host "Created temp directory: $tempDir"
    }

    # Download Agent Ransack with updated URL
    $ransackUrl = "https://www.mythicsoft.com/agentransack/download/AgentRansack_64.exe"
    $ransackFile = Join-Path $tempDir "AgentRansack.exe"
    Download-File -url $ransackUrl -outFile $ransackFile -toolName "Agent Ransack"

    # Download Copernic with updated URL
    $copernicUrl = "https://download.copernic.com/desktop-search/copernic-desktop-search-setup.exe"
    $copernicFile = Join-Path $tempDir "CopernicSetup.exe"
    Download-File -url $copernicUrl -outFile $copernicFile -toolName "Copernic"

    # Show final status
    Write-Host "`nDownload Summary:" -ForegroundColor Cyan
    if (Test-Path $logFile) {
        Write-Host "Errors occurred during download. Check $logFile for details." -ForegroundColor Yellow
        Get-Content $logFile | ForEach-Object { Write-Host $_ -ForegroundColor Red }
    } else {
        Write-Host "All downloads completed successfully!" -ForegroundColor Green
    }
}

# Execute the script
Start-Downloads

Write-Host "`nPress any key to continue..." -NoNewline
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')