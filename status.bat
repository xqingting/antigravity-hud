@echo off
chcp 65001 >nul
:: Antigravity HUD - 状态检查脚本 (Windows)

echo ==========================================
echo  Antigravity HUD 运行状态
echo ==========================================

wmic process where "commandline like '%%live_inject.js%%'" get processid 2>nul | findstr [0-9] >nul
if %errorlevel% equ 0 (
    echo [STATUS] 🟢 服务正在平稳运行中！
    if exist "%~dp0hud.log" (
        echo.
        echo --- 最近日志 ---
        powershell -Command "Get-Content '%~dp0hud.log' -Tail 5"
    )
) else (
    echo [STATUS] 🔴 服务未运行，可双击 start.bat 启动。
)
pause
