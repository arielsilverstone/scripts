##
##
##C:\Windows\System32\WindowsPowerShell\v1.0\Profile.ps1
##
# 	Change Tracking
Start-ThreadJob { 
	$Name="Profile"
	If ((Get-ItemProperty "HKCU:\Changes")."$Name.ps1 Changed") {
		RP -Path ("HKCU:\Changes") -Name "$Name.ps1 Changed"
	} 
	New-ItemProperty -Path "HKCU:\Changes" -Name "$Name.ps1 Changed" -Value "15FEB25" | Out-Null
} -Name "$Name.ps1 Changed" 
#
#
##
#
NAL STW 		" -Type DWord"
NAL TPH 		Test-Path
NAL SIP 		Set-ItemProperty
NAL WO			Write-Output
NAL GIP			Get-ItemProperty
NAL Profile		C:\Windows\System32\WindowsPowerShell\v1.0\Profile.ps1
NAL Services	D:\RegFiles\Services.ps1
NAL Schedule	D:\RegFiles\Schedule.ps1
NAL Privacy		D:\RegFiles\Privacy	
NAL Search		D:\RegFiles\Search	
NAL Shell		D:\RegFiles\Shell	
<#
NAL 	D:\RegFiles\
NAL 	D:\RegFiles\
NAL ""
NAL ""
NAL ""
NAL "" #>
#
##
#
Set-Location	D:\Desktop

$Env:Path += ;D:\Desktop\RegFiles;D:\Desktop\Holder
#
##
#