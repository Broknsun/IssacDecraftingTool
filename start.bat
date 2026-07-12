@echo off
title Isaac Decrafting Tool
cd /d "%~dp0"

echo ========================================
echo   Isaac Decrafting Tool
echo   https://github.com/Broknsun/IssacDecraftingTool
echo ========================================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Node.js not found!
    echo Please install Node.js from https://nodejs.org/
    echo Recommended: v16 or later
    echo.
    pause
    exit /b 1
)

echo Node.js: found
node -v

REM Check / install dependencies
if not exist "node_modules" (
    echo.
    echo Installing dependencies (first time)...
    call npm install
    if %ERRORLEVEL% neq 0 (
        echo [ERROR] npm install failed!
        pause
        exit /b 1
    )
)

echo.
echo Starting server...
start "Isaac Decrafting Server" cmd /c "npm run serve"
echo.
echo Waiting for server (about 10 seconds)...
timeout /t 10 /nobreak >nul
start http://localhost:8080/
echo.
echo Browser opened! If page not loaded, refresh in a few seconds.
echo Close this window to stop the server.
echo.
pause
