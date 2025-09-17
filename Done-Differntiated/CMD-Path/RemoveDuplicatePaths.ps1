# Script to remove duplicate registry paths within each file
param (
    [string]$InputFile = "RegistryPaths.txt",
    [string]$OutputFile = "RegistryPaths_NoDuplicates.txt",
    [string]$DatabaseFile = "d:\Desktop\New\RegistryPaths.db",
    [switch]$SkipDatabase = $false
)

# Function to check and install SQLite if needed
function Initialize-SQLite {
    # Check if SQLite is already loaded
    if (-not $SkipDatabase) {
        try {
            # Try to load SQLite assembly
            [System.Reflection.Assembly]::LoadWithPartialName("System.Data.SQLite") | Out-Null
            
            # Test if we can create a connection
            $testConn = New-Object System.Data.SQLite.SQLiteConnection
            $testConn.Dispose()
            
            Write-Host "SQLite is available." -ForegroundColor Green
            return $true
        }
        catch {
            # Try to load from the specified path
            $sqlitePath = "d:\program files\dev\sqlite"
            Write-Host "Trying to load SQLite from $sqlitePath" -ForegroundColor Yellow
            
            try {
                # Look for SQLite DLL in the specified directory
                $sqliteDll = Get-ChildItem -Path $sqlitePath -Filter "System.Data.SQLite.dll" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
                
                if ($sqliteDll) {
                    Write-Host "Found SQLite DLL at: $($sqliteDll.FullName)" -ForegroundColor Green
                    Add-Type -Path $sqliteDll.FullName
                    
                    # Test if we can create a connection
                    $testConn = New-Object System.Data.SQLite.SQLiteConnection
                    $testConn.Dispose()
                    
                    Write-Host "SQLite loaded successfully." -ForegroundColor Green
                    return $true
                }
                else {
                    # Try to find sqlite3.dll instead and use interop
                    $sqlite3Dll = Get-ChildItem -Path $sqlitePath -Filter "sqlite3.dll" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
                    
                    if ($sqlite3Dll) {
                        Write-Host "Found SQLite3 DLL at: $($sqlite3Dll.FullName)" -ForegroundColor Green
                        
                        # Copy the DLL to the current directory if not already there
                        $localDll = Join-Path (Get-Location) "sqlite3.dll"
                        if (-not (Test-Path $localDll)) {
                            Copy-Item -Path $sqlite3Dll.FullName -Destination $localDll -Force
                        }
                        
                        # Use P/Invoke to access SQLite functions
                        Write-Host "Using direct SQLite3 DLL access." -ForegroundColor Yellow
                        
                        # Define the SQLite interop functions
                        Add-Type @"
                        using System;
                        using System.Runtime.InteropServices;
                        
                        public static class SQLite3
                        {
                            [DllImport("sqlite3.dll", CallingConvention = CallingConvention.Cdecl)]
                            public static extern int sqlite3_open(string filename, out IntPtr db);
                            
                            [DllImport("sqlite3.dll", CallingConvention = CallingConvention.Cdecl)]
                            public static extern int sqlite3_close(IntPtr db);
                            
                            [DllImport("sqlite3.dll", CallingConvention = CallingConvention.Cdecl)]
                            public static extern int sqlite3_exec(IntPtr db, string sql, IntPtr callback, IntPtr data, out IntPtr errMsg);
                            
                            [DllImport("sqlite3.dll", CallingConvention = CallingConvention.Cdecl)]
                            public static extern void sqlite3_free(IntPtr ptr);
                        }
"@
                        
                        # Test if we can open a database
                        $tempDbPath = [System.IO.Path]::GetTempFileName()
                        $dbHandle = [IntPtr]::Zero
                        $result = [SQLite3]::sqlite3_open($tempDbPath, [ref]$dbHandle)
                        
                        if ($result -eq 0) {
                            [SQLite3]::sqlite3_close($dbHandle)
                            Remove-Item $tempDbPath -Force
                            Write-Host "SQLite3 direct access working." -ForegroundColor Green
                            return $true
                        }
                        else {
                            Write-Host "Failed to open SQLite database using direct access." -ForegroundColor Red
                            return $false
                        }
                    }
                    else {
                        Write-Host "Could not find SQLite DLL in $sqlitePath" -ForegroundColor Red
                        Write-Host "Continuing without database support." -ForegroundColor Yellow
                        return $false
                    }
                }
            }
            catch {
                Write-Host "Error loading SQLite from $sqlitePath`: $_" -ForegroundColor Red
                Write-Host "Continuing without database support." -ForegroundColor Yellow
                return $false
            }
        }
    }
    return $false
}

# Function to create database and tables
function Initialize-Database {
    param (
        [string]$DatabasePath
    )
    
    # Create or connect to the database
    $connectionString = "Data Source=$DatabasePath;Version=3;"
    
    try {
        $connection = New-Object System.Data.SQLite.SQLiteConnection($connectionString)
        $connection.Open()
        
        # Create tables
        $createScriptFilesTable = @"
CREATE TABLE IF NOT EXISTS ScriptFiles (
    FileID INTEGER PRIMARY KEY AUTOINCREMENT,
    FileName TEXT NOT NULL UNIQUE
);
"@
        
        $createRegistryPathsTable = @"
CREATE TABLE IF NOT EXISTS RegistryPaths (
    PathID INTEGER PRIMARY KEY AUTOINCREMENT,
    FileID INTEGER NOT NULL,
    Hive TEXT NOT NULL,
    Path TEXT NOT NULL,
    FOREIGN KEY (FileID) REFERENCES ScriptFiles(FileID),
    UNIQUE(FileID, Hive, Path)
);
"@
        
        $command = $connection.CreateCommand()
        $command.CommandText = $createScriptFilesTable
        $command.ExecuteNonQuery()
        
        $command.CommandText = $createRegistryPathsTable
        $command.ExecuteNonQuery()
        
        # Close the connection but return the connection string
        $connection.Close()
        
        return $connectionString
    }
    catch {
        Write-Host "Error creating database tables: $_" -ForegroundColor Red
        return $connectionString  # Return the connection string even if there's an error
    }
}

