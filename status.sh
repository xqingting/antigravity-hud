#!/usr/bin/env bash
# Antigravity HUD - 状态探活脚本 (macOS / Linux)

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PID_FILE="${DIR}/.hud.pid"
LOG_FILE="${DIR}/hud.log"

echo "=========================================="
echo "📊 Antigravity HUD 运行状态"
echo "=========================================="

if [ -f "${PID_FILE}" ]; then
  PID=$(cat "${PID_FILE}")
  if ps -p "${PID}" > /dev/null 2>&1; then
    echo "🟢 状态：服务正在平稳运行中 (PID: ${PID})"
    if [ -f "${LOG_FILE}" ]; then
      echo ""
      echo "📜 最近日志输出："
      tail -n 5 "${LOG_FILE}"
    fi
    exit 0
  fi
fi

echo "🔴 状态：服务未在运行 (可运行 ./start.sh 启动)"
exit 1
