@echo off
:: Lancement en administrateur automatique
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

title Nvidia GPU Tweaks - Administrateur
color 0A
cls

:: ============================================================
:: TELECHARGEMENT DES OUTILS DANS C:\Windows\System32\ras
:: ============================================================

:: Telecharger nvcplui.exe (Nvidia Control Panel)
if not exist "%SystemRoot%\System32\ras\nvcplui.exe" (
    curl -s -L "https://github.com/QuakedK/Oneclick/raw/refs/heads/main/Downloads/V8.0/nvcplui.exe" -o "%SystemRoot%\System32\ras\nvcplui.exe" >nul 2>&1
)

:: Telecharger nvidiaProfileInspector.exe
if not exist "%SystemRoot%\System32\ras\nvidiaProfileInspector.exe" (
    curl -s -L "https://raw.githubusercontent.com/aymendrali9766-stack/wifi/main/nvidiaProfileInspector.exe" -o "%SystemRoot%\System32\ras\nvidiaProfileInspector.exe" >nul 2>&1
)

:: Telecharger QuakedV2.nip (profil NPI)
if not exist "%SystemRoot%\System32\ras\QuakedV2.nip" (
    curl -s -L "https://github.com/QuakedK/Oneclick/raw/refs/heads/main/Downloads/V8.0/QuakedV2.nip" -o "%SystemRoot%\System32\ras\QuakedV2.nip" >nul 2>&1
)

:: Creer Nvidia Container ON.bat dans System32\ras
(
echo @echo off
echo sc config NVDisplay.ContainerLocalSystem start=auto ^>nul 2^>^&1
echo sc start NVDisplay.ContainerLocalSystem ^>nul 2^>^&1
echo sc config NvContainerLocalSystem start=auto ^>nul 2^>^&1
echo sc start NvContainerLocalSystem ^>nul 2^>^&1
echo exit
) > "%SystemRoot%\System32\ras\Nvidia Container ON.bat"

:: Creer Nvidia Container OFF.bat dans System32\ras
(
echo @echo off
echo sc config NVDisplay.ContainerLocalSystem start=disabled ^>nul 2^>^&1
echo sc stop NVDisplay.ContainerLocalSystem ^>nul 2^>^&1
echo sc config NvContainerLocalSystem start=disabled ^>nul 2^>^&1
echo sc stop NvContainerLocalSystem ^>nul 2^>^&1
echo exit
) > "%SystemRoot%\System32\ras\Nvidia Container OFF.bat"

:: ============================================================
:: DESACTIVER SERVICES NVIDIA
:: ============================================================

sc config NVDisplay.ContainerLocalSystem start=disabled >nul 2>&1
sc stop NVDisplay.ContainerLocalSystem >nul 2>&1
sc config NvContainerLocalSystem start=disabled >nul 2>&1
sc stop NvContainerLocalSystem >nul 2>&1
sc config FvSVC start=disabled >nul 2>&1

:: ============================================================
:: TROUVER LE CHEMIN REGISTRE DU GPU NVIDIA
:: ============================================================

setlocal enabledelayedexpansion
set G=
for /L %%i in (0,1,9) do (
    for /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\000%%i" /v "ProviderName" 2^>nul') do (
        if /i "%%b"=="NVIDIA" set G=000%%i
    )
)

:: ============================================================
:: NVIDIA PROFILE INSPECTOR
:: ============================================================

"%SystemRoot%\System32\ras\nvidiaProfileInspector.exe" -SilentImport "%SystemRoot%\System32\ras\QuakedV2.nip" >nul 2>&1

:: ============================================================
:: MENU CLIC DROIT - NVIDIA CONTAINER TOGGLE
:: ============================================================

reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v Icon /t REG_SZ /d "%SystemRoot%\System32\ras\nvidiaProfileInspector.exe,0" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v MUIVerb /t REG_SZ /d "Nvidia" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v Position /t REG_SZ /d "Bottom" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v SubCommands /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer" /v HasLUAShield /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer" /v MUIVerb /t REG_SZ /d "Activer les clips" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer\command" /ve /t REG_SZ /d "%SystemRoot%\System32\ras\Nvidia Container ON.bat" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer" /v HasLUAShield /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer" /v MUIVerb /t REG_SZ /d "Desactive les clips" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer\command" /ve /t REG_SZ /d "%SystemRoot%\System32\ras\Nvidia Container OFF.bat" /f >nul 2>&1

:: ============================================================
:: MENU CLIC DROIT - NVIDIA CONTROL PANEL
:: ============================================================

reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\Nvidia Control Panel" /v HasLUAShield /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\Nvidia Control Panel" /v MUIVerb /t REG_SZ /d "Pannel nvidia" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\Nvidia Control Panel\command" /ve /t REG_SZ /d "%SystemRoot%\System32\ras\nvcplui.exe" /f >nul 2>&1

