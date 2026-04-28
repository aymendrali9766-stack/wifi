@echo off

del /s /f /q "%LocalAppData%\Microsoft\Windows\INetCache\*" >nul 2>&1
del /s /f /q "%temp%\*" >nul 2>&1
del /s /f /q "%LocalAppData%\Temp\*" >nul 2>&1
del /s /f /q "%WinDir%\Temp\*" >nul 2>&1
del /s /f /q "C:\Windows\Prefetch\*" >nul 2>&1
del /s /f /q "%WinDir%\Logs\*" >nul 2>&1
del /s /f /q "%ProgramData%\USOPrivate\UpdateStore\*" >nul 2>&1
del /s /f /q "%ProgramData%\USOShared\Logs\*" >nul 2>&1
del /s /f /q "C:\Windows\System32\SleepStudy\*" >nul 2>&1
rmdir /s /q "%LocalAppData%\Microsoft\Windows\WebCache" >nul 2>&1
rmdir /s /q "%AppData%\Discord\Cache" >nul 2>&1
rmdir /s /q "%AppData%\Discord\Code Cache" >nul 2>&1
rmdir /s /q "%AppData%\Discord\GPUCache" >nul 2>&1
del /s /f /q "%AppData%\Spotify\Data\*" >nul 2>&1
del /s /f /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache\*" >nul 2>&1
 
del /s /f /q "%LocalAppData%\NVIDIA\DXCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\NVIDIA\GLCache\*" >nul 2>&1
del /s /f /q "%AppData%\NVIDIA\ComputeCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\AMD\DxCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\AMD\GLCache\*" >nul 2>&1
del /s /f /q "%LocalAppData%\D3DSCache\*" >nul 2>&1
 
exit /b
