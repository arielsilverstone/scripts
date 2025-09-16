<#
╔═════════════════════════════════════════════════════════════════════════════╗
║                        GenerateToolLaunchers.ps1                            ║
║ Purpose: Generate batch files for tools and update system variables         ║
║ File:    D:\Program Files\Dev\Settings\Scripts\GenerateToolLaunchers.ps1    ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Section 1: Initial Settings                                                 ║
║ Purpose:   Configure initial settings and logging                           ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Initialize logging
$ScriptName = $MyInvocation.MyCommand.Name
$ScriptVersion = "1.0.4"
$LogFile = "D:\Temp\GenerateToolLaunchers.log"

<-- missing banner -->
function Write-Log {
     param (
          [string]$Message,
          [string]$ForegroundColor = "White"
     )
     $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
     "$timestamp - $Message" | Out-File -FilePath $LogFile -Append
     Write-Host "$timestamp - $Message" -ForegroundColor $ForegroundColor
}
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Section 2: Script-wide Variable Definition                                  ║
║ Purpose:   Define tool paths and environment settings                       ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
# Define tool paths and environment variables
$ToolPaths = @{

    "bun" = @{
         Path = "D:\Program Files\Dev\Tools\bun\bin\bun.exe"
         EnvVars =  @(
              'set BUN_CONFIG_DIR=D:\Program Files\Dev\Tools\bun\config',
              '[Environment]::SetEnvironmentVariable("BUN_CONFIG_DIR", "D:\Program Files\Dev\Tools\bun\config", "Machine")'
              #
              ## Bun
              # BUN_INSTALL`: Installation directory
              # BUN_INSTALL_VERBOSE`: Verbose output
              # BUN_CONFIG`: Config file location
              # BUN_DEBUG`: Debug output
              # BUN_PLUGIN_DIR`: Plugin directory
              # BUN_INSTALL_DIR`: Directory to store Bun installations.
              # BUN_CONFIG_FILE`: Path to the Bun configuration file
         )
    }
    "deno" = @{
         Path = "D:\Program Files\Dev\Tools\deno\deno.exe"
         EnvVars =  @(
              'set DENO_INSTALL=D:\Program Files\Dev\Tools\deno',
              'set DENO_INSTALL_ROOT=D:\Program Files\Dev\Tools\deno',
              '[Environment]::SetEnvironmentVariable("DENO_INSTALL", "D:\Program Files\Dev\Tools\deno", "Machine")',
              '[Environment]::SetEnvironmentVariable("DENO_INSTALL_ROOT", "D:\Program Files\Dev\Tools\deno", "Machine")'
              # 
              ## Deno
              # DENO_DIR`: Cache directory
              # DENO_INSTALL_ROOT`: Installation directory
              # DENO_AUTH_TOKENS`: Authentication tokens
              # DENO_PERMISSIONS`: Runtime permissions
              # DENO_NO_UPDATE_CHECK`: Disable update check
              # DENO_CERT`: Path to a custom certificate file to use
         )
    }
    "jupyter" = @{
         Path = "D:\Program Files\Dev\Tools\Jupyter\jupyter.exe"
         EnvVars =  @(
              'set JUPYTER_CONFIG_DIR=D:\Program Files\Dev\Settings\Jupyter',
              '[Environment]::SetEnvironmentVariable("JUPYTER_CONFIG_DIR", "D:\Program Files\Dev\Settings\Jupyter", "Machine")'
              ## Jupyter
              # JUPYTER_CONFIG_DIR`: Directory for Jupyter configuration files.
              # JUPYTER_DATA_DIR`: Directory for Jupyter data files.
              # JUPYTER_RUNTIME_DIR`: Directory for Jupyter runtime files.
              # JUPYTER_PATH`: Paths to search for Jupyter components
         )
    }

     "lmstudio" = @{
         Path = "D:\Program Files\Dev\Tools\LMStudio\lmstudio.exe"
         EnvVars = ""
         ## LM Studio
         # LMSTUDIO_PATH`: Installation directory
         # LMSTUDIO_MODELS_PATH`: Path to model files
         # LMSTUDIO_PORT`: Server port
         # LMSTUDIO_HOST`: Server host
         # LMSTUDIO_API_KEY`: API key for authentication
         # LM_STUDIO_PROJECT_ID`: The default project ID to use for LM Studio operations
    }


    "DotNet-Tools" = @{
         Path = "D:\Program Files\Dev\Tools\ollama\ollama.exe"
         EnvVars = @(
              'set OLLAMA_MODELS=D:\Program Files\Dev\Tools\LLMs\ollama\models',
              '[Environment]::SetEnvironmentVariable("OLLAMA_MODELS", "D:\Program Files\Dev\Tools\LLMs\ollama\models", "Machine")'




         )
    }


    "ollama" = @{
         Path = "D:\Program Files\Dev\Tools\ollama\ollama.exe"
         EnvVars = @(
              'set OLLAMA_MODELS=D:\Program Files\Dev\Tools\LLMs\ollama\models',
              '[Environment]::SetEnvironmentVariable("OLLAMA_MODELS", "D:\Program Files\Dev\Tools\LLMs\ollama\models", "Machine")'



         )
    }

    "node" = @{
         Path = "D:\Program Files\Dev\Tools\node\node.exe"
         EnvVars =  @(
              'set NODE_PATH=D:\Program Files\Dev\Tools\node\node_modules',
              '[Environment]::SetEnvironmentVariable("NODE_PATH", "D:\Program Files\Dev\Tools\node\node_modules", "Machine")'
         )


    }



    "pip" = @{
         Path = "D:\Program Files\Dev\Tools\Python314\Scripts\pip.exe"
         EnvVars = ""



    }

    "poetry" = @{
         Path = "D:\Program Files\Dev\Tools\Poetry\poetry.exe"
         EnvVars = @(  'set POETRY_HOME=D:\Program Files\Dev\Tools\Poetry',
              '[Environment]::SetEnvironmentVariable("POETRY_HOME", "D:\Program Files\Dev\Tools\Poetry", "Machine")'



         )
    }


    "python310" = @{
         Path = "D:\Program Files\Dev\Tools\Python310\python.exe"
         EnvVars = ""
    }
    "python313" = @{
         Path = "D:\Program Files\Dev\Tools\Python313\python.exe"
         EnvVars = ""



    }
    "python314" = @{
         Path = "D:\Program Files\Dev\Tools\Python314\python.exe"
         EnvVars = ""
    }

    "vscode" = @{
         Path = "D:\Program Files\Dev\Tools\VS\vscode.exe"
         EnvVars = ""


    }

    "windsurf" = @{
         Path = "D:\Program Files\Dev\Windsurf\windsurf.exe"
         EnvVars =  @(
              'set WINDSURF_PORTABLE=D:\Program Files\Dev\Settings\user',
              '[Environment]::SetEnvironmentVariable("WINDSURF_PORTABLE", "D:\Program Files\Dev\Windsurf", "Machine")'


         )
    }
    "windsurf-next" = @{
         Path = "D:\Del\Windsurf - Next\windsurf - Next.exe"
         EnvVars =  @(
              'set WINDSURF_PORTABLE=D:\Program Files\Dev\Settings\user',
              '[Environment]::SetEnvironmentVariable("WINDSURF_Next_PORTABLE", "D:\Program Files\Dev\Windsurf", "Machine")'



         )
    }

}
$LinksDir = "D:\Links"
$ExtensionsDir = "D:\Program Files\Dev\Settings\Extensions"
$UserDataDir = "D:\Program Files\Dev\Settings\user"
$PathUpdateFile = "D:\Temp\PathUpdateCommands.txt"
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Section 3: Update System Environment Variables                              ║
║ Purpose:   Configure system PATH and tool-specific variables                ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>

