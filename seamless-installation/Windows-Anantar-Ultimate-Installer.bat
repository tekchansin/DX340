@echo off
setlocal enabledelayedexpansion
echo ===================================================
echo        Seamless One-Step installation
echo ===================================================

:: [Step 0] ตรวจสอบและติดตั้ง ADB
set ADB_CMD=adb
where adb >nul 2>nul
if %errorlevel% neq 0 (
    if exist "platform-tools\adb.exe" (
        set ADB_CMD="%~dp0platform-tools\adb.exe"
    ) else (
        echo [!] ADB not found. Downloading Android Platform Tools...
        curl -sS -o platform-tools.zip https://dl.google.com/android/repository/platform-tools-latest-windows.zip
        tar -xf platform-tools.zip
        del platform-tools.zip
        set ADB_CMD="%~dp0platform-tools\adb.exe"
    )
)

echo [1/4] Waiting for DX340 connection... 
echo (Ensure USB Debugging is ON. If it takes too long, try unplugging and re-plugging the USB cable.)
%ADB_CMD% wait-for-device

echo [Checking Internet Connection on DX340...]
%ADB_CMD% shell "ping -c 1 raw.githubusercontent.com" >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Device is not connected to the internet. 
    echo Please connect DX340 to Wi-Fi and try again.
    pause
    exit /b 1
)

echo [Checking for modified system (adb remount)...]
%ADB_CMD% shell "mount | grep -E '/mnt/scratch|/cache/overlay' || mount | grep ' /system ' | grep -e ' rw,'" > remount_check.tmp
for %%A in (remount_check.tmp) do set size=%%~zA
if %size% gtr 2 (
    del remount_check.tmp
    echo.
    echo ==========================================================
    echo  [ERROR] UNSUPPORTED STATE: "adb remount" DETECTED!
    echo ==========================================================
    echo  It appears that "adb remount" was previously used on this device.
    echo  This script does NOT support devices modified via adb remount.
    echo.
    echo  To fix this, you MUST format and re-flash the device using QFIL.
    echo  Please follow the Unbrick/Recovery guide here:
    echo  https://github.com/tekchansin/DX340/tree/main?tab=readme-ov-file#3-how-to-recover-hard-brick
    echo ==========================================================
    pause
    exit /b 1
)
del remount_check.tmp

echo [2/4] Running basic debloat script...
%ADB_CMD% shell "curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/basic_debloat.sh | sh"

echo [3/4] Running root script...
%ADB_CMD% root
timeout /t 3 /nobreak > nul

echo Waiting for device to reconnect after requesting root...
echo (If it hangs here, try unplugging and re-plugging the USB cable.)
%ADB_CMD% wait-for-device

:CHECK_NET
%ADB_CMD% shell "ping -c 1 raw.githubusercontent.com" >nul 2>&1
if %errorlevel% neq 0 (
    timeout /t 3 /nobreak > nul
    goto CHECK_NET
)

%ADB_CMD% shell "curl -sS https://raw.githubusercontent.com/tekchansin/DX340/refs/heads/main/root.sh | sh"

:: --- รอเครื่องบูต และทำ Auto-Grant & Auto-Open Magisk ---
echo [Waiting for Android system to fully boot...]
echo (If it takes too long, try unplugging and re-plugging the USB cable.)
%ADB_CMD% wait-for-device

:WAIT_BOOT
%ADB_CMD% shell getprop sys.boot_completed | find "1" > nul
if errorlevel 1 (
    timeout /t 3 /nobreak > nul
    goto WAIT_BOOT
)

:: ให้เวลา Magisk Service เริ่มทำงาน
timeout /t 5 /nobreak > nul

echo [Auto-Granting Root access to ADB and Enabling Notifications...]
:: ใช้ adb root เพื่อสิทธิ์สูงสุด
%ADB_CMD% root
timeout /t 3 /nobreak > nul
%ADB_CMD% wait-for-device

