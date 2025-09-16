# ===========================================================================
# Monitor Another Repo
# Purpose: Create a new branch in master repo to monitor another directory
# ===========================================================================
Start-ThreadJob {
    Param(
        [string]$ExternalRepoPath,
        [string]$MasterRepoPath = "D:\Program Files\Dev\Master"
    )

    If (-Not $ExternalRepoPath) {
        $ExternalRepoPath = Read-Host "Enter path of the external repo to monitor"
    }

    If (-Not (Test-Path "$MasterRepoPath\.git")) {
        Write-Error "Not a Git repository: $MasterRepoPath"
        Return
    }

    Set-Location -Path $MasterRepoPath

    $remoteName = "external$(Get-Random)"
    git remote add $remoteName $ExternalRepoPath
    git fetch $remoteName

    $branchName = "monitor-$(Split-Path $ExternalRepoPath -Leaf)"
    git checkout -b $branchName "$remoteName/master"

    Write-Host "Monitoring branch '$branchName' created from $ExternalRepoPath"
} -Name "Monitor-External-Repo"

