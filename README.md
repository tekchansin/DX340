# DX340, DX260mk2 and DX180 Optimization guide.

## Please follow tekChansin and mattclarke18 on Head-fi
- https://www.head-fi.org/threads/ibasso-dx180-dx260-dx300-max-dx320-max-dx340-rooting-optimization-guides-and-discussion.974923/


## Prerequisites (What you need)

- A computer (PC or Mac) with ADB (Android Debug Bridge) installed. (Installation Guide is below)
- A USB-C cable to connect the DX340 to your computer.

## How to Run

This is the safest and recommended method for all users.

### How to Access ADB

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

##  Debloating (Disable method for non-root)

"Run" (Execute) the online script:
```
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/debloat.sh | sh
```

##  Debloating (Uninstall method for root)

"Run" (Execute) the online script:
```
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/uninstall_debloat.sh | sh
```

When the script is finished (shows Debloat Complete), you MUST Reboot your device:
```
reboot
```

# [Rooting via Fastboot](rooting.md)


# Optimize Android Kernel
- Wider Sound Stage
- Reduce Noise and darker Bankground
- Improve more micro-detail and dynamic
- Save more bettery life
- Please follow steps [Here](https://www.head-fi.org/threads/ibasso-dx180-dx260-dx300-max-dx320-max-dx340-rooting-optimization-guides-and-discussion.974923/)


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