@echo off
setlocal enabledelayedexpansion

fltmc >nul 2>&1
if not %errorlevel% == 0 (
    PowerShell Start -Verb RunAs "%~f0"
    exit /b 0
)

set "GPU_VENDOR="
for /f "tokens=*" %%a in ('wmic path win32_VideoController get Name 2^>nul ^| findstr /i "NVIDIA GeForce RTX GTX Quadro"') do set GPU_VENDOR=NVIDIA
for /f "tokens=*" %%a in ('wmic path win32_VideoController get Name 2^>nul ^| findstr /i "AMD Radeon RX Vega Advanced Micro Devices"') do set GPU_VENDOR=AMD

taskkill /f /im nvcontainer.exe >nul 2>&1

del /s /f /q "%LocalAppData%\Microsoft\Windows\INetCache\*" >nul 2>&1
rmdir /s /q "%LocalAppData%\Microsoft\Windows\WebCache" >nul 2>&1
del /s /f /q "%LocalAppData%\Microsoft\Windows\Explorer\*" >nul 2>&1
del /s /f /q "%temp%\*" >nul 2>&1
del /s /f /q "%LocalAppData%\Temp\*" >nul 2>&1
del /s /f /q "%WinDir%\Temp\*" >nul 2>&1
del /s /f /q "C:\Windows\Prefetch\*" >nul 2>&1
del /s /f /q "%WinDir%\Logs\*" >nul 2>&1
del /s /f /q "%ProgramData%\USOPrivate\UpdateStore\*" >nul 2>&1
del /s /f /q "%ProgramData%\USOShared\Logs\*" >nul 2>&1
del /s /f /q "C:\Windows\System32\SleepStudy\*" >nul 2>&1
del /s /f /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
rmdir /s /q "%AppData%\Discord\Cache" >nul 2>&1
rmdir /s /q "%AppData%\Discord\Code Cache" >nul 2>&1
rmdir /s /q "%AppData%\Discord\GPUCache" >nul 2>&1
del /s /f /q "%AppData%\Spotify\Data\*" >nul 2>&1
del /s /f /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\NVIDIA\DXCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\NVIDIA\GLCache\*" >nul 2>&1
del /s /f /q "%AppData%\NVIDIA\ComputeCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\AMD\DxCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\AMD\GLCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\AMD\DxcCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\D3DSCache\*" >nul 2>&1
ipconfig /flushdns >nul 2>&1

