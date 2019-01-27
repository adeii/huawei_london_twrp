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
    
# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1440
TARGET_SCREEN_WIDTH := 720

# sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true \
    ro.crypto.state=encrypted \
    ro.crypto.type=file \
   ro.property_service.version=2

$(shell mkdir -p $(OUT)/recovery/)
$(shell mkdir -p $(OUT)/recovery/root/)
#$(shell touch $(OUT)/recovery/root/file_contexts) #no need for oreo, but nougat

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := london
PRODUCT_NAME := full_london
PRODUCT_BRAND := huawei
PRODUCT_MODEL := Y7 Prime 2018
PRODUCT_MANUFACTURER := Huawei
