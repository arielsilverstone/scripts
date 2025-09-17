@echo off
sc config wuauserv start= disabled
sc config bits start= demand
sc config usosvc start= demand
sc config camsvc start= demand
sc config BDESVC start= disabled
sc config DiagTrack start= disabled
sc config DusmSvc start= demand
sc config DPS start= demand
sc config MapsBroker start= demand
sc config edgeupdate start= demand
sc config Spooler start= disabled
sc config PcaSvc start= disabled
sc config Sense start= disabled
sc config sppsvc start= demand
sc config SysMain start= disabled
sc config SENS start= disabled
sc config webthreatdefsvc start= disabled
sc config webthreatdefusersvc start= disabled
sc config WerSvc start= disabled
sc config FontCache start= demand
sc config WSearch start= disabled
sc config LanmanWorkstation start= demand
net stop LanmanWorkstation
net stop WSearch
net stop FontCache
net stop WerSvc
net stop webthreatdefusersvc
net stop webthreatdefsvc
net stop SENS
net stop SysMain
net stop sppsvc
net stop Sense
net stop PcaSvc
net stop Spooler
net stop edgeupdate
net stop MapsBroker
net stop DPS
net stop DusmSvc
net stop DiagTrack
net stop BDESVC
net stop camsvc
net stop wuauserv
net stop bits
net stop usosvc
exit