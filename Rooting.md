
# How to Rooting via fastboot

## Prerequisites (What you need)
- Boot file that patched Magisk (Ask @mattclarke18)

## Install adb and fastboot on your mac 
```
brew install android-platform-tools
```

### Go to fastboot mode
- adb reboot fastboot

### Get Current Boot partition
- fastboot getvar current-slot
```
tek@Tek-Macbook-Air-M4 Root % fastboot getvar current-slot
current-slot: a
Finished. Total time: 0.007s
```

### Patch it
fastboot flash boot_a  <boot_patched_image.bin>
```
tek@Tek-Macbook-Air-M4 Root % fastboot flash boot_a boot_a Amagisk_patched-29000_sa4rS.img
Sending 'boot_a' (65536 KB)                        OKAY [  1.628s]
Writing 'boot_a'                                   OKAY [  0.695s]
Finished. Total time: 2.373s
```

### Reboot back to Android
fastboot reboot
```
tek@Tek-Macbook-Air-M4 Root % fastboot reboot
Rebooting                                          OKAY [  0.005s]
Finished. Total time: 0.005s
```

# Install Magisk
```
cd /data/local/tmp && \
curl -L -k -o Magisk.apk https://github.com/topjohnwu/Magisk/releases/download/v29.0/Magisk-v29.0.apk && \
pm install -r Magisk.apk && \
rm Magisk.apk
```

## Verify Root status
- adb shell
- su