@echo off
title VALAMV OPTIMISATION
color f

fltmc >nul 2>&1
if not %errorlevel% == 0 (
    powershell -Command "Write-Host 'Oneclick is required to be run as *Administrator.*' -ForegroundColor White -BackgroundColor Red" 
    powershell -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)
:: (Quaked) Check if TrustedInstaller is disabled, for Nsudo.
sc qc "TrustedInstaller" | find "START_TYPE" | find "DISABLED" >nul
if errorlevel 1 (
echo.
) else ( 
    sc config TrustedInstaller start=auto >nul 2>&1
    net start TrustedInstaller >nul 2>&1
)

set "fileURL=https://github.com/QuakedK/Oneclick/raw/refs/heads/main/Downloads/OneclickTools.zip"
set "fileName=Oneclick Tools.zip"
set "extractFolder=C:\valamv"
set "downloadsFolder=C:\"
if not exist "%downloadsFolder%\%fileName%" (
    curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
    timeout 1 > nul
    mkdir "%extractFolder%" >nul 2>&1
    pushd "%extractFolder%" >nul 2>&1
    tar -xf "%downloadsFolder%\%fileName%" --strip-components=1 >nul 2>&1
    popd >nul 2>&1
    del /q "C:\Oneclick Tools.zip" >nul 2>&1
) else (
echo.
)
    echo.
    start "" "C:\valamv\Dcontrol\dControl.exe"
echo.
    echo.
)

:OSS
chcp 65001 >nul 2>&1
echo.
timeout 2 > nul              

:RP
cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                                       
chcp 437 >nul
powershell -Command "Write-Host 'Creer un point de restauration' -ForegroundColor White -BackgroundColor Red"
echo.
set /p choice= (Y/N): 
if /i "%choice%"=="Y" (
    powershell -ExecutionPolicy Unrestricted -NoProfile Enable-ComputerRestore -Drive 'C:\' >nul 2>&1
    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f >nul 2>&1 
    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "DisableConfig" /f >nul 2>&1
    reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
    timeout 1 > nul 
echo.
echo.
    powershell -Command "Checkpoint-Computer -Description 'Valamvrestau'
echo.
    timeout 2 > nul 
) else if /i "%choice%"=="N" (
echo.
echo.
    timeout 2 > nul
) else (
    cls
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :RP
)

cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                                          
timeout 1 > nul  
cls
chcp 437 >nul
color f
echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
powershell -Command "Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Recurse -ErrorAction SilentlyContinue" >nul 2>&1
echo.
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg.exe add "HKU\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_DWORD /d 80000002 /f
echo.
timeout 1 > nul
cls
color f
echo.
powershell -Command "New-Item -Path 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}' -Name 'InprocServer32' -Force -Value ''" >nul 2>&1
echo.
echo.
timeout 1 > nul
cls
color f
echo.
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "200" /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'UserPreferencesMask' -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))"
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_EFSEFeatureFlags /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.


reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Manufacturer" /t REG_SZ /d "VaLaMV Optimisation" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportURL" /t REG_SZ /d "Discord:_valamv" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v HibernateEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v ShowHibernateOption /t REG_DWORD /d 0 /f
powercfg.exe /hibernate off
echo.
timeout 1 > nul
cls
color f
echo.
sc config HomeGroupListener start=demand >nul 2>&1
sc config HomeGroupProvider start=demand >nul 2>&1
echo.
echo.
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "Value" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "Value" /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /t REG_DWORD /d 1 /f
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 255 /f
powershell -Command "Disable-NetAdapterBinding -Name '*' -ComponentID ms_tcpip6" >nul 2>&1
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v EnableLUA /t REG_DWORD /d 0
echo.
timeout 1 > nul
cls
color f
chcp 437 >nul
echo.
timeout 1 > nul
sc config AJRouter start=disabled
sc config ALG start=demand
sc config AppIDSvc start=demand >nul 2>&1 
sc config AppMgmt start=demand >nul 2>&1 
sc config AppReadiness start=demand
sc config AppVClient start=disabled >nul 2>&1 
sc config AppXSvc start=demand >nul 2>&1 
sc config Appinfo start=demand
sc config AssignedAccessManagerSvc start=disabled >nul 2>&1 
sc config AudioEndpointBuilder start=auto
sc config AudioSrv start=auto
sc config Audiosrv start=auto
sc config AxInstSV start=demand
sc config BDESVC start=demand >nul 2>&1 
sc config BFE start=auto >nul 2>&1 
sc config BITS start=delayed-auto
sc config BTAGService start=demand
sc config BcastDVRUserService_dc2a4 start=demand >nul 2>&1           
sc config BluetoothUserService_dc2a4 start=demand >nul 2>&1 
sc config BrokerInfrastructure start=auto >nul 2>&1 
sc config Browser start=demand >nul 2>&1 
sc config BthAvctpSvc start=auto
sc config BthHFSrv start=auto >nul 2>&1 
sc config CDPSvc start=demand
sc config CDPUserSvc_dc2a4 start=auto >nul 2>&1 
sc config COMSysApp start=demand
sc config CaptureService_dc2a4 start=demand >nul 2>&1 
sc config CertPropSvc start=demand
sc config ClipSVC start=demand >nul 2>&1 
sc config ConsentUxUserSvc_dc2a4 start=demand >nul 2>&1 
sc config CoreMessagingRegistrar start=auto >nul 2>&1 
sc config CredentialEnrollmentManagerUserSvc_dc2a4 start=demand >nul 2>&1 
sc config CryptSvc start=auto
sc config CscService start=demand >nul 2>&1 
sc config DPS start=auto
sc config DcomLaunch start=auto >nul 2>&1 
sc config DcpSvc start=demand >nul 2>&1 
sc config DevQueryBroker start=demand
sc config DeviceAssociationBrokerSvc_dc2a4 start=demand >nul 2>&1 
sc config DeviceAssociationService start=demand
sc config DeviceInstall start=demand
sc config DevicePickerUserSvc_dc2a4 start=demand >nul 2>&1 
sc config DevicesFlowUserSvc_dc2a4 start=demand >nul 2>&1 
sc config Dhcp start=auto
sc config DiagTrack start=disabled
sc config DialogBlockingService start=disabled >nul 2>&1 
sc config DispBrokerDesktopSvc start=auto
sc config DisplayEnhancementService start=demand
sc config DmEnrollmentSvc start=demand
sc config Dnscache start=auto >nul 2>&1 
sc config DoSvc start=delayed-auto >nul 2>&1 
sc config DsSvc start=demand
sc config DsmSvc start=demand
sc config DusmSvc start=auto
sc config EFS start=demand
sc config EapHost start=demand
sc config EntAppSvc start=demand >nul 2>&1 
sc config EventLog start=auto
sc config EventSystem start=auto
sc config FDResPub start=demand
sc config Fax start=demand >nul 2>&1 
sc config FontCache start=auto
sc config FrameServer start=demand
sc config FrameServerMonitor start=demand
sc config GraphicsPerfSvc start=demand
sc config HomeGroupListener start=demand >nul 2>&1 
sc config HomeGroupProvider start=demand >nul 2>&1 
sc config HvHost start=demand
sc config IEEtwCollectorService start=demand >nul 2>&1 
sc config IKEEXT start=demand
sc config InstallService start=demand
sc config InventorySvc start=demand
sc config IpxlatCfgSvc start=demand
sc config KeyIso start=auto
sc config KtmRm start=demand
sc config LSM start=auto >nul 2>&1 
sc config LanmanServer start=auto
sc config LanmanWorkstation start=auto
sc config LicenseManager start=demand
sc config LxpSvc start=demand
sc config MSDTC start=disabled
sc config MSiSCSI start=demand
sc config MapsBroker start=delayed-auto
sc config McpManagementService start=demand
sc config MessagingService_dc2a4 start=demand >nul 2>&1 
sc config MicrosoftEdgeElevationService start=demand
sc config MixedRealityOpenXRSvc start=demand >nul 2>&1 
sc config MpsSvc start=auto >nul 2>&1 
sc config MsKeyboardFilter start=demand >nul 2>&1 
sc config NPSMSvc_dc2a4 start=demand >nul 2>&1 
sc config NaturalAuthentication start=demand
sc config NcaSvc start=demand
sc config NcbService start=demand
sc config NcdAutoSetup start=demand
sc config NetSetupSvc start=demand
sc config NetTcpPortSharing start=disabled
sc config Netlogon start=demand
sc config Netman start=demand
sc config NgcCtnrSvc start=demand >nul 2>&1 
sc config NgcSvc start=demand >nul 2>&1 
sc config NlaSvc start=demand
sc config OneSyncSvc_dc2a4 start=auto >nul 2>&1 
sc config P9RdrService_dc2a4 start=demand >nul 2>&1 
sc config PNRPAutoReg start=demand
sc config PNRPsvc start=demand
sc config PcaSvc start=demand
sc config PeerDistSvc start=demand >nul 2>&1 
sc config PenService_dc2a4 start=demand >nul 2>&1  
sc config PerfHost start=demand
sc config PhoneSvc start=demand
sc config PimIndexMaintenanceSvc_dc2a4 start=demand >nul 2>&1 
sc config PlugPlay start=demand
sc config PolicyAgent start=demand
sc config Power start=auto
sc config PrintNotify start=demand
sc config PrintWorkflowUserSvc_dc2a4 start=demand >nul 2>&1 
sc config ProfSvc start=auto
sc config PushToInstall start=demand
sc config QWAVE start=demand
sc config RasAuto start=demand
sc config RasMan start=demand
sc config RemoteAccess start=disabled
sc config RemoteRegistry start=disabled
sc config RetailDemo start=demand
sc config RmSvc start=demand
sc config RpcEptMapper start=auto >nul 2>&1 
sc config RpcLocator start=demand
sc config RpcSs start=auto >nul 2>&1 
sc config SCPolicySvc start=demand
sc config SCardSvr start=demand
sc config SDRSVC start=demand
sc config SEMgrSvc start=demand
sc config SENS start=auto
sc config SNMPTRAP start=demand
sc config SNMPTrap start=demand
sc config SSDPSRV start=demand
sc config SamSs start=auto
sc config ScDeviceEnum start=demand
sc config Schedule start=auto >nul 2>&1 
sc config SecurityHealthService start=demand >nul 2>&1 
sc config Sense start=demand >nul 2>&1 
sc config SensorDataService start=demand
sc config SensorService start=demand
sc config SensrSvc start=demand
sc config SessionEnv start=demand
sc config SgrmBroker start=auto >nul 2>&1 
sc config SharedAccess start=demand
sc config SharedRealitySvc start=demand
sc config ShellHWDetection start=auto
sc config SmsRouter start=demand
sc config Spooler start=auto
sc config SstpSvc start=demand
sc config StateRepository start=demand >nul 2>&1 
sc config StiSvc start=demand
sc config StorSvc start=demand
sc config SysMain start=auto
sc config SystemEventsBroker start=auto >nul 2>&1 
sc config TabletInputService start=demand >nul 2>&1 
sc config TapiSrv start=demand
sc config TermService start=auto
sc config TextInputManagementService start=demand >nul 2>&1 
sc config Themes start=auto
sc config TieringEngineService start=demand
sc config TimeBroker start=demand >nul 2>&1 
sc config TimeBrokerSvc start=demand >nul 2>&1 
sc config TokenBroker start=demand
sc config TrkWks start=auto
sc config TroubleshootingSvc start=demand
sc config TrustedInstaller start=demand
sc config UI0Detect start=demand >nul 2>&1 
sc config UdkUserSvc_dc2a4 start=demand >nul 2>&1 
sc config UevAgentService start=disabled >nul 2>&1 
sc config UmRdpService start=demand
sc config UnistoreSvc_dc2a4 start=demand >nul 2>&1 
sc config UserDataSvc_dc2a4 start=demand >nul 2>&1 
sc config UserManager start=auto
sc config UsoSvc start=demand
sc config VGAuthService start=auto >nul 2>&1 
sc config VMTools start=auto >nul 2>&1 
sc config VSS start=demand
sc config VacSvc start=demand
sc config VaultSvc start=auto
sc config W32Time start=demand
sc config WEPHOSTSVC start=demand
sc config WFDSConMgrSvc start=demand
sc config WMPNetworkSvc start=demand >nul 2>&1 
sc config WManSvc start=demand
sc config WPDBusEnum start=demand
sc config WSService start=demand >nul 2>&1 
sc config WSearch start=delayed-auto
sc config WaaSMedicSvc start=demand >nul 2>&1 
sc config WalletService start=demand
sc config WarpJITSvc start=demand
sc config WbioSrvc start=demand
sc config Wcmsvc start=auto
sc config WcsPlugInService start=demand >nul 2>&1 
sc config WdNisSvc start=demand >nul 2>&1 
sc config WdiServiceHost start=demand
sc config WdiSystemHost start=demand
sc config WebClient start=demand
sc config Wecsvc start=demand
sc config WerSvc start=demand
sc config WiaRpc start=demand
sc config WinDefend start=auto >nul 2>&1
sc config WinHttpAutoProxySvc start=demand >nul 2>&1 
sc config WinRM start=demand
sc config Winmgmt start=auto
sc config WlanSvc start=auto
sc config WpcMonSvc start=demand
sc config WpnService start=demand
sc config WpnUserService_dc2a4 start=auto >nul 2>&1 
sc config WwanSvc start=demand
sc config XblAuthManager start=demand
sc config XblGameSave start=demand
sc config XboxGipSvc start=demand
sc config XboxNetApiSvc start=demand
sc config autotimesvc start=demand
sc config bthserv start=demand
sc config camsvc start=demand
sc config cbdhsvc_dc2a4 start=demand >nul 2>&1 
sc config cloudidsvc start=demand >nul 2>&1 
sc config dcsvc start=demand
sc config defragsvc start=demand
sc config diagnosticshub.standardcollector.service start=demand
sc config diagsvc start=demand
sc config dmwappushservice start=demand
sc config dot3svc start=demand
sc config edgeupdate start=demand
sc config edgeupdatem start=demand
sc config embeddedmode start=demand >nul 2>&1 
sc config fdPHost start=demand
sc config fhsvc start=demand
sc config gpsvc start=auto >nul 2>&1 
sc config hidserv start=demand
sc config icssvc start=demand
sc config iphlpsvc start=auto
sc config lfsvc start=demand
sc config lltdsvc start=demand
sc config lmhosts start=demand
sc config mpssvc start=auto >nul 2>&1 
sc config msiserver start=demand >nul 2>&1 
sc config netprofm start=demand
sc config nsi start=auto
sc config p2pimsvc start=demand
sc config p2psvc start=demand
sc config perceptionsimulation start=demand
sc config pla start=demand
sc config seclogon start=demand
sc config shpamsvc start=disabled
sc config smphost start=disabled
sc config spectrum start=demand
sc config sppsvc start=delayed-auto >nul 2>&1 
sc config ssh-agent start=disabled
sc config svsvc start=demand
sc config swprv start=demand
sc config tiledatamodelsvc start=auto >nul 2>&1 
sc config tzautoupdate start=disabled
sc config uhssvc start=disabled >nul 2>&1 
sc config upnphost start=demand
sc config vds start=demand
sc config vm3dservice start=demand >nul 2>&1 
sc config vmicguestinterface start=demand
sc config vmicheartbeat start=demand
sc config vmickvpexchange start=demand
sc config vmicrdv start=demand
sc config vmicshutdown start=demand
sc config vmictimesync start=demand
sc config vmicvmsession start=demand
sc config vmicvss start=demand
sc config vmvss start=demand >nul 2>&1 
sc config wbengine start=demand
sc config wcncsvc start=demand
sc config webthreatdefsvc start=demand
sc config webthreatdefusersvc_dc2a4 start=auto >nul 2>&1 
sc config wercplsupport start=demand
sc config wisvc start=demand
sc config wlidsvc start=demand
sc config wlpasvc start=demand
sc config wmiApSrv start=demand
sc config workfolderssvc start=demand
sc config wscsvc start=delayed-auto >nul 2>&1 
sc config wuauserv start=demand
sc config wudfsvc start=demand >nul 2>&1       
echo.
timeout 1 > nul
cls
color f
echo.
timeout 1 > nul
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Application Experience\MareBackup" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable >nul 2>&1 
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable >nul 2>&1 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEverEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353698Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableTailoredExperiencesWithDiagnosticData /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v EnthusiastMode /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v Start /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 400 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v IRPStackSize /t REG_DWORD /d 30 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d 0 /f
echo.
timeout 1 > nul
cls
color f
echo.
:: Change boot menu policy to Legacy
bcdedit /set {current} bootmenupolicy Legacy >nul 2>&1
:: Check if the Windows build is less than 22557 and apply Task Manager tweak.
for /f "tokens=3" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild 2^>nul ^| findstr /r /c:"CurrentBuild"') do (
    if %%i lss 22557 (
        powershell -NoProfile -Command "Start-Process taskmgr.exe -WindowStyle Hidden"
        timeout /t 2 >nul
        :loop
        reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\TaskManager" /v Preferences >nul 2>&1
        if %errorlevel% neq 0 (
            timeout /t 1 >nul
            goto loop
        )
        taskkill /f /im taskmgr.exe >nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\TaskManager" /v Preferences /t REG_BINARY /d 0000000000000000000000000000000000000000000000000000000000000000 /f >nul 2>&1
    )
)
:: Remove specific registry item.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}' -Recurse -ErrorAction SilentlyContinue"
:: Remove Managed by your organization setting in Edge if exists
if exist "HKLM\SOFTWARE\Policies\Microsoft\Edge" (
    reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /f >nul 2>&1
)
:: Group svchost.exe processes, based on RAM capacity in KB.     
for /f %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1kb"') do set "ram_kb=%%a"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control' -Name 'SvcHostSplitThresholdInKB' -Type DWord -Value %ram_kb% -Force"
:: Remove AutoLogger-Diagtrack-Listener.etl if exists and deny SYSTEM permissions
set "autoLoggerDir=%PROGRAMDATA%\Microsoft\Diagnosis\ETLLogs\AutoLogger"
if exist "%autoLoggerDir%\AutoLogger-Diagtrack-Listener.etl" (
    del /q "%autoLoggerDir%\AutoLogger-Diagtrack-Listener.etl" >nul 2>&1
)
icacls "%autoLoggerDir%" /deny SYSTEM:(OI)(CI)F >nul 2>&1
:: Disabling Core isolation/Memory integrity
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1 
:: Fake Success Output. 
echo.
echo.
echo.
echo.
echo.
timeout 1 > nul
cls
color f
echo.
set "exePath=C:\valamv\OOshutup10\OOSU10.exe"
set "cfgPath=C:\valamv\OOshutup10\QuakedOOshutup10.cfg"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
chcp 437 >nul
"%exePath%" "%cfgPath%" /quiet
echo.
echo.
timeout 1 > nul   
cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                                          
timeout 1 > nul  
:: Privacy is Freedom's Service Control tweaks.
cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.                                                                          
timeout 1 > nul  
cls
color f
chcp 437 >nul
echo.
reg add "HKLM\System\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\xbgm" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
sc config wlidsvc start= disabled
sc config DisplayEnhancementService start= disabled
sc config DiagTrack start= disabled
sc config DusmSvc start= disabled
sc config TabletInputService start= disabled >nul 2>&1
sc config RetailDemo start= disabled
sc config Fax start= disabled >nul 2>&1
sc config SharedAccess start= disabled
sc config lfsvc start= disabled
sc config WpcMonSvc start= disabled
sc config SessionEnv start= disabled
sc config MicrosoftEdgeElevationService start= disabled
sc config edgeupdate start= disabled
sc config edgeupdatem start= disabled
sc config autotimesvc start= disabled
sc config CscService start= disabled >nul 2>&1
sc config TermService start= disabled
sc config SensorDataService start= disabled
sc config SensorService start= disabled
sc config SensrSvc start= disabled
sc config shpamsvc start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config PhoneSvc start= disabled
sc config TapiSrv start= disabled
sc config UevAgentService start= disabled >nul 2>&1
sc config WalletService start= disabled
sc config TokenBroker start= disabled
sc config WebClient start= disabled
sc config MixedRealityOpenXRSvc start= disabled >nul 2>&1
sc config stisvc start= disabled
sc config WbioSrvc start= disabled
sc config icssvc start= disabled
sc config Wecsvc start= disabled
sc config XboxGipSvc start= disabled
sc config XblAuthManager start= disabled
sc config XboxNetApiSvc start= disabled
sc config XblGameSave start= disabled
sc config SEMgrSvc start= disabled
sc config iphlpsvc start= disabled
sc config Backupper Service start= disabled >nul 2>&1
sc config BthAvctpSvc start= disabled
sc config BDESVC start= disabled >nul 2>&1
sc config cbdhsvc start= disabled
sc config CDPSvc start= disabled
sc config CDPUserSvc start= disabled
sc config DevQueryBroker start= disabled
sc config DevicesFlowUserSvc start= disabled
sc config dmwappushservice start= disabled
sc config DispBrokerDesktopSvc start= disabled
sc config TrkWks start= disabled
sc config dLauncherLoopback start= disabled >nul 2>&1
sc config EFS start= disabled
sc config fdPHost start= disabled
sc config FDResPub start= disabled
sc config IKEEXT start= disabled
sc config NPSMSvc start= disabled
sc config WPDBusEnum start= disabled
sc config PcaSvc start= disabled
sc config RasMan start= disabled
sc config RetailDemo start=disabled
sc config SstpSvc start=disabled
sc config ShellHWDetection start= disabled
sc config SSDPSRV start= disabled
sc config SysMain start= disabled
sc config OneSyncSvc start= disabled
sc config lmhosts start= disabled
sc config UserDataSvc start= disabled
sc config UnistoreSvc start= disabled
sc config Wcmsvc start= disabled
sc config FontCache start= disabled
sc config W32Time start= disabled
sc config tzautoupdate start= disabled
sc config DsSvc start= disabled
sc config DevicesFlowUserSvc_5f1ad start= disabled >nul 2>&1
sc config diagsvc start= disabled
sc config DialogBlockingService start= disabled >nul 2>&1
sc config PimIndexMaintenanceSvc_5f1ad start= disabled >nul 2>&1
sc config MessagingService_5f1ad start= disabled >nul 2>&1
sc config AppVClient start= disabled >nul 2>&1
sc config MsKeyboardFilter start= disabled >nul 2>&1
sc config NetTcpPortSharing start= disabled
sc config ssh-agent start= disabled
sc config SstpSvc start= disabled
sc config OneSyncSvc_5f1ad start= disabled >nul 2>&1
sc config wercplsupport start= disabled
sc config WMPNetworkSvc start= disabled >nul 2>&1
sc config WerSvc start= disabled
sc config WpnUserService_5f1ad start= disabled >nul 2>&1
sc config WinHttpAutoProxySvc start= disabled >nul 2>&1
schtasks /DELETE /TN "AMDInstallLauncher" /f >nul 2>&1
schtasks /DELETE /TN "AMDLinkUpdate" /f >nul 2>&1
schtasks /DELETE /TN "AMDRyzenMasterSDKTask" /f >nul 2>&1
schtasks /DELETE /TN "Driver Easy Scheduled Scan" /f >nul 2>&1
schtasks /DELETE /TN "ModifyLinkUpdate" /f >nul 2>&1
schtasks /DELETE /TN "SoftMakerUpdater" /f >nul 2>&1
schtasks /DELETE /TN "StartCN" /f >nul 2>&1
schtasks /DELETE /TN "StartDVR" /f >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Disable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device" /Disable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device User" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Disable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable
schtasks /Change /TN "Microsoft\Windows\EnterpriseMgmt\MDMMaintenenceTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Cellular" /Disable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\MUI\LPRemove" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /Disable
schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Disable
schtasks /Change /TN "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /Disable
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Servicing\StartComponentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Setup\SetupCleanupTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Setup\SnapshotCleanupTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /Disable
schtasks /Change /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /Disable
schtasks /Change /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Task Manager\Interactive" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /Disable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-HASCertRetr" /Disable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-Maintenance" /Disable
schtasks /Change /TN "Microsoft\Windows\UPnP\UPnPHostConfig" /Disable
schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Management" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Validation" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Disable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Disable
schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WwanSvc\NotificationTask" /Disable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\OobeDiscovery" /Disable
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable
echo.
timeout 1 > nul
cls
color f
echo.
sc stop uhssvc >nul 2>&1
sc stop upfc >nul 2>&1
sc stop PushToInstall >nul 2>&1
sc stop BITS >nul 2>&1
sc stop InstallService >nul 2>&1
sc stop uhssvc >nul 2>&1
sc stop UsoSvc >nul 2>&1
sc stop wuauserv >nul 2>&1
sc stop LanmanServer >nul 2>&1
sc config BITS start= disabled
sc config InstallService start= disabled
sc config uhssvc start= disabled >nul 2>&1
sc config UsoSvc start= disabled
sc config wuauserv start= disabled
sc config LanmanServer start= disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upfc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\uhssvc" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ossrs" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d "1" /f
schtasks /Change /TN "Microsoft\Windows\InstallService\ScanForUpdates" /Disable
schtasks /Change /TN "Microsoft\Windows\InstallService\ScanForUpdatesAsUser" /Disable
schtasks /Change /TN "Microsoft\Windows\InstallService\SmartRetry" /Disable
schtasks /Change /TN "Microsoft\Windows\InstallService\WakeUpAndContinueUpdates" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\InstallService\WakeUpAndScanForUpdates" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Report policies" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WaaSMedic\PerformRemediation" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable
echo.
timeout 1 > nul
cls
color f
echo.
sc config RemoteRegistry start= disabled
sc config RemoteAccess start= disabled
sc config WinRM start= disabled
sc config RmSvc start= disabled
echo.
timeout 1 > nul
cls
color f
echo.
sc config PrintNotify start= disabled
sc config Spooler start= disabled
schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Disable 
schtasks /Change /TN "Microsoft\Windows\Printing\PrinterCleanupTask" /Disable 
echo.
timeout 1 > nul
cls
color f
echo.
sc config BTAGService start= disabled
sc config bthserv start= disabled
echo.
echo.
timeout 1 > nul
cls
color f
echo.
sc config NlaSvc start= disabled
sc config LanmanWorkstation start= disabled
sc config BFE start= demand >nul 2>&1
sc config Dnscache start= demand >nul 2>&1
sc config WinHttpAutoProxySvc start= demand >nul 2>&1
sc config Dhcp start= auto 
sc config DPS start= auto 
sc config lmhosts start= disabled
sc config nsi start= auto
sc config Wcmsvc start= disabled
sc config Winmgmt start= auto
sc config WlanSvc start= demand
reg add "HKLM\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "0" /f
schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Disable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Disable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Disable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable >nul 2>&1
echo.
timeout 1 > nul
cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.                                                                          
timeout 1 > nul  
:: (Quaked) Windows Cleanup. 
cls
color f
chcp 65001 >nul 2>&1
echo. 
echo.
echo.
echo.
echo.                                                                          
timeout 1 > nul
cls
color f
chcp 437 >nul
echo.
timeout 1 > nul
sc config ALG start=disabled
sc config AJRouter start=disabled
sc config XblAuthManager start=disabled
sc config XblGameSave start=disabled
sc config XboxNetApiSvc start=disabled
sc config WSearch start=disabled
sc config lfsvc start=disabled
sc config RemoteRegistry start=disabled
sc config WpcMonSvc start=disabled
sc config SEMgrSvc start=disabled
sc config SCardSvr start=disabled
sc config Netlogon start=disabled
sc config CscService start=disabled >nul 2>&1 
sc config icssvc start=disabled 
sc config wisvc start=disabled 
sc config RetailDemo start=disabled 
sc config WalletService start=disabled 
sc config Fax start=disabled >nul 2>&1 
sc config WbioSrvc start=disabled 
sc config iphlpsvc start=disabled 
sc config wcncsvc start=disabled 
sc config fhsvc start=disabled 
sc config PhoneSvc start=disabled 
sc config seclogon start=disabled 
sc config FrameServer start=disabled 
sc config WbioSrvc start=disabled 
sc config StiSvc start=disabled 
sc config PcaSvc start=disabled 
sc config DPS start=disabled 
sc config MapsBroker start=disabled 
sc config bthserv start=disabled 
sc config BDESVC start=disabled >nul 2>&1
sc config BthAvctpSvc start=disabled 
sc config WpcMonSvc start=disabled 
sc config DiagTrack start=disabled 
sc config CertPropSvc start=disabled 
sc config WdiServiceHost start=disabled 
sc config lmhosts start=disabled 
sc config WdiSystemHost start=disabled 
sc config TrkWks start=disabled 
sc config WerSvc start=disabled 
sc config TabletInputService start=disabled >nul 2>&1 
sc config EntAppSvc start=disabled >nul 2>&1
sc config Spooler start=disabled 
sc config BcastDVRUserService start=disabled 
sc config WMPNetworkSvc start=disabled >nul 2>&1
sc config diagnosticshub.standardcollector.service start=disabled 
sc config DmEnrollmentSvc start=disabled 
sc config PNRPAutoReg start=disabled 
sc config wlidsvc start=disabled 
sc config AXInstSV start=disabled 
sc config lfsvc start=disabled 
sc config NcbService start=disabled 
sc config DeviceAssociationService start=disabled
sc config StorSvc start=disabled 
sc config TieringEngineService start=disabled 
sc config DPS start=disabled 
sc config Themes start=disabled 
sc config AppReadiness start=disabled 
echo.
timeout 1 > nul
cls
color f
echo.
sc config HvHost start=disabled 
sc config vmickvpexchange start=disabled 
sc config vmicguestinterface start=disabled 
sc config vmicshutdown start=disabled 
sc config vmicheartbeat start=disabled 
sc config vmicvmsession start=disabled 
sc config vmicrdv start=disabled 
sc config vmictimesync start=disabled 
sc config vmicvss start=disabled 
echo.
timeout 1 > nul
cls
color f
echo.
sc config edgeupdate start=disabled >nul 2>&1
sc config edgeupdatem start=disabled >nul 2>&1
sc config GoogleChromeElevationService start=disabled >nul 2>&1
sc config gupdate start=disabled >nul 2>&1
sc config gupdatem start=disabled >nul 2>&1
sc config BraveElevationService start=disabled >nul 2>&1
sc config brave start=disabled >nul 2>&1
sc config bravem start=disabled >nul 2>&1
:: Fake Success Output.
echo.
echo.
echo.
echo.
echo.
timeout 1 > nul
cls
color f
echo.
:: Intel Bloat.
sc config NcbService start=disabled >nul 2>&1
sc config jhi_service start=disabled >nul 2>&1
sc config WMIRegistrationService start=disabled >nul 2>&1
sc config "Intel(R) TPM Provisioning Service" start=disabled >nul 2>&1
sc config "Intel(R) Platform License Manager Service" start=disabled >nul 2>&1
sc config ipfsvc start=disabled >nul 2>&1
sc config igccservice start=disabled >nul 2>&1
sc config cplspcon start=disabled >nul 2>&1
sc config esifsvc start=disabled >nul 2>&1
sc config LMS start=disabled >nul 2>&1
sc config ibtsiva start=disabled >nul 2>&1
sc config IntelAudioService start=disabled >nul 2>&1
sc config "Intel(R) Capability Licensing Service TCP IP Interface" start=disabled >nul 2>&1
sc config cphs start=disabled >nul 2>&1
sc config DSAService start=disabled >nul 2>&1
sc config DSAUpdateService start=disabled >nul 2>&1
sc config igfxCUIService2.0.0.0 start=disabled >nul 2>&1
sc config RstMwService start=disabled >nul 2>&1
sc config "Intel(R) SUR QC SAM" start=disabled >nul 2>&1
sc config SystemUsageReportSvc_QUEENCREEK start=disabled >nul 2>&1
sc config iaStorAfsService start=disabled >nul 2>&1
:: AMD Bloat, NSudo needed to disable! | Disables unnecessary AMD services.
"C:\valamv\NSudo\NSudoLG.exe" -ShowWindowMode:hide -U:T -P:E "C:\valamv\Amd\AMD.bat"
:: Fake Success Output.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
timeout 1 > nul
cls
color f
echo.
:: Sound Bloat | NSudo needed to disable! | Deletes Realtek, Sound Research and VisiSonics bloat.
"C:\valamv\NSudo\NSudoLG.exe" -ShowWindowMode:hide -U:T -P:E "C:\valamv\Sound\Sound.bat"
:: HP Bloat.
sc config HPAppHelperCap start=disabled >nul 2>&1
sc config HPDiagsCap start=disabled >nul 2>&1
sc config HpTouchpointAnalyticsService start=disabled >nul 2>&1
sc config HPNetworkCap start=disabled >nul 2>&1
sc config HPOmenCap start=disabled >nul 2>&1
sc config HPSysInfoCap start=disabled >nul 2>&1
:: Gigabtye Bloat.
taskkill /f /im spd.exe >nul 2>&1
taskkill /f /im EasyTuneEngineService.exe >nul 2>&1
taskkill /f /im GraphicsCardEngine.exe >nul 2>&1
net stop "cFosSpeedS" >nul 2>&1
net stop "GigabyteUpdateService" >nul 2>&1
sc config cFosSpeedS start=disabled >nul 2>&1
sc config GigabyteUpdateService start=disabled >nul 2>&1
rd /s /q "C:\Program Files\cFosSpeed" >nul 2>&1
rd /s /q "C:\Program Files\GIGABYTE\Control Center\Lib\GBT_VGA\Service" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Gigabyte\EasyTuneEngineService" >nul 2>&1
:: CCleaner Bloat.
taskkill /f /im CCleaner64.exe >nul 2>&1
taskkill /f /im CCleanerPerformanceOptimizerService.exe >nul 2>&1
taskkill /f /im CCleanerBrowser.exe >nul 2>&1
net stop "ccleaner" >nul 2>&1
net stop "ccleanerm" >nul 2>&1
net stop "CCleanerPerformanceOptimizerService" >nul 2>&1
sc config ccleaner start=disabled >nul 2>&1
sc config ccleanerm start=disabled >nul 2>&1
sc config CCleanerPerformanceOptimizerService start=disabled >nul 2>&1
rd /s /q "C:\Program Files\CCleaner" >nul 2>&1
rd /s /q "C:\Program Files (x86)\CCleaner Browser" >nul 2>&1
rd /s /q  "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CCleaner" >nul 2>&1
:: Logitech
sc config logi_lamparray_service start=disabled >nul 2>&1
:: Fake Success Output.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
timeout 1 > nul
cls
color f
echo.
:: Orca/UpdateOrchestrator Bloat, NSudo needed to disable! | Deletes UpdateOrchestrator task.
"C:\valamv\NSudo\NSudoLG.exe" -ShowWindowMode:hide -U:T -P:E "C:\valamv\Orca\Orca.bat"
schtasks /Change /TN "GoogleUpdateTaskMachineCore{9C99738B-B026-4A33-A16D-7CCD7650D527}" /Disable >nul 2>&1
schtasks /Change /TN "GoogleUpdateTaskMachineUA{2E0C9FAD-7C87-42A8-8EFF-986A5662B894}" /Disable >nul 2>&1
schtasks /Change /TN "Opera GX scheduled Autoupdate 1711926802" /Disable >nul 2>&1
schtasks /Change /TN "BraveSoftwareUpdateTaskMachineCore{A8A54493-B843-4D11-BA1F-30C26E9F10BE}" /Disable >nul 2>&1
schtasks /Change /TN "BraveSoftwareUpdateTaskMachineUA{FF1E0511-D7AF-4DB6-8A41-DC39EA60EC93}" /Disable >nul 2>&1
schtasks /Change /TN "CCleaner Update" /Disable >nul 2>&1
schtasks /Change /TN "CCleanerCrashReporting" /Disable >nul 2>&1
schtasks /Change /TN "CCleanerUpdateTaskMachineCore" /Disable >nul 2>&1
schtasks /Change /TN "CCleanerUpdateTaskMachineUA" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\capabilityaccessmanager" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Setup\SetupCleanupTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Setup\SnapshotCleanupTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefreshTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\ThemesSyncedImageDownload" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\UpdateUserPictureTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\SdbinstMergeDbTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Printing\PrintJobCleanupTask" /Disable >nul 2>&1
schtasks /Delete /TN "GoogleUpdateTaskMachineCore{9C99738B-B026-4A33-A16D-7CCD7650D527}" /F >nul 2>&1
schtasks /Delete /TN "GoogleUpdateTaskMachineUA{2E0C9FAD-7C87-42A8-8EFF-986A5662B894}" /F >nul 2>&1
schtasks /Delete /TN "Opera GX scheduled Autoupdate 1711926802" /F >nul 2>&1
schtasks /Delete /TN "BraveSoftwareUpdateTaskMachineCore{A8A54493-B843-4D11-BA1F-30C26E9F10BE}" /F >nul 2>&1
schtasks /Delete /TN "BraveSoftwareUpdateTaskMachineUA{FF1E0511-D7AF-4DB6-8A41-DC39EA60EC93}" /F >nul 2>&1
schtasks /Delete /TN "CCleaner Update" /F >nul 2>&1
schtasks /Delete /TN "CCleanerCrashReporting" /F >nul 2>&1
schtasks /Delete /TN "CCleanerUpdateTaskMachineCore" /F >nul 2>&1
schtasks /Delete /TN "CCleanerUpdateTaskMachineUA" /F >nul 2>&1
echo.
timeout 1 > nul
cls
color f
echo.
powershell -command "get-appxpackage Microsoft.GamingServices | remove-AppxPackage -allusers" >nul 2>&1
echo.
echo.
timeout 1 > nul
cls
color f
echo.
set "fileToDelete=%SystemRoot%\System32\GameBarPresenceWriter.exe"
if exist "%fileToDelete%" (
echo.
    takeown /F "%fileToDelete%" >nul 2>&1
echo.
    icacls "%fileToDelete%" /grant administrators:F >nul 2>&1
echo.
    del "%fileToDelete%" /s /f /q
) else (
echo.
)
timeout 1 > nul
cls
color f
echo.
echo.
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im msedge.exe /fi "IMAGENAME eq msedge.exe" >nul 2>&1
taskkill /f /im msedge.exe /fi "IMAGENAME eq msedge.exe" >nul 2>&1
echo.
rd /s /q "C:\Program Files (x86)\Microsoft\Edge" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView" >nul 2>&1
rd /s /q "C:\Program Files (x86)\Microsoft\Temp" >nul 2>&1
echo.
del "C:\Users\Public\Desktop\Microsoft Edge.lnk" >nul 2>&1
del "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" >nul 2>&1
del "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" >nul 2>&1
echo.
timeout 1 > nul
cls
color f
echo.
echo.
taskkill.exe /F /IM "OneDrive.exe"
taskkill.exe /F /IM "explorer.exe"
echo.
winget uninstall --silent --accept-source-agreements Microsoft.OneDrive >nul 2>&1
echo.
echo.
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f
reg add "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f
reg load "hku\Default" "C:\Users\Default\NTUSER.DAT"
reg delete "HKEY_USERS\Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f >nul 2>&1
reg unload "hku\Default"
del /f /q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" >nul 2>&1
schtasks /delete /tn "OneDrive*" /f >nul 2>&1
echo.
start explorer.exe
echo.
timeout 1 > nul
cls
color f
echo.
set "usoClientFileToDelete=C:\Windows\System32\UsoClient.exe"
set "usoCoreWorkerFileToDelete=C:\Windows\UUS\amd64\MoUsoCoreWorker.exe"
if exist "%usoClientFileToDelete%" (
    echo.
echo.
    takeown /F "%usoClientFileToDelete%" >nul 2>&1
echo.
    icacls "%usoClientFileToDelete%" /grant administrators:F >nul 2>&1
echo.
    del "%usoClientFileToDelete%" /f /q
echo.
) else (
echo.
)
if exist "%usoCoreWorkerFileToDelete%" (
    echo.
echo.
    takeown /F "%usoCoreWorkerFileToDelete%" >nul 2>&1
echo.
    icacls "%usoCoreWorkerFileToDelete%" /grant administrators:F >nul 2>&1
echo.
    del "%usoCoreWorkerFileToDelete%" /f /q
echo.
) else (
echo.
)
timeout 1 > nul
cls
color f
echo.
echo.
taskkill /F /IM WidgetService.exe >nul 2>&1
taskkill /F /IM Widgets.exe >nul 2>&1
echo.
winget uninstall --silent --accept-source-agreements "Windows web experience Pack" >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f
CD /D "C:\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_424.1301.450.0_x64__cw5n1h2txyewy\Dashboard" >nul 2>&1
echo.
set "file1ToDelete=WidgetService.exe"
set "file2ToDelete=Widgets.exe"
if exist "%file1ToDelete%" (
echo.
    takeown /F "%file1ToDelete%" >nul 2>&1
echo.
    icacls "%file1ToDelete%" /grant administrators:F >nul 2>&1
echo.
    del "%file1ToDelete%" /s /f /q
echo.
) else (
echo.
)
if exist "%file2ToDelete%" (
    echo.
echo.
    takeown /F "%file2ToDelete%" >nul 2>&1
echo.
    icacls "%file2ToDelete%" /grant administrators:F >nul 2>&1
echo.
    del "%file2ToDelete%" /s /f /q
echo.
) else (
echo.
)
timeout 1 > nul
cls
color f
echo.
set "smartscreenFileToDelete1=C:\Windows\System32\smartscreen.exe"
set "smartscreenFileToDelete2=C:\Windows\SystemApps\Microsoft.Windows.AppRep.ChxApp_cw5n1h2txyewy\CHXSmartScreen.exe"
if exist "%smartscreenFileToDelete1%" (
    echo.
echo.
    takeown /F "%smartscreenFileToDelete1%" >nul 2>&1
echo.
    icacls "%smartscreenFileToDelete1%" /grant administrators:F >nul 2>&1
echo.
    del "%smartscreenFileToDelete1%" /f /q
echo.
) else (
echo.
)
if exist "%smartscreenFileToDelete2%" (
    echo.
echo.
    takeown /F "%smartscreenFileToDelete2%" >nul 2>&1
echo.
    icacls "%smartscreenFileToDelete2%" /grant administrators:F >nul 2>&1
echo.
    del "%smartscreenFileToDelete2%" /f /q
echo.
) else (
echo.
)
timeout 1 > nul
cls
color f
echo.
set "lockAppFileToDelete=C:\Windows\SystemApps\Microsoft.LockApp_cw5n1h2txyewy\LockApp.exe"
if exist "%lockAppFileToDelete%" (
echo.
    takeown /F "%lockAppFileToDelete%" >nul 2>&1
echo.
    icacls "%lockAppFileToDelete%" /grant administrators:F >nul 2>&1
echo.
    del "%lockAppFileToDelete%" /f /q
echo.
) else (
echo.
)
timeout 1 > nul
:InstallOpen
cls
color f
echo.
echo.
chcp 437 >nul
powershell -Command "Write-Host 'Options avancees recherche windows ' -ForegroundColor White -BackgroundColor Red" 
echo.
echo.
echo.
echo.
set /p choice=: 
echo.
if /i "%choice%"=="Y" (
echo.
    timeout 1 > nul
    goto :SearchRemover
) else if /i "%choice%"=="N" ( 
echo.
    timeout 2 > nul
    goto :SkipSearchRemover
) else (
    cls
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :InstallOpen
)
:SearchRemover
cls
color f
echo.
set "SearchFileToDelete1=C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe"
set "SearchFileToDelete2=C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe"
set "SearchFileToDelete3=C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ShellExperienceHost.exe"
set "SearchFileToDelete4=C:\Windows\System32\taskhostw.exe"
if exist "%SearchFileToDelete1%" (
    echo.
echo.
    takeown /F "%SearchFileToDelete1%" >nul 2>&1
echo.
    icacls "%SearchFileToDelete1%" /grant administrators:F >nul 2>&1
echo.
    del "%SearchFileToDelete1%" /f /q
echo.
) else (
echo.
)
if exist "%SearchFileToDelete2%" (
    echo.
echo.
    takeown /F "%SearchFileToDelete2%" >nul 2>&1
echo.
    icacls "%SearchFileToDelete2%" /grant administrators:F >nul 2>&1
echo.
    del "%SearchFileToDelete2%" /f /q
echo.
) else (
echo.
)
if exist "%SearchFileToDelete3%" (
    echo.
echo.
    takeown /F "%SearchFileToDelete3%" >nul 2>&1
echo.
    icacls "%SearchFileToDelete3%" /grant administrators:F >nul 2>&1
echo.
    del "%SearchFileToDelete3%" /f /q
echo.
) else (
echo.
)
if exist "%SearchFileToDelete4%" (
    echo.
echo.
    takeown /F "%SearchFileToDelete4%" >nul 2>&1
echo.
    icacls "%SearchFileToDelete4%" /grant administrators:F >nul 2>&1
echo.
    del "%SearchFileToDelete4%" /f /q
echo.
) else (
echo.
)
timeout 1 > nul
cls
color f
echo.
chcp 437 >nul
echo.
powershell -Command "Write-Host 'Needed if you''d like to Search things!' -ForegroundColor White -BackgroundColor Red" 
set "fileURL=https://github.com/Open-Shell/Open-Shell-Menu/releases/download/v4.4.191/OpenShellSetup_4_4_191.exe"
set "fileName=OpenShellSetup_4_4_191.exe"
set "fileURL2=https://github.com/QuakedK/Oneclick/raw/refs/heads/main/Downloads/OpenShellTheme.xml"
set "fileName2=OpenShellTheme.xml"
mkdir "C:\valamv\Open Shell" >nul 2>&1
set "downloadsFolder=C:\valamv\Open Shell"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
curl -s -L "%fileURL2%" -o "%downloadsFolder%\%fileName2%"
if exist "%downloadsFolder%\%fileName%" (
echo.
    echo.
echo.
    timeout 1 > nul
    cls
    start "" "%downloadsFolder%\%fileName%"
    chcp 437 >nul
    powershell -Command "Write-Host 'Do not skip if you want to Search things' -ForegroundColor White -BackgroundColor Red" 
    echo.
echo.
echo.
echo.
echo.
    echo.
echo.
echo.
echo.
    pause
) else (
echo.
echo.
    timeout 1 > nul
) 
:SkipSearchRemover
cls
color f
echo.
echo.
for /f "tokens=2 delims==" %%I in ('wmic startup get caption /format:list') do (
    setlocal enabledelayedexpansion
    set "app=%%I"
    set "app=!app:~0,-1!"
echo.
    :: Check if app exists in HKEY_CURRENT_USER
    reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "!app!" >nul 2>&1
    if !errorlevel! equ 0 (
echo.
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "!app!" /t REG_BINARY /d 0300000000000000 /f >nul 2>&1
    ) else (
echo.
    )
    :: Check if app exists in HKEY_LOCAL_MACHINE
    reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "!app!" >nul 2>&1
    if !errorlevel! equ 0 (
echo.
        reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "!app!" /t REG_BINARY /d 0300000000000000 /f >nul 2>&1
    ) else (
echo.
    )
    endlocal
)
echo.
timeout 1 > nul
cls
color f
echo.
setlocal enabledelayedexpansion
:: Finding Roblox and Discord path.
for /f "delims=" %%i in ('dir /b /s "%USERPROFILE%\AppData\Local\Roblox\Versions\RobloxPlayerBeta.exe" 2^>nul') do set "robloxPath=%%i"
for /f "delims=" %%i in ('dir /b /s "%USERPROFILE%\AppData\Local\Discord\Discord.exe" 2^>nul') do set "discordPath=%%i"
:: Games Paths.
set "games[0]=%ProgramFilesRobloxPath%"
set "games[1]=%AppDataRobloxPath%"
set "games[2]=C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe"
set "games[3]=C:\Program Files\Epic Games\RocketLeague\Binaries\Win64\RocketLeague.exe"
set "games[4]=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\bin\win64\cs2.exe"
set "games[5]=C:\Program Files (x86)\Steam\steamapps\common\Tom Clancy's Rainbow Six Siege\RainbowSix.exe"
set "games[6]=C:\Program Files (x86)\Steam\steamapps\common\Overwatch\Overwatch.exe"
set "games[7]=C:\Program Files (x86)\Steam\steamapps\common\Trove\Games\Trove\Live\Trove.exe"
set "games[8]=C:\Program Files (x86)\Steam\steamapps\common\VRChat\VRChat.exe"
set "games[9]=C:\Program Files (x86)\Steam\steamapps\common\FPSAimTrainer\FPSAimTrainer.exe"
set "games[10]=C:\Program Files (x86)\Steam\steamapps\common\Mafia The Old Country\MafiaTheOldCountry\Binaries\Win64\MafiaTheOldCountry.exe"
set "games[11]=C:\Program Files (x86)\Steam\steamapps\common\The Forest\TheForest.exe"
set "games[12]=C:\Program Files (x86)\Steam\steamapps\common\Dying Light 2\ph\work\bin\x64\DyingLightGame_x64_rwdi.exe"
set "games[13]=C:\Program Files (x86)\Steam\steamapps\common\Schedule I\Schedule I.exe"
set "games[14]=C:\Program Files (x86)\Steam\steamapps\common\Far Cry 3\bin\farcry3_d3d11.exe"
set "games[15]=C:\Program Files (x86)\Steam\steamapps\common\Sons Of The Forest\SonsOfTheForest.exe"
set "games[16]=C:\Program Files (x86)\Steam\steamapps\common\Mafia Definitive Edition\mafiadefinitiveedition.exe"
set "games[17]=C:\Program Files (x86)\Steam\steamapps\common\The Outlast Trials\OPP\Binaries\Win64\TOTClient-Win64-Shipping.exe"
set "games[18]=%USERPROFILE%\AppData\Local\osu!\osu!.exe"
set "games[19]=C:\Riot Games\VALORANT\live\VALORANT.exe"
set "games[20]=C:\Program Files\Epic Games\VALORANT\VALORANT.exe"
set "games[21]=C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V\GTA5.exe"
set "games[22]=C:\Program Files\Epic Games\GTAV\GTAV.exe"
set "games[23]=C:\Program Files\Rockstar Games\Grand Theft Auto V\GTA5.exe"
set "games[24]=C:\Program Files\Epic Games\Apex\Apex.exe"
set "games[25]=C:\Program Files (x86)\Steam\steamapps\common\Apex Legends\Apex Legends.exe"
set "games[26]=C:\Program Files (x86)\Electronic Arts\Apex\Apex.exe"
set "games[27]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops\BlackOps.exe"
set "games[28]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops II\BlackOps2.exe"
set "games[29]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops III\BlackOps3.exe"
set "games[30]=C:\Program Files (x86)\Battle.net\Call of Duty Black Ops 4\BlackOps4.exe"
set "games[31]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops Cold War\BlackOpsColdWar.exe"
set "games[32]=C:\Program Files (x86)\Battle.net\Call of Duty Black Ops Cold War\BlackOpsColdWar.exe"
set "games[33]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Black Ops 6\BlackOps6.exe"
set "games[34]=C:\Program Files (x86)\Battle.net\Call of Duty Black Ops 6\BlackOps6.exe"
set "games[35]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Modern Warfare\modernwarfare.exe"
set "games[36]=C:\Program Files (x86)\Battle.net\Call of Duty Modern Warfare\modernwarfare.exe"
set "games[37]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Modern Warfare II\cod22-cod.exe"
set "games[38]=C:\Program Files (x86)\Battle.net\Call of Duty Modern Warfare II\cod22-cod.exe"
set "games[39]=C:\Program Files (x86)\Steam\steamapps\common\Call of Duty Modern Warfare III\cod23-cod.exe"
set "games[40]=C:\Program Files (x86)\Battle.net\Call of Duty Modern Warfare III\cod23-cod.exe"
set "games[41]=C:\Program Files\Genshin Impact\Genshin Impact Game\GenshinImpact.exe"
set "games[42]=C:\Program Files\Epic Games\Genshin Impact\Genshin Impact Game\GenshinImpact.exe"
set "games[43]=C:\Program Files (x86)\Steam\steamapps\common\Dead by Daylight\DeadByDaylight\Binaries\Win64\DeadByDaylight-Win64-Shipping.exe"
set "games[44]=C:\Program Files\Epic Games\Dead by Daylight\DeadByDaylight\Binaries\Win64\DeadByDaylight-EGS-Shipping.exe"
set "games[45]=C:\Program Files (x86)\Steam\steamapps\common\Aimlabs\AimLab_tb.exe"
set "games[46]=C:\Program Files\Epic Games\Aimlabs\AimLab_tb.exe"
set "games[47]=C:\Program Files (x86)\Steam\steamapps\common\Tom Clancy's Rainbow Six Siege\RainbowSix.exe"
set "games[48]=C:\Program Files (x86)\Ubisoft\Ubisoft Game Launcher\games\Tom Clancy's Rainbow Six Siege\RainbowSix.exe"
set "games[49]=C:\Program Files (x86)\Call of Duty\_retail_\cod.exe"
:: Apps Paths. 
set "apps[0]=%discordPath%"
set "apps[1]=%USERPROFILE%\AppData\Roaming\Spotify\Spotify.exe"
set "apps[2]=C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
set "apps[3]=C:\Program Files\obs-studio\bin\64bit\obs64.exe"
set "apps[4]=C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe"
set "apps[5]=C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\EpicWebHelper.exe"
set "apps[6]=C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\CrashReportClient.exe"
set "apps[7]=C:\Program Files (x86)\Steam\Steam.exe"
set "apps[8]=C:\Program Files (x86)\Steam\bin\cef\cef.win7x64\steamwebhelper.exe"
set "apps[9]=C:\Program Files (x86)\Battle.net\Battle.net.exe"
set "apps[10]=C:\Program Files\Core Temp\Core Temp.exe"
set "apps[11]=C:\Program Files (x86)\CapFrameX\CapFrameX.exe"
set "apps[12]=C:\Program Files\CPUID\HWMonitor\HWMonitor.exe"
set "apps[13]=C:\Program Files\VideoLAN\VLC\vlc.exe"
set "apps[14]=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "apps[15]=C:\Program Files\Open-Shell\StartMenu.exe"
set "apps[16]=C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
set "apps[17]=%USERPROFILE%\AppData\Local\Programs\Opera GX\launcher.exe"
set "apps[18]=C:\Windows\System32\dwm.exe"
set "apps[19]=C:\Windows\explorer.exe"
:: Registry Keys
set regKeyGP=HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences
set regKeyPR=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options
set regKeyFO=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers
:: Set Games to High Performance and Hgh Priority.
for /L %%i in (0, 1, 30) do (
    set "currentPath=!games[%%i]!"
    if exist "!currentPath!" (
        for %%a in (!currentPath!) do set "exeName=%%~nxa"
echo.
        reg add "%regKeyGP%" /v "!currentPath!" /t REG_SZ /d "GpuPreference=2" /f >nul 2>&1
        reg add "%regKeyPR%\!exeName!\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
        reg add "%regKeyFO%" /v "!currentPath!" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f >nul 2>&1
    ) else (
echo.
    )
)
:: Set Apps to Power Saving and Low Priority.
for /L %%i in (0, 1, 19) do (
    set "currentPath=!apps[%%i]!"
    if exist "!currentPath!" (
        for %%a in (!currentPath!) do set "exeName=%%~nxa"
echo.
        reg add "%regKeyGP%" /v "!currentPath!" /t REG_SZ /d "GpuPreference=1" /f >nul 2>&1
        reg add "%regKeyPR%\!exeName!\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f >nul 2>&1 
    ) else (
echo.
    )
)
endlocal
echo.
timeout 1 > nul
cls
color f
echo.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ApplicationFrameHost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dllhost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\fontdrvhost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "1" /f  
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\services.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sihost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StartMenu.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe" /v "MinimumStackCommitInBytes" /t REG_DWORD /d "32768" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f  
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f  
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wininit.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WMIADAP.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WmiPrvSE.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f
echo.
timeout 1 > nul 

