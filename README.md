# DX340 Optimization guide.

## Please follow tekChansin and mattclarke18 on Head-fi
- https://www.head-fi.org/threads/ibasso-dx180-dx260-dx300-max-dx320-max-dx340-rooting-optimization-guides-and-discussion.974923/

## How to Run

This is the safest and recommended method for all users.

### Step 1 : Enable USB Debugging (on the DX340)

- Go to "Settings" > "About phone"
- Tap on "Build number" 7 times until it says "You are now a developer!"
- Go back to "Settings" > "System" > "Developer options"
- Find and turn "ON" the "USB debugging" toggle.

### Step 2 : Connect to PC

- Connect your DX340 to your computer via USB.
- On the DX340, a popup "Allow USB debugging?" will appear. -> Check "Always allow" and tap "Allow".

### Step 3 Debloating
(This method requires your DX340 to be connected to Wi-Fi)
Open a "Terminal" (Mac/Linux) or "Command Prompt" (Windows) on your computer.
"Enter" the DX340's shell:
```
adb shell
```

"Run" (Execute) the online script:
```
curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/debloat.sh | sh
```

When the script is finished (shows Debloat Complete), you MUST Reboot your device:
```
reboot
```

# Rooting and Optimize Android Kernel
- Wider Sound Stage
- Reduce Noise and darker Bankground
- Improve more micro-detail and dynamic
- Save more bettery life
- Please follow steps [https://www.head-fi.org/threads/ibasso-dx180-dx260-dx300-max-dx320-max-dx340-rooting-optimization-guides-and-discussion.974923/](Here) 