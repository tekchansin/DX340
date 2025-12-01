#!/system/bin/sh

# ===============================================
# Praedo's DX340 Audiophile Debloat Script (UNINSTALL VERSION)
#
# !! WARNING: This script permanently uninstalls apps for User 0 !!
# ===============================================

# 1. ตรวจสอบสิทธิ์ Root (Root Check)
if [ "$(id -u)" -ne 0 ]; then
  echo "Error: This script must be run as root."
  echo "Please run 'su' first, then run this script."
  exit 1
fi

# -----------------------------------------------
# 2. Safety Check (ตรวจสอบรุ่น)
# -----------------------------------------------
CURRENT_MODEL=$(getprop ro.product.model)

echo "Checking device model..."
echo "Found model: $CURRENT_MODEL"

case "$CURRENT_MODEL" in
  "DX340" | "DX180" | "DX260mk2")
    echo "Success: iBasso DAP detected ($CURRENT_MODEL). Proceeding with UNINSTALL."
    ;;
  *)
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "ERROR: Model '$CURRENT_MODEL' is not supported. Aborting."
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    exit 1
    ;;
esac
# -----------------------------------------------

echo "--- Starting PERMANENT DEBLOAT (Uninstall Mode) ---"
echo "Uninstalling 'Noise Maker' apps for User 0..."

# 3. Debloat List
PACKAGES_TO_UNINSTALL="
com.android.adservices.api
com.android.backupconfirm
com.android.bips
com.android.bluetooth
com.android.bluetoothmidiservice
com.android.bookmarkprovider
com.android.calculator2
com.android.chrome
com.android.companiondevicemanager
com.android.customization.themes
com.android.deskclock
com.android.dreams.basic
com.android.gallery3d
com.android.hotspot2.osulogin
com.android.htmlviewer
com.android.inputdevices
com.android.inputmethod.latin
com.android.internal.display.cutout.emulation.corner
com.android.internal.display.cutout.emulation.double
com.android.internal.display.cutout.emulation.hole
com.android.internal.display.cutout.emulation.tall
com.android.internal.display.cutout.emulation.waterfall
com.android.internal.systemui.navbar.gestural
com.android.internal.systemui.navbar.gestural_extra_wide_back
com.android.internal.systemui.navbar.gestural_narrow_back
com.android.internal.systemui.navbar.gestural_wide_back
com.android.launcher3
com.android.managedprovisioning
com.android.musicfx
com.android.nearby.halfsheet
com.android.ondevicepersonalization.services
com.android.providers.blockednumber
com.android.providers.downloads.ui
com.android.providers.partnerbookmarks
com.android.providers.userdictionary
com.android.proxyhandler
com.android.safetycenter.resources
com.android.server.telecom.overlay.common
com.android.sharedstoragebackup
com.android.theme.font.notoserifsource
com.android.traceur
com.android.uwb.resources
com.android.vpndialogs
com.android.wallpaper
com.android.wallpaper.livepicker
com.android.wallpaperbackup
com.android.wallpapercropper
com.android.wifi.dialog
com.android.wifi.resources.overlay.common
com.android.wifi.resources.overlay.target
com.google.android.apps.restore
com.google.android.feedback
com.google.android.gms
com.google.android.gms.location.history
com.google.android.gsf
com.google.android.onetimeinitializer
com.google.android.partnersetup
com.google.android.printservice.recommendation
com.google.android.syncadapters.calendar
com.ibasso.caputurelog
com.ibasso.updater
com.qti.dcf
com.qti.dpmserviceapp
com.qti.qcc
com.qti.qualcomm.mstatssystemservice
com.qualcomm.qti.devicestatisticsservice
com.qualcomm.qti.dynamicddsservice
com.qualcomm.qti.poweroffalarm
com.qualcomm.qti.qms.service.connectionsecurity
com.qualcomm.qti.qms.service.trustzoneaccess
com.qualcomm.qti.ramdumpcopyui
com.qualcomm.qti.server.qtiwifi
com.qualcomm.qti.xrcb
com.qualcomm.qti.xrvd.service
com.qualcomm.qtil.btdsda
com.qualcomm.wfd.service
com.quectel.mangolwm2m
org.lineageos.setupwizard
vendor.qti.hardware.cacert.server
vendor.qti.iwlan
vendor.qti.qesdk.sysservice
com.qualcomm.qti.workloadclassifier
"

# 4. Loop and Uninstall
for pkg in $PACKAGES_TO_UNINSTALL; do
  echo -n "Uninstalling (User 0) $pkg... "

  # pm uninstall -k --user 0: Uninstalls for User 0, but keeps app data (-k)
  pm uninstall -k --user 0 "$pkg"
  
  if [ $? -eq 0 ]; then
    echo "OK."
  else
    # If the app is a System App, it might fail (and only disable, which is safer)
    echo "Failed (App may be system protected, or already uninstalled/disabled)."
  fi
done

echo "--- Permanent Debloat Complete ---"
echo "Please Reboot your device NOW"