# 🧩 Tweak Script Structure

Each tweak must follow this structure:

```Example
├── TweakName/
│   └── run.ps1

```

## 📜 Script Name
- The script **must be named** `run.ps1`.

## ⚙️ Folder Name
- The folder name represents the tweak name (e.g. `PowerFix`, `TimeSync`, etc.).
- **Do not** use parentheses `()`, spaces, or special symbols in the tweak name.  
  ✅ Allowed: `MyTweak`, `power_fix`, `time-sync`  
  ❌ Not allowed: `tweak(name)`, `my tweak`, `fix@time`
