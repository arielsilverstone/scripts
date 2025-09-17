#Requires -RunAsAdministrator

# --- Embedded Customization Files ---

# This Here-String contains the unattend.xml file for the oobeSystem pass
$unattendFileContent = @"
<?xml version="1.0" encoding="utf-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend">
    <settings pass="oobeSystem">
        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
            <OOBE>
                <HideEULAPage>true</HideEULAPage>
                <HideLocalAccountScreen>true</HideLocalAccountScreen>
                <HideOnlineAccountScreens>true</HideOnlineAccountScreens>
                <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE>
                <ProtectYourPC>3</ProtectYourPC>
                <SkipMachineOOBE>true</SkipMachineOOBE>
                <SkipUserOOBE>true</SkipUserOOBE>
            </OOBE>
            <UserAccounts>
                <AdministratorPassword>
                    <Value>T</Value>
                    <PlainText>true</PlainText>
                </AdministratorPassword>
                <LocalAccounts>
                    <LocalAccount wcm:action="add">
                        <Name>Ariel</Name>
                        <Group>Administrators</Group>
                        <Password>
                            <Value></Value>
                            <PlainText>true</PlainText>
                        </Password>
                    </LocalAccount>
                    <LocalAccount wcm:action="add">
                        <Name>Machine</Name>
                        <Group>Administrators</Group>
                        <Password>
                            <Value>T</Value>
                            <PlainText>true</PlainText>
                        </Password>
                    </LocalAccount>
                </LocalAccounts>
            </UserAccounts>
            <AutoLogon>
                <Username>Ariel</Username>
                <Enabled>true</Enabled>
                <LogonCount>999999</LogonCount>
                <Password>
                    <Value></Value>
                    <PlainText>true</PlainText>
                </Password>
            </AutoLogon>
            <FolderLocations>
                <ProfilesDirectory>D:\Users</ProfilesDirectory>
            </FolderLocations>
            <FirstLogonCommands>
                <SynchronousCommand wcm:action="add">
                    <Order>1</Order>
                    <CommandLine>cmd.exe /c C:\Windows\Setup\Scripts\SetupComplete.cmd</CommandLine>
                    <Description>Run Post-Installation Scripts</Description>
                </SynchronousCommand>
            </FirstLogonCommands>
        </component>
        <component name="Microsoft-Windows-International-Core" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
            <InputLocale>en-US</InputLocale>
            <SystemLocale>en-GB</SystemLocale>
            <UILanguage>en-GB</UILanguage>
            <UserLocale>en-VI</UserLocale>
        </component>
    </settings>
    <settings pass="specialize">
        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
            <ComputerName>WIN-SERVER2025</ComputerName>
            <TimeZone>Pacific Standard Time</TimeZone>
             <ProductKey>2KNJJ-33Y9H-2GXGX-KMQWH-G6H67</ProductKey>
        </component>
        <component name="Microsoft-Windows-ServerManager-SvrMgrNc" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
            <DoNotOpenServerManagerAtLogon>true</DoNotOpenServerManagerAtLogon>
        </component>
    </settings>
</unattend>
"@

# This Here-String contains the SetupComplete.cmd file
$setupCompleteFileContent = @"
@echo off
powershell.exe -ExecutionPolicy Bypass -File C:\Windows\Setup\Scripts\PostInstall.ps1
exit /b 0
"@

# This Here-String contains the Services.reg file
$servicesRegFileContent = @"
Windows Registry Editor Version 5.00

