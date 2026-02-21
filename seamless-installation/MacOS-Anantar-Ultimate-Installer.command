#!/bin/bash

echo "==================================================="
echo "       Seamless One-Step installation"
echo "==================================================="

# [Step 0] ตรวจสอบและติดตั้ง ADB อัตโนมัติ
ADB_CMD="adb"
if ! command -v adb &> /dev/null; then
    if [ -x "./platform-tools/adb" ]; then
        ADB_CMD="./platform-tools/adb"
    else
        echo "[!] ADB not found. Downloading Android Platform Tools..."
        OS_TYPE=$(uname -s)
        if [ "$OS_TYPE" = "Darwin" ]; then
            DL_URL="https://dl.google.com/android/repository/platform-tools-latest-darwin.zip"
        else
            DL_URL="https://dl.google.com/android/repository/platform-tools-latest-linux.zip"
        fi
        curl -sS -o platform-tools.zip "$DL_URL"
        echo "[!] Extracting..."
        unzip -q platform-tools.zip
        rm platform-tools.zip
        ADB_CMD="./platform-tools/adb"
        echo "[!] Platform Tools installed locally."
    fi
fi

echo "[1/4] Waiting for DX340 connection..."
echo "(Ensure USB Debugging is ON. If it takes too long, try unplugging and re-plugging the USB cable.)"
$ADB_CMD wait-for-device

echo "[Checking Internet Connection on DX340...]"
if ! $ADB_CMD shell "ping -c 1 raw.githubusercontent.com > /dev/null 2>&1"; then
    echo "[ERROR] Device is not connected to the internet."
    echo "Please connect DX340 to Wi-Fi and try again."
    exit 1
fi

echo "[Checking for modified system (adb remount)...]"
REMOUNT_DETECTED=$($ADB_CMD shell "mount | grep -E '/mnt/scratch|/cache/overlay' || mount | grep ' /system ' | grep -e ' rw,'" | tr -d '\r\n')
if [ -n "$REMOUNT_DETECTED" ]; then
    echo ""
    echo "=========================================================="
    echo " [ERROR] UNSUPPORTED STATE: 'adb remount' DETECTED!"
    echo "=========================================================="
    echo " It appears that 'adb remount' was previously used on this device."
    echo " This script does NOT support devices modified via adb remount."
    echo ""
    echo " To fix this, you MUST format and re-flash the device using QFIL."
    echo " Please follow the Unbrick/Recovery guide here:"
    echo " https://github.com/tekchansin/DX340/tree/main?tab=readme-ov-file#3-how-to-recover-hard-brick"
    echo "=========================================================="
    exit 1
fi

echo "[2/4] Running basic debloat script..."
$ADB_CMD shell "curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/basic_debloat.sh | sh"

echo "[3/4] Running root script..."
$ADB_CMD root
sleep 3

echo "Waiting for device to reconnect after requesting root..."
echo "(If it hangs here, try unplugging and re-plugging the USB cable.)"
$ADB_CMD wait-for-device

echo "[Re-checking Internet Connection after adb root...]"
while ! $ADB_CMD shell "ping -c 1 raw.githubusercontent.com > /dev/null 2>&1"; do
    echo "Waiting for internet connection to stabilize..."
    sleep 3
done

$ADB_CMD shell "curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/root.sh | sh"

# --- รอเครื่องบูต และทำ Auto-Grant & Auto-Open Magisk ---
echo "[Waiting for Android system to fully boot...]"
echo "(If it takes too long, try unplugging and re-plugging the USB cable.)"
$ADB_CMD wait-for-device

while [ "$($ADB_CMD shell getprop sys.boot_completed | tr -d '\r')" != "1" ]; do
    sleep 3
done

sleep 5

echo "[Auto-Granting Root access to ADB and Enabling Notifications...]"
$ADB_CMD root
sleep 3
$ADB_CMD wait-for-device

$ADB_CMD shell "pm grant com.topjohnwu.magisk android.permission.POST_NOTIFICATIONS" > /dev/null 2>&1
$ADB_CMD shell "/product/bin/magisk --sqlite \"REPLACE INTO policies (uid, policy, until, logging, notification) VALUES (2000, 2, 0, 1, 1);\"" > /dev/null 2>&1

echo "[Opening Magisk App for Additional Setup...]"
$ADB_CMD shell monkey -p com.topjohnwu.magisk -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1

echo "=========================================================="
echo " *** LOOK AT YOUR DX340 SCREEN ***"
echo " If Magisk asks for 'Additional Setup', press 'OK'."
echo " (If the device reboots, the script will automatically regain root)"
echo "=========================================================="

# รอดูว่าระบบพร้อม (ในฐานะ root) หรือยัง รองรับกรณีมีการรีบูต
while true; do
    $ADB_CMD wait-for-device
    
    BOOT_STATUS=$($ADB_CMD shell getprop sys.boot_completed | tr -d '\r')
    if [ "$BOOT_STATUS" = "1" ]; then
        $ADB_CMD root > /dev/null 2>&1
        sleep 2
        $ADB_CMD wait-for-device
        
        if $ADB_CMD shell "/product/bin/magisk -v" > /dev/null 2>&1; then
            break
        fi
    fi
    sleep 3
done

# --- เช็คอินเทอร์เน็ตก่อนดาวน์โหลดไฟล์ ---
echo "[Checking Internet Connection before download...]"
while ! $ADB_CMD shell "ping -c 1 tekfile.s3-bkk.nipa.cloud > /dev/null 2>&1"; do
    echo "Waiting for internet connection... Please ensure DX340 is connected to Wi-Fi."
    sleep 3
done

echo "[4/4] Downloading and Installing Anantar Ultimate Module..."
$ADB_CMD shell "curl -sS -o /data/local/tmp/Anantar-Ultimate.zip https://tekfile.s3-bkk.nipa.cloud/anantar-ultimate/Anantar-Ultimate-3-1.zip"

$ADB_CMD shell "/product/bin/magisk --install-module /data/local/tmp/Anantar-Ultimate.zip"
$ADB_CMD shell "rm /data/local/tmp/Anantar-Ultimate.zip"

cat << "EOF"

=======================================================================
   ___   _  _    __    _  _  _____    __    ___ 
  / _ \ | \| |  /  \  | \| ||_   _|  /  \  | _ \ 
 |  _  || .` | / /\ \ | .` |  | |   / /\ \ |   / 
 |_| |_||_|\_||_||_|| |_|\_|  |_|  |_||_|| |_|_\ 

 _   _  _     _____  _  __  __    __    _____  ___ 
| | | || |   |_   _|| ||  \/  |  /  \  |_   _|| __| 
| |_| || |__   | |  | || |\/| | / /\ \   | |  | _| 
 \___/ |____|  |_|  |_||_|  |_||_||_||   |_|  |___| 

                >>> FOR iBasso DX340 <<< 
=======================================================================
EOF