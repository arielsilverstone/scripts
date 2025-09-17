# Extract registry paths from PowerShell scripts
param (
    [string]$Directory = ".",
    [string]$OutputFile = "RegistryPaths.txt"
)

function Normalize-RegistryPath {
    param (
        [string]$Path
    )
    
    # Remove quotes and trim
    $Path = $Path.Trim('"''`t '.ToCharArray())
    
    # Skip empty paths
    if ([string]::IsNullOrWhiteSpace($Path)) { return $null }
    
    # Skip paths that are clearly not registry paths
    if ($Path -match '^[A-Za-z]:\\' -or 
        $Path -match '\.ps1$' -or 
        $Path.Length -lt 3) { 
        return $null 
    }
    
    # Remove registry hive prefix if present
    $Path = $Path -replace '^(?:HKLM|HKCU|HKCR|HKU|HKEY_LOCAL_MACHINE|HKEY_CURRENT_USER|HKEY_CLASSES_ROOT|HKEY_USERS):\\', ''
    
    # Normalize path separators and make uppercase for consistency
    $Path = $Path.Replace('/', '\').ToUpper()
    
    # Remove trailing backslash
    $Path = $Path.TrimEnd('\')
    
    return $Path
}

function Get-RegistryPathsFromFile {
    param (
        [string]$FilePath
    )
    
    $fileName = [System.IO.Path]::GetFileName($FilePath)
    Write-Host "Processing $fileName..."
    
    $Content = Get-Content -Path $FilePath -Raw
    if (-not $Content) { return @{} }
    
    $paths = @{}
    
    # Registry path patterns - more comprehensive
    $regexPatterns = @(
        # Full registry paths with hive
        '(?:HKLM|HKCU|HKCR|HKU|HKEY_LOCAL_MACHINE|HKEY_CURRENT_USER|HKEY_CLASSES_ROOT|HKEY_USERS):\\([^"\s}\n,;`\[\]]+(?:\\[^"\s}\n,;`\[\]]+)*)',
        
        # Registry commands with paths
        '(?:Get|Set|Remove|New|Test)-(?:Item(?:Property)?|Path)\s+(?:-LiteralPath|-Path)?\s*([''"])?(?:HKLM|HKCU|HKCR|HKU|HKEY_LOCAL_MACHINE|HKEY_CURRENT_USER|HKEY_CLASSES_ROOT|HKEY_USERS):\\([^''"]+)\1',
        
        # Registry paths in strings
        '"(?:HKLM|HKCU|HKCR|HKU|HKEY_LOCAL_MACHINE|HKEY_CURRENT_USER|HKEY_CLASSES_ROOT|HKEY_USERS):\\([^"]+)"',
        "'(?:HKLM|HKCU|HKCR|HKU|HKEY_LOCAL_MACHINE|HKEY_CURRENT_USER|HKEY_CLASSES_ROOT|HKEY_USERS):\\([^']+)'",
        
        # Common registry paths without hive
        '(?<![A-Za-z0-9_\\:])(SOFTWARE|SYSTEM|MICROSOFT|CLASSES|POLICIES|CONTROL PANEL|WINDOWS|WINDOWS NT|SERVICES|DRIVERS|SETTINGS|COMPONENTS|CURRENTVERSION)\\([^"\s\n,;`\[\]{}]+(?:\\[^"\s\n,;`\[\]{}]+)*)'
    )
    
    foreach ($pattern in $regexPatterns) {
        $matches = [regex]::Matches($Content, $pattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        foreach ($match in $matches) {
            $path = $match.Value
            
            # Skip invalid paths
            if ($path -match '\||\)|\$\(|^\s*$|^reg\s|^Get-|^Set-|^Test-|^Remove-|^New-') {
                continue
            }
            
            # Remove quotes if present
            $path = $path -replace '^["'']|["'']$', ''
            
            $normalizedPath = Normalize-RegistryPath $path
            if ($normalizedPath) {
                if (-not $paths.ContainsKey($normalizedPath)) {
                    $paths[$normalizedPath] = @()
                }
                
                # Determine hive based on path content
                if ($path -match '^HKLM|^HKEY_LOCAL_MACHINE') {
                    if (-not $paths[$normalizedPath].Contains('HKLM')) {
                        $paths[$normalizedPath] += 'HKLM'
                    }
                }
                elseif ($path -match '^HKCU|^HKEY_CURRENT_USER') {
                    if (-not $paths[$normalizedPath].Contains('HKCU')) {
                        $paths[$normalizedPath] += 'HKCU'
                    }
                }
                elseif ($path -match '^HKCR|^HKEY_CLASSES_ROOT') {
                    if (-not $paths[$normalizedPath].Contains('HKCR')) {
                        $paths[$normalizedPath] += 'HKCR'
                    }
                }
                elseif ($path -match '^HKU|^HKEY_USERS') {
                    if (-not $paths[$normalizedPath].Contains('HKU')) {
                        $paths[$normalizedPath] += 'HKU'
                    }
                }
                else {
                    # For paths without explicit hive, use context to determine likely hive
                    if ($normalizedPath -match '^SOFTWARE\\CLASSES' -or $normalizedPath -match '^CLASSES\\') {
                        if (-not $paths[$normalizedPath].Contains('HKCR')) {
                            $paths[$normalizedPath] += 'HKCR'
                        }
                    }
                    elseif ($normalizedPath -match '^SYSTEM\\CURRENTCONTROLSET') {
                        if (-not $paths[$normalizedPath].Contains('HKLM')) {
                            $paths[$normalizedPath] += 'HKLM'
                        }
                    }
                    elseif ($normalizedPath -match '^SOFTWARE\\(?:MICROSOFT|POLICIES)') {
                        # These could be in either HKLM or HKCU
                        if (-not $paths[$normalizedPath].Contains('HKLM')) {
                            $paths[$normalizedPath] += 'HKLM'
                        }
                        
                        # Check for user-specific paths
                        if (($normalizedPath -match 'CURRENTUSER' -or 
                             $normalizedPath -match 'EXPLORER\\ADVANCED' -or 
                             $normalizedPath -match 'DESKTOP' -or
                             $normalizedPath -match 'PERSONALIZE' -or
                             $normalizedPath -match 'THEMES' -or
                             $normalizedPath -match 'GAMEBAR') -and
                             (-not $paths[$normalizedPath].Contains('HKCU'))) {
                            $paths[$normalizedPath] += 'HKCU'
                        }
                    }
                    else {
                        # For truly ambiguous paths
                        if (-not $paths[$normalizedPath].Contains('*')) {
                            $paths[$normalizedPath] += '*'
                        }
                    }
                }
            }
        }
    }
    
    # Additional context-based analysis
    $contextPatterns = @{
        'HKCU' = 'CurrentUser|UserProfile|HKCU|Shell\\Bags|Explorer\\Advanced|AppData|Themes|Personalize'
        'HKLM' = 'LocalMachine|HKLM|Services|ControlSet|Drivers|Hardware|Security Policy'
        'HKCR' = 'ClassesRoot|HKCR|FileType|Extension|ShellEx|CLSID|Interface|TypeLib'
        'HKU'  = 'Users|HKU|\.DEFAULT|S-1-5-21|_Classes'
    }
    
    # Create a copy of the keys to avoid modifying the collection during enumeration
    $pathKeys = $paths.Keys | ForEach-Object { $_ }
    
    foreach ($path in $pathKeys) {
        foreach ($hive in $contextPatterns.Keys) {
            if ($Content -match "(?i)$($contextPatterns[$hive]).*$([regex]::Escape($path))" -and 
                -not $paths[$path].Contains($hive)) {
                $paths[$path] += $hive
            }
        }
    }
    
    return $paths
}

# Main processing
$files = Get-ChildItem -Path $Directory -Filter "*.ps1" -Recurse
$results = @{}

foreach ($file in $files) {
    $fileName = $file.Name
    $paths = Get-RegistryPathsFromFile -FilePath $file.FullName
    $results[$fileName] = $paths
}

# Generate output
$output = New-Object System.Collections.ArrayList
$totalPaths = 0

foreach ($fileName in $results.Keys | Sort-Object) {
    $paths = $results[$fileName]
    $output.Add("`n$fileName") | Out-Null
    
    $formattedPaths = @()
    foreach ($path in $paths.Keys | Sort-Object) {
        $hives = $paths[$path] | Select-Object -Unique | Sort-Object
        foreach ($hive in $hives) {
            $formattedPaths += "[$hive]:\$path"
        }
    }
    
    foreach ($formattedPath in $formattedPaths | Sort-Object) {
        $output.Add($formattedPath) | Out-Null
    }
    
    $pathCount = $formattedPaths.Count
    $output.Add("Total paths: $pathCount") | Out-Null
    $totalPaths += $pathCount
}

$output.Add("`n`nGrand Total: $totalPaths") | Out-Null
$output | Out-File -FilePath $OutputFile -Encoding utf8

Write-Host "Registry paths extracted to $OutputFile"
Write-Host "Total paths found: $totalPaths"