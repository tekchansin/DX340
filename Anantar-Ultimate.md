# Anantar Ultimate for iBasso DX340

**Anantar Ultimate** is a complete, fresh re-rework built upon the foundations of the original Anantar projects. This version consolidates and improves upon the legacy modules (**Anantar Sound, Anantar Kernel, and MoonDiamond**) into a single, high-performance "Ultimate" edition for a streamlined and superior experience.

> [!IMPORTANT]
> **Compatibility & Requirements:**
> * **Firmware Requirement:** This module supports **iBasso Firmware 1.08 or higher** only.
> * **Module Conflict:** Before installing Anantar Ultimate, please **Disable or Remove** legacy modules: *Anantar Sound Profile, Anantar Kernel Boot, and MoonDiamond.*

---

## 🚀 Key Features

### 🌐 **Global USB DAC Support**
Enjoy high-fidelity USB DAC functionality across the entire Android system. No longer restricted to MangoPlayer—use **Tidal, Apple Music, or Spotify** with full optimization.

### 🔄 **MangoOS Compatibility**
Experience Anantar optimizations even in MangoOS. Configure your profiles in Android, and the settings will **persist even after booting into MangoOS**.

### 💿 **Native EXT4 Support**
Unlock maximum audio potential with **Native EXT4 File System** support. By eliminating the exFAT translation layer, it reduces CPU overhead and jitter, resulting in a **10-15% improvement** in soundstage depth and micro-detail resolution.

### 🎨 **New UI & Quick Access**
A completely refreshed interface with dedicated **Quick Settings Tiles** on the status bar for instant, on-the-fly control of your audio profiles.

### 🎼 **Enhanced Sound Signature**
Advanced tuning for improved **3D Large SoundStage**, **Clarity**, superior **Instrument Separation**, and a more natural, **Warm Vocal** delivery.

### ⚡ **High-Speed File Transfer (UMS)**
Full support for **USB Mass Storage (UMS)** on SD Cards. Transfer files at ultra-high speeds directly from MacOS and Android devices.

### 🧹 **System Health Optimization**
Keeps your storage clean by automatically removing empty Android junk folders on your SD Card, ensuring a lean and efficient filesystem.

---

### 📱 Screenshots

| Quick Settings | Boot Profiles | OverSampling | USB DAC Support |
| :---: | :---: | :---: | :---: |
| <img src="img/Tile.png" width="200"> | <img src="img/Boot.png" width="200"> | <img src="img/OverSampling.png" width="200"> | <img src="img/USBDAC.png" width="200"> |


---

## 📂 MangoOS Integration
Anantar Ultimate is designed to influence the system at a low level, allowing its benefits to persist across both OS environments.

**How to use with MangoOS:**
1. Boot into **Android Mode**.
2. Select your desired **Kernel Boot Profile**, **OverSampling Mode**, and **Harmonic Profile**.
3. Once configured, simply **Switch/Boot to MangoOS**.
4. Your chosen optimizations will remain active, providing the Anantar Ultimate sound signature within the MangoOS environment.

---

## 🎼 Audio & Kernel Profiles

### 🎧 OverSampling Modes
Select your preferred digital-to-analog processing style:
1. **Default iBasso:** The stock factory oversampling configuration.
2. **NOS Mode (Non-OverSampling):** Bypasses digital filtering for a raw, phase-coherent, and musical sound.
3. **Improved OverSampling Mode:** A custom-tuned oversampling algorithm designed for better transient response and reduced ringing artifacts.

### ⚙️ Kernel Boot Profiles
Control system processing and power delivery at the core:
1. **Extreme:** Maximize CPU performance and system responsiveness for the most precise audio processing.
2. **Analog:** Optimized power delivery and clocking to provide a smooth, organic, and "analog-like" sound signature with reduced digital glare.
3. **Default iBasso Boot:** Reverts the system behavior to the original factory specifications.

---

## 💎 Harmonic Profiles Engine
Over **18+ customized harmonic profiles** categorized into three signature series:

| Harmonic Menu | Water Series | Sky Series | Fire Series |
| :---: | :---: | :---: | :---: |
| <img src="img/Harmonic.png" width="200"> | <img src="img/Water.png" width="200"> | <img src="img/Sky.png" width="200"> | <img src="img/Fire.png" width="200"> |


### 💧 Water Series
* **TaiRai / TaiKei** | **EnON / EnONX** | **Amazakura** | **Zenbu** | **Water / Water MAX**

### ☁️ Sky Series
* **Zen (Exclusive)** | **ZeNo** | **TenGen** | **Sky** | **Sky MAX**

### 🔥 Fire Series
* **Nap on Beach** | **Epitome (Exclusive)** | **Sigma Delt Max** | **Fire**

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
- adb shell

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
- adb.exe shell

##### Windows 11 to fix fastboot driver. (thanks koala13 @headfi)

If you are using Windows 11, you can follow these steps to make fastboot work:
- After you enter fastboot, open Device Manager -> Other devices then you should see device name "trinket for arm64".
- You need to install the driver for fastboot device: Driver -> Update Driver -> Browse My Computer for Drivers -> Let me pick from a list... -> WinUsb Device -> ADB Device
- Install the driver -> reboot DX340 -> enter fastboot again and now you can see your device in Device Manager -> Universal Serial Bus Device -> trinket for arm64
- Now you can run fastboot command


### Step 3: Debloating (10-15 Minutes)
Choose one of the following options based on your usage:

