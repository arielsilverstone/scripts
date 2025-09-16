###############################################################################
#                           Create-Library-of-Folders.ps1                     #
# Filename:    Create-Library-of-Folders-in-PS.ps1                            #
# Purpose:     Merges two folders into a single view using hardlinks/junctions #
###############################################################################


# ========== CONFIGURATION ========== 
$SourceA      = "C:\Path\To\FolderA"         # <-- CHANGE THIS
$SourceB      = "C:\Path\To\FolderB"         # <-- CHANGE THIS
$HolderPath   = "D:\Desktop\Holder"          # Visible merged folder
$StagingPath  = "C:\Temp\MergedStaging"      # Hidden working directory

# ========== SETUP ========== 
if (-not (Test-Path $StagingPath)) {
    NI $StagingPath -Force | Out-Null
    attrib +h $StagingPath
}

if (-not (Test-Path $HolderPath)) {
    cmd /c mklink /J "$HolderPath" "$StagingPath" | Out-Null
    Write "Access merged files at: $HolderPath"
}

# ========== SYNC ENGINE ========== 
Function Update-MergedView {
    # Track existing links to detect deletions
    $ExistingLinks = @{} 
    LS $StagingPath -File | Where { $_.Attributes -match "ReparsePoint" } | ForEach {
        $ExistingLinks[$_.Name] = $_.Target
    }

    # Phase 1: Add/Update files from both sources
    LS $SourceA, $SourceB -File | ForEach {
        $LinkPath    = "$StagingPath\$($_.Name)"
        $NeedsUpdate = 1

        If ($ExistingLinks.ContainsKey($_.Name)) {
            If ($ExistingLinks[$_.Name] -eq $_.FullName) {
                $NeedsUpdate = 0
            }
            $ExistingLinks.Remove($_.Name)
        }

        If ($NeedsUpdate) {
            If (Test-Path $LinkPath) { Del $LinkPath -Force }
            NI -ItemType HardLink -Path $LinkPath -Target $_.FullName | Out-Null
        }
    }

    # Phase 2: Remove dead links
    Foreach ($Name in $ExistingLinks.Keys) {
        Del "$StagingPath\$Name" -Force -EA 0
    }
}

# ========== REAL-TIME MONITORING ========== 
# Using WMI for reliable events
$DriveA = $SourceA.Substring(0,2)
$DriveB = $SourceB.Substring(0,2)
