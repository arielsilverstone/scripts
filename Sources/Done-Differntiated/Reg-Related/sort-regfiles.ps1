# Define the path to the input .reg file and the output .reg file
$inputFilePath = "C:\path\to\your\input.reg"
$outputFilePath = "C:\path\to\your\sorted_output.reg"

# Read the content of the .reg file
$regContent = Get-Content -Path $inputFilePath

# Initialize an array to hold the sorted lines
$sortedLines = @()

# Process each line in the .reg file
foreach ($line in $regContent) {
    # Check if the line is a registry key (starts with [)
    if ($line -match '^\[(.+)\]') {
        # Extract the key
        $key = $matches[1]
        # Add the key to the sorted lines
        $sortedLines += $line
    }
    # Check if the line is a value (contains =)
    elseif ($line -match '^(.*)=(.*)') {
        # Add the value to the sorted lines
        $sortedLines += $line
    }
}

# Sort the lines
$sortedLines = $sortedLines | Sort-Object

# Write the sorted lines to the output .reg file
$sortedLines | Set-Content -Path $outputFilePath

Write-Host "Sorted .reg file created at: $outputFilePath"