# BashScan: The Bash Wizard Port Scanner! 🧙‍♂️✨
![(BashScan!)](https://github.com/user-attachments/assets/13928fea-a608-4a66-acc5-8817d47d1d5f)
## What is BashScan? 🤔

BashScan is a sleek, fast port scanner written in Bash! Whether you're tackling a CTF challenge, testing internal machines, or just scanning for open ports, BashScan's got you covered. 🚀

Crafted for scenarios where traditional tools might be absent or restricted, BashScan is optimized for both CTFs and professional use. It’s like having a port scanner with a built-in cup of coffee! ☕🔍

## Why Use BashScan? 🔍

- **Fast and Efficient**: Scans ports quickly and effectively. ⏱️
- **Flexible Methods**: Choose between `nc` or `/dev/tcp` based on availability. ⚙️
- **High Compatibility**: Ideal for environments where traditional tools are absent. 🛠️
- **Lightweight**: Minimal resource usage for maximum performance. 🏆
- **CIDR-Notation**: Accept IP addresses givemn in CIDR notation.
- **Tested on Linux**: Works seamlessly in Linux environments. 🐧

## Tested On

| Distribution | Logo |
|--------------|------|
| **Mint**     | <img src="https://upload.wikimedia.org/wikipedia/commons/3/3f/Linux_Mint_logo_without_wordmark.svg" alt="Mint" width="100"/> |
| **Kali**     | <img src="https://www.kali.org/images/kali-dragon-icon.svg" alt="Kali" width="100"/> |
| **Arch**     | <img src="https://i.pinimg.com/564x/37/a2/10/37a2104ab623f2c68820686b2fb593d7.jpg" alt="Arch" width="100"/> |

---

> Note: If you use this scanner against your localhost, it will consume high CPU resources. On other IPs, it will perform normally.
## Installation 📦

Clone the repository and navigate to the directory:

```bash
git clone https://github.com/MIISTERC/BashScan.git
cd BashScan
chmod +x BashScan
./BashScan
```

## ⚠️ **Warnings** ⚠️

1. **Adjusting Speed:** You can modify the speed of BashScan by increasing or decreasing the number of concurrent jobs. The default value is set to `30`. Increasing this value will speed up the scan, while decreasing it will slow down the process. **Note:** It is *not recommended* to exceed `50` concurrent jobs as it might crash your computer. 🖥️💥

2. **CPU Usage:** When running a port scan against your **localhost**, BashScan may consume a high amount of CPU resources. However, when scanning an external IP, the script will operate normally. 🚦🔄

