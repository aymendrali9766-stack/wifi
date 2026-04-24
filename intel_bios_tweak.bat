@echo off
:: ============================================================
::  VALAMV INTEL BIOS TWEAK
::
::  Applique les reglages BIOS caches Intel pour :
::    - Maximiser les performances
::    - Reduire la latence au maximum
::    - Desactiver les fonctionnalites inutiles
::
::  Exclus de ce script :
::    - Reglages qui coupent le son (Enable Hibernation)
::    - Reglages qui cassent les anti-cheats :
::      (Intel Virtualization Tech, VT-D, Execute Disable Bit, SGX)
::
::  NECESSITE :
::    - SCEWIN_64.exe dans le meme dossier que ce .bat
::    - Droits administrateur (auto-eleve)
::    - Carte mere Intel compatible SCEWIN
::
::  EXECUTION 100% AUTOMATIQUE - pas de confirmation.
::  APRES EXECUTION : REDEMARRAGE NECESSAIRE.
:: ============================================================

:: ---------- Auto-elevation administrateur ----------
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b 0
)

:: ---------- Verification de SCEWIN_64.exe ----------
cd /d "%~dp0"
if not exist "%~dp0SCEWIN_64.exe" (
    powershell -Command "Write-Host '[ERREUR] SCEWIN_64.exe introuvable.' -ForegroundColor White -BackgroundColor Red"
    powershell -Command "Write-Host 'Placez SCEWIN_64.exe dans le meme dossier que ce .bat.' -ForegroundColor White -BackgroundColor Red"
    timeout 5 > nul
    exit /b 1
)

title VALAMV INTEL BIOS TWEAK
color 0B
cls

