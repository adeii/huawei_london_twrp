TeamWin Recovery Project
omni-10.0 branch, still no FBE,
should be useful for Android 10/11-based custom roms *not built yet

Device configuration for Huawei Y7 Prime 2018 (LDN-L21B)
=====================================================

Basic   | Spec Sheet
-------:|:-------------------------
CHIPSET | Qualcomm MSM8937 Snapdragon 430
GPU     | Adreno 505
Shipped Android Version | Android 8.0
Release Date | April 2018

    1 - repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
    (if can not boot, use branch twrp-7.1)
    2 - repo sync --force-sync
    3 - git clone https://github.com/adeii/huawei_london_twrp.git -b omni-10.0 device/huawei/london
    4 - look for new commits @ https://github.com/TeamWin/android_bootable_recovery/commits/android-10.0
    5 - . build/envsetup.sh; lunch omni_london-eng;
    6 - export ALLOW_MISSING_DEPENDENCIES=true; export LC_ALL=C
    7 - mka adbd recoveryimage
