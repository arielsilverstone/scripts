##
##  
#
. .\Functions.ps1
Track-Change -Name "Power"
Manage-Tracing -On
#
##
## Global Vars
#
$CCS = "HKLM:\System\CurrentControlSet\"
$CV  = "HKLM:\Software\Microsoft\Windows\CurrentVersion"
$CVN = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion"
$Pol = "HKLM:\Software\Policies\Microsoft\Windows"

NAL NIP New-ItemProperty
NAL STD Start-ThreadJob  
NAL	JP	Join-Path
#
#
##
#
$CPath     = JP $CCS "Control\Power\PowerSettings"
$Defaults  = $Defs + "a1841308-3541-4fab-bc81-f71556f20b4a"
$Defs      = @("381b4222-f694-41f0-9685-ff5bb260df2e", "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c")
$DPS       = "DefaultPowerSchemeValues"
$Ends      = @("", "0", "1")
$Extras    = @("4b92d758-5a24-4851-a470-815d78aee119", "7b224883-b3cc-4d79-819f-8374152cbe7c")
$Indexes   = @("AC", "DC")
$Path1 = JP $CPath "0e796bdb-100d-47d6-a2d5-f7d2daa51f51\"
SaJB {
	try {
        ForEach ($Item in $Defaults) {
            ForEach ($Index in $Indexes) {
                STD -ArgumentList @($Path1, $Ends, $Index) {
                    Param ($Path1, $Ends, $Index)
                    try {
                        ForEach ($End in $Ends) {
                            $Path2 = JP $Path1 $End
                            $Combo = "$Index SettingIndex"
                            SP -Path $Path2 -Name $Combo -Value 0 -Type Dword
                        }
                    } catch { Log-Error "Error in Mains 1: $_" }
                } -Name "Mains 1"
			#
			$Path3 = JP $Path1 $DPS $Item
			$Combo = "$Index SettingIndex"
			SP -Path $Path3 -Name $Combo -Value 0 -Type Dword
			#
			Start-ThreadJob -ArgumentList @($Item,$Index,$CCS,$Combo) {
				Param ($Item,$Index,$CCS,$Combo)
				try {
					$Path4 = JP $CCS "Control\Power\PowerSettings" "2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\" $DPS
					$Joint	= JP $Path4 $Item
					SP -Path  $Joint -Name $Combo -Value 0 -Type Dword
				} catch { Log-Error "Error in Mains 2: $_" }
			} -Name "Mains 2"
		}
	} catch { Log-Error "Error in Power Settings: $_" }
} -Name "Power Settings"
	#
STD -ArgumentList @($DPS,$Defs,$CCS,$Indexes,$Extras) {
	param ($DPS,$Defs,$CCS,$Indexes,$Extras)
	try {
        $Path5 = JP $CCS "Control\Power\PowerSettings" "54533251-82be-4824-96c1-47b60b740d00"
        ForEach ($Item in $Defs) {
            $Path7 = JP $Path5 "3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" $DPS $Item
            ForEach ($Index in $Indexes) {
                $Combo = "$Index SettingIndex"
                STD -ArgumentList @($Item,$Path5,$Index,$Extras,$DPS,$Combo) {
                    Param ($Item,$Path5,$Index,$Extras,$DPS,$Combo)
                    try {
                        ForEach ($Extra in $Extras) {
                            $Path6 = JP $Path5 $Extra $DPS $Item
                            SP -Path $Path6 -Name $Combo -Value 100 -Type Dword
                        }
                    } catch {
                        Log-Error "Error in Sub Plans: $_"
                    }
                } -Name "Sub Plans"
                
                $PathA = JP "HKLM:\Software\Policies\Microsoft" "Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
                SP -Path $Path7 -Name $Combo -Value 0 -Type Dword
                SP -Path $PathA -Name $Combo -Value 0 -Type Dword
            }
        }
    } catch { Log-Error "Error in Def Power: $_" }
} -Name "Def Power"
#
##
#
$Path	= "HKLM:\SYSTEM\CurrentControlSet\Control\Power"
$PathX	= $Path "PowerSettings"
$PathY	= $Path "PowerThrottling"
$Pairs	= @{ "CSEnabled"=0;"ExitLatency"=1;"ExitLatencyCheckEnabled"=1;"HibernateEnabled"=0;"Latency"=1;`
			 "LatencyToleranceDefault"=1;"LatencyToleranceFSVP"=1;"LatencyTolerancePerfOverride"=1;"LatencyToleranceScreenOffIR"=1;"LatencyToleranceVSyncEnabled"=1;"RtlCapabilityCheckLatency"=1;"EcoModeState"=2;								 <# Turn off Eco mode#>
			 "PlatformAoACOverride"="-" 					<# Disable modern standby power #> }
Start-ThreadJob {
	ForEach ($Item in $Pairs.Keys) {
		SP -Path $PathX -Name $Item -Value $Pairs[$Item]	-Type Dword
		SP -Path $Path 	-Name $Item -Value $Pairs[$Item]	-Type Dword
	}
<#	SP -Path $PathY -Name "PowerThrottlingOff" -Value 1 -Type Dword #>
} -Name "Power Throtteling"
#
##
#
STD {
    try {
        SP -Path $PathX -Name "fDisablePowerManagement" -Value 1 -Type Dword
        SP -Path $PathY -Name "WCMPresent"				-Value 1 -Type Dword
    } catch { Log-Error "Error in NIC Power Management: $_" }
} -Name "NIC Power"


Manage-Tracing -Off
#
##
#

#
##
#

#
##
#

#
##
#



