@echo off
chcp 65001 >nul
:: Antigravity HUD - 一键启动脚本 (Windows)

set "DIR=%~dp0"
set "PID_FILE=%DIR%.hud.pid"
set "LOG_FILE=%DIR%hud.log"

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] 未检测到 Node.js，请先安装 Node.js (推荐 v18+): https://nodejs.org/
    pause
    exit /b 1
)

echo [INFO] 正在启动 Antigravity HUD 守护进程...
start /B node "%DIR%injector\live_inject.js" > "%LOG_FILE%" 2>&1

echo [OK] 启动成功！日志文件: %LOG_FILE%
echo [TIP] 打开或切换 Antigravity 会话，即可看到底部 HUD 实时性能条与新建大盘！
