#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Encryption no more, use from /device/qcom/common
#PRODUCT_PACKAGES += \
#    libcryptfs_hw

# Kernel
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/recovery/kernel:kernel # nope, no more dependancies cycle

# sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Time Zone data for recovery, not found in 8.0
#PRODUCT_COPY_FILES += \
#    bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := london
PRODUCT_NAME := full_london
PRODUCT_BRAND := huawei
PRODUCT_MODEL := Y7 Prime 2018
PRODUCT_MANUFACTURER := Huawei
