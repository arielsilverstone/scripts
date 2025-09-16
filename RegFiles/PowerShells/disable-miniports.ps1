Start-ThreadJob { RP -Path "HKCU:\Changes" -Name "NewMISC.ps1 Changed"
				  New-ItemProperty -Path "HKCU:\Changes" -Name "MISC.ps1 Changed" -Value "18JAN25"}
#
##
$Devices = "GREMINIPORT","AGILEVPNMINIPORT","NDISWANIP","NDISWANIPV6","L2TPMINIPORT","NDISWANBH","PPPOEMINIPORT","PPTPMINIPORT","MS_SSTPMINIPORT"

SaJb { ForEach ($Device in $Devices) { Start-Threadjob { pnputil /remove-device /deviceid MS_$Device } 
									 }
	 }
	
	




