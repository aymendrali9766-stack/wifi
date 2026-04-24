@echo off
setlocal EnableDelayedExpansion

color 0B
chcp 65001 >nul 2>&1
cls


set "NETCLASS=HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}"

for /f "tokens=*" %%a in ('reg query "%NETCLASS%" /s /f "DriverDesc" 2^>nul ^| findstr "HKEY"') do (
    reg add "%%a" /v "*InterruptModeration" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "InterruptModeration" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "ITR" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*InterruptModerationRate" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "InterruptModerationRate" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "TxIntDelay" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*LsoV1IPv4" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*LsoV2IPv4" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*LsoV2IPv6" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "LsoV1IPv4" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "LsoV2IPv4" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "LsoV2IPv6" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "LSOEnable" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "LargeSendOffload" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "LargeSendOffloadV2" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*RSC" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*RscIPv4" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*RscIPv6" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "RscIPv4" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "RscIPv6" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "PacketCoalescingFilter" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*PacketCoalescing" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "Coalesce" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*FlowControl" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "FlowControl" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "FlowControlCap" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*IPChecksumOffloadIPv4" /t REG_SZ /d "3" /f >nul 2>&1
    reg add "%%a" /v "*TCPChecksumOffloadIPv4" /t REG_SZ /d "3" /f >nul 2>&1
    reg add "%%a" /v "*TCPChecksumOffloadIPv6" /t REG_SZ /d "3" /f >nul 2>&1
    reg add "%%a" /v "*UDPChecksumOffloadIPv4" /t REG_SZ /d "3" /f >nul 2>&1
    reg add "%%a" /v "*UDPChecksumOffloadIPv6" /t REG_SZ /d "3" /f >nul 2>&1
    reg add "%%a" /v "*RSS" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "RSS" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*NumRssQueues" /t REG_SZ /d "1" /f >nul 2>&1
    reg add "%%a" /v "NumRssQueues" /t REG_SZ /d "1" /f >nul 2>&1
    reg add "%%a" /v "*MaxRssProcessors" /t REG_SZ /d "1" /f >nul 2>&1
    reg add "%%a" /v "MaxRssProcessors" /t REG_SZ /d "1" /f >nul 2>&1
    reg add "%%a" /v "*RssBaseProcNumber" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "RssBaseProcNumber" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*RssProfile" /t REG_SZ /d "1" /f >nul 2>&1
    reg add "%%a" /v "*NetworkDirect" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*NetworkDirectAcrossIPSubnets" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*TCPConnectionOffloadIPv4" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*TCPConnectionOffloadIPv6" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*ReceiveBuffers" /t REG_SZ /d "512" /f >nul 2>&1
    reg add "%%a" /v "ReceiveBuffers" /t REG_SZ /d "512" /f >nul 2>&1
    reg add "%%a" /v "*TransmitBuffers" /t REG_SZ /d "512" /f >nul 2>&1
    reg add "%%a" /v "TransmitBuffers" /t REG_SZ /d "512" /f >nul 2>&1
    reg add "%%a" /v "*JumboPacket" /t REG_SZ /d "1514" /f >nul 2>&1
    reg add "%%a" /v "JumboPacket" /t REG_SZ /d "1514" /f >nul 2>&1
    reg add "%%a" /v "MTU" /t REG_SZ /d "1500" /f >nul 2>&1
    reg add "%%a" /v "*PriorityVLANTag" /t REG_SZ /d "3" /f >nul 2>&1
    reg add "%%a" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*WakeOnPattern" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "WakeOnLink" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*DeviceSleepOnDisconnect" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "EnablePME" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "S5WakeOnLan" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "ARPOffload" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "NSOffload" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "PMARPOffload" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "PMNSOffload" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*EEE" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "EEE" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*EnergyEfficientEthernet" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "AdvancedEEE" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "PowerSavingMode" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "UltraLowPowerMode" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "AutoDisableGigabit" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "GigaLite" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "PowerDownPll" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "DynamicPowerGating" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "ConnectedPowerGating" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "NicAutoPowerSaver" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "DelayedPowerUp" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "APMState" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "*SelectiveSuspend" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "%%a" /v "PnPCapabilities" /t REG_DWORD /d "24" /f >nul 2>&1
)



