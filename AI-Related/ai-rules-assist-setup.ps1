# ai-rules-assist-setup.ps1
# Non-interactive subtask: Sets up AI-Rules bare repo and Assistance-Scripts branch in Projects.git
# Logs errors to ai-rules-assist-errors.txt

$ErrorActionPreference = 'Stop'
$git = 'd:\program files\dev\Git\cmd\git.exe'
$aiRepo = 'H:\Dev\MasterRepo\AI-Rules.git'
$projectsRepo = 'H:\Dev\MasterRepo\Projects.git'
$projectsWork = 'H:\Dev\Projects'
$errLog = Join-Path $PSScriptRoot 'ai-rules-assist-errors.txt'

function Log-Err($msg) {
    $timestamp = Get-Date -Format 'HH:mm'
    "$timestamp $msg" | Add-Content -Path $errLog
}

# 1. Create AI-Rules bare repo if not exists
if (-not (Test-Path $aiRepo)) {
    try {
        & $git init --bare $aiRepo
    } catch {
        Log-Err "Failed to init AI-Rules.git: $_"
    }
}

# 2. (Placeholder) Set up split-git for AI-Rules (user must confirm actual work-tree path)
# Example: # $aiWorkTree = 'H:\Dev\Projects\New\# AI Rules'
# Add split-git or config logic here if needed

# 3. Create Assistance-Scripts branch in Projects.git
try {
    $exists = & $git --git-dir=$projectsRepo --work-tree=$projectsWork branch --list Assistance-Scripts
    if (-not $exists) {
        & $git --git-dir=$projectsRepo --work-tree=$projectsWork branch Assistance-Scripts
    }
} catch {
    Log-Err "Failed to create Assistance-Scripts branch: $_"
}
