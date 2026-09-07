# Antigravity HUD - 一键停止脚本 (PowerShell)
Write-Host "🛑 正在停止 Antigravity HUD 守护进程..." -ForegroundColor Yellow

$Processes = Get-CimInstance Win32_Process | Where-Object { $_.CommandLine -like "*live_inject.js*" }

if ($Processes) {
    foreach ($p in $Processes) {
        Stop-Process -Id $p.ProcessId -Force -ErrorAction SilentlyContinue
    }
    Write-Host "✅ Antigravity HUD 服务已成功停止！" -ForegroundColor Green
} else {
    Write-Host "ℹ️  未找到运行中的 Antigravity HUD 守护进程。" -ForegroundColor Gray
}
