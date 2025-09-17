# Remove existing junction link
if (Test-Path "windsurf-extensions") {
    Remove-Item "windsurf-extensions" -Force
}

# Create new junction link to the correct location
$source = "D:\Program Files\Dev\Settings\Extensions"
$target = "D:\Program Files\Dev\Settings\Extensions\windsurf-extensions"

# Create junction link
cmd /c mklink /J $target $source

# Verify link creation
if (Test-Path $target) {
    "Successfully created junction link from $source to $target" | Out-File "fix-junction-log.txt"
} else {
    "Failed to create junction link" | Out-File "fix-junction-log.txt"
}