:: ให้สิทธิ์ System App Notification แก่ Magisk
%ADB_CMD% shell "pm grant com.topjohnwu.magisk android.permission.POST_NOTIFICATIONS" >nul 2>&1
%ADB_CMD% shell "/product/bin/magisk --sqlite \"REPLACE INTO policies (uid, policy, until, logging, notification) VALUES (2000, 2, 0, 1, 1);\"" >nul 2>&1

echo [Opening Magisk App for Additional Setup...]
%ADB_CMD% shell monkey -p com.topjohnwu.magisk -c android.intent.category.LAUNCHER 1 >nul 2>&1

echo ==========================================================
echo  *********************************
echo  *********************************
echo  *********************************
echo  *** LOOK AT YOUR DX340 SCREEN ***
echo  *********************************
echo  *********************************
echo  *********************************
echo  If Magisk asks for "Additional Setup", press "OK".
echo  (If the device reboots, the script will automatically regain root)
echo ==========================================================

:: รอดูว่าระบบพร้อม (ในฐานะ root) หรือยัง รองรับกรณีมีการรีบูต
:WAIT_ROOT_READY
%ADB_CMD% wait-for-device
%ADB_CMD% shell getprop sys.boot_completed | find "1" > nul
if errorlevel 1 (
    timeout /t 3 /nobreak > nul
    goto WAIT_ROOT_READY
)

:: พยายามสั่ง adb root เสมอ เผื่อเครื่องเพิ่งรีบูตกลับมา
%ADB_CMD% root >nul 2>&1
timeout /t 2 /nobreak > nul
%ADB_CMD% wait-for-device

:: เช็คว่าเข้าถึง magisk binary ได้หรือยัง
%ADB_CMD% shell "/product/bin/magisk -v" >nul 2>&1
if %errorlevel% neq 0 (
    timeout /t 3 /nobreak > nul
    goto WAIT_ROOT_READY
)

echo [Checking Internet Connection before download...]
:CHECK_NET_DL
%ADB_CMD% shell "curl -s -I -m 5 https://tekfile.s3-bkk.nipa.cloud" >nul 2>&1
if %errorlevel% neq 0 (
    echo Waiting for internet connection... Please ensure DX340 is connected to Wi-Fi.
    ping 127.0.0.1 -n 4 > nul
    goto CHECK_NET_DL
)

echo [4/4] Downloading and Installing Anantar Ultimate Module...
:: ใช้เครื่อง DX340 ดาวน์โหลดและติดตั้งผ่าน adb root + absolute path
%ADB_CMD% shell "curl -sS -o /data/local/tmp/Anantar-Ultimate.zip https://tekfile.s3-bkk.nipa.cloud/anantar-ultimate/Anantar-Ultimate-3-1.zip"

%ADB_CMD% shell "/product/bin/magisk --install-module /data/local/tmp/Anantar-Ultimate.zip"
%ADB_CMD% shell "rm /data/local/tmp/Anantar-Ultimate.zip"

for %%A in (
"======================================================================="
"   ___   _  _    __    _  _  _____    __    ___ "
"  / _ \ | \| |  /  \  | \| ||_   _|  /  \  | _ \ "
" |  _  || .` | / /\ \ | .` |  | |   / /\ \ |   / "
" |_| |_||_|\_||_||_|| |_|\_|  |_|  |_||_|| |_|_\ "
""
" _   _  _     _____  _  __  __    __    _____  ___ "
"| | | || |   |_   _|| ||  \/  |  /  \  |_   _|| __| "
"| |_| || |__   | |  | || |\/| | / /\ \   | |  | _| "
" \___/ |____|  |_|  |_||_|  |_||_||_||   |_|  |___| "
""
"                >>> FOR iBasso DX340 <<< "
"======================================================================="
) do (
    set "line=%%~A"
    echo.!line!
)
echo  Welcome to Anantar Ultimate! 
echo  Installation is completely successful.
echo  Your device is now rebooting... Enjoy the sound!
echo =======================================================================
echo.
pause