
# How to Rooting via fastboot

# Install Magisk
via ADB
```
cd /data/local/tmp && \
curl -L -k -o Magisk.apk https://github.com/topjohnwu/Magisk/releases/download/v30.6/Magisk-v30.6.apk && \
pm install -r Magisk.apk && \
rm Magisk.apk
```

or just download apk from https://github.com/topjohnwu/Magisk/releases/download/v30.6/Magisk-v30.6.apk and install manually

## You have to know what is current boot (a or b) and have to flash on that.

## Find active boot partition
- adb shell getprop ro.boot.slot_suffix

## Getting Current Boot file (change _a or _b)
- adb root
- adb shell
- dd if=/dev/block/by-name/boot_a of=/sdcard/boot_a.img
- Boot file is /sdcard/boot_a.img or DX340/boot_a.img

## Patch boot file with Magisk app (change _a or _b)
- open Magisk app in DX340.
- Click Magisk Install
- Select and patch a file
- choose file in DX340/boot_a.img.
- output file will be /sdcard/Download/magisk_patched-30600_tcUj7.img

## Pull Patched Boot file from DX340
- adb pull /sdcard/Download/magisk_patched-30600_tcUj7.img

### Go to fastboot mode
- adb reboot fastboot

### Get Current Boot partition
- fastboot getvar current-slot
```
tek@Tek-Macbook-Air-M4 Root % fastboot getvar current-slot
current-slot: a
Finished. Total time: 0.007s
```

### Patch it (boot_a)
fastboot flash boot_a  <boot_patched_image.bin>
```
tek@Tek-Macbook-Air-M4 Root % fastboot flash boot_a ./magisk_patched-30600_tcUj7.img
Sending 'boot_a' (65536 KB)                        OKAY [  1.628s]
Writing 'boot_a'                                   OKAY [  0.695s]
Finished. Total time: 2.373s
```

#### Patch it (boot_b)
fastboot flash boot_b  <boot_patched_image.bin>
```
tek@Tek-Macbook-Air-M4 Root % fastboot flash boot_b ./magisk_patched-30600_tcUj7.img
Sending 'boot_b' (65536 KB)                        OKAY [  1.628s]
Writing 'boot_b'                                   OKAY [  0.695s]
Finished. Total time: 2.373s
```

### Reboot back to Android
fastboot reboot
```
tek@Tek-Macbook-Air-M4 Root % fastboot reboot
Rebooting                                          OKAY [  0.005s]
Finished. Total time: 0.005s
```


## Verify Root status
- adb shell
- su


### How to switch to boot_a (Optional)
- fastboot --set-active=a
- fastboot --set-active=b