* **Option 1: Basic Debloat (Recommended)**
    ```bash
    adb shell
    ## For Windows "Type adb.exe shell" in cmd prompt
    curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/basic_debloat.sh | sh
    ```
* **Option 2: Max Debloat (Local Play Only)** *Removes Google Play, Chrome, and most background services.*
    ```bash
    adb shell
    ## For Windows "Type adb.exe shell" in cmd prompt
    curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/max_debloat.sh | sh
    ```

> [!IMPORTANT]
> Once the script shows "Debloat Complete," you **MUST** reboot your device: `reboot`

### Step 4: Rooting
* Supports Firmware **v1.07** and later.
* Installs the Magisk app automatically.
* **Note:** Follow step 2 above and run CMD from Address bar (WebADB is not supported for rooting).

```bash
adb root
adb shell 
## For Windows "Type adb.exe shell" in cmd prompt
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/root.sh | sh
```
* DX340 will reboot and rooted.
* Magisk is installed.


### Step 5: Installing Magisk Modules to improve audio performance

### 📦 Download Magisk Modules

* Note: Unzip it, it has another zip inside. use that zip to install.

### **How to Install**
1. **Download** the ZIP files provided above.
2. **Transfer** (Upload) the files to your DX340 internal storage.
3. Open the **Magisk App** > Go to the **Modules** tab.
4. Select **Install from storage** and pick each ZIP file.
5. **Reboot** your device once all modules are installed.
---

---

## 💡 Why EXT4?

* **Native Compatibility:** EXT4 is the native file system for the Linux Kernel and Android; every system partition on your device already uses EXT4.
* **Lower Overhead:** Unlike exFAT, which requires an extra software layer (FUSE/Driver), EXT4 is handled directly by the kernel, reducing CPU load and electrical noise.
* **MangoOS Support:** **Anantar Ultimate** provides full native support for EXT4 on MangoOS.
* **SQ Improvement:** You can expect a **10-15%** improvement in sound quality, characterized by a significantly larger stage, better 3D positioning, and enhanced resolution.

## 🛠 Step-by-Step: Formatting via ADB

Execute these commands via **ADB Shell** (Root access required) to format your microSD card with optimized parameters for high-fidelity audio playback.

### 1. Identify & Unmount Volume
First, identify your card's ID and unmount it to prepare for formatting.

#### adb command
```
su
sm list-volumes public
sm unmount public:179,1

###Format SD, select Y
mke2fs -t ext4 -b 4096 -O ^has_journal,extent,sparse_super -m 0 -L Swissbit /dev/block/vold/public:179,1

sm list-volumes
sm mount public:179,1

TARGET=$(mount | grep "/dev/block/vold/public:179,1" | awk '{print $3}') && chown -R 1023:1023 $TARGET && chmod -R 775 $TARGET
```

## ⚠️ Limitations of EXT4

While EXT4 offers superior audio performance, it is important to understand the compatibility constraints:

* **No Direct Mounting on PC/Mac:** Windows and macOS do not natively support EXT4. You cannot simply plug your microSD card into a card reader and expect it to show up as a drive.
* **MTP Transfer Required:** To add or manage music, you must connect your **DX340** to your computer via USB and use **MTP (Media Transfer Protocol)** mode.
* **Software for macOS:** For Mac users, the native "Android File Transfer" can be unstable. It is highly recommended to use **"MacDroid"** for faster and more reliable file management via ADB/MTP.
* **Android/Linux Only:** This card will only be readable by Android devices or computers running a Linux distribution.

### Format back to exFat
* Go to Setting -> Storage -> select SDcard -> top 3 dot -> format

---

## ⚠️ Known Issues
* **Module Deactivation after MangoOS Reboot:** When rebooting from **MangoOS back to Android**, the Magisk module may occasionally become disabled or "drop out."
    * **How to Check:** Pay attention to the **Boot Animation**. If you do not see the custom Anantar boot animation, the module has likely been disabled.
    * **Solution:** Simply go into the Magisk app and **Re-enable** the Anantar Ultimate module, then reboot once more.

---

## ☕ Support My Work

I have previously released free versions of my mods, including **Anantar Sound, Anantar Kernel, and MoonDiamond**. These free modules already offer a significant sound upgrade and are available for everyone to enjoy.

However, the **Anantar Ultimate** edition is a premium version created specifically for those who wish to support my ongoing research and development. This version includes **exclusive features, deeper kernel tuning, and a unified interface** that isn't available in the free versions. Your support helps me spend more time fine-tuning the DX340 to its absolute limit.

| Platform | Donation Link / Address |
| :--- | :--- |
| **PayPal** | [![PayPal](https://img.shields.io/badge/Donate-PayPal-00457C?style=flat-square&logo=paypal&logoColor=white)](https://www.paypal.me/CharnsilpChinprasert) |
| **Bitcoin** | `0x794161ef033bd117a45f4dbeda023b5a69cc7cd5` |

### 📥 How to Get the Module
1. Send your donation via one of the platforms above.
2. Please send your transaction proof to **justice.form@gmail.com**.
3. Once confirmed, I will reply with the download link for the **Anantar Ultimate** module.

---

## 📩 Contact & Feedback
For support or feedback, please send a Private Message (PM) via **Head-Fi**:
* **Profile:** [tekchansin on Head-Fi](https://www.head-fi.org/members/tekchansin.500217/)