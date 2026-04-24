@echo off
:: ============================================================
::  VALAMV AMD BIOS TWEAK
::
::  Applique les reglages BIOS caches AMD (AM4/AM5) pour :
::    - Maximiser les performances
::    - Reduire la latence au maximum
::    - Desactiver les fonctionnalites inutiles
::
::  Exclus de ce script :
::    - Reglages qui coupent le son (Enable Hibernation)
::    - Reglages qui cassent les anti-cheats
::      (SVM, TSME, IOMMU, DMA Protection, DMAr, SMEE,
::       Indirect Branch Prediction Speculation)
::
::  NECESSITE :
::    - SCEWIN_64.exe dans le meme dossier que ce .bat
::    - Droits administrateur (auto-eleve)
::    - Carte mere AMD compatible SCEWIN
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

title VALAMV AMD BIOS TWEAK
color 0A
cls

:: ============================================================
::  POWER / GATING - desactivation
:: ============================================================
SCEWIN_64.exe /i /ms "ACP Power Gating"                               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ACP CLock Gating"                               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Power Down Enable"                              /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ECO Mode"                                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "LN2 Mode"                                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "LCLK DPM"                                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "LCLK DPM Enhanced PCIe Detection"               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "AB Clock Gating"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Chipset Power Saving Features"                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ASPM Control for CPU"                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ASPM Mode Control"                              /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ASPM Support"                                   /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  C-STATES / POWER STATES - desactives pour latence minimale
:: ============================================================
SCEWIN_64.exe /i /ms "Global C-state Control"                         /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ACPI _CST C1 Declaration"                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DF Cstates"                                     /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "CPPC"                                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "CPPC Preferred Cores"                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PSS Support"                                    /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  MEMOIRE / DRAM - scrubbers et encryption
:: ============================================================
SCEWIN_64.exe /i /ms "CC6 memory region encryption"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DRAM scrub time"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Poison scrubber control"                        /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Redirect scrubber control"                      /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "GMI encryption control"                         /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "xGMI encryption control"                        /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Data Poisoning"                                 /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "RCD Parity"                                     /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DRAM Address Command Parity Retry"              /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Write CRC Enable"                               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DRAM Write CRC Enable and Retry Limit"          /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DRAM ECC Enable"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DRAM UECC Retry"                                /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  DRAM - Latence, banking et optimisation
:: ============================================================
SCEWIN_64.exe /i /ms "DRAM Latency Enhance"                           /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "DRAM map inversion"                             /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "BankGroupSwap"                                  /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "BankGroupSwapAlt"                               /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Address Hash Bank"                              /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Address Hash CS"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Address Hash Rm"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "SPD Read Optimization"                          /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "A-XMP"                                          /qv 0x1 /lang en-US >nul 2>&1

:: ============================================================
::  REP-MOV / STOS - optimisations instructions CPU
:: ============================================================
SCEWIN_64.exe /i /ms "Fast Short REP MOVSB"                           /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Enhanced REP MOVSB/STOSB"                       /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "REP-MOV/STOS Streaming"                         /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Opcache Control"                                /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  DATA FABRIC - sync flood, erreurs
:: ============================================================
SCEWIN_64.exe /i /ms "Disable DF to external downstream IP SyncFloodPropagation" /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Disable DF sync flood propagation"              /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Freeze DF module queues on error"               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PSP error injection support"                    /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  PCIe - optimisations
:: ============================================================
SCEWIN_64.exe /i /ms "Enable AER Cap"                                 /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "SRIS"                                           /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Re-Size BAR Support"                            /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCIe Ten Bit Tag Support"                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PCIB Clock Run"                                 /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "SR-IOV Support"                                 /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  NBIO RAS - reporting/control desactives
:: ============================================================
SCEWIN_64.exe /i /ms "NBIO DPM Control"                               /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "NBIO Poison Consumption"                        /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "NBIO RAS Global Control"                        /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "NBIO RAS Control"                               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "NBIO SyncFlood Generation"                      /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "NBIO SyncFlood Reporting"                       /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Log Poison Data from SLINK"                     /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Edpc Control"                                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ESPI Enable"                                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ALink RAS Support"                              /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  SATA - slumber et devsleep desactives
:: ============================================================
SCEWIN_64.exe /i /ms "Sata RAS Support"                               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Aggresive SATA Device Sleep Port 0"             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Aggresive SATA Device Sleep Port 1"             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Socket1 DevSlp0 Enable"                         /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Socket1 DevSlp1 Enable"                         /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "SATA Slumber State Capability"                  /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  DETERMINISM / SOC / APBDIS - forcage performance
:: ============================================================
SCEWIN_64.exe /i /ms "Determinism Control"                            /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Determinism Slider"                             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "APBDIS"                                         /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Fixed SOC Pstate"                               /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "SoC/Uncore OC Mode"                             /qv 0x1 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "PPC Adjustment"                                 /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  BIOS MODE / OC GENIE
:: ============================================================
SCEWIN_64.exe /i /ms "BIOS Mode"                                      /qv 0x1 /lang en-US >nul 2>&1

:: ============================================================
::  ACPI / STANDBY - desactivation sleep modes
:: ============================================================
SCEWIN_64.exe /i /ms "S3/Modern Standby Support"                      /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ACPI Standby State"                             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ACPI SLIT remote relative distance"             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "ACPI SRAT L3 Cache As NUMA Domain"              /qv 0x1 /lang en-US >nul 2>&1

:: ============================================================
::  TIMER / HPET
:: ============================================================
SCEWIN_64.exe /i /ms "HPET"                                           /qv 0x1 /lang en-US >nul 2>&1

:: ============================================================
::  SPREAD SPECTRUM - desactives (latence)
:: ============================================================
SCEWIN_64.exe /i /ms "Spread Spectrum"                                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Int. Clk Differential Spread"                   /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "SB Clock Spread Spectrum"                       /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  WAKE ON - desactivation des resume/wake
:: ============================================================
SCEWIN_64.exe /i /ms "Resume By PCI-E Device"                         /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Resume By Onboard Intel LAN"                    /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Resume By USB Device"                           /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Resume From S3/S4/S5 By PS/2 Mouse"             /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Resume From S3/S4/S5 By PS/2 keyboard"          /qv 0x0 /lang en-US >nul 2>&1

:: ============================================================
::  MONITORING / DIRECTORY
:: ============================================================
SCEWIN_64.exe /i /ms "CPU temperature Warning Control"                /qv 0x0 /lang en-US >nul 2>&1
SCEWIN_64.exe /i /ms "Periodic Directory Rinse"                       /qv 0x0 /lang en-US >nul 2>&1

echo.
echo  ============================================================
echo         VALAMV AMD BIOS TWEAK - Termine avec succes
echo  ============================================================
echo.
echo   REDEMARRAGE NECESSAIRE pour appliquer les changements.
echo.
echo  ============================================================
timeout 5 > nul
exit /b 0
