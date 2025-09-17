# NLevelComparison.ps1
# Compares two JSON files up to a specified Depth, optionally logging differences to a file.
# Usage:
#   . .\NLevelComparison.ps1
#   Compare-JsonNLevel -PathA "fileA.json" -PathB "fileB.json" -Depth 2 -Output "D:\Desktop\Temp\mydiff.txt"
#
Param(
    [string]$ScriptOutputPath = "D:\Desktop\Temp\NLevelComparison_output.txt"
)

function ConvertTo-JsonHashtableLimited {
    param(
        [Parameter(Mandatory)] [object] $Object,
        [int] $Depth
    )

    # If Depth is 0, treat everything as a scalar
    if ($Depth -le 0) {
        return $Object.ToString()
    }

    if ($Object -is [System.Management.Automation.PSCustomObject]) {
        $ht = @{}
        foreach ($p in $Object.PSObject.Properties) {
            $name = $p.Name
            $value = $p.Value
            # Convert child with Depth - 1
            $ht[$name] = ConvertTo-JsonHashtableLimited -Object $value -Depth ($Depth - 1)
        }
        return $ht
    }
    elseif ($Object -is [System.Collections.IEnumerable] -and -not ($Object -is [string])) {
        # This handles arrays
        $arr = @()
        foreach ($item in $Object) {
            $arr += ,(ConvertTo-JsonHashtableLimited -Object $item -Depth ($Depth - 1))
        }
        return $arr
    }
    else {
        # scalar or string
        return $Object
    }
}

function Compare-JsonArraysLimited {
    param(
        [Parameter(Mandatory)] [object[]] $A,
        [Parameter(Mandatory)] [object[]] $B,
        [string] $Path,
        [int] $Depth
    )

    $differences = New-Object System.Collections.Generic.List[System.String]

    $countA = $A.Count
    $countB = $B.Count
    if ($countA -ne $countB) {
        $differences.Add("# Array length mismatch at $Path: A has $countA, B has $countB")
    }

    $minLength = [Math]::Min($countA, $countB)
    for ($i = 0; $i -lt $minLength; $i++) {
        $subPath = "$Path`[$i]"
        $valA = $A[$i]
        $valB = $B[$i]

        # If Depth is not fully used up, we can descend further
        if ($Depth -gt 0) {
            if ($valA -is [hashtable] -and $valB -is [hashtable]) {
                $differences.AddRange(Compare-JsonNLevelCore -A $valA -B $valB -Path $subPath -Depth ($Depth))
            } elseif ($valA -is [object[]] -and $valB -is [object[]]) {
                $differences.AddRange(Compare-JsonArraysLimited -A $valA -B $valB -Path $subPath -Depth $Depth)
            } else {
                if ($valA -ne $valB) {
                    $differences.Add("# Diff at $subPath: A='$valA' vs B='$valB'")
                }
            }
        } else {
            # Depth exhausted, compare as scalar.
            if ($valA -ne $valB) {
                $differences.Add("# Diff at $subPath (exhausted depth): A='$valA' vs B='$valB'")
            }
        }
    }

    return $differences
}

function Compare-JsonNLevelCore {
    param(
        [Parameter(Mandatory)] [hashtable] $A,
        [Parameter(Mandatory)] [hashtable] $B,
        [string] $Path,
        [int] $Depth
    )

    $differences = New-Object System.Collections.Generic.List[System.String]

    # 1. Keys only in A
    foreach ($key in $A.Keys) {
        $subPath = if ($Path) { "$Path.$key" } else { $key }
        if (-not $B.ContainsKey($key)) {
            $differences.Add("# Only in A: $subPath = $($A[$key])")
        }
    }

    # 2. Keys only in B
    foreach ($key in $B.Keys) {
        $subPath = if ($Path) { "$Path.$key" } else { $key }
        if (-not $A.ContainsKey($key)) {
            $differences.Add("# Only in B: $subPath = $($B[$key])")
        }
    }

    # 3. Keys in both, compare values
    foreach ($key in $A.Keys) {
        if ($B.ContainsKey($key)) {
            $subPath = if ($Path) { "$Path.$key" } else { $key }
            $valA = $A[$key]
            $valB = $B[$key]

            if ($Depth -gt 0) {
                switch -regex ([string]($valA.GetType().Name + "," + $valB.GetType().Name)) {
                    ".*Hashtable.*" {
                        $differences.AddRange(Compare-JsonNLevelCore -A $valA -B $valB -Path $subPath -Depth ($Depth - 1))
                    }
                    ".*Object\[\].*" {
                        $differences.AddRange(Compare-JsonArraysLimited -A $valA -B $valB -Path $subPath -Depth ($Depth - 1))
                    }
                    default {
                        if ($valA -ne $valB) {
                            $differences.Add("# Diff at $subPath: A='$valA' vs B='$valB'")
                        }
                    }
                }
            } else {
                # Depth is 0, compare as scalars
                if ($valA -ne $valB) {
                    $differences.Add("# Diff at $subPath (depth exhausted): A='$valA' vs B='$valB'")
                }
            }
        }
    }

    return $differences
}

function Compare-JsonNLevel {
    <#
        Compare two JSON files, up to a specified Depth.
        Depth=1 => top-level only
        Depth=2 => top-level and one nested level
        Depth=3 => up to 3 nested levels, etc.

        Usage:
          Compare-JsonNLevel -PathA "fileA.json" -PathB "fileB.json" -Depth 2 -Output "D:\Desktop\Temp\mydiff.txt"
    #>
    param(
        [Parameter(Mandatory)] [string] $PathA,
        [Parameter(Mandatory)] [string] $PathB,
        [Parameter(Mandatory)] [int] $Depth = 2,
        [string] $Output = ""
    )

    if (-not (Test-Path $PathA)) {
        Write-Host "# Cannot find $PathA"
        return
    }
    if (-not (Test-Path $PathB)) {
        Write-Host "# Cannot find $PathB"
        return
    }

    $header = "# Comparing $PathA vs $PathB up to depth=$Depth"
    Write-Host $header

    $jsonA = Get-Content $PathA -Raw | ConvertFrom-Json
    $jsonB = Get-Content $PathB -Raw | ConvertFrom-Json

    if (-not $jsonA) {
        Write-Host "# Failed to parse JSON for $PathA"
        return
    }
    if (-not $jsonB) {
        Write-Host "# Failed to parse JSON for $PathB"
        return
    }

    # Convert them to limited-depth hashtables
    $hashA = ConvertTo-JsonHashtableLimited -Object $jsonA -Depth $Depth
    $hashB = ConvertTo-JsonHashtableLimited -Object $jsonB -Depth $Depth

    $diffs = Compare-JsonNLevelCore -A $hashA -B $hashB -Path "" -Depth ($Depth - 1)

    if ($diffs.Count -eq 0) {
        $message = "# No differences found up to depth $Depth."
        Write-Host $message
        if ($Output) {
            "$header`n$message" | Out-File -FilePath $Output -Encoding UTF8 -Append
        }
    } else {
        foreach ($d in $diffs) {
            Write-Host $d
        }
        if ($Output) {
            $log = ($header + "`r`n" + ($diffs -join "`r`n"))
            $log | Out-File -FilePath $Output -Encoding UTF8 -Append
        }
    }
}

Write-Host "# NLevelComparison.ps1 loaded. Use Compare-JsonNLevel -PathA fileA -PathB fileB -Depth N -Output path"
