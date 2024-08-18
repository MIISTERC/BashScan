# BashScan: The Bash Wizard Port Scanner! 🧙‍♂️✨

![BashScan Logo](https://img.shields.io/badge/BashScan-v1.0-blue.svg) ![License](https://img.shields.io/badge/License-MIT-green.svg) ![Contributors](https://img.shields.io/github/contributors/yourusername/BashScan.svg) ![Issues](https://img.shields.io/github/issues/yourusername/BashScan.svg)

## Overview
**BashScan** is your go-to tool for fast and efficient port scanning in environments where traditional tools like `curl` or `wget` are missing. Designed for both CTF challenges and professional use, BashScan is like having a port scanner with a built-in cup of coffee! ☕

![BashScan in Action](https://media.giphy.com/media/26Ff1dDjp7vju/giphy.gif)

## Features
- **Versatile Scanning:** Works with `/dev/tcp` and `nc` (netcat), adapting to the environment.
- **CIDR Notation Support:** Automatically handles IP ranges, making it ideal for scanning subnets.
- **Concurrent Jobs:** Optimized for performance with configurable concurrency, reducing scan times.

## Why BashScan?
Ever found yourself in a CTF or a machine where `curl` and `wget` are missing? Or faced with static binaries and no easy way to perform a port scan? BashScan has you covered! It’s designed to handle those tricky situations and streamline your scanning process.

![Scanning](https://media.giphy.com/media/xT1XGvEKtX75jS1I1O/giphy.gif)

## Usage
```bash
./BashScan.sh <target_ip> <start_port> <end_port> [method]