[HKLM\SYSTEM\CurrentControlSet\Services\AarSvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\AdobeARMservice]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\AGMService]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\AppIDSvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc]
"Start"=dword:00000003
[HKLM\SYSTEM\CurrentControlSet\Services\aspnet_state]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\atzautoupdate]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\AxInstSV]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\AzureAttestService]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\Beep]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\camsvc]
"Start"=dword:00000002
[HKLM\SYSTEM\CurrentControlSet\Services\CaptureService]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\CertPropSvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\ClickToRunSvc]
"Start"=dword:00000003
[HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC]
"Start"=dword:00000003
[HKLM\SYSTEM\CurrentControlSet\Services\CDPSvc]
"Start"=dword:00000002
[HKLM\SYSTEM\CurrentControlSet\Services\CDPUserSvc]
"Start"=dword:00000002
[HKLM\SYSTEM\CurrentControlSet\Services\DPS]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\EFS]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\FSDepends]
"Start"=dword:00000000
[HKLM\SYSTEM\CurrentControlSet\Services\FSDepends\Parameters]
"VirtualDiskExpandOnMount"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\HgClientService]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\KeyIso]
"Start"=dword:00000003
[HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager]
"Start"=dword:00000003
[HKLM\SYSTEM\CurrentControlSet\Services\mpio]
"Start"=dword:00000000
[HKLM\SYSTEM\CurrentControlSet\Services\MSiSCSI]
"Start"=dword:00000003
[HKLM\SYSTEM\CurrentControlSet\Services\NetTcpPortSharing]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\pla]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\PolicyAgent]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\sppsvc]
"Start"=dword:00000002
[HKLM\SYSTEM\CurrentControlSet\Services\QWAVE]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\RemoteAccess]
"Start"=dword:00000002
[HKLM\SYSTEM\CurrentControlSet\Services\RemoteRegistry]
"Start"=dword:00000002
[HKLM\SYSTEM\CurrentControlSet\Services\RpcLocator]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SCardSvr]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\wscsvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\WSearch]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SENS]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\Sense]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SensorDataService]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SensorService]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SensrSvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SgrmAgent]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\ShellHWDetection]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SNMPTrap]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\ssh-agent]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\SysMain]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\tapisrv]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\TrkWks]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\UALSVC]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc]
"Start"=dword:00000003
[HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\WdiServiceHost]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\WdiSystemHost]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\WDSServer]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\WinRM]
"Start"=dword:00000002
[HKLM\SYSTEM\CurrentControlSet\Services\WlanSvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\wlidsvc]
"Start"=dword:00000004
[HKLM\SYSTEM\CurrentControlSet\Services\wuauserv]
"Start"=dword:00000004
"@

#########
# This Here-String contains the master PostInstall.ps1 file
$postInstallFileContent = @"
Write-Host "Assigning drive letters..." -ForegroundColor Green
# Phase 1: Ensure Correct Drive Letters
Write-Host "Phase 1: Verifying and assigning drive letters..." -ForegroundColor Yellow
Get-Volume | Where-Object { $_.FileSystemLabel -eq 'Data' -and $_.DriveLetter -ne 'D' } | Set-Partition -NewDriveLetter 'D'
Get-Volume | Where-Object { $_.FileSystemLabel -eq 'Pagefile' -and $_.DriveLetter -ne 'Y' } | Set-Partition -NewDriveLetter 'Y'
Write-Host "Drive letters D: and Y: have been assigned." -ForegroundColor Cyan
Start-Sleep -Seconds 2 # Allow time for drive letter changes to register

#########
Write-Host "Starting Post-OOBE configuration..." -ForegroundColor Green
# Phase 2: Create Core Directory Structure
Write-Host "Phase 2: Creating directory structure..." -ForegroundColor Yellow
`$Directories = @(
    "D:\Users\Ariel", "D:\Desktop", "D:\Temp", "D:\AppData", "D:\Links",
    "D:\Program Files\Dev\Tools\Python313", "D:\Program Files\Dev\Tools\PyPaks\Scripts",
    "D:\Program Files\Dev\Settings\Ariel", "D:\Program Files\Dev\Settings\Extensions",D:\Program Files\Dev\Settings\Templates","D:\Program Files\Dev\Settings\System", "D:\Program Files\Dev\Windsurf",
    "D:\Program Files\PowerShell\Modules", "D:\Program Files\PowerShell\7\Modules"
)
foreach (`$Dir in `$Directories) {
    if (!(Test-Path `$Dir)) {
        New-Item -Path `$Dir -ItemType Directory -Force | Out-Null
        Write-Host "Created directory: `$Dir" -ForegroundColor Cyan
    }
}

#########
# Phase 3: Apply Service Configurations
Write-Host "Phase 3: Importing service configurations..." -ForegroundColor Yellow
try {
    reg import "C:\Windows\Setup\Scripts\Services.reg"
    Write-Host "Successfully imported service settings." -ForegroundColor Cyan
} catch { Write-Warning "Failed to import service settings: `$(`$_.Exception.Message)" }

