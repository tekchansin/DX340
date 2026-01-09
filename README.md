[![Donate with PayPal](https://raw.githubusercontent.com/stefan-niedermann/paypal-donate-button/master/paypal-donate-button.png)]([www.paypal.com](https://paypal.me/CharnsilpChinprasert))

[![Donate Bitcoin](img.shields.io)](bitcoin:0x794161ef033bd117a45f4dbeda023b5a69cc7cd5?label=MoonDiamond-Anantar&amount=10)


# DX340, DX260mk2 and DX180 Optimization guide.

## Please follow tekChansin and mattclarke18 on Head-fi
- https://www.head-fi.org/threads/ibasso-dx180-dx260-dx300-max-dx320-max-dx340-rooting-optimization-guides-and-discussion.974923/


## Prerequisites (What you need)

- A computer (PC or Mac) with ADB (Android Debug Bridge) installed. (Installation Guide is below)
- A USB-C cable to connect the DX340 to your computer.

## How to Run

This is the safest and recommended method for all users.

### How to Access ADB

### Step 0 : Connect DX340 to Internet via Wifi

### Step 1 : Enable USB Debugging (on the DX340)
- [Step by Step how to enable USB Debugging](https://drive.google.com/open?id=16Cj0Fg3WbrOMQ203d1HSczG9x7RZpePq&usp=drive_fs) 
- Go to "Settings" > "About phone"
- Tap on "Build number" 7 times until it says "You are now a developer!"
- Go back to "Settings" > "System" > "Developer options"
- Find and turn "ON" the "USB debugging" toggle.

### Step 2 : Connect to PC

- Connect your DX340 to your computer via USB.
- On the DX340, a popup "Allow USB debugging?" will appear. -> Check "Always allow" and tap "Allow".

### Step 3: Connect ADB via web.
- Go to: https://app.webadb.com/shell
- Click Add -> Select Device -> Click Connect
- Open Interactive Shell

##  Basic Debloating 

"Run" (Execute) the online script:
```
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/basic_debloat.sh | sh
```

##  Max Debloating (Remove GooglePlay, Chrome )

"Run" (Execute) the online script:
```
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/max_debloat.sh | sh
```

When the script is finished (shows Debloat Complete), you MUST Reboot your device:
```
reboot
```


##  Rooting (Recommend, very easy)

!! NOT Support WebADB
"Run" (Execute) the online script:
```
adb root
adb shell 
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/root.sh | sh

```

# [Rooting via Fastboot](Rooting.md)

# Install 3 Magisk Modules (All must to use together)
1. MoonDiamond v2 for DX340
2. Anantar Harmonic v2 for DX340
3. Anantar Boot v2 for DX340

## How to install Magisk Modules
1. Download zip file.
2. Upload to DX340 device.
3. Go to Magisk App -> Module -> Install from storage

### How to use Anantar Harmonic.
1. Go to Magisk App
2. Modules tab.
3. Select Action on Anantar Harmonic module.
4. use scrolling volume button.
5. double tap to confirm selection.
6. The Profile will instantly apply after confirmation, and every time device started
7. Enjoy Music.

### How to use Anantar Harmonic.
1. Go to Magisk App
2. Modules tab.
3. Select Action on Anantar Boot module.
4. use scrolling volume button.
5. double tap to confirm selection.
6. Device will reboot into that Boot version.
7. Enjoy Music.

# Discussion
- Please follow in Headfi [Here](https://www.head-fi.org/threads/dx340-guides-optimization-battery-replacements-diy-discussions.975654/)

# Recommend sound profile.

### Amp14
- Extreme Boot / OS Mode / EnOn harmonic.
### Amp18 
- Analog Boot / OS Mode / Zeno Harmonic.
### Clarity/transparency/Dynamic:
- Extreme Boot / OS Mode / EnOn harmonic.
### R2R and Analog performanced
- Analog Boot / NOS Mode / TenGen harmonic.


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
