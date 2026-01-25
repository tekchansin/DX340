# DX340 Rooting & Optimization Guide

Welcome to the comprehensive guide for optimizing your iBasso DX340. This project introduces the **Three Pillars of Tuning**, designed to elevate your listening experience through kernel-level modifications and FPGA optimizations.

---

## 📋 Table of Contents
* [☕ Support My Work](#-support-my-work)
* [💎 The Three Pillars of Tuning](#-the-three-pillars-of-tuning)
* [🚀 Installation Guide (Quick Start)](#-installation-guide-quick-start)
    * [Prerequisites](#prerequisites)
    * [Step 1: Prepare the Device](#step-1-prepare-the-device)
    * [Step 2: Install ADB (Android Debug Bridge)](#step-2-install-adb-android-debug-bridge)
    * [Step 3: Debloating](#step-3-debloating)
    * [Step 4: Rooting](#step-4-rooting)
    * [Step 5: 📦 Download Magisk Modules and install](#-download-magisk-modules)
* [🛠️ How to Update OTA from iBasso](#️how-to-upgrade-ota-from-ibasso)    
    * [Method 1: UnDebloat, Update and Debloat](#method-1-undebloat-update-and-debloat)
    * [Method 2: ADB Sideload](#method-2-adb-sideload)
    * [Post Upgrade](#Post-upgrade)
* [🛠️ Usage Instructions](#️-usage-instructions)
    * [Configuring Anantar Harmonic](#configuring-anantar-harmonic)
    * [Configuring Anantar Boot](#configuring-anantar-boot)
* [🎶 Recommended Sound Profiles](#-recommended-sound-profiles)
* [💬 Community & Discussion](#-community--discussion)
* [❤️ Special Thanks](#️-special-thanks)
* [🛠️ Maintenance & Recovery Guide](#️-maintenance--recovery-guide)
    * [1. How to Unroot](#1-how-to-unroot)
    * [2. How to Recover (Soft Brick)](#2-how-to-recover-soft-brick)
    * [3. How to Recover (Hard Brick)](#3-how-to-recover-hard-brick)
    * [4. How to Undebloat](#3-how-to-undebloat)

---

---

## ☕ Support My Work

If you find these mods helpful and wish to support further development, consider buying me a coffee!

| Platform | Donation Link / Address |
| :--- | :--- |
| **PayPal** | [![PayPal](https://img.shields.io/badge/Donate-PayPal-00457C?style=flat-square&logo=paypal&logoColor=white)](https://www.paypal.me/CharnsilpChinprasert) |
| **Bitcoin** | `0x794161ef033bd117a45f4dbeda023b5a69cc7cd5` |

---

## 💎 The Three Pillars of Tuning

### 1. MoonDiamond v2
**The Efficiency & Clarity Engine** A high-performance system-wide processing module. It optimizes core efficiency to deliver a transparent, dynamic soundstage while maintaining a pitch-black background.  
*Special thanks to [mattClarke18 @Head-Fi](https://www.head-fi.org/members/mattclarke18.585003/)*

### 2. Anantar Harmonic v2
**The FPGA Timbre Specialist** This module goes beyond simple filters by interacting directly with the SRC, DSP, and FPGA.  
*Special thanks to [Whitigir @Head-Fi](https://www.head-fi.org/members/whitigir.378966/)*
- **Step 1:** Choose your topology—**NOS (Non-OverSampling)** for an organic feel or **Upgraded OS** for precision.
- **Step 2:** **Advanced Harmonic Adjustments (AHA)**. Custom-tuned FPGA profiles that refine texture and instrument weight far beyond stock H1-H5 settings.

### 3. Anantar Boot v2
**The Deep Kernel Core** The foundation of the mod. This involves exclusive kernel-level optimization and CPU core isolation.
- **Kernel Sound Profiles:** Flash custom boot images to change the system's "DNA."
- **Selectable Modes:** Ranges from **Extreme Isolated** (Maximum Transparency) to **Analog Isolated** (Tube-like warmth).

---

## 🚀 Installation Guide (Quick Start)

Estimated time: **15 minutes**

1. **Debloat:** Remove unnecessary system apps.
2. **Root:** Gain administrative access (Magisk).
3. **Install Modules:** Flash the Three Pillars via Magisk.
4. **Enjoy:** Experience the new sound signature.

### Prerequisites
- A computer (PC or Mac) with **ADB (Android Debug Bridge)** installed.
- A high-quality USB-C cable.

### Step 1: Prepare the Device
1. **Enable Developer Options:** Go to `Settings` > `About phone` > Tap `Build number` 7 times.
2. **Enable USB Debugging:** Go to `Settings` > `System` > `Developer options` > Turn on `USB debugging`.
3. **Authorize Connection:** Connect the DX340 to your PC. On the device popup, select "Always allow" and tap "Allow."

### Step 2: Install ADB (Android Debug Bridge)

If you do not have ADB installed, here is the simplest way to get it.

#### On macOS (Recommended: Homebrew)

- Open the "Terminal" app.
- Install Homebrew (if you don't have it) by pasting this command:
```
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"
```

- Install Android Platform Tools (this includes ADB):
```
brew install --cask android-platform-tools
```
- Verify the installation by plugging in your DX340 and running adb devices.

#### On Windows (Recommended: Platform-Tools ZIP)

- Go to the official Android developer website and download "SDK Platform-Tools for Windows":
https://developer.android.com/studio/releases/platform-tools
- Unzip the file to a simple location you can remember (e.g., C:\platform-tools)
- This folder (C:\platform-tools) now contains adb.exe.

CRITICAL: You must run the commands from this folder.

- Open the C:\platform-tools folder in Windows File Explorer.
- Click in the "address bar" (where it says C:\platform-tools).
- Type cmd and press Enter.
- This will open a Command Prompt in the correct location.
- Verify the installation by plugging in your DX340 and running adb devices.

##### Windows 11 to fix fastboot driver. (thanks koala13 @headfi)

If you are using Windows 11, you can follow these steps to make fastboot work:
- After you enter fastboot, open Device Manager -> Other devices then you should see device name "trinket for arm64".
- You need to install the driver for fastboot device: Driver -> Update Driver -> Browse My Computer for Drivers -> Let me pick from a list... -> WinUsb Device -> ADB Device
- Install the driver -> reboot DX340 -> enter fastboot again and now you can see your device in Device Manager -> Universal Serial Bus Device -> trinket for arm64
- Now you can run fastboot command


### Step 3: Debloating
Choose one of the following options based on your usage:

* **Option 1: Basic Debloat (Recommended)**
    ```bash
    curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/basic_debloat.sh | sh
    ```
* **Option 2: Max Debloat (Local Play Only)** *Removes Google Play, Chrome, and most background services.*
    ```bash
    curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/max_debloat.sh | sh
    ```

> [!IMPORTANT]
> Once the script shows "Debloat Complete," you **MUST** reboot your device: `reboot`

### Step 4: Rooting
* Supports Firmware **v1.07** and later.
* Installs the Magisk app automatically.
* **Note:** This step requires a local terminal (WebADB is not supported for rooting).

```bash
adb root
adb shell 
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/root.sh | sh
```
### 🔑 Rooting & Module Installation

> [!TIP]
> Prefer a more traditional method? See the **[Rooting via Fastboot (Optional)](Rooting.md)** guide.

---

## 📦 Download Magisk Modules

To achieve the intended sound signature and performance, **all three modules must be installed and used together.**

| Module Name | Description | Download |
| :--- | :--- | :--- |
| **MoonDiamond v2** | System-wide efficiency & clarity | [Download](https://drive.google.com/uc?export=download&id=1nf8vj3xREEH7XH-CXwDLXw8PMSib4lT2) |
| **Anantar Harmonic v2** | FPGA & Timbre adjustments | [Download](https://drive.google.com/file/d/1eWah8O9dKdWaFbWdiT1ys0UtxtZUvcIi/view?usp=sharing) |
| **Anantar Boot v2** | Kernel-level core optimization | [Download](https://drive.google.com/file/d/16qlTgcb0mNPqF2X-V2b4AmWGQ8AcomLs/view?usp=sharing) |

### **How to Install**
1. **Download** the ZIP files provided above.
2. **Transfer** (Upload) the files to your DX340 internal storage.
3. Open the **Magisk App** > Go to the **Modules** tab.
4. Select **Install from storage** and pick each ZIP file.
5. **Reboot** your device once all modules are installed.
---

* [🛠️ How to Update OTA from iBasso](#️how-to-upgrade-ota-from-ibasso)    
    * [Method 1: UnDebloat, Update and Debloat](#method-1-undebloat-update-and-debloat)
    * [Method 2: ADB Sideload](#method-2-adb-sideload)
    * [After Upgrade](#after-upgrade)

## 🛠️ How to Update OTA from iBasso
### Download Firmware 
- Download firmware from https://drive.google.com/drive/folders/1qrl4OfUJKiOsnOVH4_5GGncfFPdYWIvY?usp=sharing
- Download file DX340FW-ota-xxx.zip
- unzip. DX340_full_ota_xxx ( has 2 files inside, readme and DX340_full_ota_xxx.zip )
- Use "DX340_full_ota_xxx.zip" for update


### **Method 1: UnDebloat, Update and Debloat**
- [UnDebload via script](#3-how-to-undebloat)
- Open Setting -> System -> Updater -> local update
- Select File
- Update
- [Debload again](#step-3-debloating)

### **Method 2: ADB Sideload**
- Upload ota file to sdcard
- adb reboot recovery
- "Apply update from SD Card"
- Select OTA file
- update and reboot


### **Post Upgrade**
- After You upgrade to latest firmware, You need to root again via script.
- [Root via scritpt](#step-4-rooting)
- Update Modules to latest

---

## 🛠️ Usage Instructions

### **Configuring Anantar Harmonic**
1. Launch the **Magisk App** and navigate to the **Modules** tab.
2. Tap the **Action** button on the *Anantar Harmonic* module.
3. Use the **physical volume wheel** to scroll through the menu.
4. **Double-tap** (or follow on-screen prompts) to confirm your selection.
5. The profile applies instantly and will persist through reboots.

### **Configuring Anantar Boot**
1. Launch the **Magisk App** and navigate to the **Modules** tab.
2. Tap the **Action** button on the *Anantar Boot* module.
3. Use the **physical volume wheel** to scroll through the kernel profiles.
4. **Double-tap** to confirm your selection.
5. The device will **automatically reboot** to apply the selected Boot/Kernel version.

---

## 🎶 Recommended Sound Profiles

| Desired Signature | Configuration Settings |
| :--- | :--- |
| **Maximum Clarity & Dynamics** | Extreme Boot / OS Mode / EnOn Harmonic |
| **R2R & Analog Performance** | Analog Boot / NOS Mode / TenGen Harmonic |
| **Optimized for Amp14** | Extreme Boot / OS Mode / EnOn Harmonic |
| **Optimized for Amp18** | Analog Boot / OS Mode / Zeno Harmonic |

---

## 💬 Community & Discussion

Join the conversation and stay updated on Head-Fi:
* [DX340 Guides & DIY Discussion](https://www.head-fi.org/threads/dx340-guides-optimization-battery-replacements-diy-discussions.975654/)
* [Global iBasso Rooting & Optimization Guide](https://www.head-fi.org/threads/ibasso-dx180-dx260-dx300-max-dx320-max-dx340-rooting-optimization-guides-and-discussion.974923/)

---

## ❤️ Special Thanks

A huge thank you to the contributors who made these mods possible:
* **[mattClarke18 @Head-Fi](https://www.head-fi.org/members/mattclarke18.585003/)**
* **[Whitigir @Head-Fi](https://www.head-fi.org/members/whitigir.378966/)**

# iBasso DX340 Maintenance & Recovery Guide

This guide provides instructions for unrooting and recovering the iBasso DX340 from soft-brick or hard-brick states.

---

## 1. How to Unroot
1. Open the **Magisk** app.
2. Select **"Uninstall Magisk"** (the red button located on the Home tab).
3. The DX340 will automatically reboot and the device will be unrooted.
4. Uninstall the **Magisk** app from your device.
5. **Note:** If you plan to send your device to iBasso for service, it is highly recommended to perform a **Factory Reset** after unrooting.

---

## 2. How to Recover (Soft Brick)
If your device is stuck in a boot loop or failing to boot:
1. Turn the DX340 **OFF**.
2. Press and hold the **Bottom Side Button** (the last button) and the **Power Button** simultaneously.
3. When the iBasso logo appears, **release the Power Button** but continue holding the **Bottom Side Button**.
4. A screen with white text on a black background will appear.
5. Use the side buttons to navigate and select **"Recovery Mode"**, then press the **Power Button** to confirm.
6. Once in Recovery Mode, select **"Wipe data/factory reset"** > **"Factory data reset"**.
7. Select **"Reboot system now"** once the process is complete.

---

## 3. How to Recover (Hard Brick)
The iBasso DX340 uses a Qualcomm SoC, which allows you to flash the entire firmware via **QFIL (Qualcomm Flash Image Loader)**.

> [!IMPORTANT]  
> View the full documentation [here](https://drive.google.com/file/d/15Fzf8U1YbBecVIcsOP35qu2iupTHoZQq/view) (Special thanks to **@mattClarke18**).

### Preparation
* **System:** Windows PC (or macOS via VirtualBox/Parallels).
* **Hardware:** High-quality USB-C cable.
* **Drivers:** [Qualcomm USB Driver v1.0.10065.1](https://drive.google.com/drive/folders/1qrl4OfUJKiOsnOVH4_5GGncfFPdYWIvY?usp=sharing)
* **Software:** [QPST/QFIL Tool](https://drive.google.com/drive/folders/1qrl4OfUJKiOsnOVH4_5GGncfFPdYWIvY?usp=sharing)
* **Firmware:** [iBasso DX340 Full Firmware 1.07](https://drive.google.com/drive/folders/1qrl4OfUJKiOsnOVH4_5GGncfFPdYWIvY?usp=sharing) (`DX340_20251227_1.07.726_256G_img.zip`)

### Steps to Flash
1. Extract the firmware zip file.
2. Launch QFIL located at: `C:\Program Files (x86)\Qualcomm\QPST\bin\Qfil.exe`

#### QFIL Configuration
* **Select Port:** Ensure the device is detected as **"Qualcomm HS-USB QDLoader 9008"**.
* **Select Build Type:** Select **Flat Build**.
* **Select Programmer:** Click **"Browse"**, navigate to the firmware folder, and select the `prog_xxx.elf` file.
* **Load XML:** Click **"Load XML"**, navigate to the firmware folder, and select all available **rawprogram** and **patch** XML files.

#### Format All Partitions
1. Go to **Tools** > **Partition Manager**.
2. Right-click on any row in the list.
3. Select **"Erase Entire Flash"**.
4. When prompted "Would you like to erase entire flash?", select **Yes**.
5. When prompted "Would you like to erase GPT?", select **Yes**.
6. Click **OK** and return to the QFIL main screen.

#### Flash Firmware
1. Once the partitions are formatted and XML files are loaded, the **"Download"** button will be active.
2. Click **"Download"** and wait (approx. 5-10 minutes) until the progress bar completes.
3. **Troubleshooting:** This process has a variable success rate. If it fails, unplug the USB cable, restart QFIL, and try again. You can repeat this process until it completes successfully.
4. Reboot the device.


## 4. How to Undebloat
```bash
adb shell
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/undebloat.sh | sh
```