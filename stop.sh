#!/usr/bin/env bash
# Antigravity HUD - 一键停止脚本 (macOS / Linux)

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PID_FILE="${DIR}/.hud.pid"

if [ ! -f "${PID_FILE}" ]; then
  echo "ℹ️  未找到运行中的 PID 文件，尝试清理孤立进程..."
  pkill -f "live_inject.js" >/dev/null 2>&1 || true
  echo "✅ 服务已停止！"
  exit 0
fi

PID=$(cat "${PID_FILE}")
echo "🛑 正在停止 Antigravity HUD 服务 (PID: ${PID})..."

if ps -p "${PID}" > /dev/null 2>&1; then
  kill "${PID}" >/dev/null 2>&1
  sleep 1
  if ps -p "${PID}" > /dev/null 2>&1; then
    kill -9 "${PID}" >/dev/null 2>&1
  fi
fi

rm -f "${PID_FILE}"
echo "✅ 已成功停止！"
