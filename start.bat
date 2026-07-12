@echo off
chcp 65001 >nul
title Isaac Decrafting Tool
cd /d "%~dp0"

echo ========================================
echo   Isaac Decrafting Tool
echo   github.com/Broknsun/IssacDecraftingTool
echo ========================================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Node.js not found!
    echo.
    echo Please install Node.js:
    echo   https://nodejs.org/
    echo.
    echo Recommended version: v16 or later
    echo.
    pause
    exit /b 1
)

echo Node.js: found
node -v
echo.

REM Install dependencies if needed
if not exist "node_modules\" (
    echo Installing dependencies...
    echo This may take a few minutes...
    call npm install
    if %ERRORLEVEL% neq 0 (
        echo [ERROR] npm install failed!
        pause
        exit /b 1
    )
)

echo Starting server...
start "Isaac-Decrafting-Server" cmd /c "chcp 65001 >nul && npm run serve"
echo.
echo Waiting for server to start (10s)...
timeout /t 10 /nobreak >nul
start http://localhost:8080/
echo.
echo Browser opened! If page not loaded yet, refresh.
echo.
echo Close this window to stop the server.
pause
