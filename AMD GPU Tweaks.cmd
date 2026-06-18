@echo off


title AMD GPU
color f
cls



taskkill /f /im RadeonSoftware.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start "" "%SystemDrive%\Program Files\AMD\CNext\CNext\RadeonSoftware.exe"
timeout /t 30 /nobreak >nul
taskkill /f /im RadeonSoftware.exe >nul 2>&1
timeout /t 2 /nobreak >nul



for /f "tokens=*" %%c in (
    'reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /f "Radeon" /t REG_SZ /s 2^>nul ^| findstr /l "}"'
) do (
    set gpu_key=%%c
)




reg add "%gpu_key%" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "%gpu_key%" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f >nul 2>&1

:: Desactiver Sleep
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




reg add "HKCU\Software\AMD\CN" /v "PowerSaverAutoEnable_CUR" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKLM\System\CurrentControlSet\Services\amdwddmg" /v "ChillEnabled" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKCU\Software\AMD\CN" /v "AutoUpdate" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN" /v "AutoUpdateTriggered" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKCU\Software\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f >nul 2>&1


reg add "HKCU\Software\AMD\AIM" /v "LaunchBugTool" /t REG_DWORD /d "0" /f >nul 2>&1


reg add "HKCU\Software\AMD\DVR" /v "HotkeysDisabled" /t REG_DWORD /d "1" /f >nul 2>&1


reg add "HKCU\Software\AMD\CN" /v "SystemTray" /t REG_SZ /d "false" /f >nul 2>&1


reg add "HKCU\Software\AMD\DVR" /v "ShowRSOverlay" /t REG_SZ /d "false" /f >nul 2>&1


reg add "HKCU\Software\AMD\CN" /v "RSXBrowserUnavailable" /t REG_SZ /d "true" /f >nul 2>&1


reg add "HKCU\Software\AMD\CN" /v "AllowWebContent" /t REG_SZ /d "false" /f >nul 2>&1


reg add "HKCU\Software\AMD\CN" /v "CN_Hide_Toast_Notification" /t REG_SZ /d "true" /f >nul 2>&1


reg add "HKCU\Software\AMD\CN" /v "WizardProfile" /t REG_SZ /d "PROFILE_CUSTOM" /f >nul 2>&1


powershell -NoProfile -Command ^
  "$basePath = 'HKLM:\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}';" ^
  "$allKeys = Get-ChildItem -Path $basePath -Recurse -ErrorAction SilentlyContinue;" ^
  "$umdKeys = $allKeys | Where-Object { $_.PSChildName -eq 'UMD' };" ^
  "foreach ($key in $umdKeys) {" ^
  "  $regPath = $key.Name;" ^
  "  reg add \"$regPath\" /v 'VSyncControl' /t REG_BINARY /d '3000' /f | Out-Null;" ^
  "  reg add \"$regPath\" /v 'TFQ' /t REG_BINARY /d '3200' /f | Out-Null;" ^
  "  reg add \"$regPath\" /v 'Tessellation' /t REG_BINARY /d '3100' /f | Out-Null;" ^
  "  reg add \"$regPath\" /v 'Tessellation_OPTION' /t REG_BINARY /d '3200' /f | Out-Null;" ^
  "}"


reg add "HKCU\Software\AMD\CN\CustomResolutions" /v "EulaAccepted" /t REG_SZ /d "true" /f >nul 2>&1


reg add "HKCU\Software\AMD\CN\DisplayOverride" /v "EulaAccepted" /t REG_SZ /d "true" /f >nul 2>&1


powershell -NoProfile -Command ^
  "$basePath = 'HKLM:\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}';" ^
  "$allKeys = Get-ChildItem -Path $basePath -Recurse -ErrorAction SilentlyContinue;" ^
  "$pwrKeys = $allKeys | Where-Object { $_.PSChildName -eq 'power_v1' };" ^
  "foreach ($key in $pwrKeys) {" ^
  "  $regPath = $key.Name;" ^
  "  reg add \"$regPath\" /v 'abmlevel' /t REG_BINARY /d '00000000' /f | Out-Null;" ^
  "}"


powershell -NoProfile -Command ^
  "$basePath = 'HKLM:\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}';" ^
  "$adapterKeys = Get-ChildItem -Path $basePath -ErrorAction SilentlyContinue;" ^
  "foreach ($key in $adapterKeys) {" ^
  "  if ($key.PSChildName -match '^\d{4}$') {" ^
  "    $regPath = $key.Name;" ^
  "    reg add \"$regPath\" /v 'IsAutoDefault' /t REG_BINARY /d '00000000' /f | Out-Null;" ^
  "    reg add \"$regPath\" /v 'IsComponentControl' /t REG_BINARY /d '0f000000' /f | Out-Null;" ^
  "  }" ^
  "}"


reg delete "HKCU\Software\AMD\CN\Notification" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN\Notification" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN\FreeSync" /v "AlreadyNotified" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN\OverlayNotification" /v "AlreadyNotified" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\AMD\CN\VirtualSuperResolution" /v "AlreadyNotified" /t REG_DWORD /d "1" /f >nul 2>&1

pause
exit /b
