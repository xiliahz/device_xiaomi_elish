#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/elish

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

BUILD_BROKEN_DUP_RULES := true

# Board
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Display
TARGET_SCREEN_DENSITY := 360

# Kernel
TARGET_KERNEL_CONFIG += vendor/xiaomi/elish.config

# OTA assert
TARGET_OTA_ASSERT_DEVICE := elish

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Sepolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Inherit from the proprietary version
include vendor/xiaomi/elish/BoardConfigVendor.mk

# Use prebuilt kernel
TARGET_USE_PREBUILT_KERNEL := true

ifeq ($(TARGET_USE_PREBUILT_KERNEL),true)
TARGET_NO_KERNEL_OVERRIDE := true

ELISH_PREBUILT := device/xiaomi/elish-prebuilt

PRODUCT_COPY_FILES += \
    $(ELISH_PREBUILT)/Image:kernel \
    $(ELISH_PREBUILT)/dtb.img:dtb.img

BOARD_PREBUILT_DTBOIMAGE := $(ELISH_PREBUILT)/dtbo.img

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(ELISH_PREBUILT)/modules/modules.load))
BOARD_VENDOR_KERNEL_MODULES += $(wildcard $(ELISH_PREBUILT)/modules/*.ko)
endif
