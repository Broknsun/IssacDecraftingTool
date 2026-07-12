@echo off
cd /d D:\zaxiang\IsaacDecraftingHuijiGadget
start "Server" cmd /c "npm run serve"
timeout /t 10 /nobreak >nul
start http://localhost:8080/
echo Browser opened! If not loaded yet, refresh in a few seconds.
pause
