<#
╔═════════════════════════════════════════════════════════════════════════════╗
║                   PSScriptAnalyzerSettings.psd1  V. 1.2                     ║
║        PowerShell Script Analyzer settings with auto-formatting rules       ║
╚═════════════════════════════════════════════════════════════════════════════╝
#>

@{
    # Use PowerShell's default rules
    IncludeDefaultRules = $true

    # Custom rules for formatting
    Rules = @{
        # Only enable rules for tabs and trailing spaces
        PSAvoidTrailingWhitespace = @{
            Enable  = $true          # This rule removes trailing spaces
            OnSave  = $true          # Apply on save
        }
        ConvertTabsToSpaces = @{
            Enable  = $true          # Custom rule to convert tabs to spaces
            TabSize = 5              # Number of spaces per tab
            OnSave  = $true          # Apply on save
        }
    }

    # Settings for automatic formatting
    FormattingOptions = @{
        AutoCorrectOnSave   = $false  # Disable auto-corrections on save
        AutoCorrectOnOpen   = $true   # Enable auto-corrections on open
        ConvertTabsToSpaces = $true   # Keep tab conversion setting
    }

    # Exclude specific rules if needed
    ExcludeRules = @(
		# Allow use of aliases
        PSAvoidUsingCmdletAliases        = @{ Enabled = $false } 
		# Don't enforce approved verbs		
        PSUseApprovedVerbs               = @{ Enabled = $false }  
		# Disable Write-Host Messages		
        PSAvoidUsingWriteHost            = @{ Enabled = $false }    
        PSAvoidGlobalVars                = @{ Enabled = $false }
        PSAvoidUsingPlainTextForPassword = @{ Enabled = $false }
    )
}