@Echo On
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCU\Changes" /v "Network Services File Changed" /f
Reg.exe add "HKCU\Changes" /v "Network Services File Changed" /t REG_SZ /d "27JAN25" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d "8218" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d "8194" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "EnableDynamicBacklog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "64000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d "64000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "LargeBufferSize" /t REG_DWORD /d "32774" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MediumBufferSize" /t REG_DWORD /d "12035" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "SmallBufferSize" /t REG_DWORD /d "1025" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "TransmitWorker" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableDnr" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheEntryTtlLimit" /t REG_DWORD /d "10800" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheTtl" /t REG_DWORD /d "10800" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaximumUdpPacketSize" /t REG_DWORD /d "4864" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxNegativeCacheTtl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeCacheTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NetFailureCacheTime" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "DisableMultiChannel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "DisableStrictNameChecking" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableCompressedTraffic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableForcedLogoff" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableSecuritySignature" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableSMBQUIC" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "Hidden" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "RequireSecuritySignature" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "RestrictNullSessAccess" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SizReqBuf" /t REG_DWORD /d "16386" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "TreatHostAsStableStorage" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "UseRawRead" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "UseRawWrite" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "UseWriteRawData" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation" /v "ErrorControl" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation" /v "RequireEncryption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "DisableBandwidthThrottling" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "DisableMultiChannel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "EnableCompressedTraffic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "EnablePlainTextPassword" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "EnableSecuritySignature" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "KeepConn" /t REG_SZ /d "259200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "RequireSecuritySignature" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "SizReqBuf" /t REG_DWORD /d "16386" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mlx4_bus\Parameters" /v "DeviceManagedSteering" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mlx4_bus\Parameters" /v "ThreadDpcEnable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mlx5\Parameters\Roce" /v "RoCE_Mode" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /ve /t REG_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "DefaultPnPCapabilities" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "MaxCachedNblContextSize" /t REG_DWORD /d "1024" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "NetworkDirectGlobalFlags" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "PortAuthReceiveAuthorizationState" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "PortAuthReceiveControlState" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "PortAuthSendAuthorizationState" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "PortAuthSendControlState" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "ReceiveWorkerDisableAutoStart" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "RssBaseCpu" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "TrackNblOwner" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "WppRecorder_TraceGuid" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles" /v "DefaultProfile" /t REG_SZ /d "Balanced" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "MaxPacketsReceiveAtDispatch" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "MaxPacketsReceiveAtPassive" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "MaxPacketsReceiveCompleteAtDispatch" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "MaxPacketsReceiveCompleteAtPassive" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "MaxPacketsSendAtDispatch" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "MaxPacketsSendAtPassive" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "MaxPacketsSendCompleteAtDispatch" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "MaxPacketsSendCompleteAtPassive" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters\Reserved\ExecutionContextProfiles\Balanced" /v "WorkerThreadPriority" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableMediaSenseEventLog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableRSS" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTcpChimneyOffload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Domain" /t REG_SZ /d "2300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DontAddDefaultGatewayDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDCA" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDeadGWDetect" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableRSS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableTCPA" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableTCPChimney" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d "1500" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "64000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "ForwardBroadcasts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "987135" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "ICSDomain" /t REG_SZ /d "2300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IPEnableRouter" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveTime" /t REG_DWORD /d "7200000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxFreeTcbs" /t REG_DWORD /d "65535" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NameServer" /t REG_SZ /d "192.168.0.254" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NV Domain" /t REG_SZ /d "2300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "QualifyingDestinationThreshold" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SearchList" /t REG_SZ /d "2300,home.local" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "StrictTimeWaitSeqCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SyncDomainWithMembership" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpCreateAndConnectTcbRateLimitDepth" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpFinWait2Delay" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPUDPChecksumOffloadIPv4" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpUseRFC1122UrgentPointer" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "UseDomainNameDevolution" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "WppRecorder_TraceGuid" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_SZ /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_SZ /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_SZ /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_SZ /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d "4" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