cls
color f
echo.                                          
echo.                                       
echo.                                            
echo. 
chcp 437 >nul
powershell -Command "Write-Host 'Logiciel Microsoft ...' -ForegroundColor White -BackgroundColor Red"  
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Cortana* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *WindowsCalculator* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Sway* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.BingSports* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.BingFinance* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.HEIFImageExtension* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.VP9VideoExtensions* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WebpImageExtension* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Office.Sway* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.StorePurchaseApp* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsPhone* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsPhone* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsPhone* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Windows.Phone* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.CommsPhone* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Appconnector* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.MinecraftUWP* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Wallet* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsCalculator* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.GroupMe10* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *king.com.CandyCrushSaga* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *king.com.CandyCrushSodaSaga* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *ShazamEntertainmentLtd.Shazam* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Flipboard.Flipboard* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *9E2F88E3.Twitter* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *ClearChannelRadioDigital.iHeartRadio* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *D5EA27B7.Duolingo-LearnLanguagesforFree* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *PandoraMediaInc.29680B314EFC2* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *46928bounde.EclipseManager* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *ActiproSoftwareLLC.562882FEEB491* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Advertising.Xaml* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.RemoteDesktop* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.NetworkSpeedTest* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Todos* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Windows.Search* | Remove-AppxPackage" >nul 2>&1
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Windows.Cortana* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *windowsterminal* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.PowerAutomateDesktop* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.Office.Outlook* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.WindowsNotepad* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.OneDrive* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.ParentalControls* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Clipchamp* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *RealtekSemiconductorCorp.RealtekAudioControl* | Remove-AppxPackage" >nul 2>&1
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.RemoteDesktop* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *Microsoft.RemoteDesktop_10.2.1810.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage" >nul 2>&1
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *HPAudioControl* | Remove-AppxPackage" >nul 2>&1
taskkill /F /IM Teams.exe >nul 2>&1
taskkill /F /IM msteams.exe >nul 2>&1
taskkill /F /IM msteams_autostarter.exe >nul 2>&1
taskkill /F /IM msteamsupdate.exe >nul 2>&1
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *MicrosoftTeams* | Remove-AppxPackage"
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage *MicrosoftTeams_24102.2309.2851.4917_x64__8wekyb3d8bbwe* | Remove-AppxPackage"
echo.
timeout 1 > nul

cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p option="GPU Nvidia 1 , 2 AMD , 1 Intel : "
echo.
if "%option%"=="1" (
echo.
timeout 2 > nul
goto :Nivida
) else if "%option%"=="2" (
echo.
timeout 2 > nul
goto :AMD
) else if "%option%"=="3" (
echo.
timeout 2 > nul
goto :Intel
) else if "%option%"=="4" (
echo.
goto :DoneSkipGpu 
timeout 1 > nul   
) 
:Nivida
cls

mkdir "C:\valamv\Nvidia\Nvidia Control Panel" >nul 2>&1

set "FileURL=https://github.com/QuakedK/Oneclick/raw/refs/heads/main/Downloads/V8.0/nvcplui.exe"
set "FileName=nvcplui.exe"
set "DownloadsFolder=C:\valamv\Nvidia\Nvidia Control Panel"

curl -s -L "%FileURL%" -o "%DownloadsFolder%\%FileName%"

if exist "%DownloadsFolder%\%FileName%" (

    reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\Nvidia Control Panel" /v HasLUAShield /t REG_SZ /d "" /f >nul 2>&1
    reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\Nvidia Control Panel" /v MUIVerb /t REG_SZ /d "Pannel Nvidia" /f >nul 2>&1
    reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\Nvidia Control Panel\command" /ve /t REG_SZ /d "C:\valamv\Nvidia\Nvidia Control Panel\nvcplui.exe" /f >nul 2>&1

)

:: Find GPU Device Path Loop.
for /L %%i in (0,1,9) do (
    for /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\000%%i" /v "ProviderName" 2^>nul') do (
	if /i "%%b"=="NVIDIA" (
		set G=000%%i
		)
	)
)
HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%
HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%
Set "BinaryMask=00ffff0f01ffff0f02ffff0f03ffff0f04ffff0f05ffff0f06ffff0f07ffff0f08ffff0f09ffff0f0affff0f0bffff0f0cffff0f0dffff0f0effff0f0fffff0f10ffff0f11ffff0f12ffff0f13ffff0f14ffff0f15ffff0f16ffff0f00ffff1f01ffff1f02ffff1f03ffff1f04ffff1f05ffff1f06ffff1f07ffff1f08ffff1f09ffff1f0affff1f0bffff1f0cffff1f0dffff1f0effff1f0fffff1f00ffff2f01ffff2f02ffff2f03ffff2f04ffff2f05ffff2f06ffff2f07ffff2f08ffff2f09ffff2f0affff2f0bffff2f0cffff2f0dffff2f0effff2f0fffff2f00ffff3f01ffff3f02ffff3f03ffff3f04ffff3f05ffff3f06ffff3f07ffff3f" 

reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v Icon /t REG_SZ /d "C:\valamv\Nvidia\Nvidia Profile Inspector\nvidiaProfileInspector.exe,0" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v MUIVerb /t REG_SZ /d "Nvidia" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v Position /t REG_SZ /d "Bottom" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v SubCommands /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer" /v HasLUAShield /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer" /v MUIVerb /t REG_SZ /d "Activer clip nvidia" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer\command" /ve /t REG_SZ /d "C:\valamv\Nvidia\Nvidia Container\Nvidia Container ON.bat" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer" /v HasLUAShield /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer" /v MUIVerb /t REG_SZ /d "Desactiver clip Nvidia" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer\command" /ve /t REG_SZ /d "C:\valamv\Nvidia\Nvidia Container\Nvidia Container OFF.bat" /f >nul 2>&1

reg add "HKCR\Directory\Background\shellex\ContextMenuHandlers\NvCplDesktopContext" /ve /t REG_SZ /d "{}" /f >nul 2>&1


reg add "HKCU\SOFTWARE\NVIDIA Corporation\Global\GFExperience" /v "NotifyNewDisplayUpdates" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "NvDevToolsVisible" /t REG_DWORD /d "1" /f >nul 2>&1
timeout /t 5 /nobreak >nul
reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvTray" /v "StartOnLogin" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "HideXGpuTrayIcon" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\CoProcManager" /v "ShowTrayIcon" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\NVIDIA Corporation\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmProfilingAdminOnly" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmProfilingAdminOnly" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\NGXCore" /v "ShowDlssIndicator" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableHDAudioD3Cold" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableHwFaultBuffer" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisablePerIntrDPCQueueing" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElcg" /t REG_DWORD /d "1431655765" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMBlcg" /t REG_DWORD /d "286331153" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElpg" /t REG_DWORD /d "4095" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMSlcg" /t REG_DWORD /d "262131" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMFspg" /t REG_DWORD /d "15" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGC6Feature" /t REG_DWORD /d "699050" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGC6Parameters" /t REG_DWORD /d "85" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDidleFeatureGC5" /t REG_DWORD /d "44731050" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMHotPlugSupportDisable" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrPagedDMA" /t REG_DWORD /d "1" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmRcWatchdog" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLogonRC" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMIntrDetailedLogs" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMCtxswLog" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMNvLog" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMSuppressGPIOIntrErrLog" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "LogDisableMasks" /t REG_BINARY /d "%BinaryMask%" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters" /v "LogWarningEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters" /v "LogPagingEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters" /v "LogEventEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters" /v "LogErrorEntries" /t REG_DWORD /d "0" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMUsbcDebugMode" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableFeatureDisablement" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmBreakonRC" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDebugSetSMCMode" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableLRCCoalescing" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmEnableI2CNanny" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMPcieLtrOverride" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMPcieLtrL12ThresholdOverride" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisablePreosapps" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmPerfLimitsOverride" /t REG_DWORD /d "21" /f >nul 2>&1
 

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGCOffFeature" /t REG_DWORD /d "2" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmOverrideSupportChipsetAspm" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableASPMDT" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableGpuASPMFlags" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableASPMAtLoad" /t REG_DWORD /d "0" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableEventTracer" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SkipSwStateErrChecks" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMAERRForceDisable" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RM580312" /t REG_DWORD /d "1" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmWar1760398" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMLpwrArch" /t REG_DWORD /d "349525" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrGrPgSwFilterFunction" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrCtrlMsDifrSwAsrParameters" /t REG_DWORD /d "5461" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrCacheStatsOnD3" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmPgCtrlParameters" /t REG_DWORD /d "1431655765" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDwbMscg" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableInforomBBX" /t REG_DWORD /d "15" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmSec2EnableApm" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmOverrideIdleSlowdownSettings" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMClkSlowDown" /t REG_DWORD /d "71303168" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RM2644249" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableACPI" /t REG_DWORD /d "1023" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMNativePcieL1WarFlags" /t REG_DWORD /d "16" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMResetPerfMonD4" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrWDDMMode" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrFileMode" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "PerfLevelSrc" /t REG_DWORD /d "8738" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElpgStateOnInit" /t REG_DWORD /d "3" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmMIONoPowerOff" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableOptimalPowerForPadlinkPll" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmClkPowerOffDramPllWhenUnused" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMOPSB" /t REG_DWORD /d "10914" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "DisableAsyncPstates" /t REG_DWORD /d "1" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SlideMCLK" /t REG_DWORD /d "0" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMNvlinkUPHYInitControl" /t REG_DWORD /d "16" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmGpsGenoa" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\Software\Nvidia Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\System\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID44231 /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID64640 /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID66610 /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableRegistryCaching" /t REG_DWORD /d "15" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "D3PCLatency" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "EnableMsHybrid" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableIntrIllegalCompstatAccess" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SetPanelRefreshRate" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableNoncontigAlloc" /t REG_DWORD /d "1" /f >nul 2>&1