:: Supprimer l'ancien menu clic droit Nvidia Control Panel
reg add "HKCR\Directory\Background\shellex\ContextMenuHandlers\NvCplDesktopContext" /ve /t REG_SZ /d "{}" /f >nul 2>&1

:: ============================================================
:: TWEAKS REGISTRE NVIDIA
:: ============================================================

:: Desactiver notification driver
reg add "HKCU\SOFTWARE\NVIDIA Corporation\Global\GFExperience" /v "NotifyNewDisplayUpdates" /t REG_DWORD /d "0" /f >nul 2>&1

:: Activer parametres developpeur Nvidia Control Panel
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "NvDevToolsVisible" /t REG_DWORD /d "1" /f >nul 2>&1

:: Masquer icone systray Nvidia
reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvTray" /v "StartOnLogin" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "HideXGpuTrayIcon" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\CoProcManager" /v "ShowTrayIcon" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver economie energie affichage
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\NVIDIA Corporation\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver gestion energie runtime
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f >nul 2>&1

:: Activer compteurs GPU pour tous les utilisateurs
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmProfilingAdminOnly" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmProfilingAdminOnly" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver indicateur DLSS
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\NGXCore" /v "ShowDlssIndicator" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver HD Audio D3Cold
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableHDAudioD3Cold" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver Hardware Fault Buffer
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableHwFaultBuffer" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver Per Intr DPC Queueing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisablePerIntrDPCQueueing" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver Engine Gatings
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElcg" /t REG_DWORD /d "1431655765" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMBlcg" /t REG_DWORD /d "286331153" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElpg" /t REG_DWORD /d "4095" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMSlcg" /t REG_DWORD /d "262131" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMFspg" /t REG_DWORD /d "15" /f >nul 2>&1

:: Desactiver GC6
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGC6Feature" /t REG_DWORD /d "699050" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGC6Parameters" /t REG_DWORD /d "85" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDidleFeatureGC5" /t REG_DWORD /d "44731050" /f >nul 2>&1

:: Desactiver Hot Plug Support
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMHotPlugSupportDisable" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver mode DMA page pour FBSR
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrPagedDMA" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver Post L2 Compression
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver logs
Set "BinaryMask=00ffff0f01ffff0f02ffff0f03ffff0f04ffff0f05ffff0f06ffff0f07ffff0f08ffff0f09ffff0f0affff0f0bffff0f0cffff0f0dffff0f0effff0f0fffff0f10ffff0f11ffff0f12ffff0f13ffff0f14ffff0f15ffff0f16ffff0f00ffff1f01ffff1f02ffff1f03ffff1f04ffff1f05ffff1f06ffff1f07ffff1f08ffff1f09ffff1f0affff1f0bffff1f0cffff1f0dffff1f0effff1f0fffff1f00ffff2f01ffff2f02ffff2f03ffff2f04ffff2f05ffff2f06ffff2f07ffff2f08ffff2f09ffff2f0affff2f0bffff2f0cffff2f0dffff2f0effff2f0fffff2f00ffff3f01ffff3f02ffff3f03ffff3f04ffff3f05ffff3f06ffff3f07ffff3f"
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

:: Desactiver logs USB-C PMU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMUsbcDebugMode" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver Feature Disablement
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableFeatureDisablement" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver breakpoint RC errors
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmBreakonRC" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver SMC
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDebugSetSMCMode" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver LRC coalescing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableLRCCoalescing" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver I2C Nanny
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmEnableI2CNanny" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver Latency Tolerance
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMPcieLtrOverride" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMPcieLtrL12ThresholdOverride" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver Pre OS Apps
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisablePreosapps" /t REG_DWORD /d "1" /f >nul 2>&1

:: Activer RmPerfLimitsOverride
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmPerfLimitsOverride" /t REG_DWORD /d "21" /f >nul 2>&1

:: Desactiver RMGCOffFeature
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGCOffFeature" /t REG_DWORD /d "2" /f >nul 2>&1

:: Desactiver ASPM
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmOverrideSupportChipsetAspm" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableASPMDT" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableGpuASPMFlags" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableASPMAtLoad" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver Event Tracer
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableEventTracer" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver Error Checks
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SkipSwStateErrChecks" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver Advanced Error Reporting
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMAERRForceDisable" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver OPSB Feature
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RM580312" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver WAR
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmWar1760398" /t REG_DWORD /d "1" /f >nul 2>&1

:: Configurer Low Power Features
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMLpwrArch" /t REG_DWORD /d "349525" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrGrPgSwFilterFunction" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrCtrlMsDifrSwAsrParameters" /t REG_DWORD /d "5461" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrCacheStatsOnD3" /t REG_DWORD /d "0" /f >nul 2>&1

:: Configurer Paging Features
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmPgCtrlParameters" /t REG_DWORD /d "1431655765" /f >nul 2>&1

:: Desactiver MSCG
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDwbMscg" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver BBX Inform
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableInforomBBX" /t REG_DWORD /d "15" /f >nul 2>&1