:: ============================================================
::  SENSOR / RMT / READY MODE - desactivation
:: ============================================================
SCEWIN_64.exe /i /ms "Sensor Standby"                                 /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "CS PL1 Limit"                                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Intel Ready Mode Technology"                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Intel RMT State"                                /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  PCI / MSI - optimisations
:: ============================================================
SCEWIN_64.exe /i /ms "PCI Delay Optimization"                         /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "MSI enabled"                                    /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "C6DRAM"                                         /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  DEBUG / PROBE / BIST
:: ============================================================
SCEWIN_64.exe /i /ms "PECI"                                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "BIST"                                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "AP threads Idle Manner"                         /qv 0x2 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Probeless Trace"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Advanced Error Reporting"                       /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  SPEED SHIFT / EIST / BOOST - desactivation
:: ============================================================
SCEWIN_64.exe /i /ms "Intel(R) Speed Shift Technology Interrupt Control" /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Boot performance mode"                          /qv 0x3 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "EIST"                                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Race To Halt (RTH)"                             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Intel Speed Shift Technology"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Intel(R) Adaptive Boost Technology"             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Intel Adaptive Boost Technology"                /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  C-STATES - tous desactives pour latence minimale
:: ============================================================
SCEWIN_64.exe /i /ms "Enhanced C-states"                              /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "CPU C-states"                                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Intel C-State"                                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "C1E Support"                                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "C-State Auto Demotion"                          /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "C-State Un-demotion"                            /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Package C-State Demotion"                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Package C-State Un-demotion"                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "CState Pre-Wake"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Package C State Limit"                          /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "CPU C States Support"                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Package C States support"                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "JTAG C10 Power Gate"                            /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  INTERRUPT / ENERGY - optimisation
:: ============================================================
SCEWIN_64.exe /i /ms "Interrupt Redirection Mode Selection"           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Energy Efficient P-state"                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Energy Efficient Turbo"                         /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  PROCHOT / THERMAL - desactivation des protections basse perf
:: ============================================================
SCEWIN_64.exe /i /ms "Bi-directional PROCHOT#"                        /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Disable PROCHOT# Output"                        /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PROCHOT Response"                               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PROCHOT Lock"                                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ACPI T-States"                                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Tcc Activation Offset"                          /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Thermal Throttling Level"                       /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "T0 Level"                                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "T1 Level"                                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "T2 Level"                                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Power Loss Notification Feature"                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "P-state Capping"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "BCLK Aware Adaptive Voltage"                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "TVB Ratio Clipping"                             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Ring Down Bin"                                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Power Down Mode"                                /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  ZPODD / Zero Power Optical Disc
:: ============================================================
SCEWIN_64.exe /i /ms "ZPODD"                                          /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  ASPM / LTR / L1 - desactivation pour latence PCIe
:: ============================================================
SCEWIN_64.exe /i /ms "Enable ASPM"                                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Enable LTR"                                     /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "LTR"                                            /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Enable TBT ASPM"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ASPM"                                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "LTR Mechanism Enable"                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DMI Link ASPM Control"                          /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Clock Power Management"                         /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Power Down Unused Lanes"                        /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "L1 Substates"                                   /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  PEG (PCI Express Graphics) - ASPM desactives
:: ============================================================
SCEWIN_64.exe /i /ms "PEG 0 ASPM"                                     /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PEG 1 ASPM"                                     /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PEG0 - ASPM"                                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PEG1 - ASPM"                                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PEG2 - ASPM"                                    /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  PCI Express Root Ports ASPM (1-24) - desactives
:: ============================================================
SCEWIN_64.exe /i /ms "PCI Express Root Port 1 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 2 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 3 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 4 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 5 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 6 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 7 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 8 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 9 ASPM"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 10 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 11 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 12 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 13 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 14 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 15 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 16 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 17 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 18 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 19 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 20 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 21 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 22 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 23 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Root Port 24 ASPM"                  /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  PCIe / GATING - performances
:: ============================================================
SCEWIN_64.exe /i /ms "Re-Size BAR Support"                            /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Above 4G memory/Crypto Currency mining"         /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Clock Gating"                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCI Express Power Gating"                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCIE Spread Spectrum"                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Pcie Pll SSC"                                   /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  USB
:: ============================================================
SCEWIN_64.exe /i /ms "USB 2.0 Controller Mode"                        /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "USB S5 Wakeup Support"                          /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "USB Standby Power at S4/S5"                     /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "USB2 PHY Sus Well Power Gating"                 /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  DRAM / MEMOIRE - power down desactives
:: ============================================================
SCEWIN_64.exe /i /ms "EPG DIMM Idd3N"                                 /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "EPG DIMM Idd3P"                                 /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DDR PowerDown and idle counter"                 /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "For LPDDR Only: DDR PowerDown and idle counter" /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PowerDown Energy Ch0Dimm0"                      /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PowerDown Energy Ch0Dimm1"                      /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PowerDown Energy Ch1Dimm0"                      /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PowerDown Energy Ch1Dimm1"                      /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Extreme Memory Profile(XMP)"                    /qv 0x1 /lang en-US >nul 2>&1

:: ============================================================
::  GPU / RENDER
:: ============================================================
SCEWIN_64.exe /i /ms "RC6(Render Standby)"                            /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  WAKE ON LAN / WLAN - desactivation
:: ============================================================
SCEWIN_64.exe /i /ms "LAN Wake From DeepSx"                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Wake on LAN Enable"                             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Wake on WLAN and BT Enable"                     /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DeepSx Wake on WLAN and BT Enable"              /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  HPET / LEGACY IO - activation pour latence
:: ============================================================
SCEWIN_64.exe /i /ms "HPET"                                           /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Legacy IO Low Latency"                          /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Disable Gen2 Pll Shutdown and L1 Controller Power gating" /qv 0x1 /lang en-US >nul 2>&1

:: ============================================================
::  PCH / CHIPSET - gating desactives
:: ============================================================
SCEWIN_64.exe /i /ms "PCH Cross Throttling"                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Enable 8254 Clock Gate"                         /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Aggressive LPM Support"                         /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  MODERN STANDBY - desactivation
:: ============================================================
SCEWIN_64.exe /i /ms "Modern StandBy"                                 /qv 0x0 /lang en-US >nul 2>&1

echo.
echo  ============================================================
echo         VALAMV INTEL BIOS TWEAK - Termine avec succes
echo  ============================================================
echo.
echo   REDEMARRAGE NECESSAIRE pour appliquer les changements.
echo.
echo  ============================================================
timeout 5 > nul
exit /b 0
