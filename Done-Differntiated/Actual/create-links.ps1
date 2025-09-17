# Create junction link for Windsurf extensions
$source = "D:\Users\Ariel\.windsurf\extensions"
$target = "D:\Program Files\Dev\Settings\Extensions\windsurf-extensions"

# Remove existing target if it exists
if (Test-Path $target) {
    Remove-Item $target -Recurse -Force
}

# Create junction link
cmd /c mklink /J $target $source

# Verify link creation
if (Test-Path $target) {
    "Successfully created junction link from $source to $target"  #  | Out-File "links-log.txt"
} else {
    "Failed to create junction link" # | Out-File "links-log.txt"
}