timeout 1 > nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d "8192" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d "8192" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "1500" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndu" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableIPSourceRouting" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisableIPSourceRouting" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "DormantFileLimit" /t REG_DWORD /d "256" /f >nul 2>&1

netsh int tcp set global autotuninglevel=disabled


timeout 1 > nul

netsh int tcp set global autotuninglevel=disabled >nul 2>&1
netsh int tcp set global ecncapability=enabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
netsh int tcp set global rss=disabled >nul 2>&1
netsh int tcp set global chimney=disabled >nul 2>&1
netsh int tcp set global netdma=disabled >nul 2>&1
netsh int tcp set global dca=disabled >nul 2>&1
netsh int tcp set global initialRto=2000 >nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled >nul 2>&1
netsh int tcp set global MaxSynRetransmissions=2 >nul 2>&1
netsh int tcp set global fastopen=enabled >nul 2>&1
netsh int tcp set global fastopenfallback=enabled >nul 2>&1
netsh int tcp set global hystart=disabled >nul 2>&1
netsh int tcp set global prr=enabled >nul 2>&1
netsh int tcp set global pacingprofile=off >nul 2>&1
netsh int tcp set supplemental Internet congestionprovider=ctcp >nul 2>&1
netsh int tcp set supplemental InternetCustom congestionprovider=cubic >nul 2>&1
netsh int ip set global taskoffload=enabled >nul 2>&1
netsh int ip set global neighborcachelimit=4096 >nul 2>&1
netsh int ip set global routecachelimit=4096 >nul 2>&1
netsh int ip set global icmpredirects=disabled >nul 2>&1
netsh int ip set global sourceroutingbehavior=drop >nul 2>&1
netsh int ip set global multicastforwarding=disabled >nul 2>&1
netsh int ip set global groupforwardedfragments=disabled >nul 2>&1
netsh int ip set global randomizeidentifiers=disabled >nul 2>&1
netsh int ip set global addressmaskreply=disabled >nul 2>&1
netsh int udp set global uro=disabled >nul 2>&1
netsh int teredo set state disabled >nul 2>&1
netsh int 6to4 set state disabled >nul 2>&1
netsh int isatap set state disabled >nul 2>&1
netsh int tcp set global autotuninglevel=disabled


timeout 1 > nul

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter -Physical | Where-Object { $_.Status -eq 'Up' } | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -NoRestart -ErrorAction SilentlyContinue }" >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter -Physical | ForEach-Object { Disable-NetAdapterLso -Name $_.Name -ErrorAction SilentlyContinue }" >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter -Physical | ForEach-Object { Disable-NetAdapterRsc -Name $_.Name -ErrorAction SilentlyContinue }" >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter -Physical | ForEach-Object { Disable-NetAdapterRss -Name $_.Name -ErrorAction SilentlyContinue }" >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter -Physical | ForEach-Object { Restart-NetAdapter -Name $_.Name -Confirm:$false -ErrorAction SilentlyContinue }" >nul 2>&1

ipconfig /release
ipconfig /renew
ipconfig /flushdns


reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f 
timeout /t 1 /nobreak >nul 2>&1



netsh int tcp set global ecncapability=disabled
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set global dca=enabled
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set global netdma=enabled
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set global rsc=disabled
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set global rss=enabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndis\Parameters" /v "RssBaseCpu" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set global timestamps=disabled
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set global initialRto=2000
timeout /t 1 /nobreak >nul 2>&1


netsh interface ipv4 set subinterface “Ethernet” mtu=1500 store=persistent
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set global nonsackrttresiliency=disabled
timeout /t 1 /nobreak >nul 2>&1

netsh int tcp set global maxsynretransmissions=2
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set security mpp=disabled
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set security profiles=disabled
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set heuristics disabled
timeout /t 1 /nobreak >nul 2>&1


netsh int ip set global neighborcachelimit=4096
timeout /t 1 /nobreak >nul 2>&1


netsh int tcp set supplemental Internet congestionprovider=ctcp
timeout /t 1 /nobreak >nul 2>&1


netsh int ip set global taskoffload=disabled
timeout /t 1 /nobreak >nul 2>&1


netsh int ipv6 set state disabled
timeout /t 1 /nobreak > NUL


netsh int isatap set state disabled
timeout /t 1 /nobreak > NUL


