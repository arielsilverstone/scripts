# Input and output files
$inputFile = "h:\dev\projects\Comparisons\all_setting_keys.txt"
$outputFile1 = "h:\dev\projects\Comparisons\all_setting_keys_filtered.txt"
$outputFile2 = "h:\dev\projects\Comparisons\2.txt"

# Patterns to match for the second file (2.txt)
$patterns = @(
    '^git',
    '^github',
    '^java',
    '^typescript',
    '^ts',
    '^xml',
    '^css',
    '^html',
    '^http',
    '^zen',
    '^cmake',
    '^makefile',
    '^debug',
    '^diffeditor',
    '^scss',
    '^less',
    '^search',
    '^tsc',
    '^tsserver',
    '^jdt',
    '^maven',
    '^gradle',
    '^xml',
    '^xquery',
    '^xsl',
    '^xslt',
    '^http',
    '^rest',
    '^api',
    '^cmake',
    '^makefile',
    '^make',
    '^gulp',
    '^grunt',
    '^webpack',
    '^babel',
    '^browser',
    '^node',
    '^npm',
    '^yarn',
    '^pnpm',
    '^sass',
    '^scss',
    '^less',
    '^stylus',
    '^postcss',
    '^tailwind',
    '^bootstrap',
    '^material',
    '^antd',
    '^element',
    '^vuetify',
    '^quasar',
    '^nuxt',
    '^next',
    '^gatsby',
    '^gridsome',
    '^svelte',
    '^angular',
    '^react',
    '^vue',
    '^prettier',
    '^eslint',
    '^stylelint',
    '^markdownlint',
    '^htmlhint',
    '^csscomb',
    '^beautify',
    '^prettier',
    '^eslint',
    '^stylelint',
    '^markdownlint',
    '^htmlhint',
    '^csscomb',
    '^beautify',
    '^prettier',
    '^eslint',
    '^stylelint',
    '^markdownlint',
    '^htmlhint',
    '^csscomb',
    '^beautify',
    '^prettier',
    '^eslint',
    '^stylelint',
    '^markdownlint',
    '^htmlhint',
    '^csscomb',
    '^beautify'
)

# Read all lines from the input file
$allLines = Get-Content -Path $inputFile

# Arrays to hold the filtered lines
$file1Lines = @()
$file2Lines = @()

# Process each line
foreach ($line in $allLines) {
    $line = $line.Trim()
    if ([string]::IsNullOrWhiteSpace($line)) {
        continue
    }
    
    $matched = $false
    foreach ($pattern in $patterns) {
        if ($line -match $pattern) {
            $file2Lines += $line
            $matched = $true
            break
        }
    }
    
    if (-not $matched) {
        $file1Lines += $line
    }
}

# Write the filtered lines to the output files
$file1Lines | Out-File -FilePath $outputFile1 -Encoding utf8
$file2Lines | Sort-Object -Unique | Out-File -FilePath $outputFile2 -Encoding utf8

# Show summary
Write-Host "Processing complete!"
Write-Host "Original keys: $($allLines.Count)"
Write-Host "Keys in $($outputFile1): $($file1Lines.Count)"
Write-Host "Keys in $($outputFile2): $($file2Lines.Count)"
