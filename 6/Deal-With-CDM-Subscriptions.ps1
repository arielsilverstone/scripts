
# Deal with the CDM Obnoxious reg key
$Items  = ("ContentDeliveryAllowed","FeatureManagement","OEMPreInstalledApps","PreInstalledApps","PreInstalledAppsEver","PreInstalledAppsOverlay","RotatingLockScreen","RotatingLockScreenOverlay","SilentInstalledApps","Slideshow","SoftLanding","SubscribedContent","SystemPaneSuggestions")
$Items2 = ("202913","202914","280812","280813","280814","280815","310091","310092","310093","310094","314558","314559","314562",	"314563","314566","314567","338380","338381","338382","338386","338387","338388","338389","338393","346480","346481","353694","353695","353696","353697","353698","353699","88000044","88000045","88000105","88000106","88000165","88000166","88000326")

$Path = "Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\"
$Pre = "SubscribedContent-"
$Post = "Enabled"
$Mothers =( "HKCU","HKLM")

ForEach ($Mother in $Mothers)
	{
	Set-Location Registry::$Mother
	$MotherDot = ($Mother + ":")
	ForEach ($Item in $Items)
		{ 
		Try
			{
			$Exists= ((Get-itemproperty -Path $Path).$Item) 
			Set-ItemProperty -Path $Path -Name $Item -Value "1"
			}
		Catch 
			{
			New-ItemProperty -Path $Path -Name $Item -PropertyType DWord -Value "1"
			}
		}

	ForEach ($Item in $Items2)
		{ 
		Try
			{
			$Exists= ((Get-itemproperty -Path $Path).$Item) 
			Set-ItemProperty -Path $Path -Name $ItemMod -Value "0"
			}
		Catch 
			{
			New-ItemProperty -Path $Path -Name $ItemMod -PropertyType DWord -Value "0"
			}
		}
	}