netsh int teredo set state disabled
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MinSockAddrLength" /t REG_DWORD /d "16" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MaxSockAddrLength" /t REG_DWORD /d "16" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "1" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "20" /f 
timeout /t 1 /nobreak > NUL


reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL

:: Get the Sub ID of the Network Adapter
for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (


reg add "%%n" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f 
reg add "%%n" /v "AutoDisableGigabit" /t REG_SZ /d "0" /f 
reg add "%%n" /v "AdvancedEEE" /t REG_SZ /d "0" /f 
reg add "%%n" /v "DisableDelayedPowerUp" /t REG_SZ /d "2" /f 
reg add "%%n" /v "*EEE" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EEE" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EnablePME" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EnableSavePowerNow" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EnablePowerManagement" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EnableDynamicPowerGating" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EnableConnectedPowerGating" /t REG_SZ /d "0" /f 
reg add "%%n" /v "EnableWakeOnLan" /t REG_SZ /d "0" /f 
reg add "%%n" /v "GigaLite" /t REG_SZ /d "0" /f 
reg add "%%n" /v "NicAutoPowerSaver" /t REG_SZ /d "2" /f 
reg add "%%n" /v "PowerDownPll" /t REG_SZ /d "0" /f 
reg add "%%n" /v "PowerSavingMode" /t REG_SZ /d "0" /f 
reg add "%%n" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f 
reg add "%%n" /v "SmartPowerDownEnable" /t REG_SZ /d "0" /f 
reg add "%%n" /v "S5NicKeepOverrideMacAddrV2" /t REG_SZ /d "0" /f 
reg add "%%n" /v "S5WakeOnLan" /t REG_SZ /d "0" /f 
reg add "%%n" /v "ULPMode" /t REG_SZ /d "0" /f 
reg add "%%n" /v "WakeOnDisconnect" /t REG_SZ /d "0" /f 
reg add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f 
reg add "%%n" /v "*WakeOnPattern" /t REG_SZ /d "0" /f 
reg add "%%n" /v "WakeOnLink" /t REG_SZ /d "0" /f 
reg add "%%n" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f 
timeout /t 1 /nobreak > NUL


reg add "%%n" /v "JumboPacket" /t REG_SZ /d "1514" /f 
timeout /t 1 /nobreak > NUL


reg add "%%n" /v "TransmitBuffers" /t REG_SZ /d "4096" /f 
reg add "%%n" /v "ReceiveBuffers" /t REG_SZ /d "512" /f 
timeout /t 1 /nobreak > NUL


reg add "%%n" /v "IPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
reg add "%%n" /v "LsoV1IPv4" /t REG_SZ /d "0" /f 
reg add "%%n" /v "LsoV2IPv4" /t REG_SZ /d "0" /f 
reg add "%%n" /v "LsoV2IPv6" /t REG_SZ /d "0" /f 
reg add "%%n" /v "PMARPOffload" /t REG_SZ /d "0" /f 
reg add "%%n" /v "PMNSOffload" /t REG_SZ /d "0" /f 
reg add "%%n" /v "TCPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
reg add "%%n" /v "TCPChecksumOffloadIPv6" /t REG_SZ /d "0" /f 
reg add "%%n" /v "UDPChecksumOffloadIPv6" /t REG_SZ /d "0" /f 
reg add "%%n" /v "UDPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > NUL

reg add "%%n" /v "RSS" /t REG_SZ /d "1" /f 
reg add "%%n" /v "*NumRssQueues" /t REG_SZ /d "2" /f 
reg add "%%n" /v "RSSProfile" /t REG_SZ /d "3" /f 
timeout /t 1 /nobreak > NUL


reg add "%%n" /v "*FlowControl" /t REG_SZ /d "0" /f 
reg add "%%n" /v "FlowControlCap" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > NUL



reg add "%%n" /v "TxIntDelay" /t REG_SZ /d "0" /f 
reg add "%%n" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f 
reg add "%%n" /v "RxIntDelay" /t REG_SZ /d "0" /f 
reg add "%%n" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > NUL



reg add "%%n" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > NUL



reg add "%%n" /v "*InterruptModeration" /t REG_SZ /d "0" /f 
)

timeout 2 > nul

cls

exit /b 0