#########
# Phase 4: Set Pagefile
Write-Host "Phase 4: Configuring 8GB static pagefile on Y: ..." -ForegroundColor Yellow
try {
    `$computerSystem = Get-CimInstance -ClassName Win32_ComputerSystem
    `$computerSystem.AutomaticManagedPagefile = `$false
    Set-CimInstance -CimInstance `$computerSystem
    `$cPageFile = Get-CimInstance -Class Win32_PageFileSetting -Filter "Name='C:\\pagefile.sys'"
    if(`$cPageFile) { `$cPageFile | Remove-CimInstance }
    Set-CimInstance -Query "SELECT * FROM Win32_PageFileSetting WHERE Name='Y:\\pagefile.sys'" -Property @{InitialSize = 8192; MaximumSize = 8192} -ErrorAction SilentlyContinue
    If (!(`$?)) {
         New-CimInstance -ClassName Win32_PageFileSetting -Property @{Name="Y:\pagefile.sys"; InitialSize = 8192; MaximumSize = 8192}
    }
    Write-Host "Pagefile set to 8GB on Y:" -ForegroundColor Cyan
} catch { Write-Warning "Failed to configure pagefile: `$(`$_.Exception.Message)" }

#########
# Phase 5: Configure Security & System Policies
Write-Host "Phase 5: Configuring security policies..." -ForegroundColor Yellow
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled `$false
Write-Host "All firewall profiles disabled." -ForegroundColor Cyan
`$cfg = "`$env:TEMP\secpol.cfg"
secedit /export /cfg `$cfg /quiet
(Get-Content `$cfg) -replace 'PasswordComplexity = 1', 'PasswordComplexity = 0' | Set-Content `$cfg
secedit /configure /db "`$env:windir\security\new.sdb" /cfg `$cfg /areas SECURITYPOLICY /quiet
Remove-Item `$cfg -Force
Write-Host "Password complexity disabled." -ForegroundColor Cyan
`$DataCollectionPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
New-Item -Path `$DataCollectionPath -Force | Out-Null
Set-ItemProperty -Path `$DataCollectionPath -Name "AllowTelemetry" -Value 0 -Type DWord -Force
Write-Host "Telemetry disabled." -ForegroundColor Cyan

#########
# Phase 6: Remove AppX Packages
Write-Host "Phase 6: Removing AppX Packages..." -ForegroundColor Yellow
`$AppPackNames = @(
    "*3dbuilder*", "*549981c3f5f10*", "*alarms*", "*bing*", "*Clipchamp*",
    "*communicationsapps*", "*FeedbackHub*", "*GetHelp*", "*maps*",
    "*MicrosoftEdge*", "*MicrosoftStickyNotes*", "*officehub*", "*onenote*",
    "*people*", "*PowerAutomateDesktop*", "*quickassist*", "*ScreenSketch*",
    "*solitaire*", "*soundrecorder*", "*Spotify*", "*Teams*", "*Todos*",
    "*webexperience*", "*windowsalarms*", "*WindowsNotepad*",
    "*Xbox*", "*Zune*"
)
foreach (`$app in `$AppPackNames) {
    Get-AppxProvisionedPackage -Online | Where-Object { `$_.PackageName -like `$app } | ForEach-Object {
        Write-Host "Removing provisioned package: `$(`$_.DisplayName)" -ForegroundColor Cyan
        Remove-AppxProvisionedPackage -Online -PackageName `$_.PackageName -ErrorAction SilentlyContinue
    }
}

#########
# Phase 7: Install On-Demand Features & Software
Write-Host "Phase 7: Installing features and software..." -ForegroundColor Yellow
`$Capabilities = @("Language.Basic~~~pl-PL~0.0.1.0", "Language.Basic~~~ro-RO~0.0.1.0")
foreach (`$cap in `$Capabilities) {
    Write-Host "Adding capability: `$cap" -ForegroundColor Cyan
    Add-WindowsCapability -Online -Name `$cap -ErrorAction SilentlyContinue
}

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -ErrorAction SilentlyContinue
Add-AppxPackage -Path "https://aka.ms/getwinget" -ErrorAction SilentlyContinue
winget install --id Microsoft.DotNet.DesktopRuntime.9 --location "D:\Program Files\dotnet" --accept-source-agreements --accept-package-agreements --silent
winget install --id Microsoft.PowerShell --version 7 --location "D:\Program Files\PowerShell\7" --accept-source-agreements --accept-package-agreements --silent
#########

# Phase 8: Configure Environment Variables
Write-Host "Phase 8: Configuring environment variables..." -ForegroundColor Yellow
[Environment]::SetEnvironmentVariable("TEMP", "D:\Temp", "Machine")
[Environment]::SetEnvironmentVariable("TMP", "D:\Temp", "Machine")

#########
# Phase 9: Configure WinRM
Write-Host "Phase 9: Configuring WinRM..." -ForegroundColor Yellow
Enable-PSRemoting -Force -SkipNetworkProfileCheck
Set-WSManInstance -ResourceURI winrm/config/service -ValueSet @{AllowUnencrypted = "true" }
Set-WSManInstance -ResourceURI winrm/config/client -ValueSet @{AllowUnencrypted = "true"; TrustedHosts = "*" }
Restart-Service WinRM -Force

#########
# Phase 10: Configure Context Menu
Write-Host "Phase 10: Configuring context menu..." -ForegroundColor Yellow
$shellPath = "HKCR:\Directory\Background\shell"

# PowerShell Admin
$psAdminPath = "$shellPath\PowerShellAdmin"
New-Item -Path $psAdminPath -Force | Out-Null
Set-ItemProperty -Path $psAdminPath -Name "(Default)" -Value "PowerShell as Admin"
Set-ItemProperty -Path $psAdminPath -Name "Icon" -Value "powershell.exe"
New-Item -Path "$psAdminPath\command" -Force | Set-ItemProperty -Name "(Default)" -Value "powershell.exe -Command `"Start-Process powershell -Verb RunAs`""

