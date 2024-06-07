#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit some common lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit from elish device
$(call inherit-product, device/xiaomi/elish/device.mk)

$(call inherit-product, vendor/gms/common/common-vendor.mk)
$(call inherit-product, vendor/gms/extras/config.mk)

PRODUCT_NAME := lineage_elish
PRODUCT_DEVICE := elish
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Pad 5 Pro
PRODUCT_CHARACTERISTICS := tablet

# AAPT
# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Screen
TARGET_SCREEN_DENSITY := 320
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/elish/elish:13/RKQ1.211001.001/V816.0.2.0.TKYCNXM:user/release-keys
