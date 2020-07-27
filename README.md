TeamWin Recovery Project
omni-9.0 branch, still no working MTP and FBE

Device configuration for Huawei Y7 Prime 2018 (LDN-L21B)
=====================================================

Basic   | Spec Sheet
-------:|:-------------------------
CHIPSET | Qualcomm MSM8937 Snapdragon 430
GPU     | Adreno 505
Shipped Android Version | Android 8.0
Release Date | April 2018

    1 - repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
    (if can not boot, use branch twrp-7.1)
    2 - repo sync --force-sync
    3 - git clone https://github.com/adeii/huawei_london_twrp.git -b omni-9.0 device/huawei/london
    4 - . build/envsetup.sh; lunch omni_london-eng;
    5 - export ALLOW_MISSING_DEPENDENCIES=true; export LC_ALL=C
    6 - mka adbd recoveryimage
-----

For Sky Hawk Recovery Project - use:

repo init -u git://github.com/SKYHAWK-Recovery-Project/platform_manifest_twrp_omni.git -b android-9.0

add to BoardConfig.mk

SHRP_PATH := device/huawei/london
SHRP_MAINTAINER := none
SHRP_DEVICE_CODE := L21B
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_Only
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_REC := /dev/block/bootdevice/by-name/recovery_ramdisk
