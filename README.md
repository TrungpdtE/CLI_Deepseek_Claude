# CLI_Deepseek_Claude
Cách sử dụng cli của deepseek và claudeAI (macOS và win)

CLI của [Claude](https://www.anthropic.com/claude?utm_source=chatgpt.com) và [DeepSeek](https://www.deepseek.com/?utm_source=chatgpt.com) trên macOS + Windows Terminal/CMD.

---
# 0. FIle chạy nhanh cho macos, win cho người không rành 

AI_Launcher.command -> cho win

AI_Launcher.bat -> cho macos

Đối với macos, nhớ xài chmod +x AI_Launcher.command để cấp quyền trước

# 1. Claude CLI

## Cài đặt Node.js

### macOS

```bash
brew install node
node -v
npm -v
```

### Windows (CMD / PowerShell)

Tải Node.js tại:

[Node.js Official Website](https://nodejs.org/?utm_source=chatgpt.com)

Kiểm tra:

```cmd
node -v
npm -v
```

---

## Cài Claude CLI

```bash
npm install -g @anthropic-ai/claude-code
```

Kiểm tra:

```bash
claude --version
```

---

## Login Claude

```bash
claude login
```

Sau đó browser sẽ mở để đăng nhập tài khoản Claude.

---

## Chạy Claude CLI

### Interactive mode

```bash
claude
```

Ví dụ:

```bash
claude
> fix bug này giúp tôi
> giải thích file app.js
> refactor code React
```

---

## Quick mode (`-q`)

Khi cần hỏi nhanh 1 câu rồi thoát terminal luôn.

### Syntax

```bash
claude -q "your prompt"
```

### Ví dụ

```bash
claude -q "viết regex email"

claude -q "tạo REST API express"

claude -q "explain async await"

claude -q "fix lỗi React useEffect"
```

---

## Chạy với file/folder project

Mở terminal ngay thư mục project:

```bash
cd my-project
claude
```

Claude sẽ đọc context codebase hiện tại khá giống AI agent trong IDE.

---

## Một số tips

### Reset session

```bash
/clear
```

### Thoát

```bash
exit
```

hoặc:

```bash
Ctrl + C
```

---

# 2. DeepSeek CLI (deepseek-tui)

CLI community cho model của [DeepSeek](https://www.deepseek.com/?utm_source=chatgpt.com).

---

## Cài Node.js

### macOS

```bash
brew install node
node -v
```

### Windows

Cài Node.js:

[Node.js Official Website](https://nodejs.org/?utm_source=chatgpt.com)

---

## Cài deepseek-tui

```bash
npm i -g deepseek-tui
```

---

## Tạo API Key

Lấy API key tại:

[DeepSeek Platform](https://platform.deepseek.com/?utm_source=chatgpt.com)

---

## Set API Key

### macOS / Linux

```bash
export DEEPSEEK_API_KEY="your_api_key"
```

Nếu muốn lưu vĩnh viễn:

```bash
echo 'export DEEPSEEK_API_KEY="your_api_key"' >> ~/.zshrc
source ~/.zshrc
```

---

### Windows CMD

```cmd
set DEEPSEEK_API_KEY=your_api_key
```

### Windows PowerShell

```powershell
$env:DEEPSEEK_API_KEY="your_api_key"
```

---

## Chạy DeepSeek CLI

### Interactive mode

```bash
deepseek
```

Ví dụ:

```bash
deepseek
> viết regex email
> explain docker compose
> tạo API express
```

---

## Quick mode (`-q`)

`-q` chỉ là mode chạy nhanh 1 câu rồi thoát.

### Syntax

```bash
deepseek -q "your prompt"
```

### Ví dụ

```bash
deepseek -q "viết regex email"

deepseek -q "tạo REST API nodejs"

deepseek -q "explain async await"

deepseek -q "fix lỗi CSS flexbox"

deepseek -q "viết script python rename file"
```

---

# 3. So sánh nhanh

| Feature              | Claude CLI | DeepSeek CLI |
| -------------------- | ---------- | ------------ |
| Agent coding mạnh    | ✅          | ⚠️           |
| Context project tốt  | ✅          | ⚠️           |
| Nhanh                | ✅          | ✅            |
| Giá rẻ               | ⚠️         | ✅            |
| Code explain         | ✅          | ✅            |
| Refactor project lớn | ✅ mạnh     | ⚠️           |
| Quick mode `-q`      | ✅          | ✅            |

---

# 4. Workflow gợi ý

## Dùng Claude khi:

* Refactor project lớn
* Debug nhiều file
* Agent coding
* Phân tích codebase
* Viết feature phức tạp

## Dùng DeepSeek khi:

* Hỏi nhanh
* Generate snippet
* Regex
* Shell command
* Script nhỏ
* Tiết kiệm cost

---

# 5. Một số command hữu ích

## Kiểm tra package global

```bash
npm list -g --depth=0
```

## Update package

```bash
npm update -g
```

## Gỡ package

```bash
npm uninstall -g deepseek-tui

npm uninstall -g @anthropic-ai/claude-code
```

---

# 6. Recommended Terminal

## macOS

* Terminal.app
* iTerm2

[iTerm2](https://iterm2.com/?utm_source=chatgpt.com)

---

## Windows

* Windows Terminal
* PowerShell

[Windows Terminal](https://aka.ms/terminal?utm_source=chatgpt.com)

---

# 7. Tips chuyên nghiệp

## Mở đúng folder project trước khi chạy

```bash
cd your-project
claude
```

AI sẽ hiểu structure project tốt hơn nhiều.

---

## Dùng Git trước khi để AI sửa code

```bash
git init
git add .
git commit -m "before ai changes"
```

Nếu AI phá project còn rollback được.

---

## Chia task nhỏ

Thay vì:

```txt
build full website
```

Hãy:

```txt
tạo navbar responsive
fix auth middleware
optimize image lazy loading
```

Kết quả thường tốt hơn.

---

# 8. Useful Links

* [Claude Official Website](https://claude.ai/?utm_source=chatgpt.com)
* [Anthropic](https://www.anthropic.com/?utm_source=chatgpt.com)
* [DeepSeek](https://www.deepseek.com/?utm_source=chatgpt.com)
* [DeepSeek Platform](https://platform.deepseek.com/?utm_source=chatgpt.com)
* [Node.js](https://nodejs.org/?utm_source=chatgpt.com)
