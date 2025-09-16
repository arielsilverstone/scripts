<#
╔═════════════════════════════════════════════════════════════════════════════╗
║                    move_net_files.ps1  V.1                               ║
║ Purpose:  Move network-related files to the trea directory                ║
║                                                                           ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
$files = @(
    "net_components.txt",
    "all_capabilities.txt",
    "get_net_capabilities.ps1",
    "remove_net_components.bat",
    "verify_removal.ps1",
    "move_net_files.ps1"
)

foreach ($file in $files) {
    $source = "d:\Desktop\$file"
    $destination = "d:\Desktop\trea\$file"
    
    if (Test-Path $source) {
        Move-Item -Path $source -Destination $destination -Force
        Write-Host "Moved $file to trea directory"
    } else {
        Write-Host "File not found: $file"
    }
}