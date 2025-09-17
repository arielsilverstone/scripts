# Load SQLite assembly from Dev\SQLite
Add-Type -Path "D:\Program Files\Dev\SQLite\System.Data.SQLite.dll"

# Connect to database
$connectionString = "Data Source=D:\Desktop\New\example.db;Version=3;"
$connection = New-Object System.Data.SQLite.SQLiteConnection($connectionString)
$connection.Open()

try {
    # Create a table
    $command = $connection.CreateCommand()
    $command.CommandText = "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, email TEXT)"
    $command.ExecuteNonQuery() | Out-Null
    
    # Insert data
    $insertCmd = $connection.CreateCommand()
    $insertCmd.CommandText = "INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com')"
    $insertCmd.ExecuteNonQuery() | Out-Null
    
    # Query data
    $queryCmd = $connection.CreateCommand()
    $queryCmd.CommandText = "SELECT * FROM users"
    $reader = $queryCmd.ExecuteReader()
    
    while ($reader.Read()) {
        Write-Host "User: $($reader['name']) - $($reader['email'])"
    }
}
finally {
    $connection.Close()
}