nvidia-smi.exe -acp 0 >nul 2>&1


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableHdcp22" /t REG_DWORD /d "1" /f >nul 2>&1

if exist "C:\Program Files\NVIDIA Corporation\Installer2\InstallerCore\NVI2.dll" (
    for %%C in (Display.3DVision Display.Audio Ansel) do (
        Rundll32.exe "C:\Program Files\NVIDIA Corporation\Installer2\InstallerCore\NVI2.dll",UninstallPackage %%C >nul 2>&1
    )
)


reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f >nul 2>&1


for /d %%F in ("%SystemDrive%\Windows\System32\DriverStore\FileRepository\nv_dispig.inf_amd64_*") do (
    takeown /f "%%F" /r /d Y >nul 2>&1
    icacls "%%F" /grant "%USERNAME%":F /t >nul 2>&1
    del /s /q "%%F\NvTelemetry64.dll" >nul 2>&1
    rd /s /q "%%F\NvCamera" >nul 2>&1
    del /s /q "%%F\Display.NvContainer\plugins\LocalSystem\_DisplayDriverRAS.dll" >nul 2>&1
)


Takeown /F "C:\Windows\System32\drivers\NVIDIA Corporation" /R /D Y >nul 2>&1
Icacls "C:\Windows\System32\drivers\NVIDIA Corporation" /grant "%USERNAME%":F /T >nul 2>&1
rd /s /q "C:\Windows\System32\drivers\NVIDIA Corporation" >nul 2>&1


rd /s /q "%SystemDrive%\Program Files\NVIDIA Corporation\Display.NvContainer\plugins\LocalSystem\DisplayDriverRAS" >nul 2>&1
rd /s /q "%SystemDrive%\Program Files\NVIDIA Corporation\DisplayDriverRAS" >nul 2>&1
rd /s /q "%SystemDrive%\ProgramData\NVIDIA Corporation\DisplayDriverRAS" >nul 2>&1
endlocal


timeout 2 > nul

Nettoyage
del /s /q "%LocalAppData%\Microsoft\Windows\WebCache" 
rd /s /q "%LocalAppData%\Microsoft\Windows\WebCache" >nul 2>&1
mkdir "%LocalAppData%\Microsoft\Windows\WebCache" >nul 2>&1


del /s /q "C:\Windows\Temp"
rd /s /q "C:\Windows\Temp" >nul 2>&1
mkdir "C:\Windows\Temp" >nul 2>&1 


del /s /q "%Temp%" 
rd /s /q "%Temp%" >nul 2>&1
mkdir "%Temp%" >nul 2>&1 


del /s /q "%AppData%\Discord\Cache" 
rd /s /q "%AppData%\Discord\Cache" >nul 2>&1
mkdir "%AppData%\Discord\Cache" >nul 2>&1


del /s /q "%AppData%\Discord\Code Cache" 
rd /s /q "%AppData%\Discord\Code Cache" >nul 2>&1
mkdir "%AppData%\Discord\Code Cache" >nul 2>&1


del /s /q "%LocalAppData%\Spotify\Data"
rd /s /q "%LocalAppData%\Spotify\Data" >nul 2>&1
mkdir "%LocalAppData%\Spotify\Data" >nul 2>&1


del /s /q "C:\Windows\Prefetch"
rd /s /q "C:\Windows\Prefetch" >nul 2>&1
mkdir "C:\Windows\Prefetch" >nul 2>&1 


del /s /q "%ProgramData%\USOPrivate\UpdateStore" 
del /s /q "%ProgramData%\USOShared\Logs" 
del /s /q "C:\Windows\System32\SleepStudy"
del /s /q "C:\Windows\Logs"


echo.
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{7B7A1E6E-0A7E-11EF-946A-806E6F6E6963}\0000" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{7B7A1E6E-0A7E-11EF-946A-806E6F6E6963}\0000" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{7B7A1E6E-0A7E-11EF-946A-806E6F6E6963}\0000" /v "PowerMizerLevelAC" /t REG_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{7B7A1E6E-0A7E-11EF-946A-806E6F6E6963}\0000" /v "PerfLevelSrc" /t REG_DWORD /d "8738" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t Reg_DWORD /d "0" /f 
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}\0001\PowerSettings" /v IdlePowerState /t REG_BINARY /d 00000000 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
timeout 1 > nul
cls

echo.
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t REG_DWORD /d "1" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d 0 /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f >nul 2>&1
timeout 1 > nul
cls

sc config NVDisplay.ContainerLocalSystem start=disabled >nul 2>&1
sc config NvContainerLocalSystem start=disabled >nul 2>&1
sc config FvSVC start=disabled >nul 2>&1

echo.
echo.
echo.
echo.
echo.
echo.
echo.
schtasks /change /disable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" >nul 2>&1 
schtasks /change /disable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" >nul 2>&1
schtasks /change /disable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" >nul 2>&1
schtasks /change /disable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" >nul 2>&1 
schtasks /change /disable /tn "NVIDIA GeForce Experience SelfUpdate_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" >nul 2>&1  
schtasks /change /disable /tn "NvDriverUpdateCheckDaily_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" >nul 2>&1
schtasks /change /disable /tn "NvBatteryBoostCheckOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" >nul 2>&1
schtasks /change /disable /tn "NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" >nul 2>&1
timeout 1 > nul
cls

echo.
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyGlobZero" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /t REG_DWORD /d 5 /f
timeout 1 > nul
cls

echo.
FOR /f %%g IN ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f 
FOR /f %%g IN ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do REG DELETE "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>&1
FOR /f %%i IN ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f 
FOR /f %%i IN ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do REG DELETE "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>&1
FOR /f %%u IN ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%u\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%u\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d C0 >nul 2>&1
)
FOR /f %%v IN ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%v\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%v\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d C0 >nul 2>&1
)
FOR /f %%n IN ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /l "PCI\VEN_"') do ( 
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d 30 >nul 2>&1
)
timeout 1 > nul
cls               
:NvidiaTelemetryClient


)
cls
echo.
set "fileURL=https://github.com/Orbmu2k/nvidiaProfileInspector/releases/download/2.4.0.4/nvidiaProfileInspector.zip"
set "fileName=nvidiaProfileInspector.zip"
set "fileURL2=https://raw.githubusercontent.com/aymendrali9766-stack/wifi/refs/heads/main/QuakedOptimizedNVProflie.nip"
set "fileName2=Quaked Optimized NV Proflie.nip"
mkdir "C:\valamv\Nvidia" >nul 2>&1
set "extractFolder=C:\valamv\Nvidia\nvidiaProfileInspector"
set "downloadsFolder=C:\valamv\Nvidia"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
if not exist "%downloadsFolder%\%fileName%" (
curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
curl -s -L "%fileURL2%" -o "%downloadsFolder%\%fileName2%"
timeout 1 > nul
mkdir "%extractFolder%" >nul 2>&1
pushd "%extractFolder%" >nul 2>&1
chcp 437 >nul
powershell -Command "Expand-Archive -Path '%downloadsFolder%\%fileName%' -DestinationPath '%extractFolder%' -Force" >nul 2>&1
popd >nul 2>&1
del /q "C:\valamv\Nvidia\nvidiaProfileInspector.zip" >nul 2>&1
echo.
echo.
"%extractFolder%\nvidiaProfileInspector.exe" -importProfile "%downloadsFolder%\%fileName2%"
echo.
pause
goto :DoneSkipGpu 
) else (
echo.
)
:AMD
cls
echo.
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "3D_Refresh_Rate_Override_DEF" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "3to2Pulldown_NA" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "AAF_NA" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "Adaptive De-interlacing" /t Reg_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "AllowRSOverlay" /t Reg_SZ /d "false" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "AllowSkins" /t Reg_SZ /d "false" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "AllowSnapshot" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "AllowSubscription" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "AntiAlias_NA" /t Reg_SZ /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "AreaAniso_NA" /t Reg_SZ /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "ASTT_NA" /t Reg_SZ /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "AutoColorDepthReduction_NA" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "DisableSAMUPowerGating" /t Reg_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "DisableUVDPowerGatingDynamic" /t Reg_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "DisableVCEPowerGating" /t Reg_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "EnableAspmL0s" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "EnableAspmL1" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "EnableUlps" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "EnableUlps_NA" /t Reg_SZ /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "KMD_DeLagEnabled" /t Reg_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "KMD_FRTEnabled" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "DisableDMACopy" /t Reg_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "DisableBlockWrite" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "StutterMode" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "EnableUlps" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "PP_SclkDeepSleepDisable" /t Reg_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "PP_ThermalAutoThrottlingEnable" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "DisableDrmdmaPowerGating" /t Reg_DWORD /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000" /v "KMD_EnableComputePreemption" /t Reg_DWORD /d "0" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\UMD" /t Reg_SZ /d "1" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\UMD" /v "Main3D" /t Reg_BINARY /d "3100" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\UMD" /v "FlipQueueSize" /t Reg_BINARY /d "3100" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\UMD" /v "ShaderCache" /t Reg_BINARY /d "3200" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\UMD" /v "Tessellation_OPTION" /t Reg_BINARY /d "3200" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\UMD" /v "Tessellation" /t Reg_BINARY /d "3100" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\UMD" /v "VSyncControl" /t Reg_BINARY /d "3000" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\UMD" /v "TFQ" /t Reg_BINARY /d "3200" /f 
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{B784559B-672D-11EE-A4CA-E612636C81AA}\0000\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f 
timeout 1 > nul 
cls

echo.
FOR /f %%g IN ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f 
FOR /f %%g IN ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do REG DELETE "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>&1
FOR /f %%i IN ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f 
FOR /f %%i IN ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do REG DELETE "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>&1
FOR /f %%u IN ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%u\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%u\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d C0 >nul 2>&1
)
FOR /f %%v IN ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%v\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%v\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d C0 >nul 2>&1
)
FOR /f %%n IN ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /l "PCI\VEN_"') do ( 
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d 30 >nul 2>&1
)
goto :DoneSkipGpu
:Intel
cls
echo.
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Disable_OverlayDSQualityEnhancement" /t REG_DWORD /d "1" /f
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "IncreaseFixedSegment" /t REG_DWORD /d "1" /f
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AdaptiveVsyncEnable" /t REG_DWORD /d "0" /f
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePFonDP" /t REG_DWORD /d "1" /f
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableCompensationForDVI" /t REG_DWORD /d "1" /f
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "NoFastLinkTrainingForeDP" /t REG_DWORD /d "0" /f
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ACPowerPolicyVersion" /t REG_DWORD /d "16898" /f
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DCPowerPolicyVersion" /t REG_DWORD /d "16642" /f
REG ADD "HKLM\Software\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "512" /f
timeout 1 > nul
cls

echo.
FOR /f %%g IN ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f 
FOR /f %%g IN ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do REG DELETE "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>&1
FOR /f %%i IN ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do REG ADD "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f 
FOR /f %%i IN ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do REG DELETE "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>&1
FOR /f %%u IN ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%u\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%u\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d C0 >nul 2>&1
)
FOR /f %%v IN ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%v\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%v\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d C0 >nul 2>&1
)
FOR /f %%n IN ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /l "PCI\VEN_"') do ( 
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /f /v DevicePolicy /t REG_DWORD /d 4 >nul 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /f /v AssignmentSetOverride /t REG_BINARY /d 30 >nul 2>&1
)
goto :DoneSkipGpu

:DoneSkipGpu
cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                                          
timeout 1 > nul  
cls
color f
chcp 437 >nul
echo.
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /set useplatformtick no
bcdedit /set disabledynamictick yes
echo.
timeout 1 > nul

:: =====================================================================
:: MISE A JOUR V8.4 - Nouvelles optimisations (silencieuses)
:: =====================================================================

:: --- Branding OEM ---
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Manufacturer" /t REG_SZ /d "VALAMV Optimisation" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportURL" /t REG_SZ /d "Discord:_valamv" /f >nul 2>&1

:: --- UCPD Task Disable ---
sc config "ucpd" start=disabled >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\AppxDeploymentClient\UCPD velocity" >nul 2>&1

:: --- Tweaks directs (Gaming, Telemetrie, Bloatware, Audio, Clavier/Souris, Explorer, VBS, etc.) ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "AutorunValamvAfterRestart" /t REG_SZ /d "\"%~f0\"" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "SettingsPageVisibility" /t REG_SZ /d "hide:home" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f >nul 2>&1
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v "EnableTransparency" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "HideRecommendedSection" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Education" /v "IsEducationEnvironment" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "HideRecommendedSection" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_DSEBehavior /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "01" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Installer" /v "DisableCoInstallers" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AppIDSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\CredentialEnrollmentManagerUserSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\DeviceAssociationBrokerSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\EntAppSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\embeddedmode" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\PrintWorkflowUserSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AUEPLauncher" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "4294967295" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\1394ohci" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AcpiDev" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\acpipagr" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AcpiPmi" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\acpitime" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdsata" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdsbs" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdxata" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppvVemgr" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\arcsas" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\atapi" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\b06bdrv" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bam" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\beep" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bowser" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BTHUSB" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bttflt" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\cdfs" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\cdrom" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\cht4tiscsi" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\cht4vbd" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\circlass" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CSC" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dam" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ebdrv" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\fdc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\flpydisk" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\gencounter" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidIr" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hvcrash" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hvservice" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hyperkbd" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HyperVideo" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ItSas35i" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MEIx64" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Microsoft_Bluetooth_AvrcpTransport" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NdisCap" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NdisVirtualBus" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndu" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\rdpbus" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RFCOMM" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\scfilter" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\sfloppy" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SgrmAgent" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SpatialGraphFilter" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Synth3dVsc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TsUsbFlt" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TsUsbGD" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\tsusbhub" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\udfs" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UevAgentDriver" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\umbus" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbcir" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbprint" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Vid" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vmgid" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vwifibus" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vwifimp" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WacomPen" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wanarp" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wanarpv6" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "%%A" /t REG_BINARY /d 0300000000000000 /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "%%A" /t REG_BINARY /d 0300000000000000 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder" /v "%%~nxF" /t REG_BINARY /d 0300000000000000 /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder" /v "%%~nxF" /t REG_BINARY /d 0300000000000000 /f >nul
reg add "HKLM\System\ControlSet001\Control\FeatureManagement\Overrides\8\1387020943" /v "EnabledStateOptions" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\System\ControlSet001\Control\FeatureManagement\Overrides\8\1387020943" /v "EnabledState" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\ControlSet001\Control\FeatureManagement\Overrides\8\1387020943" /v "Variant" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\System\ControlSet001\Control\FeatureManagement\Overrides\8\1387020943" /v "VariantPayload" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\System\ControlSet001\Control\FeatureManagement\Overrides\8\1387020943" /v "VariantPayloadKind" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\UdkUserSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\Nvidia Control Panel" /v MUIVerb /t REG_SZ /d "Nvidia Control Panel" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v Icon /t REG_SZ /d "C:\valamv\Nvidia\Nvidia Profile Inspector\nvidiaProfileInspector.exe,0" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v MUIVerb /t REG_SZ /d "Nvidia Container" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer" /v MUIVerb /t REG_SZ /d "Enable Container" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer" /v MUIVerb /t REG_SZ /d "Disable Container" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN" /v "PowerSaverAutoEnable_CUR" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\amdwddmg" /v "ChillEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN" /v "AutoUpdateTriggered" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN" /v "AutoUpdate" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "AllowHibernate" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergySaverState" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "TimerCoalescing" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000000000000" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformRoleOverride" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MSDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DynamicHeteroCpuPolicyMask" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DefaultDynamicHeteroCpuPolicy" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DynamicHeteroCpuPolicyImportant" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DynamicHeteroCpuPolicyImportantShort" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DynamicHeteroCpuPolicyImportantPriority" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "EnablePerCpuClockTickScheduling" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "TimerCheckFlags" /t REG_DWORD /d "0" /f > nul 2>&1 >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x2a" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x00000024" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x1a" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5000 --no-console" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5040 --no-console" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5070 --no-console" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vwifibus" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vwifimp" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1