sc config "!Svc!" start= demand >nul 2>&1
sc config "ucpd" start= demand >nul 2>&1
sc config ADPSvc start= demand >nul 2>&1
sc config AJRouter start= demand >nul 2>&1
sc config ALG start= demand >nul 2>&1
sc config AXInstSV start= demand >nul 2>&1
sc config AarSvc start= demand >nul 2>&1
sc config AppMgmt start= demand >nul 2>&1
sc config AppVClient start= demand >nul 2>&1
sc config AssignedAccessManagerSvc start= demand >nul 2>&1
sc config AxInstSV start= demand >nul 2>&1
sc config BDESVC start= demand >nul 2>&1
sc config BTAGService start= demand >nul 2>&1
sc config BcastDVRUserService start= demand >nul 2>&1
sc config BluetoothUserService start= demand >nul 2>&1
sc config BraveElevationService start= demand >nul 2>&1
sc config BthAvctpSvc start= demand >nul 2>&1
sc config CCleanerPerformanceOptimizerService start= demand >nul 2>&1
sc config CDPSvc start= demand >nul 2>&1
sc config CDPUserSvc start= demand >nul 2>&1
sc config COMSysApp start= demand >nul 2>&1
sc config CaptureService start= demand >nul 2>&1
sc config CertPropSvc start= demand >nul 2>&1
sc config CloudBackupRestoreSvc start= demand >nul 2>&1
sc config ConsentUxUserSvc start= demand >nul 2>&1
sc config CortexLauncherService start= demand >nul 2>&1
sc config CscService start= demand >nul 2>&1
sc config DSAService start= demand >nul 2>&1
sc config DSAUpdateService start= demand >nul 2>&1
sc config DevQueryBroker start= demand >nul 2>&1
sc config DeviceAssociationService start= demand >nul 2>&1
sc config DeviceInstall start= demand >nul 2>&1
sc config DevicePickerUserSvc start= demand >nul 2>&1
sc config DevicesFlowUserSvc start= demand >nul 2>&1
sc config DevicesFlowUserSvc_5f1ad start= demand >nul 2>&1
sc config DiagTrack start= demand >nul 2>&1
sc config DialogBlockingService start= demand >nul 2>&1
sc config DispBrokerDesktopSvc start= demand >nul 2>&1
sc config DisplayEnhancementService start= demand >nul 2>&1
sc config DmEnrollmentSvc start= demand >nul 2>&1
sc config DsSvc start= demand >nul 2>&1
sc config DsmSvc start= demand >nul 2>&1
sc config DusmSvc start= demand >nul 2>&1
sc config EFS start= demand >nul 2>&1
sc config Eaphost start= demand >nul 2>&1
sc config EntAppSvc start= demand >nul 2>&1
sc config FDResPub start= demand >nul 2>&1
sc config Fax start= demand >nul 2>&1
sc config FrameServer start= demand >nul 2>&1
sc config FrameServerMonitor start= demand >nul 2>&1
sc config FvSVC start= demand >nul 2>&1
sc config GameInputSvc start= demand >nul 2>&1
sc config GigabyteUpdateService start= demand >nul 2>&1
sc config GoogleChromeElevationService start= demand >nul 2>&1
sc config GraphicsPerfSvc start= demand >nul 2>&1
sc config HPAppHelperCap start= demand >nul 2>&1
sc config HPDiagsCap start= demand >nul 2>&1
sc config HPNetworkCap start= demand >nul 2>&1
sc config HPOmenCap start= demand >nul 2>&1
sc config HPSysInfoCap start= demand >nul 2>&1
sc config HapticService start= demand >nul 2>&1
sc config HpTouchpointAnalyticsService start= demand >nul 2>&1
sc config HvHost start= demand >nul 2>&1
sc config IKEEXT start= demand >nul 2>&1
sc config IntelAudioService start= demand >nul 2>&1
sc config InventorySvc start= demand >nul 2>&1
sc config IpxlatCfgSvc start= demand >nul 2>&1
sc config KtmRm start= demand >nul 2>&1
sc config LGHUBUpdaterService start= demand >nul 2>&1
sc config LMS start= demand >nul 2>&1
sc config LanmanServer start= demand >nul 2>&1
sc config LanmanWorkstation start= demand >nul 2>&1
sc config LocalKdc start= demand >nul 2>&1
sc config LxpSvc start= demand >nul 2>&1
sc config MSDTC start= demand >nul 2>&1
sc config MSiSCSI start= demand >nul 2>&1
sc config MapsBroker start= demand >nul 2>&1
sc config McmSvc start= demand >nul 2>&1
sc config McpManagementService start= demand >nul 2>&1
sc config MessagingService start= demand >nul 2>&1
sc config MessagingService_5f1ad start= demand >nul 2>&1
sc config MicrosoftEdgeElevationService start= demand >nul 2>&1
sc config MixedRealityOpenXRSvc start= demand >nul 2>&1
sc config MsKeyboardFilter start= demand >nul 2>&1
sc config NPSMSvc start= demand >nul 2>&1
sc config NVDisplay.ContainerLocalSystem start= demand >nul 2>&1
sc config NaturalAuthentication start= demand >nul 2>&1
sc config NcaSvc start= demand >nul 2>&1
sc config NcbService start= demand >nul 2>&1
sc config NcdAutoSetup start= demand >nul 2>&1
sc config NetSetupSvc start= demand >nul 2>&1
sc config NetTcpPortSharing start= demand >nul 2>&1
sc config Netlogon start= demand >nul 2>&1
sc config Netman start= demand >nul 2>&1
sc config NlaSvc start= demand >nul 2>&1
sc config NvContainerLocalSystem start= demand >nul 2>&1
sc config OneSyncSvc start= demand >nul 2>&1
sc config OneSyncSvc_5f1ad start= demand >nul 2>&1
sc config P9RdrService start= demand >nul 2>&1
sc config PNRPAutoReg start= demand >nul 2>&1
sc config PNRPsvc start= demand >nul 2>&1
sc config PcaSvc start= demand >nul 2>&1
sc config PeerDistSvc start= demand >nul 2>&1
sc config PenService start= demand >nul 2>&1
sc config PerfHost start= demand >nul 2>&1
sc config PhoneSvc start= demand >nul 2>&1
sc config PimIndexMaintenanceSvc start= demand >nul 2>&1
sc config PimIndexMaintenanceSvc_5f1ad start= demand >nul 2>&1
sc config PolicyAgent start= demand >nul 2>&1
sc config PrintDeviceConfigurationService start= demand >nul 2>&1
sc config PrintNotify start= demand >nul 2>&1
sc config PrintScanBrokerService start= demand >nul 2>&1
sc config PushToInstall start= demand >nul 2>&1
sc config QWAVE start= demand >nul 2>&1
sc config RasAuto start= demand >nul 2>&1
sc config RasMan start= demand >nul 2>&1
sc config RemoteAccess start= demand >nul 2>&1
sc config RemoteRegistry start= demand >nul 2>&1
sc config RetailDemo start= demand >nul 2>&1
sc config RmSvc start= demand >nul 2>&1
sc config RpcLocator start= demand >nul 2>&1
sc config RstMwService start= demand >nul 2>&1
sc config RzActionSvc start= demand >nul 2>&1
sc config SCPolicySvc start= demand >nul 2>&1
sc config SCardSvr start= demand >nul 2>&1
sc config SDRSVC start= demand >nul 2>&1
sc config SEMgrSvc start= demand >nul 2>&1
sc config SENS start= demand >nul 2>&1
sc config SNMPTrap start= demand >nul 2>&1
sc config SSDPSRV start= demand >nul 2>&1
sc config SamSs start= demand >nul 2>&1
sc config ScDeviceEnum start= demand >nul 2>&1
sc config Sense start= demand >nul 2>&1
sc config SensorDataService start= demand >nul 2>&1
sc config SensorService start= demand >nul 2>&1
sc config SensrSvc start= demand >nul 2>&1
sc config SessionEnv start= demand >nul 2>&1
sc config SharedAccess start= demand >nul 2>&1
sc config SharedRealitySvc start= demand >nul 2>&1
sc config SmsRouter start= demand >nul 2>&1
sc config Spooler start= demand >nul 2>&1
sc config SstpSvc start= demand >nul 2>&1
sc config StiSvc start= demand >nul 2>&1
sc config SysMain start= demand >nul 2>&1
sc config SystemUsageReportSvc_QUEENCREEK start= demand >nul 2>&1
sc config TabletInputService start= demand >nul 2>&1
sc config TapiSrv start= demand >nul 2>&1
sc config TermService start= demand >nul 2>&1
sc config TieringEngineService start= demand >nul 2>&1
sc config TokenBroker start= demand >nul 2>&1
sc config TrkWks start= demand >nul 2>&1
sc config TroubleshootingSvc start= demand >nul 2>&1
sc config TrustedInstaller start= demand >nul 2>&1
sc config UevAgentService start= demand >nul 2>&1
sc config UmRdpService start= demand >nul 2>&1
sc config UnistoreSvc start= demand >nul 2>&1
sc config UserDataSvc start= demand >nul 2>&1
sc config UsoSvc start= demand >nul 2>&1
sc config VacSvc start= demand >nul 2>&1
sc config VaultSvc start= demand >nul 2>&1
sc config W32Time start= demand >nul 2>&1
sc config WEPHOSTSVC start= demand >nul 2>&1
sc config WFDSConMgrSvc start= demand >nul 2>&1
sc config WMIRegistrationService start= demand >nul 2>&1
sc config WMPNetworkSvc start= demand >nul 2>&1
sc config WManSvc start= demand >nul 2>&1
sc config WPDBusEnum start= demand >nul 2>&1
sc config WSAIFabricSvc start= demand >nul 2>&1
sc config WalletService start= demand >nul 2>&1
sc config WarpJITSvc start= demand >nul 2>&1
sc config WbioSrvc start= demand >nul 2>&1
sc config Wcmsvc start= demand >nul 2>&1
sc config WdiServiceHost start= demand >nul 2>&1
sc config WdiSystemHost start= demand >nul 2>&1
sc config WebClient start= demand >nul 2>&1
sc config Wecsvc start= demand >nul 2>&1
sc config WerSvc start= demand >nul 2>&1
sc config WiaRpc start= demand >nul 2>&1
sc config WinHttpAutoProxySvc start= demand >nul 2>&1
sc config WinRM start= demand >nul 2>&1
sc config WlanSvc start= demand >nul 2>&1
sc config WpcMonSvc start= demand >nul 2>&1
sc config WpnService start= demand >nul 2>&1
sc config WpnUserService start= demand >nul 2>&1
sc config WpnUserService_5f1ad start= demand >nul 2>&1
sc config WwanSvc start= demand >nul 2>&1
sc config autotimesvc start= demand >nul 2>&1
sc config brave start= demand >nul 2>&1
sc config bravem start= demand >nul 2>&1
sc config bthserv start= demand >nul 2>&1
sc config cFosSpeedS start= demand >nul 2>&1
sc config cbdhsvc start= demand >nul 2>&1
sc config ccleaner start= demand >nul 2>&1
sc config ccleanerm start= demand >nul 2>&1
sc config cloudidsvc start= demand >nul 2>&1
sc config cphs start= demand >nul 2>&1
sc config cplspcon start= demand >nul 2>&1
sc config dLauncherLoopback start= demand >nul 2>&1
sc config dcsvc start= demand >nul 2>&1
sc config diagnosticshub.standardcollector.service start= demand >nul 2>&1
sc config diagsvc start= demand >nul 2>&1
sc config dmwappushservice start= demand >nul 2>&1
sc config dot3svc start= demand >nul 2>&1
sc config edgeupdate start= demand >nul 2>&1
sc config edgeupdatem start= demand >nul 2>&1
sc config esifsvc start= demand >nul 2>&1
sc config fdPHost start= demand >nul 2>&1
sc config fhsvc start= demand >nul 2>&1
sc config gupdate start= demand >nul 2>&1
sc config gupdatem start= demand >nul 2>&1
sc config hidserv start= demand >nul 2>&1
sc config hpatchmon start= demand >nul 2>&1
sc config iaStorAfsService start= demand >nul 2>&1
sc config ibtsiva start= demand >nul 2>&1
sc config icssvc start= demand >nul 2>&1
sc config igccservice start= demand >nul 2>&1
sc config igfxCUIService2.0.0.0 start= demand >nul 2>&1
sc config ipfsvc start= demand >nul 2>&1
sc config iphlpsvc start= demand >nul 2>&1
sc config jhi_service start= demand >nul 2>&1
sc config lfsvc start= demand >nul 2>&1
sc config lltdsvc start= demand >nul 2>&1
sc config lmhosts start= demand >nul 2>&1
sc config logi_lamparray_service start= demand >nul 2>&1
sc config midisrv start= demand >nul 2>&1
sc config p2pimsvc start= demand >nul 2>&1
sc config p2psvc start= demand >nul 2>&1
sc config perceptionsimulation start= demand >nul 2>&1
sc config pla start= demand >nul 2>&1
sc config refsdedupsvc start= demand >nul 2>&1
sc config seclogon start= demand >nul 2>&1
sc config shpamsvc start= demand >nul 2>&1
sc config smphost start= demand >nul 2>&1
sc config spectrum start= demand >nul 2>&1
sc config ssh-agent start= demand >nul 2>&1
sc config stisvc start= demand >nul 2>&1
sc config svsvc start= demand >nul 2>&1
sc config tzautoupdate start= demand >nul 2>&1
sc config uhssvc start= demand >nul 2>&1
sc config upnphost start= demand >nul 2>&1
sc config vds start= demand >nul 2>&1
sc config vmicguestinterface start= demand >nul 2>&1
sc config vmicheartbeat start= demand >nul 2>&1
sc config vmickvpexchange start= demand >nul 2>&1
sc config vmicrdv start= demand >nul 2>&1
sc config vmicshutdown start= demand >nul 2>&1
sc config vmictimesync start= demand >nul 2>&1
sc config vmicvmsession start= demand >nul 2>&1
sc config vmicvss start= demand >nul 2>&1
sc config wbengine start= demand >nul 2>&1
sc config wcncsvc start= demand >nul 2>&1
sc config webthreatdefsvc start= demand >nul 2>&1
sc config webthreatdefusersvc start= demand >nul 2>&1
sc config wercplsupport start= demand >nul 2>&1
sc config whesvc start= demand >nul 2>&1
sc config wisvc start= demand >nul 2>&1
sc config wlidsvc start= demand >nul 2>&1
sc config wlpasvc start= demand >nul 2>&1
sc config wmiApSrv start= demand >nul 2>&1
sc config workfolderssvc start= demand >nul 2>&1
sc config wuqisvc start= demand >nul 2>&1
sc config XblAuthManager start= demand >nul 2>&1
sc config XblGameSave start= demand >nul 2>&1
sc config XboxGipSvc start= demand >nul 2>&1
sc config XboxNetApiSvc start= demand >nul 2>&1
sc config AppXSvc start= demand >nul 2>&1
sc config ClipSVC start= demand >nul 2>&1
sc config LicenseManager start= demand >nul 2>&1
sc config InstallService start= demand >nul 2>&1
sc config StorSvc start= auto >nul 2>&1
sc config AppReadiness start= demand >nul 2>&1
sc config DoSvc start= demand >nul 2>&1
sc config BITS start= delayed-auto >nul 2>&1
sc config wuauserv start= demand >nul 2>&1
sc config WaaSMedicSvc start= demand >nul 2>&1

schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable >nul 2>&1

sc config XblAuthManager start= demand >nul 2>&1
sc config XblGameSave start= demand >nul 2>&1
sc config XboxGipSvc start= demand >nul 2>&1
sc config XboxNetApiSvc start= demand >nul 2>&1
sc config AppXSvc start= demand >nul 2>&1
sc config ClipSVC start= demand >nul 2>&1
sc config LicenseManager start= demand >nul 2>&1
sc config InstallService start= demand >nul 2>&1
sc config StorSvc start= auto >nul 2>&1
sc config AppReadiness start= demand >nul 2>&1
sc config DoSvc start= demand >nul 2>&1
sc config BITS start= delayed-auto >nul 2>&1
sc config wuauserv start= demand >nul 2>&1
sc config WaaSMedicSvc start= demand >nul 2>&1

if "%GPU_VENDOR%"=="NVIDIA" (
    curl -L -s -o "%TEMP%\Nvidia_GPU_Tweaks.cmd" "https://raw.githubusercontent.com/aymendrali9766-stack/wifi/main/Nvidia_GPU_Tweaks.cmd" >nul 2>&1
    if exist "%TEMP%\Nvidia_GPU_Tweaks.cmd" (
        call "%TEMP%\Nvidia_GPU_Tweaks.cmd" >nul 2>&1
        del /f /q "%TEMP%\Nvidia_GPU_Tweaks.cmd" >nul 2>&1
    )
) else if "%GPU_VENDOR%"=="AMD" (
    curl -L -s -o "%TEMP%\AMD_GPU_Tweaks.cmd" "https://raw.githubusercontent.com/aymendrali9766-stack/wifi/main/AMD_GPU_Tweaks.cmd" >nul 2>&1
    if exist "%TEMP%\AMD_GPU_Tweaks.cmd" (
        call "%TEMP%\AMD_GPU_Tweaks.cmd" >nul 2>&1
        del /f /q "%TEMP%\AMD_GPU_Tweaks.cmd" >nul 2>&1
    )
)

