# Combine two directories' file shortcuts into a 3rd:
# Define paths
$folderA = "C:\A"
$folderB = "C:\B"
$folderC = "C:\C"

# Create Folder A if it doesn't exist
if (!(Test-Path $folderA)) { New-Item -ItemType Directory -Path $folderA }

# Function to create shortcuts in A for all files in a source folder
function Create-Shortcuts {
    param ([string]$sourceFolder, [string]$targetFolder)
    Get-ChildItem -File -Path $sourceFolder | ForEach-Object {
        $shortcutPath = Join-Path $targetFolder "$($_.Name).lnk"
        $WScriptShell = New-Object -ComObject WScript.Shell
        $shortcut = $WScriptShell.CreateShortcut($shortcutPath)
        $shortcut.TargetPath = $_.FullName
        $shortcut.Save()
    }
}

# Create shortcuts for files in B and C
Create-Shortcuts -sourceFolder $folderB -targetFolder $folderA
Create-Shortcuts -sourceFolder $folderC -targetFolder $folderA

Write-Host "Shortcuts created in $folderA for all files in $folderB and $folderC."
#
#
##
#
#


}
