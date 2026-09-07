# Antigravity HUD - 一键启动脚本 (PowerShell)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$LogFile = Join-Path $ScriptDir "hud.log"

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "❌ 错误: 未检测到 Node.js 环境，请先安装 Node.js (推荐 v18+)" -ForegroundColor Red
    exit 1
}

Write-Host "🚀 正在启动 Antigravity HUD 守护进程..." -ForegroundColor Cyan
$Process = Start-Process -FilePath "node" -ArgumentList "`"$ScriptDir\injector\live_inject.js`"" -RedirectStandardOutput $LogFile -RedirectStandardError $LogFile -PassThru -WindowStyle Hidden

Start-Sleep -Seconds 1
if (-not $Process.HasExited) {
    Write-Host "✅ 启动成功！PID: $($Process.Id)" -ForegroundColor Green
    Write-Host "   日志文件: $LogFile" -ForegroundColor Gray
    Write-Host "👉 现在打开或切换 Antigravity 任意会话，输入框下方即可呈现实时 HUD 与大盘！" -ForegroundColor Yellow
} else {
    Write-Host "❌ 启动失败，请查看日志: $LogFile" -ForegroundColor Red
}