# Read the input file
$content = Get-Content -Path $InputFile -Raw
if (-not $content) {
    Write-Error "Input file is empty or could not be read."
    exit 1
}

# Initialize SQLite if needed
$useSQLite = Initialize-SQLite
$connection = $null

if ($useSQLite) {
    try {
        # Initialize database
        $connectionString = Initialize-Database -DatabasePath $DatabaseFile
        $connection = New-Object System.Data.SQLite.SQLiteConnection
        $connection.ConnectionString = $connectionString
        $connection.Open()
        Write-Host "Connected to database: $DatabaseFile" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to initialize database: $_" -ForegroundColor Red
        $useSQLite = $false
        $connection = $null
    }
}

# Split content by file sections
$filePattern = '(?m)^\s*([^\r\n]+\.ps1)\s*$'
$fileSections = [regex]::Split($content, $filePattern)

# Initialize output
$output = New-Object System.Collections.ArrayList
$grandTotal = 0

# Process each section
for ($i = 1; $i -lt $fileSections.Count; $i += 2) {
    $fileName = $fileSections[$i].Trim()
    $sectionContent = $fileSections[$i + 1]
    
    # Add file to database if using SQLite
    $fileID = $null
    if ($useSQLite -and $connection -ne $null) {
        try {
            $command = $connection.CreateCommand()
            $command.CommandText = "INSERT OR IGNORE INTO ScriptFiles (FileName) VALUES (@FileName); SELECT FileID FROM ScriptFiles WHERE FileName = @FileName;"
            $command.Parameters.AddWithValue("@FileName", $fileName)
            $fileID = $command.ExecuteScalar()
        }
        catch {
            Write-Warning "Error adding file to database: $fileName - $($_.Exception.Message)"
        }
    }
    
    # Skip if section is empty
    if ([string]::IsNullOrWhiteSpace($sectionContent)) {
        $output.Add("`n$fileName") | Out-Null
        $output.Add("Total paths: 0") | Out-Null
        continue
    }
    
    # Extract paths
    $paths = @()
    $lines = $sectionContent -split "`n"
    foreach ($line in $lines) {
        $line = $line.Trim()
        if ($line -match '^\[.*\]:\\') {
            $paths += $line
        }
    }
    
    # Remove duplicates while preserving order
    $uniquePaths = @{}
    $orderedUniquePaths = @()
    
    foreach ($path in $paths) {
        if (-not $uniquePaths.ContainsKey($path)) {
            $uniquePaths[$path] = $true
            $orderedUniquePaths += $path
            
            # Add to database if using SQLite
            if ($useSQLite -and $fileID) {
                # Parse the registry path
                if ($path -match '^\[(.*?)\]:\\(.*)$') {
                    $hive = $matches[1]
                    $pathValue = $matches[2]
                    
                    $command = $connection.CreateCommand()
                    $command.CommandText = "INSERT OR IGNORE INTO RegistryPaths (FileID, Hive, Path) VALUES (@FileID, @Hive, @Path);"
                    $command.Parameters.AddWithValue("@FileID", $fileID)
                    $command.Parameters.AddWithValue("@Hive", $hive)
                    $command.Parameters.AddWithValue("@Path", $pathValue)
                    
                    try {
                        $command.ExecuteNonQuery()
                    }
                    catch {
                        Write-Warning "Error inserting path: $path - $($_.Exception.Message)"
                    }
                }
            }
        }
    }
    
    # Add to output
    $output.Add("`n$fileName") | Out-Null
    foreach ($path in $orderedUniquePaths) {
        $output.Add($path) | Out-Null
    }
    
    $pathCount = $orderedUniquePaths.Count
    $output.Add("Total paths: $pathCount") | Out-Null
    $grandTotal += $pathCount
}

# Add grand total
$output.Add("`n`nGrand Total: $grandTotal") | Out-Null

# Write to output file
$output | Out-File -FilePath $OutputFile -Encoding utf8

# Close database connection if open
if ($useSQLite -and $connection -ne $null) {
    $connection.Close()
    Write-Host "Database connection closed."
}

Write-Host "Duplicate paths removed. Output written to $OutputFile"
Write-Host "Total unique paths: $grandTotal"

if ($useSQLite) {
    Write-Host "Registry paths stored in database: $DatabaseFile"
    
    # Display some example queries
    Write-Host "`nExample SQLite queries you can run:"
    Write-Host "- Count paths by hive: SELECT Hive, COUNT(*) FROM RegistryPaths GROUP BY Hive;"
    Write-Host "- Find most common paths: SELECT Path, COUNT(*) FROM RegistryPaths GROUP BY Path ORDER BY COUNT(*) DESC LIMIT 10;"
    Write-Host "- Find which scripts use a specific path: SELECT sf.FileName FROM ScriptFiles sf JOIN RegistryPaths rp ON sf.FileID = rp.FileID WHERE rp.Path LIKE '%WINDOWS%';"
}