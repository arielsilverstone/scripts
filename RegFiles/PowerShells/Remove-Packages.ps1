

### -------------------------------------------------------- ###

# Remove junk
$Packs = "Telemetry","Azure","WordBreaking","Antimalware","Media","Mobile","Nanoserver","Bio","BITS","Cellcore","CHSIME","Cloud","Consent","Containers","DeliveryOptimization","IME-","cast","PointOfService","REFS","Retail","EnergyEfficiency","Unix","VirtualizationBasedSecurity","WaaS","WER","XBox","Shared-Ink","Shielded","TPM","BestPractices","Bitlocker","Cortana","Deployment-Services","DeviceGuard","DFS","DHCPServer","DirectMusic","DirectPlay","DirectShow","Edge","EnterpriseClientSync","Fabric","Fax","Game","Host-Guardian","IIS","Identity","Codec","ISOBurn","Mail","MDM","Multipoint","NetworkLoad","OEM","Portable","XPS","ProjFS","Reliability","Assistance","Rights-M","SearchEngine","SMB1","SNMP","SQM","Insights","Tablet<---- problem, as 2 TableText services exist","Troubleshooting","TVT","VideoFor","ImageAcq<---- problem, as windowsimageacq exists","OCR","WinSAT","frame","Defender","CEIP","Harvester","SIUF","WorkPlace"



ForEach ($Pack in $Packs) { 
	$Path = 'HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\*$Pack*'
	
	Set-ItemProperty -Path $Path -Name Visibility -Value 1 -Force -EA SilentlyContinue	
	Get-ChildItem -Path $Path -Name | ForEach-Object Remove-WindowsPackage -Online -packagename $_ -NoRestart -Recurse -Force -EA SilentlyContinue -asjob
	Remove-Item -Path $Path -Include *Owner* -Recurse -Force -EA SilentlyContinue
	
	}
			   
### -------------------------------------------------------- ###