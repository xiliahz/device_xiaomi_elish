#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

BUILD_BROKEN_DUP_RULES := true

DEVICE_PATH := device/xiaomi/elish
BOARD_VENDOR := xiaomi

# Security patch level
VENDOR_SECURITY_PATCH := 2024-03-01

# Display
TARGET_SCREEN_DENSITY := 360

# Kernel
TARGET_KERNEL_CONFIG += vendor/xiaomi/elish.config

# OTA assert
TARGET_OTA_ASSERT_DEVICE := elish

# Properties
# TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit from the proprietary version
-include vendor/xiaomi/elish/BoardConfigVendor.mk

# 为了加速构建进度并且减少构建内核遇到的问题，启用预编译
#ELISH_PREBUILT := device/xiaomi/elish-prebuilt
#BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
#BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
#BOARD_PREBUILT_ODMIMAGE := $(ELISH_PREBUILT)/odm.img
#TARGET_PREBUILT_KERNEL := $(ELISH_PREBUILT)/kernel
#TARGET_PREBUILT_DTB := $(ELISH_PREBUILT)/dtb.img
#BOARD_PREBUILT_DTBOIMAGE := $(ELISH_PREBUILT)/dtbo.img
# PRODUCT_COPY_FILES += $(TARGET_PREBUILT_DTB):dtb.img
# BOARD_PREBUILT_VENDORIMAGE := $(DEVICE_PATH)/vendor.img
#PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(ELISH_PREBUILT)/modules/,$(TARGET_COPY_OUT_VENDOR)/lib/modules)
