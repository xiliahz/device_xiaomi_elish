#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_CHARACTERISTICS := tablet

# Inherit from elish device
$(call inherit-product, device/xiaomi/elish/device.mk)

PRODUCT_NAME := lineage_elish
PRODUCT_DEVICE := elish
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2105K81AC
TARGET_SUPPORTS_WALLEFFECT := true
BYPASS_CHARGE_SUPPORTED  := true
    
# Matrixx
MATRIXX_BUILD_TYPE := Official
MATRIXX_MAINTAINER := Xiliahz❤_(心凉患者)
MATRIXX_CHIPSET := Snapdragon 870
MATRIXX_BATTERY := 8600mAh
MATRIXX_DISPLAY := 1600x2560

# TARGET_ENABLE_BLUR := true    
WITH_GMS := true
# TARGET_CORE_GMS := true
# TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
TARGET_SUPPORTS_QUICK_TAP := false
TARGET_INCLUDE_MATLOG := true
TARGET_PREBUILT_BCR := false

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/elish/elish:13/RKQ1.211001.001/V816.0.2.0.TKYCNXM:user/release-keys
