## ☕ Support My Work

If you find my mods helpful, consider buying me a coffee!

| PayPal | Bitcoin |
| :--- | :--- |
| [![PayPal](https://img.shields.io/badge/Donate-PayPal-00457C?style=flat-square&logo=paypal&logoColor=white)](https://www.paypal.me/CharnsilpChinprasert) | ![Bitcoin](https://img.shields.io/badge/BTC-000000?style=flat-square&logo=bitcoin&logoColor=white) `0x794161ef033bd117a45f4dbeda023b5a69cc7cd5` |

# DX340 Rooting & Optimization

## Introducing Three Pillars of Tuning.

### MoonDiamond v2 for DX340
The Efficiency & Clarity Engine A high-performance system-wide processing module. It optimizes core efficiency to deliver a transparent, dynamic soundstage while maintaining a black background. Thanks for [mattClarke18 @Headfi](https://www.head-fi.org/members/mattclarke18.585003/)

### Anantar Harmonic v2 for DX340
The FPGA Timbre Specialist Beyond simple filters—this module interacts directly with the SRC DSP and FPGA. Thanks for [Whitigir @Headfi](https://www.head-fi.org/members/whitigir.378966/)
- Step 1: Choose your topology—NOS (Non-OverSampling) for an organic feel or Upgraded OS for precision.
- Step 2: Advanced Harmonic Adjustments (AHA). Custom-tuned FPGA profiles that refine texture and instrument weight far beyond stock H1-H5 settings.

### Anantar Boot v2 for DX340
The Deep Kernel Core The foundation of the mod. This involves exclusive Kernel-level optimization and CPU core isolation.

- Kernel Sound Profiles: Flash custom boot images to change the system's "DNA."
- Selectable Modes: From Extreme Isolated (Maximum Transparency) to Analog Isolated (Tube-like warmth).

## Steps to install (Super easy in 15 mins)
1. Debloat
2. Rooting
3. Install Modules
4. Enjoy Music

## Prerequisites (What you need)
- A computer (PC or Mac) with ADB (Android Debug Bridge) installed. (Installation Guide is below)
- A USB-C cable to connect the DX340 to your computer.


#### How to Access ADB

##### Step 1 : Connect DX340 to Internet via Wifi

##### Step 2 : Enable USB Debugging (on the DX340)
- [Step by Step how to enable USB Debugging](https://drive.google.com/open?id=16Cj0Fg3WbrOMQ203d1HSczG9x7RZpePq&usp=drive_fs) 
- Go to "Settings" > "About phone"
- Tap on "Build number" 7 times until it says "You are now a developer!"
- Go back to "Settings" > "System" > "Developer options"
- Find and turn "ON" the "USB debugging" toggle.

##### Step 3 : Connect to PC

- Connect your DX340 to your computer via USB.
- On the DX340, a popup "Allow USB debugging?" will appear. -> Check "Always allow" and tap "Allow".

##### Step 4: Connect ADB via web.
- Go to: https://app.webadb.com/shell
- Click Add -> Select Device -> Click Connect
- Open Interactive Shell

### Debloating

####  Option 1: Basic Debloating (Recommend for all user)

"Run" (Execute) the online script:
```
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/basic_debloat.sh | sh
```

####  Option 2: Max Debloating (Remove GooglePlay, Chrome for local play only)

"Run" (Execute) the online script:
```
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/max_debloat.sh | sh
```

When the script is finished (shows Debloat Complete), you MUST Reboot your device:
```
reboot
```


##  Rooting DX340 (Recommend, very easy)
- Support only FW version 1.07 and later.
- NOT Support WebADB.
- This will install Magisk app automatically.

"Run" (Execute) the online script:
```
adb root
adb shell 
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/root.sh | sh

```

#### [Rooting via Fastboot (Optional)](Rooting.md)

# Install 3 Magisk Modules (All must to use together)
1. MoonDiamond v2 for DX340 [Download Link](https://drive.google.com/uc?export=download&id=1nf8vj3xREEH7XH-CXwDLXw8PMSib4lT2)
2. Anantar Harmonic v2 for DX340 [Download Link](https://drive.google.com/file/d/1eWah8O9dKdWaFbWdiT1ys0UtxtZUvcIi/view?usp=sharing)
3. Anantar Boot v2 for DX340 [Download Link](https://drive.google.com/file/d/16qlTgcb0mNPqF2X-V2b4AmWGQ8AcomLs/view?usp=sharing)

## How to install Magisk Modules
1. Download zip file.
2. Upload to DX340 device.
3. Go to Magisk App -> Module -> Install from storage

# How to use

### Anantar Harmonic.
1. Go to Magisk App
2. Modules tab.
3. Select Action on Anantar Harmonic module.
4. use scrolling volume button.
5. double tap to confirm selection.
6. The Profile will instantly apply after confirmation, and every time device started
7. Enjoy Music.

### Anantar Harmonic.
1. Go to Magisk App
2. Modules tab.
3. Select Action on Anantar Boot module.
4. use scrolling volume button.
5. double tap to confirm selection.
6. Device will reboot into that Boot version.
7. Enjoy Music.

# Discussion
- Please follow in Headfi [Here](https://www.head-fi.org/threads/dx340-guides-optimization-battery-replacements-diy-discussions.975654/)
- [Here](https://www.head-fi.org/threads/ibasso-dx180-dx260-dx300-max-dx320-max-dx340-rooting-optimization-guides-and-discussion.974923/)

# Recommend sound profile.

#### Clarity/transparency/Dynamic:
- Extreme Boot / OS Mode / EnOn harmonic.
#### R2R and Analog performanced
- Analog Boot / NOS Mode / TenGen harmonic.
#### Amp14
- Extreme Boot / OS Mode / EnOn harmonic.
#### Amp18 
- Analog Boot / OS Mode / Zeno Harmonic.

# Special Thanks
- [mattClarke18 @Headfi](https://www.head-fi.org/members/mattclarke18.585003/)
- [Whitigir @Headfi](https://www.head-fi.org/members/whitigir.378966/)

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



## Appendix: How to Install ADB (Android Debug Bridge)

If you do not have ADB installed, here is the simplest way to get it.

### On macOS (Recommended: Homebrew)

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

### On Windows (Recommended: Platform-Tools ZIP)

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

### Windows 11 to fix fastboot driver. (thanks koala13 @headfi)

If you are using Windows 11, you can follow these steps to make fastboot work:
- After you enter fastboot, open Device Manager -> Other devices then you should see device name "trinket for arm64".
- You need to install the driver for fastboot device: Driver -> Update Driver -> Browse My Computer for Drivers -> Let me pick from a list... -> WinUsb Device -> ADB Device
- Install the driver -> reboot DX340 -> enter fastboot again and now you can see your device in Device Manager -> Universal Serial Bus Device -> trinket for arm64
- Now you can run fastboot command
