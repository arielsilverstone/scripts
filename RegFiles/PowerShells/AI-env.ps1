<#
╔═════════════════════════════════════════════════════════════════════════════╗
║                             AI-env.ps1 V.1                                  ║
║ Project: Comparisons                                                        ║
║ Purpose: Contains AI/LLM-related environment setup functions, e.g. Ollama.  ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Define AI/LLM-related global paths if needed
$GlobalSettings = "D:\Program Files\Dev\Settings\Global"
$UserSettings   = "D:\Program Files\Dev\Settings\Ariel"
$DevRoot        = "D:\Program Files\Dev"

<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 2.4: Setup-OllamaEnvVars                                           ║
║ Purpose:      Set Ollama environment variables                              ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Setup-OllamaEnvVars: Set Ollama environment variables (moved from master)
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Function 1: Setup-OllamaEnvVars                                             ║
║ Purpose:      Set Ollama environment variables                              ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
Function Setup-OllamaEnvVars {
    $OllamaVars = @{
        Ollama_Home   = 'D:\\Program Files\\Dev\\LLMs\\Ollama'
        Ollama_MODELS = 'D:\\Program Files\\Dev\\LLMs'
        Ollama_Root   = 'D:\\Program Files\\Dev\\LLMs\\Ollama'
        USERSTARTUP   = 'D:\\Program Files\\Dev\\LLM\\Ollama\\System'
    }
    $OllamaVars.GetEnumerator() | ForEach {
        TPSP -Path $UserEnv -Name $_.Key -Value $_.Value
    }
}

# Activate AI-related setup functions
$AISetupFunctions = @(
    "Setup-OllamaEnvVars"
)
ForEach ($FuncName in $AISetupFunctions) {
    Start-Throt -Command (Get-Command $FuncName).ScriptBlock
}