<-- # comment required -->
try {
     Write-Log "Updating system environment variables..." -ForegroundColor Cyan
     
     # Define system variables
     $SystemVars = @{
          "OLLAMA_MODELS" = "D:\Program Files\Dev\Tools\LLMs\"
          "DENO_INSTALL" = "D:\Program Files\Dev\Tools\deno"
          "DENO_INSTALL_ROOT" = "D:\Program Files\Dev\Tools\deno"
          "POETRY_HOME" = "D:\Program Files\Dev\Tools\Poetry"
          "WINDSURF_PORTABLE" = "D:\Program Files\Dev\Windsurf"
          "NODE_PATH" = "D:\Program Files\Dev\Tools\node\node_modules"
          "PYTHONPATH" = "D:\Program Files\Dev\Tools\PyPaks"
          "JUPYTER_CONFIG_DIR" = "D:\Program Files\Dev\Settings\Jupyter"
     }
     
     # Define PATH additions
     $PathAdditions = @(
          "D:\Program Files\Dev\Tools\deno",
          "D:\Program Files\Dev\Tools\bun\bin",
          "D:\Program Files\Dev\Tools\node",
          "D:\Program Files\Dev\Tools\Jupyter"
     )
     
     # Define PATH removals
     $PathRemovals = @()
     
     # Get current system PATH
     $currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
     
     # Remove unwanted paths
     foreach ($path in $PathRemovals) {
          if ($currentPath -like "*$path*") {
               $currentPath = $currentPath -replace [regex]::Escape($path), ""
               Write-Log "Removed $path from PATH" -ForegroundColor Yellow
          }
     }
     
     # Append new paths
     $newPath = $currentPath
     foreach ($path in $PathAdditions) {
          if ($newPath -notlike "*$path*") {
               $newPath += ";$path"
               Write-Log "Added $path to PATH" -ForegroundColor Green
          }
     }
     
     # Generate PATH update commands
     $pathCommands = @"
         # PowerShell commands
         `$Env:Path = "$newPath"  <-- backtick, because of this the script doesnt consider the next foreach and other lines as active ps lines. 
         [Environment]::SetEnvironmentVariable("Path", "$newPath", "Machine")
         # CMD commands
         setx Path "$newPath"
         # Environment variable commands
         "@

<-- # comment required -->
     foreach ($var in $SystemVars.Keys) {
          $value = $SystemVars[$var]
          $pathCommands += @"  <--- warning, unary
              # PowerShell
              [Environment]::SetEnvironmentVariable("$var", "$value", "Machine")
              # CMD
              setx $var "$value"
              "@

          Write-Log "Set $var=$value" -ForegroundColor Green
     }
     
     # Save PATH update commands
     $pathCommands | Out-File -FilePath $PathUpdateFile
     Write-Log "Saved PATH and variable commands to $PathUpdateFile" -ForegroundColor Green
}
catch {
     Write-Log "Error updating system variables: $_" -ForegroundColor Red
}
<#
╔═════════════════════════════════════════════════════════════════════════════╗
║ Section 4: Generate Batch Files                                             ║
║ Purpose:   Create batch files for each tool in D:\Links                     ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>
<-- # comment required -->
try {
     Write-Log "Starting batch file generation..." -ForegroundColor Cyan
     
     # Ensure D:\Links exists
     if (-not (Test-Path $LinksDir)) {
          New-Item -Path $LinksDir -ItemType Directory -Force | Out-Null
          Write-Log "Created directory: $LinksDir" -ForegroundColor Green
     }
     
    # Generate batch file for each tool
    foreach ($tool in $ToolPaths.Keys) {
         $toolInfo = $ToolPaths[$tool]
         $toolPath = $toolInfo.Path
         $envVars = $toolInfo.EnvVars
         $batchFile = Join-Path $LinksDir "$tool.bat"
         
         if (-not (Test-Path $toolPath)) {
              Write-Log "Tool not found: $toolPath" -ForegroundColor Yellow
              continue
         }
         
         # Center file name in banner
         $fileName = "$tool.bat"
         $bannerWidth = 77  # Width between ║ characters
         $padding = [math]::Max(0, ($bannerWidth - $fileName.Length - 2) / 2)    <-- Valid?
         $leftPadding = " " * [math]::Floor($padding)                            <-- Valid?
         $rightPadding = " " * [math]::Ceiling($padding)                         <-- Valid?
         $centeredFileName = "$leftPadding$fileName$rightPadding"
         
         # Generate batch content with +5 indentation
         $batchContent = @"
              REM ╔═════════════════════════════════════════════════════════════════════════════╗
              REM ║$centeredFileName  <-- should be actual file name and actually centered      ║
              REM ║ Purpose: Launch $tool tool                                                  ║
              REM ║ File:    $batchFile                                                         ║
              REM ╚═════════════════════════════════════════════════════════════════════════════╝
              REM
              @echo off
              setlocal enabledelayedexpansion
              REM
              REM ╔═════════════════════════════════════════════════════════════════════════════╗
              REM ║ Section 1: Launch Tool                                                      ║
              REM ║ Purpose:   Execute the $tool executable with appropriate settings           ║
              REM ╚═════════════════════════════════════════════════════════════════════════════╝
              REM
              :LaunchTool
                   REM Set environment variables
                   $envVars
                   REM Check if tool exists
                   if not exist "$toolPath" (
                        echo ERROR: Tool not found at $toolPath
                        exit /b 1
                   )
                   REM Launch tool
             "@

         $isIDE = $tool -in @("vscode", "windsurf", "windsurf-next")
         if ($isIDE) {
              $batchContent += @"     <-- unary
                   start """" "$toolPath" --extensions-dir="$ExtensionsDir\$tool" --user-data-dir="$UserDataDir"
              "@

         } else {
              $batchContent += @"     <-- unary
                   start """" "$toolPath" %*
              "@
         }
         $batchContent += @"     <-- unary
              if !errorlevel! neq 0 (
                   echo ERROR: Failed to launch $tool
                   exit /b 1
              )
              exit /b 0
              REM End label
              REM
              REM End of script
             "@

         # Write batch file
         Set-Content -Path $batchFile -Value $batchContent
         Write-Log "Generated batch file: $batchFile" -ForegroundColor Green
     }
     
     Write-Log "Batch file generation complete!" -ForegroundColor Green
}
catch {
     Write-Log "Error generating batch files: $_" -ForegroundColor Red
}
#
## End of script