# CMD Admin
$cmdAdminPath = "$shellPath\CMDAdmin"
New-Item -Path $cmdAdminPath -Force | Out-Null
Set-ItemProperty -Path $cmdAdminPath -Name "(Default)" -Value "Command Prompt as Admin"
Set-ItemProperty -Path $cmdAdminPath -Name "Icon" -Value "cmd.exe"
Set-ItemProperty -Path $cmdAdminPath -Name "HasLUAShield" -Value ""
New-Item -Path "$cmdAdminPath\command" -Force | Set-ItemProperty -Name "(Default)" -Value "cmd.exe /s /k pushd `"%V`""

# God Mode
$godModePath = "$shellPath\GodMode"
New-Item -Path $godModePath -Force | Out-Null
Set-ItemProperty -Path $godModePath -Name "(Default)" -Value "God Mode"
Set-ItemProperty -Path $godModePath -Name "Icon" -Value "control.exe"
New-Item -Path "$godModePath\command" -Force | Set-ItemProperty -Name "(Default)" -Value "explorer.exe shell:::{ED7BA470-8E54-465E-825C-99712043E01C}"

# Device Manager
$devmgmtPath = "$shellPath\DevMgmt"
New-Item -Path $devmgmtPath -Force | Out-Null
Set-ItemProperty -Path $devmgmtPath -Name "(Default)" -Value "Device Manager"
Set-ItemProperty -Path $devmgmtPath -Name "Icon" -Value "devmgmt.msc"
New-Item -Path "$devmgmtPath\command" -Force | Set-ItemProperty -Name "(Default)" -Value "devmgmt.msc"

# Network Connections
$ncpaPath = "$shellPath\NetConnections"
New-Item -Path $ncpaPath -Force | Out-Null
Set-ItemProperty -Path $ncpaPath -Name "(Default)" -Value "Network Connections"
Set-ItemProperty -Path $ncpaPath -Name "Icon" -Value "ncpa.cpl"
New-Item -Path "$ncpaPath\command" -Force | Set-ItemProperty -Name "(Default)" -Value "ncpa.cpl"

# Kill Non-Responsive Processes
$killNrPath = "$shellPath\KillNR"
New-Item -Path $killNrPath -Force | Out-Null
Set-ItemProperty -Path $killNrPath -Name "(Default)" -Value "Kill Non-Responsive Tasks"
Set-ItemProperty -Path $killNrPath -Name "Icon" -Value "taskmgr.exe"
New-Item -Path "$killNrPath\command" -Force | Set-ItemProperty -Name "(Default)" -Value "taskkill.exe /f /fi `"status eq not responding`""

# Snipping Tool
$snipPath = "$shellPath\SnipTool"
New-Item -Path $snipPath -Force | Out-Null
Set-ItemProperty -Path $snipPath -Name "(Default)" -Value "Snipping Tool"
Set-ItemProperty -Path $snipPath -Name "Icon" -Value "SnippingTool.exe"
New-Item -Path "$snipPath\command" -Force | Set-ItemProperty -Name "(Default)" -Value "SnippingTool.exe"

