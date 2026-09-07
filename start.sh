#!/usr/bin/env bash
# Antigravity HUD - 一键启动脚本 (macOS / Linux)

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PID_FILE="${DIR}/.hud.pid"
LOG_FILE="${DIR}/hud.log"

if [ -f "${PID_FILE}" ]; then
  PID=$(cat "${PID_FILE}")
  if ps -p "${PID}" > /dev/null 2>&1; then
    echo "ℹ️  Antigravity HUD 守护进程已在运行中 (PID: ${PID})"
    exit 0
  fi
fi

if ! command -v node >/dev/null 2>&1; then
  echo "❌ 错误: 未检测到 Node.js 环境，请先安装 Node.js (推荐 v18+)"
  exit 1
fi

echo "🚀 正在后台启动 Antigravity HUD 守护服务..."
nohup node "${DIR}/injector/live_inject.js" > "${LOG_FILE}" 2>&1 &
echo $! > "${PID_FILE}"

sleep 1
if ps -p $(cat "${PID_FILE}") > /dev/null 2>&1; then
  echo "✅ 启动成功！PID: $(cat "${PID_FILE}")"
  echo "   运行日志：${LOG_FILE}"
  echo "👉 现在打开或切换 Antigravity 任意对话，输入框底部均会自动呈现实时 HUD！"
else
  echo "❌ 启动失败，请查看日志：${LOG_FILE}"
  exit 1
fi
