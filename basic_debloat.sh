#!/system/bin/sh

# ===============================================
# Praedo's DX340 Audiophile Debloat Script (UNINSTALL VERSION)
#
# !! WARNING: This script permanently uninstalls apps for User 0 !!
# ===============================================

# 1. ตรวจสอบสิทธิ์ Root (Root Check)
# if [ "$(id -u)" -ne 0 ]; then
#   echo "Error: This script must be run as root."
#   echo "Please run 'su' first, then run this script."
#   exit 1
# fi

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
com.android.bluetoothmidiservice
com.android.bookmarkprovider
com.android.calculator2
com.android.companiondevicemanager
com.android.customization.themes
com.android.deskclock
com.android.dreams.basic
com.android.gallery3d
com.android.htmlviewer
com.android.inputdevices
com.android.internal.display.cutout.emulation.corner
com.android.internal.display.cutout.emulation.double
com.android.internal.display.cutout.emulation.hole
com.android.internal.display.cutout.emulation.tall
com.android.internal.display.cutout.emulation.waterfall
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
com.android.wifi.dialog
com.android.wifi.resources.overlay.common
com.android.wifi.resources.overlay.target
com.google.android.apps.restore
com.google.android.feedback
com.google.android.gms.location.history
com.google.android.onetimeinitializer
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
com.google.android.inputmethod.latin
com.android.inputmethod.latin
com.google.android.contactkeys
com.google.android.safetycore
"

#com.android.launcher3

# 4. Loop and Uninstall
for pkg in $PACKAGES_TO_UNINSTALL; do
  echo -n "Uninstalling (User 0) $pkg... "

  # pm uninstall -k --user 0: Uninstalls for User 0, but keeps app data (-k)
  cmd package uninstall --user 0 "$pkg"
  # pm uninstall -k --user 0 "$pkg"
  
  if [ $? -eq 0 ]; then
    echo "OK."
  else
    # If the app is a System App, it might fail (and only disable, which is safer)
    echo "Failed (App may be system protected, or already uninstalled/disabled)."
  fi
done

cd /data/local/tmp

# cd /data/local/tmp && \
# curl -L -k -o olauncer.apk https://f-droid.org/repo/app.olauncher_95.apk && \
# pm install -r olauncer.apk && \
# rm olauncer.apk

curl -L -k -o simplekeyboard.apk https://f-droid.org/repo/rkr.simplekeyboard.inputmethod_139.apk && \
pm install -r simplekeyboard.apk && \
rm simplekeyboard.apk


# curl -L -k -o aurorastore.apk https://f-droid.org/repo/com.aurora.store_71.apk && \
# pm install -r aurorastore.apk && \
# rm aurorastore.apk


settings put secure default_input_method rkr.simplekeyboard.inputmethod/.latin.LatinIME

settings put global activity_starts_logging_enabled 0
settings put global bug_report 0    
settings put global multi_cb 0   
settings put secure send_action_app_error 0  
settings put system send_security_reports 0   
settings put secure location_mode 0
settings put secure notification_bubbles 0
settings put global animator_duration_scale 0
settings put global transition_animation_scale 0
settings put global window_animation_scale 0
settings put secure ui_night_mode 2 

settings put global wifi_scan_throttling_enabled 0
settings put global wifi_networks_available_notification_on 0
settings put global mobile_data_always_on 0

settings put global cell_on 0
settings put global cdma_cell_broadcast_sms 0
settings put global auto_wifi 0

settings put global heads_up_notifications_enabled 0
settings put global auto_time 1
settings put global auto_time_zone 1
settings put global usb_configuration_sticky mtp,adb
settings put system system_capabilities_usb_default_config mtp,adb
settings put global device_idle_constants \
"inactive_to=600000,\
idle_after_inactive_to=600000,\
light_after_inactive_to=300000,\
light_idle_to=300000,\
quick_doze_delay_to=60000"

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "This process takes 15-30 minutes to complete."
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
for pkg in $(pm list packages -3 | cut -d: -f2); do dumpsys deviceidle whitelist -$pkg; done
pm compile -a --check-prof false -m everything
pm compile -a --check-prof false --compile-layouts
pm bg-dexopt-job
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "Some package could not be re-compiled. That's normal."
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

ime enable rkr.simplekeyboard.inputmethod/.latin.LatinIME
ime set rkr.simplekeyboard.inputmethod/.latin.LatinIME

echo "--- Permanent Debloat Complete ---"
echo "Rebooting your device NOW"
reboot





