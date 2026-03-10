@echo off
setlocal
cd /d "%~dp0"

set "APP_NAME=%~n0"
for %%I in ("%~dp0.") do set "APP_NAME=%%~nxI"

set /a PORT=1000 + (%RANDOM% %% 9000)
set "URL=http://127.0.0.1:%PORT%/index.html"

where python >nul 2>&1
if %errorlevel%==0 (
    start "%APP_NAME% Server" cmd /k "cd /d ""%~dp0"" && python -m http.server %PORT%"
) else (
    start "%APP_NAME% Server" cmd /k "cd /d ""%~dp0"" && py -m http.server %PORT%"
)

timeout /t 1 /nobreak >nul
start "" "%URL%"
