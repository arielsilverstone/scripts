
;
; Enable power tab on wifi adapter
[HKLM:\System\CurrentControlSet\Control\Power]
"CSEnabled"=dword:00000000
; Turn off Eco mode
"EcoModeState"=dword:00000002
"ExitLatency"=dword:00000001
"ExitLatencyCheckEnabled"=dword:00000001
; Disable modern standby power
"PlatformAoACOverride"=-
"HibernateEnabled"=dword:00000000
"Latency"=dword:00000001
"LatencyToleranceDefault"=dword:00000001
"LatencyToleranceFSVP"=dword:00000001
"LatencyTolerancePerfOverride"=dword:00000001
"LatencyToleranceScreenOffIR"=dword:00000001
"LatencyToleranceVSyncEnabled"=dword:00000001
"RtlCapabilityCheckLatency"=dword:00000001
;
[HKLM:\Software\Policies\Microsoft\Windows\PSched]
"NonBestEffortLimit"=dword:00000000
; "TimerResolution" will go here if I ever figure out how.  Def value=10.
;
; ***********Power Optimization Fixes
;
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9]
"Attributes"=dword:00000002
;
[HKLM:\System\CurrentControlSet\Control\Power\PowerThrottling]
"PowerThrottlingOff"=dword:00000001
;
; Below all to prevent wake up login requirments
;
[HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
[HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
[HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\0]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
[HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\1]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
[HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
#
##
# #	Change Tracking
Start-ThreadJob { 
	$Name="Power"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "11FEB25" | Out-Null
} -Name "$Name.ps1 Changed"
#
##
#



[HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
[HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
;
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c]
"ACSettingIndex"=dword:00000000
;
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c]
"ACSettingIndex"=dword:00000000
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e]
"ACSettingIndex"=dword:00000064
"DCSettingIndex"=dword:00000064
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c]
"ACSettingIndex"=dword:00000064
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e]
"ACSettingIndex"=dword:00000064
"DCSettingIndex"=dword:00000064
[HKLM:\System\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c]
"ACSettingIndex"=dword:00000064
"DCSettingIndex"=dword:00000064
;
;
; *********** power settings END