# Take Ownership
$takeOwnPath = "HKCR:\*\shell\runas"
New-Item -Path $takeOwnPath -Force | Out-Null
Set-ItemProperty -Path $takeOwnPath -Name "(Default)" -Value "Take Ownership"
Set-ItemProperty -Path $takeOwnPath -Name "Icon" -Value "imageres.dll,-18"
Set-ItemProperty -Path $takeOwnPath -Name "NoWorkingDirectory" -Value ""
New-Item -Path "$takeOwnPath\command" -Force | Set-ItemProperty -Name "(Default)" -Value "cmd.exe /c takeown /f `"%1`" && icacls `"%1`" /grant administrators:F"

Write-Host "All context menu items have been added." -ForegroundColor Cyan

#########
# Phase 11: Configure Network Mappings
Write-Host "Phase 11: Mapping network and local drives..." -ForegroundColor Yellow

New-PSDrive -Name "B" -PSProvider FileSystem -Root "\\192.168.0.122\Baks" -Persist -ErrorAction SilentlyContinue
New-PSDrive -Name "S" -PSProvider FileSystem -Root "\\192.168.0.122\Software" -Persist -ErrorAction SilentlyContinue
New-PSDrive -Name "I" -PSProvider FileSystem -Root "\\192.168.0.122\ISO" -Persist -ErrorAction SilentlyContinue
New-PSDrive -Name "U" -PSProvider FileSystem -Root "\\192.168.0.122\OneDrive" -Persist -ErrorAction SilentlyContinue
subst P: "D:\Program Files\Dev\Projects"
subst S: "D:\Program Files\Dev\Settings"
subst T: "D:\Program Files\Dev\Tools"


#########
# Phase 12: Redirect User Shell Folders# Phase 11: Redirect User Shell Folders for Current and Default Users

Write-Host "Phase 12: Redirecting shell folders..." -ForegroundColor Yellow
$targetPath = "D:\Desktop"

# Function to apply redirection to a specific registry hive
function Set-FolderRedirection {
    param(
        [string]$RegistryPath
    )
    $folders = @{
        "Desktop"                                 = $targetPath
        "Personal"                                = $targetPath # Documents
        "{374DE290-123F-4565-9164-39C4925E467B}"   = $targetPath # Downloads
        "My Music"                                = $targetPath
        "My Pictures"                             = $targetPath
        "My Videos"                               = $targetPath
    }
    foreach ($folder in $folders.GetEnumerator()) {
        try {
            Set-ItemProperty -Path $RegistryPath -Name $folder.Key -Value $folder.Value -Type ExpandString -Force
        } catch {
            Write-Warning "Failed to set redirection for $($folder.Key) in $RegistryPath"
        }
    }
}

# 1. Apply to the current user (Ariel)
Write-Host "Applying redirection for current user..." -ForegroundColor Cyan
Set-FolderRedirection -RegistryPath "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"

# 2. Apply to the Default User for all future accounts
Write-Host "Applying redirection for Default User profile..." -ForegroundColor Cyan
# Dynamically get the profiles directory path (e.g., D:\Users)
$profilesDir = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList' -Name 'ProfilesDirectory').ProfilesDirectory
$defaultUserHive = Join-Path -Path $profilesDir -ChildPath "Default\NTUSER.DAT"


if (Test-Path $defaultUserHive) {
    # Load the default user's registry hive to a temporary location (HKU:\DefaultUser)
    reg load "HKU\DefaultUser" $defaultUserHive | Out-Null
    # Apply the settings
    Set-FolderRedirection -RegistryPath "HKU:\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
    # Unload the hive
    reg unload "HKU\DefaultUser" | Out-Null
    Write-Host "Default User profile updated successfully." -ForegroundColor Cyan
} else {
    Write-Warning "Could not find Default User hive at $defaultUserHive. Future users will not have redirected folders."
}


# Apply the settings
Set-FolderRedirection -RegistryPath "HKU:\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
# Unload the hive
reg unload "HKU\DefaultUser"
#########

Write-Host "Post-OOBE configuration completed. A restart is recommended." -ForegroundColor Green
"@


####################################
# --- Main Script Logic ---

# Step 1: Gather Information
Write-Host "Windows Server 2025 VHDX Creation Script" -ForegroundColor Green
$isoDrive = Read-Host "Enter the drive letter for your mounted Windows ISO (e.g., E)"
if (-not (Test-Path -Path "${isoDrive}:\sources\install.wim")) {
    Write-Error "Invalid ISO drive letter. Could not find install.wim. Exiting."
    return
}

