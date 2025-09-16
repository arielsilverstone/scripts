
winrm QC

winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/service/auth @{CredSSP="true"}
winrm set winrm/config/service/auth @{CbtHardeningLevel="relaxed"}

winrm set winrm/config/service @{AllowUnencrypted="true"}

winrm set winrm/config/client/auth @{Basic="true"}
winrm set winrm/config/client/auth @{CredSSP="true"}

winrm set winrm/config/client @{AllowUnencrypted="true"}
winrm set winrm/config/client @{TrustedHosts="*"}
