TeamWin Recovery Project (use omni-7.1 branch for porting from TRT-Lxx)

Device configuration for Huawei Y7 Prime 2018 (LDN-L21B)
=====================================================

Basic   | Spec Sheet
-------:|:-------------------------
CHIPSET | Qualcomm MSM8937 Snapdragon 430
GPU     | Adreno 505
Shipped Android Version | Android 8.0
Release Date | April 2018

if omni-8.0 add:

    export ALLOW_MISSING_DEPENDENCIES=true
    export LC_ALL=C
    mka adbd recoveryimage