$workDir = Read-Host "Enter the full path for a new working directory (e.g., C:\WimSetup)"
if (!(Test-Path -Path $workDir)) {
    New-Item -Path $workDir -ItemType Directory -Force | Out-Null
}

# Step 2: Create and Prepare VHDX
$vhdxPath = Join-Path $workDir "26433.vhdx"
$wimPath = Join-Path -Path "${isoDrive}:" -ChildPath "sources\install.wim"

Write-Host "Creating 180GB dynamic VHDX at $vhdxPath..." -ForegroundColor Yellow
New-VHD -Path $vhdxPath -SizeBytes 180GB -Dynamic | Out-Null

Write-Host "Mounting and initializing VHDX..." -ForegroundColor Yellow
$vhdx = Mount-VHD -Path $vhdxPath -Passthru
$diskNumber = $vhdx.DiskNumber
Initialize-Disk -DiskNumber $diskNumber -PartitionStyle GPT | Out-Null
Start-Sleep -Seconds 5

# Step 3: Partition the VHDX
Write-Host "Partitioning VHDX Disk $diskNumber..." -ForegroundColor Yellow
$efiPartition = New-Partition -DiskNumber $diskNumber -Size 800MB -IsESP
Format-Volume -Partition $efiPartition -FileSystem FAT32 -NewFileSystemLabel "EFI" | Out-Null
$efiDrive = ($efiPartition | Get-Volume).DriveLetter

$winPartition = New-Partition -DiskNumber $diskNumber -Size 51200MB -AssignDriveLetter
Format-Volume -Partition $winPartition -FileSystem NTFS -NewFileSystemLabel "Windows" -Force -Confirm:$false | Out-Null
$winDrive = ($winPartition | Get-Volume).DriveLetter

$dataPartition = New-Partition -DiskNumber $diskNumber -Size 102400MB -AssignDriveLetter
Format-Volume -Partition $dataPartition -FileSystem NTFS -NewFileSystemLabel "Data" -Force -Confirm:$false | Out-Null

$pagefilePartition = New-Partition -DiskNumber $diskNumber -UseMaximumSize -AssignDriveLetter
Format-Volume -Partition $pagefilePartition -FileSystem NTFS -NewFileSystemLabel "Pagefile" -Force -Confirm:$false | Out-Null

Write-Host "Partitions created successfully." -ForegroundColor Cyan

# Step 4: Apply Windows Image using DISM
Write-Host "Applying Windows Server image (Index 4) to ${winDrive}:\..." -ForegroundColor Yellow
$dismArgs = "/Apply-Image /ImageFile:`"$wimPath`" /Index:4 /ApplyDir:`"${winDrive}:`" /Compact"
Start-Process -FilePath "dism.exe" -ArgumentList $dismArgs -Wait -NoNewWindow

# Step 5: Create Customization Files from Embedded Content
Write-Host "Creating unattend and post-install scripts on the new image..." -ForegroundColor Yellow
$sysprepPath = Join-Path "${winDrive}:" "Windows\System32\Sysprep"
$scriptsPath = Join-Path "${winDrive}:" "Windows\Setup\Scripts"
New-Item -Path $scriptsPath -ItemType Directory -Force | Out-Null

Set-Content -Path (Join-Path $sysprepPath "unattend.xml") -Value $unattendFileContent
Set-Content -Path (Join-Path $scriptsPath "SetupComplete.cmd") -Value $setupCompleteFileContent
Set-Content -Path (Join-Path $scriptsPath "Services.reg") -Value $servicesRegFileContent
# Note: PowerShell variables ($) inside the PostInstall script need to be escaped with a backtick (`$)
Set-Content -Path (Join-Path $scriptsPath "PostInstall.ps1") -Value $postInstallFileContent

# Step 6: Make VHDX Bootable
Write-Host "Making VHDX bootable..." -ForegroundColor Yellow
bcdboot.exe "${winDrive}:\Windows" /s "${efiDrive}:" /f UEFI

# Step 7: Cleanup and Finalize
Write-Host "Dismounting VHDX..." -ForegroundColor Yellow
Dismount-VHD -Path $vhdxPath

Write-Host ""
Write-Host "---------------------------------------------------------" -ForegroundColor Green
Write-Host "VHDX created successfully at $vhdxPath" -ForegroundColor Green
Write-Host "You can now add this VHDX to a VM or to your host boot menu." -ForegroundColor Green
Write-Host "---------------------------------------------------------" -ForegroundColor Green