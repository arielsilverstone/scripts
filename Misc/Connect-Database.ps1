# Load SQLite assembly
Add-Type -Path "D:\Desktop\New\System.Data.SQLite.dll"

# Create connection function
function Connect-SQLiteDB {
    param($DbPath)
    
    try {
        $connection = New-Object System.Data.SQLite.SQLiteConnection
        $connection.ConnectionString = "Data Source=$DbPath;Version=3;"
        $connection.Open()
        return $connection
    }
    catch {
        Write-Error "Failed to connect to SQLite database: $_"
        return $null
    }
}

# Create query function
function Invoke-SQLiteQuery {
    param(
        $Connection,
        $Query,
        $Parameters = @{}
    )
    
    try {
        $command = $Connection.CreateCommand()
        $command.CommandText = $Query
        
        foreach ($param in $Parameters.GetEnumerator()) {
            $command.Parameters.AddWithValue($param.Key, $param.Value)
        }
        
        $result = $command.ExecuteReader()
        $dt = New-Object System.Data.DataTable
        $dt.Load($result)
        return $dt
    }
    catch {
        Write-Error "Failed to execute query: $_"
        return $null
    }
}

Export-ModuleMember -Function Connect-SQLiteDB, Invoke-SQLiteQuery