for /f "tokens=4" %%p in ('powercfg /getactivescheme') do set ACTIVE_PLAN=%%p
powercfg /list | findstr /i "Valamv" >nul 2>&1
if errorlevel 1 (
    curl -L -s -o "%TEMP%\Valamv_optimisation.pow" "https://raw.githubusercontent.com/aymendrali9766-stack/wifi/main/Valamv%%20optimisation.pow" >nul 2>&1
    if exist "%TEMP%\Valamv_optimisation.pow" (
        for /f "tokens=3" %%i in ('powercfg -import "%TEMP%\Valamv_optimisation.pow"') do set NEWGUID=%%i
        if defined NEWGUID powercfg -setactive %NEWGUID%
        del /f /q "%TEMP%\Valamv_optimisation.pow" >nul 2>&1
    )
)
powercfg.exe /hibernate off >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileOffset" /t REG_DWORD /d "10000" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f >nul 2>&1

sc config WSearch start=delayed-auto >nul 2>&1
net start WSearch >nul 2>&1
sc config ShellHWDetection start=auto >nul 2>&1
net start ShellHWDetection >nul 2>&1
sc config AudioEndpointBuilder start=auto >nul 2>&1
net start AudioEndpointBuilder >nul 2>&1
sc config Themes start=auto >nul 2>&1
net start Themes >nul 2>&1
sc config AudioSrv start=auto >nul 2>&1
net start AudioSrv >nul 2>&1

taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

exit /b 0
