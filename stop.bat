@echo off
chcp 65001 >nul
:: Antigravity HUD - 一键停止脚本 (Windows)

echo [INFO] 正在停止 Antigravity HUD 守护进程...
taskkill /F /IM node.exe /FI "WINDOWTITLE eq *live_inject.js*" >nul 2>nul
wmic process where "commandline like '%%live_inject.js%%'" call terminate >nul 2>nul

echo [OK] Antigravity HUD 服务已成功停止！
