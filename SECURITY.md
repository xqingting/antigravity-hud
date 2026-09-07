# 安全与隐私声明 (Security & Privacy Policy)

**Antigravity HUD** 将用户的代码隐私与系统安全置于首位。

---

## 🛡️ 核心安全与隐私原则

1. **100% 纯本地运行（零网络外传）**：
   - 本项目的所有通信均严格绑定在 `127.0.0.1` 本地回环网络；
   - 绝不向任何外部远程服务器、第三方统计平台或分析服务发送任何数据；
   - 所有的 Token 统计与耗时分析均直接读取本地磁盘落盘文件（`~/.gemini/antigravity/brain`）。

2. **非侵入式热注入（零文件篡改）**：
   - 本工具绝不篡改、解包或覆盖官方 `/Applications/Antigravity.app` 的任何系统程序包或 `app.asar` 文件；
   - 注入仅通过 Chromium 官方支持的标准 DevTools 调试通道在内存中动态挂载视觉组件，退出后无任何持久性残留。

---

## 🚨 漏洞报告 (Reporting a Vulnerability)

如果您在使用过程中发现任何潜在的安全缺陷或隐私隐患，请不要公开提交 Issue，请直接通过以下方式私下与维护者取得联系：

* **GitHub Security Advisory**：通过本仓库的 [Security Advisories](https://github.com/xqingting/antigravity-hud/security/advisories) 页面创建私密漏洞报告。
* **响应时效**：我们将在 48 小时内确认并评估漏洞，并在修复完成后第一时间发布补丁。