:: --- Services Windows (Bluetooth, Hyper-V, lecteurs obsoletes, etc.) ---
sc config "ucpd" start=disabled >nul 2>&1
sc config AarSvc start=disabled >nul 2>&1
sc config ADPSvc start=disabled >nul 2>&1
sc config AppMgmt start=disabled >nul 2>&1
sc config AppInfo start=demand >nul 2>&1
sc config AxInstSV start=disabled >nul 2>&1
sc config BluetoothUserService start=disabled >nul 2>&1
sc config CaptureService start=disabled >nul 2>&1
sc config CloudBackupRestoreSvc start=disabled >nul 2>&1
sc config cloudidsvc start=disabled >nul 2>&1
sc config COMSysApp start=disabled >nul 2>&1
sc config ConsentUxUserSvc start=disabled >nul 2>&1
sc config dcsvc start=disabled >nul 2>&1
sc config DeviceInstall start=disabled >nul 2>&1
sc config DevicePickerUserSvc start=disabled >nul 2>&1
sc config dot3svc start=disabled >nul 2>&1
sc config DsmSvc start=disabled >nul 2>&1
sc config Eaphost start=disabled >nul 2>&1
sc config EventLog start=disabled >nul 2>&1
sc config EventSystem start=demand >nul 2>&1
sc config FrameServerMonitor start=disabled >nul 2>&1
sc config GameInputSvc start=disabled >nul 2>&1
sc config GraphicsPerfSvc start=disabled >nul 2>&1
sc config hpatchmon start=disabled >nul 2>&1
sc config hidserv start=disabled >nul 2>&1
sc config InventorySvc start=disabled >nul 2>&1
sc config IpxlatCfgSvc start=disabled >nul 2>&1
sc config KtmRm start=disabled >nul 2>&1
sc config LocalKdc start=disabled >nul 2>&1
sc config LicenseManager start=disabled >nul 2>&1
sc config lltdsvc start=disabled >nul 2>&1
sc config LxpSvc start=disabled >nul 2>&1
sc config McpManagementService start=disabled >nul 2>&1
sc config McmSvc start=disabled >nul 2>&1
sc config MessagingService start=disabled >nul 2>&1
sc config midisrv start=disabled >nul 2>&1
sc config MSiSCSI start=disabled >nul 2>&1
sc config NaturalAuthentication start=disabled >nul 2>&1
sc config NcaSvc start=disabled >nul 2>&1
sc config NcdAutoSetup start=disabled >nul 2>&1
sc config Netman start=disabled >nul 2>&1
sc config NetSetupSvc start=disabled >nul 2>&1
sc config p2pimsvc start=disabled >nul 2>&1
sc config p2psvc start=disabled >nul 2>&1
sc config P9RdrService start=disabled >nul 2>&1
sc config PeerDistSvc start=disabled >nul 2>&1
sc config PenService start=disabled >nul 2>&1
sc config perceptionsimulation start=disabled >nul 2>&1
sc config PerfHost start=disabled >nul 2>&1
sc config PimIndexMaintenanceSvc start=disabled >nul 2>&1
sc config pla start=disabled >nul 2>&1
sc config PNRPsvc start=disabled >nul 2>&1
sc config PolicyAgent start=disabled >nul 2>&1
sc config PrintDeviceConfigurationService start=disabled >nul 2>&1
sc config PrintScanBrokerService start=disabled >nul 2>&1
sc config PushToInstall start=disabled >nul 2>&1
sc config QWAVE start=disabled >nul 2>&1
sc config RasAuto start=disabled >nul 2>&1
sc config refsdedupsvc start=disabled >nul 2>&1
sc config RpcLocator start=disabled >nul 2>&1
sc config SamSs start=disabled >nul 2>&1
sc config ScDeviceEnum start=disabled >nul 2>&1
sc config SCPolicySvc start=disabled >nul 2>&1
sc config SDRSVC start=disabled >nul 2>&1
sc config SENS start=disabled >nul 2>&1
sc config Sense start=disabled >nul 2>&1
sc config SharedRealitySvc start=disabled >nul 2>&1
sc config SmsRouter start=disabled >nul 2>&1
sc config SNMPTrap start=disabled >nul 2>&1
sc config spectrum start=disabled >nul 2>&1
sc config svsvc start=disabled >nul 2>&1
sc config TroubleshootingSvc start=disabled >nul 2>&1
sc config UmRdpService start=disabled >nul 2>&1
sc config upnphost start=disabled >nul 2>&1
sc config VacSvc start=disabled >nul 2>&1
sc config VaultSvc start=disabled >nul 2>&1
sc config vds start=disabled >nul 2>&1
sc config WarpJITSvc start=disabled >nul 2>&1
sc config wbengine start=disabled >nul 2>&1
sc config webthreatdefusersvc start=disabled >nul 2>&1
sc config webthreatdefsvc start=disabled >nul 2>&1
sc config WEPHOSTSVC start=disabled >nul 2>&1
sc config WFDSConMgrSvc start=disabled >nul 2>&1
sc config whesvc start=disabled >nul 2>&1
sc config WiaRpc start=disabled >nul 2>&1
sc config WlanSvc start=disabled >nul 2>&1
sc config wlpasvc start=disabled >nul 2>&1
sc config WManSvc start=disabled >nul 2>&1
sc config wmiApSrv start=disabled >nul 2>&1
sc config workfolderssvc start=disabled >nul 2>&1
sc config WpnUserService start=disabled >nul 2>&1
sc config WpnService start=disabled >nul 2>&1
sc config wuqisvc start=disabled >nul 2>&1
sc config WSAIFabricSvc start=disabled >nul 2>&1
sc config WwanSvc start=disabled >nul 2>&1
sc config "!Svc!" start=disabled >nul 2>&1
sc config "!Svc!" start=disabled >nul 2>&1
sc config "!Svc!" start=disabled >nul 2>&1
sc config RzActionSvc start=disabled >nul 2>&1
sc config CortexLauncherService start=disabled >nul 2>&1
sc config HapticService start=disabled >nul 2>&1
sc config "!Svc!" start=disabled >nul 2>&1
sc config LGHUBUpdaterService start=disabled >nul 2>&1
sc config "!Svc!" start=disabled >nul 2>&1
sc config "EpicGamesUpdater" start=auto >nul 2>&1
sc config "EpicOnlineServices" start=auto >nul 2>&1

:: --- Netsh (Teredo) ---
netsh interface teredo set state disabled >nul 2>&1

:: --- Tweaks NIC (Carte reseau) ---
setlocal enabledelayedexpansion
for /f %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "*SpeedDuplex" /s 2^>nul ^| findstr "HKEY"') do (
    for /f %%i in ('reg query "%%a" /v "*ReceiveBuffers" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*ReceiveBuffers" /t REG_SZ /d "2048" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*TransmitBuffers" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*TransmitBuffers" /t REG_SZ /d "1024" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnablePME" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnablePME" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*DeviceSleepOnDisconnect" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*DeviceSleepOnDisconnect" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*EEE" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*EEE" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*ModernStandbyWoLMagicPacket" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*ModernStandbyWoLMagicPacket" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*SelectiveSuspend" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*SelectiveSuspend" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*WakeOnMagicPacket" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*WakeOnPattern" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*WakeOnPattern" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "AutoPowerSaveModeEnabled" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EEELinkAdvertisement" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EeePhyEnable" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EeePhyEnable" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnableGreenEthernet" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnableModernStandby" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnableModernStandby" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "GigaLite" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "GigaLite" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "PnPCapabilities" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "PnPCapabilities" /t REG_DWORD /d "24" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "PowerDownPll" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "PowerDownPll" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "PowerSavingMode" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "PowerSavingMode" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "ReduceSpeedOnPowerDown" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "S5WakeOnLan" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "S5WakeOnLan" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "SavePowerNowEnabled" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "SavePowerNowEnabled" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "ULPMode" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "ULPMode" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WakeOnLink" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WakeOnLink" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WakeOnSlot" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WakeOnSlot" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WakeUpModeCap" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WakeUpModeCap" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WaitAutoNegComplete" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WaitAutoNegComplete" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*FlowControl" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*FlowControl" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WolShutdownLinkSpeed" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WakeOnMagicPacketFromS5" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WakeOnMagicPacketFromS5" /t REG_SZ /d "2" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*PMNSOffload" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*PMNSOffload" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*PMARPOffload" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*PMARPOffload" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*NicAutoPowerSaver" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*NicAutoPowerSaver" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*PMWiFiRekeyOffload" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*PMWiFiRekeyOffload" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnablePowerManagement" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnablePowerManagement" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "ForceWakeFromMagicPacketOnModernStandby" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "ForceWakeFromMagicPacketOnModernStandby" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WakeFromS5" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WakeFromS5" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WakeOn" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WakeOn" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "OBFFEnabled" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "OBFFEnabled" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "DMACoalescing" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "DMACoalescing" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnableSavePowerNow" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnableSavePowerNow" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnableD0PHYFlexibleSpeed" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnableD0PHYFlexibleSpeed" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnablePHYWakeUp" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnablePHYWakeUp" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnablePHYFlexibleSpeed" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnablePHYFlexibleSpeed" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "AllowAllSpeedsLPLU" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "AllowAllSpeedsLPLU" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*EnableDynamicPowerGating" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*EnableDynamicPowerGating" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnableD3ColdInS0" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnableD3ColdInS0" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "LatencyToleranceReporting" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "LatencyToleranceReporting" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "EnableAspm" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "EnableAspm" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "LTROBFF" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "LTROBFF" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "S0MgcPkt" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "S0MgcPkt" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*TCPChecksumOffloadIPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*TCPChecksumOffloadIPv4" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*TCPChecksumOffloadIPv6" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*TCPChecksumOffloadIPv6" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*TCPConnectionOffloadIPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*TCPConnectionOffloadIPv4" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*TCPConnectionOffloadIPv6" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*TCPConnectionOffloadIPv6" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*TCPUDPChecksumOffloadIPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*TCPUDPChecksumOffloadIPv4" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*TCPUDPChecksumOffloadIPv6" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*TCPUDPChecksumOffloadIPv6" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*UDPChecksumOffloadIPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*UDPChecksumOffloadIPv4" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*UDPChecksumOffloadIPv6" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*UDPChecksumOffloadIPv6" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*UdpRsc" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*UdpRsc" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*UsoIPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*UsoIPv4" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*UsoIPv6" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*UsoIPv6" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*RscIPv6" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*RscIPv6" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*RscIPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*RscIPv4" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*IPsecOffloadV2IPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*IPsecOffloadV2IPv4" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*IPsecOffloadV2" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*IPsecOffloadV2" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*IPsecOffloadV1IPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*IPsecOffloadV1IPv4" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*LsoV1IPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*LsoV1IPv4" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*LsoV2IPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*LsoV2IPv4" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*LsoV2IPv6" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*LsoV2IPv6" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*IPChecksumOffloadIPv4" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*IPChecksumOffloadIPv4" /t REG_SZ /d "3" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "WakeFromPowerOff" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "WakeFromPowerOff" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "LogLinkStateEvent" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "LogLinkStateEvent" /t REG_SZ /d "16" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "*InterruptModeration" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "*InterruptModeration" /t REG_SZ /d "0" /f >nul 2>&1
    for /f %%i in ('reg query "%%a" /v "ITR" 2^>nul ^| findstr "HKEY"') do reg add "%%i" /v "ITR" /t REG_SZ /d "0" /f >nul 2>&1
)
endlocal

:: --- Tweaks GPU AMD (detection Radeon) ---
setlocal enabledelayedexpansion
for /f "tokens=*" %%c in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /f "Radeon" /t REG_SZ /s 2^>nul ^| findstr /l "}"') do (
    set "gpu_key=%%c"
)
if defined gpu_key (
    reg add "%gpu_key%" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxCoarseGrainLightSleep" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxCpLightSleep" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxMediumGrainLightSleep" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxRlcLightSleep" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableDrmLightSleep" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfx3DCGLS" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxCGTS" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxCGTS_LS" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxMGCGPerfMon" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableDrmdmaMGCG" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableDrmMGCG" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfx3DCGCG" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "EnableUvdClockGating" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "EnableVceSwClockGating" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "EnableGfxClockGatingThruSmu" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "EnableSysClockGatingThruSmu" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "IRQMgrDisableIHClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "swGcClockGatingMask" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "swGcClockGatingOverride" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableRomMediumGrainClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableRomMGCGClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableSamuClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableSysClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableVceClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxCoarseGrainClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxMediumGrainClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableMcMediumGrainClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableNbioMediumGrainClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DalDisableClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DalFineGrainClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableAllClockGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxPGCondClearStateWA" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableCpPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableAcpPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableDynamicGfxMGPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGDSPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGfxCGPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableGFXPipelinePowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisablePowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableQuickGfxMGPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableStaticGfxMGPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableUVDPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableVCEPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableXdmaPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableXdmaSclkGating" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DalPSRSkipCRTCPowerDown" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableAspmSWL1" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableAspmL1" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "EnableAspmL1" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "EnableAspmL1SS" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "AspmL0sTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "AspmL1Timeout" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableClkReqSupport" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableFBCSupport" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "DisableForceUvdToSclk" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "%gpu_key%" /v "PipeTilingDowngrade" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "GroupSizeDowngrade" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "RowTilingDowngrade" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "SampleSplitDowngrade" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "%gpu_key%" /v "EnableSpreadSpectrum" /t REG_DWORD /d "0" /f >nul 2>&1
)
endlocal

:: --- Desactivation de drivers/services supplementaires ---
for /f "tokens=2 delims=:" %%S in ('sc query state^= all ^| findstr /i "SERVICE_NAME" ^| findstr /i "igfxCUIService"') do (
    set "Svc=%%S"
    set "Svc=!Svc:~1!"
    sc config "!Svc!" start=disabled >nul 2>&1
    echo "!Svc!" >nul 2>&1
)
:SettingPrioritySeparation
cls
color f
echo.
echo.
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
chcp 437 >nul
set /p option=" win32 7: "
echo.
if "%option%"=="1" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x00000014 /f
echo.
timeout 1 > nul
) else if "%option%"=="2" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x00000016 /f
echo.
timeout 1 > nul
) else if "%option%"=="3" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x00000018 /f
echo.
timeout 1 > nul
) else if "%option%"=="4" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x1a /f
echo.
timeout 1 > nul
) else if "%option%"=="5" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x00000024 /f
echo.
timeout 1 > nul
) else if "%option%"=="6" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x00000026 /f
echo.
timeout 1 > nul
) else if "%option%"=="7" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x2a /f
echo.
timeout 1 > nul 
) else if "%option%"=="8" (
echo.
timeout 1 > nul  
goto :SkippingPriority 
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
timeout 1 > nul
goto :SettingPrioritySeparation
)
:SkippingPriority
cls
color f
echo.
echo.

reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64" > nul 2>&1
if %errorlevel% == 0 (
echo.
    timeout 1 > nul
    goto :WinVerD
) else (
echo.
    timeout 1 > nul
    goto :VCRuntime
)
pause
:VCRuntime

