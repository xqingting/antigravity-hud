# 贡献指南 (Contributing Guide)

感谢你对 **Antigravity HUD** 的关注与支持！无论是提出新功能建议、改进样式、优化性能还是修复 Bug，我们都非常欢迎。

---

## 🛠️ 本地开发环境准备

1. **环境依赖**：
   - Node.js 18.0.0+ (无需额外安装任何第三方依赖，纯标准库实现)。
   - 本地已安装 Google Antigravity 客户端（任意当前或未来版本均可）。

2. **目录结构说明**：
   - `injector/antigravity-hud.js`：运行在 Antigravity 渲染进程内的前端逻辑（包含 LocalStorage 缓存、样式渲染与 DOM 挂载）。
   - `injector/live_inject.js`：运行在系统后台的长连接守护进程（监听 DevToolsActivePort、计算 transcript.jsonl 指标）。

---

## 🧪 本地测试与调试

1. 启动 Antigravity 客户端。
2. 运行 `./start.sh` 或直接在终端前台运行：
   ```bash
   node injector/live_inject.js
   ```
3. 打开 Antigravity 客户端，切换新建会话或现有会话，观察输入框底部 HUD 与大盘卡片渲染效果。

---

## 📝 提交代码与 Pull Request 规范

1. **Fork 本仓库** 并创建您的特性分支：
   ```bash
   git checkout -b feature/awesome-feature
   ```
2. **遵循代码风格**：
   - 保持原生纯净，尽量避免引入庞大的第三方 npm 运行时依赖。
   - 保障跨平台兼容性（macOS、Windows、Linux）。
3. **编写规范的 Git 提交信息**：
   - `feat: 增加 ...`
   - `fix: 修复 ...`
   - `docs: 更新 ...`
   - `style: 优化 ...`
4. **提交 PR**：简要描述改动原因与效果截图。
