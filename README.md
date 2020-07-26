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

    1 - repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-7.1
    2 - repo sync --force-sync
    3 - git clone https://github.com/adeii/huawei_london_twrp.git -b omni-9.0 device/huawei/london
    4 - . build/envsetup.sh; lunch omni_london-eng;
    5 - export ALLOW_MISSING_DEPENDENCIES=true; export LC_ALL=C
    6 - mka adbd recoveryimage
-----
add out/target/product/london/system/lib64/libservices.so
add 6.0 toolbox/ls.c to system/core/toolbox
-----
see this: https://github.com/TeamWin/android_device_oneplus_cheeseburger/commit/e684edca5f714a2af163bd33e42725c5828ce397
or this: https://github.com/chetgurevitch/android_device_huawei_angler/commit/982198a17236ec04c2042a1e7097d8a855b2761e