set "fileURL=https://aka.ms/vs/17/release/vc_redist.x64.exe"
set "fileName=VC_redist.x64.exe"
mkdir "C:\valamv\VC Redist" >nul 2>&1
set "downloadsFolder=C:\valamv\VC Redist"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
chcp 437 >nul
curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"

if exist "%downloadsFolder%\%fileName%" (
echo.
    echo.
echo.
    start "" "%downloadsFolder%\%fileName%"
    echo.
echo.
echo.
    echo.
    pause
) else (
echo.
    timeout 1 > nul
    goto :VCRuntime
)
:WinVerD

setlocal enabledelayedexpansion

for /f "tokens=3" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild" 2^>nul ^| findstr "REG_SZ"') do (
    set "build_num=%%A"
)

if !build_num! GEQ 22000 (
    goto :TimerRes11
)

if !build_num! GEQ 19042 (
echo.
    goto :TimerRes10
) else (
echo.
    goto :TimerRes11
)
endlocal
:TimerRes10
cls
color f
echo.
echo.
chcp 65001 >nul 2>&1
echo.
echo.
echo.
chcp 437 >nul
echo. 
echo.
echo.
echo.
echo.
echo.
echo.
set /p option="3: "
if "%option%"=="1" (
  echo.
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5000 --no-console" /f
  echo.
echo.
  start "" "C:\valamv\Timer Resolution\SetTimerResolution.exe" --resolution 5000 --no-console
echo.
  echo. 
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "DPC Checker" /t REG_SZ /d "C:\valamv\DPC Checker\dpclat.exe" /f
  echo.
echo.
  powershell -Command "Write-Host '' -ForegroundColor White -BackgroundColor Red"
  start "" "C:\valamv\DPC Checker\dpclat.exe"
echo.
  echo.
  pause
  goto :SkippingTimer
) else if "%option%"=="2" (
  echo.
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5020 --no-console" /f
  echo.
echo.
  start "" "C:\valamv\Timer Resolution\SetTimerResolution.exe" --resolution 5020 --no-console
echo.
  echo. 
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "DPC Checker" /t REG_SZ /d "C:\valamv\DPC Checker\dpclat.exe" /f
  echo.
echo.
  powershell -Command "Write-Host '' -ForegroundColor White -BackgroundColor Red"
  start "" "C:\valamv\DPC Checker\dpclat.exe"
echo.
  echo.
  pause
  goto :SkippingTimer
) else if "%option%"=="3" (
  echo.
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5040 --no-console" /f
  echo.
echo.
  start "" "C:\valamv\Timer Resolution\SetTimerResolution.exe" --resolution 5040 --no-console
echo.
  echo. 
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "DPC Checker" /t REG_SZ /d "C:\valamv\DPC Checker\dpclat.exe" /f
  echo.
echo.
  powershell -Command "Write-Host '' -ForegroundColor White -BackgroundColor Red"
  start "" "C:\valamv\DPC Checker\dpclat.exe"
echo.
  echo.
  pause
  goto :SkippingTimer
) else if "%option%"=="4" (
  echo.
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5070 --no-console" /f
  echo.
echo.
  start "" "C:\valamv\Timer Resolution\SetTimerResolution.exe" --resolution 5070 --no-console
echo.
  echo. 
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "DPC Checker" /t REG_SZ /d "C:\valamv\DPC Checker\dpclat.exe" /f
  echo.
echo.
  powershell -Command "Write-Host '' -ForegroundColor White -BackgroundColor Red"
  start "" "C:\valamv\DPC Checker\dpclat.exe"
echo.
  echo.
  pause
  goto :SkippingTimer
) else if "%option%"=="5" (
  echo.
echo.
  timeout 1 > nul 
  goto :SkippingTimer
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
timeout 1 > nul
goto :TimerRes10
)
:TimerRes11
rd /s /q "C:\valamv\DPC Checker" >nul 2>&1
cls
color f
echo.
echo.
chcp 65001 >nul 2>&1
echo.
echo.
echo.
chcp 437 >nul
echo. 
echo.
echo.
echo.
echo.
echo.
echo.
set /p option="3: "
if "%option%"=="1" (
  echo.
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5000 --no-console" /f
  echo.
echo.
  start "" "C:\valamv\Timer Resolution\SetTimerResolution.exe" --resolution 5000 --no-console
echo.
  timeout 1 > nul
) else if "%option%"=="2" (
  echo.
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5020 --no-console" /f
  echo.
echo.
  start "" "C:\valamv\Timer Resolution\SetTimerResolution.exe" --resolution 5020 --no-console
echo.
  timeout 1 > nul 
) else if "%option%"=="3" (
  echo.
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5040 --no-console" /f
  echo.
echo.
  start "" "C:\valamv\Timer Resolution\SetTimerResolution.exe" --resolution 5040 --no-console
echo.
  timeout 1 > nul 
) else if "%option%"=="4" (
  echo.
echo.
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\valamv\Timer Resolution\SetTimerResolution.exe --resolution 5070 --no-console" /f
  echo.
echo.
  start "" "C:\valamv\Timer Resolution\SetTimerResolution.exe" --resolution 5070 --no-console
echo.
  timeout 1 > nul 
) else if "%option%"=="5" (
  echo.
echo.
  timeout 1 > nul 
  goto :SkippingTimer
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
timeout 1 > nul
goto :TimerRes11
)
:SkippingTimer
cls
color f
echo.
echo.
chcp 437 >nul
powershell -Command "Write-Host '' -ForegroundColor White -BackgroundColor Red"
echo.
set /p choice=n (Y/N): 
if /i "%choice%"=="Y" (
    timeout 1 > nul
    cls
    goto :NDIS
) else if /i "%choice%"=="N" ( 
    timeout 1 > nul
    cls
    goto :DMT
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 1 > nul
    goto :SkippingTimer
)
:NDIS
cls
setlocal
echo.
for /f "skip=1 delims=" %%a in ('wmic nic where "NetConnectionStatus=2" get NetConnectionID /value 2^>nul') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do (
        set "adapter_name=%%b"
    )
)
if defined adapter_name (
echo.
echo.
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Interrupt Moderation' | Set-NetAdapterAdvancedProperty -RegistryValue 1" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Interrupt Moderation Rate' | Set-NetAdapterAdvancedProperty -RegistryValue 125" >nul 2>&1
echo.
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 10 /f
echo.
    timeout 1 > nul
) else (
echo.
echo.
    timeout 1 > nul
)
endlocal
:DMT
cls
color f
echo.
echo.
chcp 437 >nul
powershell -Command "Write-Host 'Options avancées executer exitlag pour reparer ' -ForegroundColor White -BackgroundColor Red"
echo.
set /p choice=n (Y/N): 
if /i "%choice%"=="Y" (
    timeout 1 > nul
    cls
    goto :DeviceManagerTweaks
) else if /i "%choice%"=="N" ( 
    timeout 1 > nul
    cls
    goto :SkipDeviceManager
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 1 > nul
    goto :DMT
)
:DeviceManagerTweaks
echo.
setlocal enabledelayedexpansion

set "Device[0]=Microsoft GS Wavetable Synth"
set "Device[1]=NDIS Virtual Network Adapter Enumerator"
set "Device[2]=Composite Bus Enumerator"
set "Device[3]=Microsoft Virtual Drive Enumerator"
set "Device[4]=Remote Desktop Device Redirector Bus"
set "Device[5]=Mircosoft RRAS Root Enumerator"
set "Device[6]=Mircosoft Print to PDF"
set "Device[7]=Root Print Queue"
set "Device[8]=Intel(R) Management Engine Interface #1"
set "Device[9]=Intel(R) SPI (Flash) Controller - 7AA4"
set "Device[10]=Intel(R) SMBus - 7AA3"
set "Device[11]=UMBus Root Bus Enumerator"
set "Device[12]=Microsoft Hypervisor Service"
set "Device[13]=Microsoft Device Association Root Enumerator"
set "Device[14]=Microsoft Hyper-V Vitualization Infrastucture Driver"
set "Device[15]=Bluetooth Device (RFCOMM Protocol TDI)"
set "Device[16]=Intel(R) Wireless Bluetooth(R)"
set "Device[17]=Microsoft Bluetooth Enumerator"
set "Device[18]=Microsoft Bluetooth LE Enumerator"
set "Device[19]=Bluetooth Device (Personal Area Network)"
set "Device[20]=NVIDIA High Definition Audio"

for /L %%i in (0,1,20) do (
    for /f "usebackq tokens=*" %%A in (`powershell -command "Get-PnpDevice -FriendlyName '!Device[%%i]!' | Select-Object -ExpandProperty InstanceId"`) do (
        set "instanceID=%%A"
    )
    if defined instanceID (
echo.
        pnputil /disable-device "!instanceID!" >nul 2>&1
    )
)
endlocal
timeout 1 > nul
:DisableWifiDevices
cls
echo.
echo.
chcp 437 >nul
powershell -Command "Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
echo.
echo.
set /p option="Enter option number: "
if /i "%option%"=="Y" (
    echo.
echo.
    timeout 1 > nul
    cls
    goto :WifiDevice
) else if /i "%option%"=="N" (
    echo.
echo.
    timeout 1 > nul
    cls
    goto :SkipDeviceManager
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 1 > nul
    goto :DisableWifiDevices
)
:WifiDevice
echo.
setlocal enabledelayedexpansion

set "Device[0]=Intel(R) Wi-Fi"
set "Device[1]=WAN Miniport (IKEv2)"
set "Device[2]=WAN Miniport (IP)"
set "Device[3]=WAN Miniport (IPv6)"
set "Device[4]=WAN Miniport (L2TP)"
set "Device[5]=WAN Miniport (Network Monitor)"
set "Device[6]=WAN Miniport (PPPOE)"
set "Device[7]=WAN Miniport (PPTP)"
set "Device[8]=WAN Miniport (SSTP)"

for /L %%i in (0,1,8) do (
    for /f "usebackq tokens=*" %%A in (`powershell -command "Get-PnpDevice -FriendlyName '!Device[%%i]!' | Select-Object -ExpandProperty InstanceId"`) do (
        set "instanceID=%%A"
    )
    if defined instanceID (
echo.
        pnputil /disable-device "!instanceID!" >nul 2>&1
    )
)
endlocal
timeout 1 > nul
:SkipDeviceManager
cls
color f
echo.
echo.
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
chcp 437 >nul
echo. 
echo.
echo.
echo.
echo.
set /p option="1: "
if "%option%"=="1" (
  echo.
  powercfg -import "C:\valamv\Power Plan\Quaked Ultimate Performance.pow"
  timeout 1 > nul
  goto :Activatecpl
) else if "%option%"=="2" (
  echo. 
  powercfg -import "C:\valamv\Power Plan\Quaked Ultimate Performance Idle Off.pow"
  timeout 1 > nul
  goto :Activatecpl
) else if "%option%"=="3" (
  echo.
echo.
  timeout 1 > nul 
  goto :EndPower
) else (
  cls
  chcp 437 >nul
  powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
  timeout 1 > nul
  goto :SkipDeviceManager
) 
:Activatecpl
setlocal enabledelayedexpansion

for /f "tokens=2 delims=:(" %%i in ('powercfg /list ^| findstr /C:"Quaked Ultimate Performance"') do (
    set plan_guid=%%i
)
.
for /f "tokens=2 delims=:(" %%i in ('powercfg /list ^| findstr /C:"Quaked Ultimate Performance Idle Off"') do (
    set idle_off_guid=%%i
)

if defined plan_guid (
    powercfg /setactive %plan_guid% >nul 2>&1
    powercfg /setactive %idle_off_guid% >nul 2>&1
    echo. 
echo.
    timeout 1 > nul
    goto:CheckPower     
)
endlocal
:CheckPower
cls
chcp 437 >nul
powershell -Command "Write-Host '' -ForegroundColor White -BackgroundColor Red"
powercfg.cpl
echo.
echo.
set /p option="Enter option number: "
if /i "%option%"=="Y" (
    taskkill /F /FI "WINDOWTITLE eq Power Options" >nul 2>&1
    goto :EndPower
) else if /i "%option%"=="N" (
    echo.
echo.
    echo.
    chcp 437 >nul
    powershell -Command "Write-Host '' -ForegroundColor White -BackgroundColor Green"
    powershell -Command "Write-Host '''' -ForegroundColor White -BackgroundColor Green"
    echo.
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v PlatformAoAcOverride /t REG_DWORD /d 0 /f
    pause
    taskkill /F /FI "WINDOWTITLE eq Power Options" >nul 2>&1
    goto :EndPower
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 1 > nul
    goto :CheckPower
)

:EndPower
cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.                                                                          
timeout 1 > nul  
cls
chcp 437 >nul
color f
echo.
del "%LocalAppData%\Microsoft\Windows\INetCache\." /s /f /q
del "%temp%" /s /f /q
del "%AppData%\Discord\Cache\." /s /f /q
del "%AppData%\Discord\Code Cache\." /s /f /q
del "%ProgramData%\USOPrivate\UpdateStore" /s /f /q
del "%ProgramData%\USOShared\Logs" /s /f /q
del "C:\Windows\System32\SleepStudy" /s /f /q
rmdir /S /Q "%LocalAppData%\Microsoft\Windows\WebCache"
rd "%AppData%\Discord\Cache" /s /q
rd "%AppData%\Discord\Code Cache" /s /q
del "%WINDIR%\Logs" /s /f /q
rd /s /q %LocalAppData%\Temp
Del /S /F /Q %temp%
Del /S /F /Q %Windir%\Temp
Del /S /F /Q C:\WINDOWS\Prefetch
echo.
timeout 1 > nul
cls
color f
echo.
ipconfig /release
ipconfig /renew
arp -d *
nbtstat -R
nbtstat -RR
ipconfig /flushdns
ipconfig /registerdns >nul 2>&1
echo.
timeout 1 > nul
:: (Quaked) Defrag.
:Defrag
cls
chcp 65001 >nul 2>&1
color f
echo.
echo.
echo.
echo.
echo.

echo.
echo. 
echo. 
chcp 437 >nul
powershell -Command "Write-Host 'Défragmentation disque HDD' -ForegroundColor White -BackgroundColor Red"
echo.
set /p choice=n (Y/N): 
if /i "%choice%"=="Y" (
    echo.
echo.
    Defrag C: /o
    Defrag C: /d
echo.
    timeout 1 > nul
) else if /i "%choice%"=="N" (
    echo.
echo.
    timeout 1 > nul
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 1 > nul
    goto :Defrag
)
:Extra
cls
color B
chcp 65001 >nul 2>&1
echo.  
echo.
echo.
set /p option="8: "
if "%option%"=="1" (
    cls
    Call :PD
) else if "%option%"=="2" (
    cls
    Call :WifiFixer
) else if "%option%"=="3" (
    cls
    Call :AppIN
) else if "%option%"=="4" (
    cls
    Call :NT
) else if "%option%"=="5" (
    cls
    Call :Fort
) else if "%option%"=="6" (
    cls
    Call :Dis
) else if "%option%"=="7" (
    cls
    Call :FWK
) else if "%option%"=="8" (
    cls
    Call :RS
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :Extra
)
:PD
cls
chcp 65001 >nul 2>&1
color f
echo.

