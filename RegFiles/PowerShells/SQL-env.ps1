<#
╔═════════════════════════════════════════════════════════════════════════════╗
║                             SQL-env.ps1 V.1                                 ║
║ Project: Comparisons                                                        ║
║ Purpose: Contains SQL/DB-related environment setup functions, e.g. SQLITE.  ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Define SQL/DB-related global paths if needed
$GlobalSettings = "D:\Program Files\Dev\Settings\Global"
$UserSettings   = "D:\Program Files\Dev\Settings\Ariel"
$DevRoot        = "D:\Program Files\Dev"

<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 1: Setup-SQLITE                                                    ║
║ Purpose:    Configure SQLITE installation and environment variable          ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Setup-SQLITE: Configure SQLITE installation and environment variable (moved from master)
Function Setup-SQLITE {
    $SQLITE = JP "Dev" "SQLITE"
    If (TPSP -Path $SQLITE    -Name "SQLITE") {
        TPSP -Path $GlobalEnv -Name "SQLITE_HOME" -Value $SQLITE
    }
}

# Activate SQL-related setup functions
$SQLSetupFunctions = @(
    "Setup-SQLITE"
)
ForEach ($FuncName in $SQLSetupFunctions) {
    Start-Throt -Command (Get-Command $FuncName).ScriptBlock
}
