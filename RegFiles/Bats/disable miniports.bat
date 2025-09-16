
@Echo Off
REM
REM ; Date function
Reg.exe add "HKCU\Changes" /v "MiniPorts FileChanged" /t REG_SZ /d "09OCT24" /f
REM
REM
pnputil /remove-device /deviceid "MS_GREMINIPORT"
pnputil /remove-device /deviceid "MS_AGILEVPNMINIPORT"
pnputil /remove-device /deviceid "MS_NDISWANIP"
pnputil /remove-device /deviceid "MS_NDISWANIPV6"
pnputil /remove-device /deviceid "MS_L2TPMINIPORT"
pnputil /remove-device /deviceid "MS_NDISWANBH"
pnputil /remove-device /deviceid "MS_PPPOEMINIPORT"
pnputil /remove-device /deviceid "MS_PPTPMINIPORT"
pnputil /remove-device /deviceid "MS_SSTPMINIPORT"


