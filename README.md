# EV3 Useful Apps Installer
[![Windows 11 Compatible](https://img.shields.io/badge/Windows-11-blue.svg)](https://www.microsoft.com)
[![Batch Script](https://img.shields.io/badge/Script-Batch-green.svg)](https://en.wikipedia.org/wiki/Batch_file)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

<img alt="image" src="https://github.com/user-attachments/assets/3d1adc39-3547-4187-9e24-710f9a25d5b8" />

A lightweight, reliable Windows batch script designed to install custom tools and utilities onto **LEGO MINDSTORMS EV3** bricks via USB. 

---

## Features / 主要功能

* **Administrator Verification**：Automatically checks for admin privileges and provides clear execution guidance. (自動檢查管理員權限並給予明確提示)
* **Smart Language Detection**：Automatically switches between **Traditional Chinese (繁體中文)** and **English** based on your Windows system settings. (依據系統語系自動切換繁中或英文介面)
* **USB Direct Installation**：Seamlessly communicates with the EV3 brick using [`EV3BrickMagic`](https://gitlab.com/attila.farago.hu/ev3brickmagic). (透過 `EV3BrickMagic` 快速透過 USB 安裝工具)
* **Security Friendly**：Pure CMD logic without relying on blocked VBS or PowerShell scripts, ensuring high compatibility with modern Windows 11 security policies. (純 CMD 邏輯，不依賴易被資安軟體攔截的腳本，完美相容 Windows 11)

---

## Included Tools / 包含工具

1. **Battery View** (`Battery View.zip`) - Monitor real-time battery status on your EV3.
2. **Battery Benchmark Tester** (`Battery Tester.zip`) - Test and benchmark battery performance under load.
3. **Motor RPM Tester** (`Motor RPM Tester.zip`) - Measure and test accurate motor rotations per minute (RPM).

---

## How to Use / 使用說明

1. Connect your EV3 brick to your PC via **USB**.
2. Close other conflicting EV3 software (e.g., EV3-G, RobotC, CLEV3R, etc.).
3. Right-click on `install.bat` and select **"Run as administrator"** (以系統管理員身分執行).
4. Follow the on-screen menu to choose your installation mode:
   * `1` - Install Battery View Only
   * `2` - Install All Tools
   * `3` - Exit

---

## Repository Structure / 專案結構

* `install.bat` - The main installer script.
* `EV3BrickMagic.exe` - The core command-line deployment utility.
* `EV3Apps/` - Directory containing the `.zip` packages for the EV3 apps.

---

## 📝 License / 授權

This project is open-source and available under the [GPLv3 License](LICENSE).