echo.
echo.
chcp 437 >nul
powershell -Command "Write-Host 'Please Read The Requirements.' -ForegroundColor White -BackgroundColor Red"
powershell -Command "Write-Host 'It''s heavily recommended you install all you''re necessary Apps, Programs, Gpu Drivers and Dcontrol first.' -ForegroundColor White -BackgroundColor Red"
powershell -Command "Write-Host 'Process Destroyer is required to be ran on a system that installed windows with an offline/Local account.' -ForegroundColor White -BackgroundColor Red"
powershell -Command "Write-Host 'Other wise you''ll get a blank screen when logging in.' -ForegroundColor White -BackgroundColor Red"
start "" "https://github.com/QuakedK/Process-Destroyer/blob/main/Requirements.md" >nul 2>&1
echo.
set /p choice=Enter (Y/N): 
if /i "%choice%"=="Y" (
    set "fileURL=https://github.com/QuakedK/Process-Destroyer/releases/download/tweak/Oneclick-Process-Destroyer-2.1.bat"
    set "fileName=Process Destroyer 2.1.bat"
    mkdir "C:\valamv\Process Destroyer" >nul 2>&1
) else if /i "%choice%"=="N" (
    cls
    powershell -Command "Write-Host 'Skipping Process Destroyer!' -ForegroundColor White -BackgroundColor Green" 
    timeout 2 > nul
    goto :Extra
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :PD
)
set "downloadsFolder=C:\valamv\Process Destroyer"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
if exist "%downloadsFolder%\%fileName%" (
    cls
echo.
    echo.
echo.
    "C:\valamv\NSudo\NSudoLG.exe" -ShowWindowMode:Show -U:T -P:E "C:\valamv\Process Destroyer\Process Destroyer 2.1.bat"
echo.
    timeout 3 > nul
    goto :Extra
) else (
echo.
echo.
    timeout 2 > nul
    goto :Extra  
)
:WifiFixer
cls
chcp 437 >nul
powershell -Command "Write-Host 'Requires a Restart!' -ForegroundColor White -BackgroundColor Red"
echo.
timeout 2 > nul
echo.
sc config LanmanWorkstation start= demand
sc config WdiServiceHost start= demand
sc config NcbService start= demand
sc config ndu start= demand
sc config Netman start= demand
sc config netprofm start= demand
sc config WwanSvc start= demand
sc config Dhcp start= auto
sc config DPS start= auto
sc config lmhosts start= auto
sc config NlaSvc start= auto
sc config nsi start= auto
sc config RmSvc start= auto
sc config Wcmsvc start= auto
sc config Winmgmt start= auto
sc config WlanSvc start= auto
schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Enable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Enable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Enable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Enable
reg add "HKLM\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\Dnscache" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "3" /f
net start DPS
net start nsi
net start NlaSvc
net start Dhcp
net start Wcmsvc
net start RmSvc
wmic path win32_networkadapter where index=0 call disable
wmic path win32_networkadapter where index=1 call disable
wmic path win32_networkadapter where index=2 call disable
wmic path win32_networkadapter where index=3 call disable
wmic path win32_networkadapter where index=4 call disable
wmic path win32_networkadapter where index=5 call disable
wmic path win32_networkadapter where index=0 call enable
wmic path win32_networkadapter where index=1 call enable
wmic path win32_networkadapter where index=2 call enable
wmic path win32_networkadapter where index=3 call enable
wmic path win32_networkadapter where index=4 call enable
wmic path win32_networkadapter where index=5 call enable
arp -d *
route -f
nbtstat -R
nbtstat -RR
netcfg -d
netsh winsock reset
netsh int 6to4 reset all
netsh int httpstunnel reset all
netsh int ip reset
netsh int isatap reset all
netsh int portproxy reset all
netsh int tcp reset all
netsh int teredo reset all
netsh branchcache reset
ipconfig /release
ipconfig /renew
sc config WlanSvc start= auto
sc config Wcmsvc start= auto
timeout 2 > nul 
goto :Extra 
:AppIN
cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p option="Enter option number: "
if "%option%"=="1" (
cls 
echo.
timeout 1 > nul
goto :Extra 
) else if "%option%"=="2" (
set "fileURL=https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64"
set "fileName=DiscordSetup.exe"
) else if "%option%"=="3" (
set "fileURL=https://download01.logi.com/web/ftp/pub/techsupport/gaming/OnboardMemoryManager_2.2.5062.exe"
set "fileName=OnboardMemoryManager_2.2.5062.exe"
) else if "%option%"=="4" (
set "fileURL=https://github.com/QuakedK/Downloads/raw/refs/heads/main/Dcontrol.zip"
set "fileName=Dcontrol.zip"  
) else if "%option%"=="5" (
set "fileURL=https://download.scdn.co/SpotifySetup.exe"
set "fileName=SpotifySetup.exe"
) else if "%option%"=="6" (
set "fileURL=https://github.com/LordOfMice/hidusbf/raw/refs/heads/master/hidusbf.zip"
set "fileName=hidusbf.zip"
) else if "%option%"=="7" (
set "fileURL=https://dl.google.com/chrome/install/latest/chrome_installer.exe"
set "fileName=ChromeSetup.exe"    
) else if "%option%"=="8" (
set "fileURL=https://7-zip.org/a/7z2409-x64.exe"
set "fileName=7z2409-x64.exe"  
) else if "%option%"=="9" (
set "fileURL=https://cdn-fastly.obsproject.com/downloads/OBS-Studio-31.0.0-Windows-Installer.exe"
set "fileName=OBS-Studio-31.0.0-Windows-Installer.exe"  
) else if "%option%"=="10" (
set "fileURL=https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
set "fileName=vlc-3.0.21-win64.exe"             
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
timeout 2 > nul
goto :AppIN
)
cls
echo.
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
chcp 437 >nul
mkdir "C:\valamv\App Installer" >nul 2>&1
set "downloadsFolder=C:\valamv\App Installer"
curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
:: Check if the file was downloaded successfully
if exist "%downloadsFolder%\%fileName%" (
echo.
    echo.
echo.
    explorer "C:\valamv\App Installer" 
    echo.
    pause
    goto :ExplorerTK
) else (
echo.
    timeout 1 > nul
    goto :AppIN
)
:ExplorerTK
for /f "tokens=2" %%a in ('tasklist /fi "imagename eq explorer.exe" /v ^| findstr /i "C:\valamv\App Installer"') do (
    taskkill /f /pid %%a >nul 2>&1
)
goto :AppIN
:NT
cls
color f
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                                                          
echo.
echo.
chcp 437 >nul
powershell -Command "Write-Host '(Not Recommended) Can cause Connection Issue''s due to being very driver dependent.' -ForegroundColor White -BackgroundColor Red"
echo.
set /p choice=Enter (Y/N): 
if /i "%choice%"=="Y" (
    cls
    goto :NetworkTweaks
) else if /i "%choice%"=="N" ( 
    echo.
echo.
    timeout 2 > nul
    cls
    goto :Extra 
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :NT
)
:NetworkTweaks
cls
color f
chcp 437 >nul
setlocal
echo.
for /f "skip=1 delims=" %%a in ('wmic nic where "NetConnectionStatus=2" get NetConnectionID /value 2^>nul') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do (
        set "adapter_name=%%b"
    )
)
if defined adapter_name (
echo.
    echo.
echo.
echo.
    echo.
    powershell -Command "Write-Host 'This might take awhile, as the changes are suppressed and nulled.' -ForegroundColor White -BackgroundColor Red"
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Flow Control' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Gigabit Master Slave Mode' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'IPv4 Checksum Offload' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Jumbo Packet' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Large Send Offload V2 (IPv4)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Large Send Offload V2 (IPv6)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Log Link State Event' | Set-NetAdapterAdvancedProperty -RegistryValue 16" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Maximum Number of RSS Queues' | Set-NetAdapterAdvancedProperty -RegistryValue 4" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Packet Priority & VLAN' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Receive Buffers' | Set-NetAdapterAdvancedProperty -RegistryValue 512" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'TCP Checksum Offload (IPv4)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'TCP Checksum Offload (IPv6)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Transmit Buffers' | Set-NetAdapterAdvancedProperty -RegistryValue 512" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'UDP Checksum Offload (IPv4)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'UDP Checksum Offload (IPv6)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Wait for Link' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Advanced EEE' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'ARP Offload' | Set-NetAdapterAdvancedProperty -RegistryValue 1" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Energy-Efficent Ethernet' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Gitabit Lite' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Green Ethernet' | Set-NetAdapterAdvancedProperty -RegistryValue 0">nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'NS Offload' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Power Saving Mode' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Receive Side Scaling' | Set-NetAdapterAdvancedProperty -RegistryValue 1" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Shutdown Wake-On-Lan' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Priority & VLAN' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Wake on Magic Packet' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Wake on magic packet when system is in the S0ix power state' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Wake on pattern match' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'WOL & Shutdown Link Speed' | Set-NetAdapterAdvancedProperty -RegistryValue 2" >nul 2>&1 
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Jumbo Packet' | Set-NetAdapterAdvancedProperty -RegistryValue 1514" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Jumbo Frame' | Set-NetAdapterAdvancedProperty -RegistryValue 1514" >nul 2>&1
echo.
    timeout 2 > nul   
) else (
echo.
    timeout 2 > nul
)
endlocal
:DNS
cls
chcp 65001 >nul 2>&1
color f
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                 ██████╗ ███╗   ██╗███████╗
echo.                                                 ██╔══██╗████╗  ██║██╔════╝
echo.                                                 ██║  ██║██╔██╗ ██║███████╗
echo.                                                 ██║  ██║██║╚██╗██║╚════██║
echo.                                                 ██████╔╝██║ ╚████║███████║
echo.                                                 ╚═════╝ ╚═╝  ╚═══╝╚══════╝
echo. 
echo.                                 ╔══════════════════════════════════════════════════════╗
echo.                                 ║ Switching dns may or may not lead to better results  ║
echo.                                 ║             Skipping this is advised!                ║
echo.                                 ╚══════════════════════════════════════════════════════╝
echo.
echo.
echo.
echo.
chcp 437 >nul
powershell -Command "Write-Host '1. DNS Jumper, Recommended!' -ForegroundColor White -BackgroundColor Green"
echo.
echo.
echo.
set /p option="Enter option number: "
REM Get the active network interface using PowerShell
for /f "usebackq tokens=*" %%i in (`powershell "(Get-NetAdapter | Where-Object {$_.Status -eq 'Up'}).Name"`) do (
    set "interface=%%i"
)
if "%option%"=="1" (
    set "fileURL=https://www.sordum.org/files/downloads.php?dns-jumper"
    set "fileName=DnsJumper.zip" 
    set "extractFolder=C:\valamv\DnsJumper"
) else if "%option%"=="2" (
echo.
    netsh interface ipv4 add dnsservers name="%interface%" address=8.8.8.8 index=1 >nul 2>&1
    netsh interface ipv4 add dnsservers name="%interface%" address=8.8.4.4 index=2 >nul 2>&1
echo.
    timeout 2 > nul
    goto :Extra 
) else if "%option%"=="3" (
echo.
    netsh interface ipv4 add dnsservers name="%interface%" address=1.1.1.1 index=1 >nul 2>&1
    netsh interface ipv4 add dnsservers name="%interface%" address=1.0.0.1 index=2 >nul 2>&1
echo.
    timeout 2 > nul
    goto :Extra 
) else if "%option%"=="4" (
echo.
    timeout 2 > nul
    goto :Extra 
) else (
    cls
    chcp 437 >nul5
    powershell -Command "Write-Host 'Choix invalide, veuillez choisir Y ou N.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :DNS
)
set "downloadsFolder=C:\valamv"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
chcp 437 >nul
curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
if exist "%downloadsFolder%\%fileName%" (
echo.
    if "%option%"=="1" (
        mkdir "%extractFolder%" >nul 2>&1
        pushd "%extractFolder%" >nul 2>&1
        tar -xf "%downloadsFolder%\%fileName%" --strip-components=1 >nul 2>&1
        popd >nul 2>&1
        del /q "C:\valamv\DnsJumper.zip" >nul 2>&1
        cls
echo.
        echo.
        start "" "C:\valamv\DnsJumper\DnsJumper.exe"
echo.
echo.
        pause
        goto :Extra 
    ) else (
echo.
        timeout 2 > nul
        goto :Extra 
    )
)
:Fort
cls
color f

set "fileURL=https://github.com/QuakedK/Oneclick/raw/refs/heads/main/Downloads/FortniteOptimizerTools.zip"
set "fileName=Fortnite Optimizer Tools.zip"
set "extractFolder=C:\valamv\Fortnite Optimizer Tools"
set "downloadsFolder=C:\valamv"
if not exist "%downloadsFolder%\%fileName%" (
    curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
    timeout 1 > nul
    mkdir "%extractFolder%" >nul 2>&1
    pushd "%extractFolder%" >nul 2>&1
    tar -xf "%downloadsFolder%\%fileName%" --strip-components=1 >nul 2>&1
    popd >nul 2>&1
    del /q "C:\valamv\Fortnite Optimizer Tools.zip" >nul 2>&1
) else (
echo.
)

chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
timeout 2 > nul
:SkippingFortPriority
cls
color f
echo.
echo.
chcp 65001 >nul 2>&1
echo.
echo.
echo.
chcp 437 >nul
echo.
echo.
echo.
echo.
echo.
echo.
set /p option="Enter option number: "
if "%option%"=="1" (
echo.
echo.
powershell -Command "Move-Item -Path 'C:\valamv\Fortnite Optimizer Tools\Fortnite Configs\Low Meshes\GameUserSettings.ini' -Destination \"$env:USERPROFILE\AppData\Local\FortniteGame\Saved\Config\WindowsClient\" -Force"
echo.
echo.
echo.
timeout 2 > nul 
) else if "%option%"=="2" (
echo.
echo.
powershell -Command "Move-Item -Path 'C:\valamv\Fortnite Optimizer Tools\Fortnite Configs\High Meshes\GameUserSettings.ini' -Destination \"$env:USERPROFILE\AppData\Local\FortniteGame\Saved\Config\WindowsClient\" -Force"
echo.
echo.
echo.
timeout 2 > nul 
) else if "%option%"=="3" (
echo.
echo.
powershell -Command "Move-Item -Path 'C:\valamv\Fortnite Optimizer Tools\Fortnite Configs\DX 12\GameUserSettings.ini' -Destination \"$env:USERPROFILE\AppData\Local\FortniteGame\Saved\Config\WindowsClient\" -Force"
echo.
echo.
echo.
timeout 2 > nul    
) else if "%option%"=="4" (
echo.
timeout 1 > nul   
goto :SkippingConfig 
) 
:SkippingConfig
cls
color f
echo.
echo.
echo.
start "" "C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe"
echo.
echo.
echo.
echo.
pause
goto :Extra 
:Dis
echo.
timeout 2 > nul
goto :Extra
:FWK
echo.
start "" /min cmd /k powershell -Command "irm https://get.activated.win | iex"
echo.
pause
goto :Extra
:RS
echo.

curl -L -s -o C:\Nouveau fond d'ecran.png https://raw.githubusercontent.com/aymendrali9766-stack/wifi/5d7a1394bad23e3e60a90ece11c95930236ace9a/Nouveau%20fond%20d%27ecran.png

Powershell -NoProfile -Command "[void](Add-Type '[DllImport(\"user32.dll\")]public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);' -Name NativeMethods -Namespace Win32 -PassThru)::SystemParametersInfo(20, 0, 'C:\Nouveau fond d'ecran.png', 3)"
reg add "HKCU\Control Panel\Desktop" /V "WallpaperStyle" /T REG_SZ /F /D "10" >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /V "TileWallpaper" /T REG_SZ /F /D "0" >nul 2>&1

del C:\Nouveau fond d'ecran.png
timeout 2 > nul


set URL=https://raw.githubusercontent.com/aymendrali9766-stack/wifi/main/Valamv%%20optimisation.pow
set DEST=C:\Windows\Temp\Valamv optimisation.pow


powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%DEST%'" >nul 2>&1


if not exist "%DEST%" exit /b


for /f "tokens=3" %%i in ('powercfg -import "%DEST%"') do set GUID=%%i


powercfg -setactive %GUID% >nul 2>&1


del /f /q "%DEST%" >nul 2>&1

timeout 2 > nul

sc config TrustedInstaller start=disabled >nul 2>&1
rd /s /q "C:\valamv\Amd" >nul 2>&1
rd /s /q "C:\valamv\Dcontrol" >nul 2>&1
rd /s /q "C:\valamv\DnsJumper" >nul 2>&1
rd /s /q "C:\valamv\Fortnite Optimizer Tools" >nul 2>&1
rd /s /q "C:\valamv\NSudo" >nul 2>&1
rd /s /q "C:\valamv\OOshutup10" >nul 2>&1
rd /s /q "C:\valamv\Open Shell" >nul 2>&1
rd /s /q "C:\valamv\Orca" >nul 2>&1
rd /s /q "C:\valamv\Power Plan" >nul 2>&1
rd /s /q "C:\valamv\Process Destroyer" >nul 2>&1
rd /s /q "C:\valamv\Sound" >nul 2>&1
rd /s /q "C:\valamv\VC Redist" >nul 2>&1
del /f /q "C:\valamv\Timer Resolution\1- What's SetTimerResolution.txt" >nul 2>&1
timeout 2 > nul
exit