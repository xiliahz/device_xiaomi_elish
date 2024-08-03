#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/derp/config/common_full_tablet_wifionly.mk)

# Inherit from elish device
$(call inherit-product, device/xiaomi/elish/device.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := derp_elish
PRODUCT_DEVICE := elish
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2105K81AC
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

DERP_BUILDTYPE := Official
DERP_MAINTAINER := 心凉患者
TARGET_INCLUDE_LIVE_WALLPAPERS := true
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.derp.maintainer=心凉患者

BUILD_FINGERPRINT := Xiaomi/elish/elish:13/RKQ1.211001.001/V816.0.2.0.TKYCNXM:user/release-keys
