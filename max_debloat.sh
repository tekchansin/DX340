#!/system/bin/sh

# ===============================================
# tekChansin's DX340 Audiophile Debloat Script
# Listed privided by mattclarke18 on Head-fi
#
# ===============================================

# Check for Root
# if [ "$(id -u)" -ne 0 ]; then
#   echo "Error: This script must be run as root."
#   echo "Please run 'su' first, then run this script."
#   exit 1
# fi

echo "--- Starting DX340, DX260mk2 and  DX180 Audiophile Debloat ---"
echo "tekChansin's DX340 Audiophile Debloat Script"
echo "Debloat List from mattclarke18 on Head-fi"
echo "Disabling 'Noise Maker' apps and bloatware..."

# Check Device model
case "$HOSTNAME" in
  "DX340" | "DX180" | "DX260mk2")
    # (รุ่นถูกต้อง, ทำงานต่อ)
    echo "Success: iBasso DAP detected ($CURRENT_MODEL). Proceeding..."
    ;;
  *)
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "ERROR: This script is ONLY for iBasso DX340, DX180, or DX260mk2."
    echo "Device model '$CURRENT_MODEL' is not supported."
    echo "Aborting script."
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    exit 1
    ;;
esac

# Debloat List
PACKAGES_TO_DISABLE="
com.android.adservices.api
com.android.backupconfirm
com.android.bips
com.android.bluetooth
com.android.bluetoothmidiservice
com.android.bookmarkprovider
com.android.calculator2
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
com.android.managedprovisioning
com.android.musicfx
com.android.nearby.halfsheet
com.android.ondevicepersonalization.services
com.android.providers.blockednumber
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
com.wandoujia.phoenix2
cm.aptoide.pt
"

# 3. "วนลูป" (Loop) และ "ปิด" (Disable) ทีละตัว
for pkg in $PACKAGES_TO_DISABLE; do
  echo -n "Disabling $pkg... "

  pm disable-user --user 0  "$pkg"
  
  # Checking
  if [ $? -eq 0 ]; then
    echo "OK."
  else
    echo "Failed (Maybe not found or already disabled)."
  fi
done

echo "--- Debloat Complete ---"
echo "Please Reboot your device NOW"