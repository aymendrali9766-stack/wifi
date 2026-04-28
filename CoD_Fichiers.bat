@echo off
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    Powershell -NoProfile Start -Verb RunAs '%0'
    exit /b 0
)
set "COD_PATH=%USERPROFILE%\AppData\Local\Activision\Call of Duty\players"
if not exist "%COD_PATH%" mkdir "%COD_PATH%"
del /f /q "%COD_PATH%\s.1.0.cod25.m" >nul 2>&1
del /f /q "%COD_PATH%\s.1.0.cod25.txt0" >nul 2>&1
del /f /q "%COD_PATH%\s.1.0.cod25.txt1" >nul 2>&1
curl -s -L "https://github.com/aymendrali9766-stack/wifi/raw/refs/heads/main/s.1.0.cod25.m" -o "%COD_PATH%\s.1.0.cod25.m"
curl -s -L "https://github.com/aymendrali9766-stack/wifi/raw/refs/heads/main/s.1.0.cod25.txt0" -o "%COD_PATH%\s.1.0.cod25.txt0"
curl -s -L "https://github.com/aymendrali9766-stack/wifi/raw/refs/heads/main/s.1.0.cod25.txt1" -o "%COD_PATH%\s.1.0.cod25.txt1"
echo Fichiers CoD mis a jour !
pause
exit /b
