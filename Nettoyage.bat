@echo off
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

pause