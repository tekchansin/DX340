#!/system/bin/sh

# --- Configuration ---
ZIP_URL="https://github.com/tekchansin/DX340/archive/refs/tags/fw1.08.zip"
TMP_DIR="/data/local/tmp/dx340_flash"
ZIP_FILE="$TMP_DIR/prerelease.zip"

echo "==============================================="
echo "   DX340 Magisk Auto-Flash Tool (MoonDiamond)  "
echo "==============================================="

# 1. ตรวจสอบสิทธิ์ Root
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Error: Please run as root (su)"
    exit 1
fi

# 2. ตรวจสอบเครื่อง (HOSTNAME / Model)
# หมายเหตุ: ใน Android ส่วนใหญ่จะใช้ ro.product.model
CURRENT_MODEL=$(getprop ro.product.model)
if [ "$CURRENT_MODEL" != "DX340" ]; then
    echo "[!] Error: Device mismatch! (Found: $CURRENT_MODEL, Expected: DX340)"
    exit 1
fi
echo "[+] Device Verified: $CURRENT_MODEL"

# 3. ตรวจสอบเวอร์ชัน Firmware และสร้างชื่อไฟล์
# ro.product.firmware: [1.07.726] -> ดึง 1.07 ออกมา
FULL_FW_VER=$(getprop ro.product.firmware)
FW_SHORT_VER=$(echo $FULL_FW_VER | cut -d'.' -f1,2) # ได้ 1.07
VER_NUM=$(echo $FW_SHORT_VER | tr -d '.')           # ได้ 107
IMG_NAME="magisk-patched-$VER_NUM.img"

echo "[*] Firmware Version: $FULL_FW_VER"
echo "[*] Target Patch File: $IMG_NAME"

# 4. เตรียมพื้นที่และดาวน์โหลด
mkdir -p $TMP_DIR
echo "[*] Downloading firmware package..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

if [ $? -ne 0 ]; then
    echo "[!] Download failed!"
    exit 1
fi

# 5. แตกไฟล์เฉพาะไฟล์ที่เราต้องการ
echo "[*] Extracting $IMG_NAME..."
# GitHub zip จะมี root folder เป็นชื่อ repo-branch (เช่น DX340-prerelease)
# เราจะใช้คำสั่ง unzip -j เพื่อดึงเฉพาะไฟล์ออกมาโดยไม่เอาโครงสร้างโฟลเดอร์เดิม
unzip -j "$ZIP_FILE" "*/patched_boot_dx340/$IMG_NAME" -d "$TMP_DIR"

if [ ! -f "$TMP_DIR/$IMG_NAME" ]; then
    echo "[!] Error: Could not find $IMG_NAME in the zip!"
    exit 1
fi

# 6. ค้นหา Slot และ Flash
SLOT=$(getprop ro.boot.slot_suffix)
TARGET_PARTITION="boot$SLOT"
BLOCK_PATH=$(find /dev/block -name "$TARGET_PARTITION" | head -n 1)

echo "[!] Flashing $IMG_NAME to $TARGET_PARTITION ($BLOCK_PATH)..."
dd if="$TMP_DIR/$IMG_NAME" of="$BLOCK_PATH" 

echo "[!] Install Magisk Manager APK..."

cd /data/local/tmp
curl -L -k -o magisk.apk https://github.com/topjohnwu/Magisk/releases/download/v30.6/Magisk-v30.6.apk && \
pm install -r magisk.apk && \
rm magisk.apk

# 7. สรุปผล
if [ $? -eq 0 ]; then
    echo "-----------------------------------------------"
    echo "[+] Flash Success!"
    echo "[*] Cleaning up..."
    rm -rf "$TMP_DIR"
    sync
    echo "[*] Rebooting..."
    sleep 2
    reboot
else
    echo "[!] FATAL ERROR: Flash failed!"
    exit 1
fi