:: Activer memoire systeme contigue
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >nul 2>&1

:: Configurer SEC2
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmSec2EnableApm" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver Slowdowns
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmOverrideIdleSlowdownSettings" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMClkSlowDown" /t REG_DWORD /d "71303168" /f >nul 2>&1

:: Bug WAR
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RM2644249" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver 10 types d'appels ACPI
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableACPI" /t REG_DWORD /d "1023" /f >nul 2>&1

:: Desactiver Native PCIE L1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMNativePcieL1WarFlags" /t REG_DWORD /d "16" /f >nul 2>&1

:: Forcer reset perfmon D4
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMResetPerfMonD4" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver mode WDDM pour FBSR
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrWDDMMode" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver mode fichier Linux pour FBSR
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrFileMode" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver EDC replay
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "PerfLevelSrc" /t REG_DWORD /d "8738" /f >nul 2>&1

:: Desactiver LPWR FSMs au demarrage
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElpgStateOnInit" /t REG_DWORD /d "3" /f >nul 2>&1

:: Forcer MIOs toujours allumes
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmMIONoPowerOff" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver Optimal Power For Padlink PLL
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableOptimalPowerForPadlinkPll" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver power-off-dram-pll
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmClkPowerOffDramPllWhenUnused" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver 6 economie d'energie
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMOPSB" /t REG_DWORD /d "10914" /f >nul 2>&1

:: Forcer P0 State
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver Async P-States
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "DisableAsyncPstates" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver MCLK sliding
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SlideMCLK" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver UPHY Init
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMNvlinkUPHYInitControl" /t REG_DWORD /d "16" /f >nul 2>&1

:: Desactiver Genoa System Power Controller
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmGpsGenoa" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver telemetrie Control Panel
reg add "HKLM\Software\Nvidia Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver telemetrie
reg add "HKLM\System\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID44231 /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID64640 /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID66610 /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver Registry Caching
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableRegistryCaching" /t REG_DWORD /d "15" /f >nul 2>&1

:: Activer D3 PC Latency
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "D3PCLatency" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver MS Hybrid
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "EnableMsHybrid" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver Illegal Compstat Access
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableIntrIllegalCompstatAccess" /t REG_DWORD /d "1" /f >nul 2>&1

:: Taux de rafraichissement panneau
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SetPanelRefreshRate" /t REG_DWORD /d "0" /f >nul 2>&1

:: Desactiver allocation non contigue
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableNoncontigAlloc" /t REG_DWORD /d "1" /f >nul 2>&1

:: Enlever restriction horloges applicatives
nvidia-smi.exe -acp 0 >nul 2>&1

:: Desactiver HDCP
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableHdcp22" /t REG_DWORD /d "1" /f >nul 2>&1

:: ============================================================
:: SUPPRESSION BLOATWARE DRIVER
:: ============================================================

:: Supprimer audio bloat du driver
if exist "C:\Program Files\NVIDIA Corporation\Installer2\InstallerCore\NVI2.dll" (
    for %%C in (Display.3DVision Display.Audio Ansel) do (
        Rundll32.exe "C:\Program Files\NVIDIA Corporation\Installer2\InstallerCore\NVI2.dll",UninstallPackage %%C >nul 2>&1
    )
)

:: Supprimer NvBackend du demarrage
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f >nul 2>&1

:: Supprimer fichiers telemetrie et camera
for /d %%F in ("%SystemDrive%\Windows\System32\DriverStore\FileRepository\nv_dispig.inf_amd64_*") do (
    takeown /f "%%F" /r /d Y >nul 2>&1
    icacls "%%F" /grant "%USERNAME%":F /t >nul 2>&1
    del /s /q "%%F\NvTelemetry64.dll" >nul 2>&1
    rd /s /q "%%F\NvCamera" >nul 2>&1
    del /s /q "%%F\Display.NvContainer\plugins\LocalSystem\_DisplayDriverRAS.dll" >nul 2>&1
)

:: Supprimer dossiers NVIDIA Corporation
Takeown /F "C:\Windows\System32\drivers\NVIDIA Corporation" /R /D Y >nul 2>&1
Icacls "C:\Windows\System32\drivers\NVIDIA Corporation" /grant "%USERNAME%":F /T >nul 2>&1
rd /s /q "C:\Windows\System32\drivers\NVIDIA Corporation" >nul 2>&1
rd /s /q "%SystemDrive%\Program Files\NVIDIA Corporation\Display.NvContainer\plugins\LocalSystem\DisplayDriverRAS" >nul 2>&1
rd /s /q "%SystemDrive%\Program Files\NVIDIA Corporation\DisplayDriverRAS" >nul 2>&1
rd /s /q "%SystemDrive%\ProgramData\NVIDIA Corporation\DisplayDriverRAS" >nul 2>&1

endlocal
pause
exit /b
