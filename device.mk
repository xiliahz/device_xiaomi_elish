#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/elish

# A/B
TARGET_IS_VAB := true

# Is tablet
TARGET_IS_TABLET := true
PRODUCT_CHARACTERISTICS := tablet

# Use prebuilt kernel
# TARGET_USE_PREBUILT_KERNEL := true

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600

# Camera
PRODUCT_PACKAGES += \
    libMegviiFacepp-0.5.2 \
    libmegface \
    libpiex_shim
    
# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.xiaomi \
    vendor.xiaomi.hardware.fx.tunnel@1.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# ForceRotation
PRODUCT_PACKAGES += \
    ForceRotation

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor

# Media
#PRODUCT_PACKAGES += \
#    libavservices_minijail \
#    libavservices_minijail.vendor \
#    libavservices_minijail_vendor
    
#PRODUCT_COPY_FILES += \
#     $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media/,$(TARGET_COPY_OUT_VENDOR)/etc)
    
#PRODUCT_COPY_FILES += \
#    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Mlipay
PRODUCT_PACKAGES += \
    manifest_vendor.xiaomi.hardware.mlipay \
    vendor.xiaomi.hardware.mlipay@1.1.vendor \
    vendor.xiaomi.hardware.mtdservice@1.2.vendor
       
# Parts
PRODUCT_PACKAGES += \
    MiPadParts

PRODUCT_PACKAGES += \
    vendor.xiaomi_elish.peripherals@1.0-service.default

ifneq ($(TARGET_USE_PREBUILT_KERNEL), true)
$(call soong_config_set, xiaomi_elish_peripherals, stylus_use_old_driver, true)
endif

# Rootdir
PRODUCT_PACKAGES += \
    init.elish.rc

# RRO Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayElish \
    FrameworkResOverlayElish \
    LineageSDKOverlayElish \
    NetworkStackOverlayMIUI \
    SettingsOverlayElish \
    SettingsProviderOverlayElish \
    SystemUIOverlayElish \
    TargetWifiOverlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel

# TTF
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ttf/zh-cn.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/zh-cn.ttf
    
# WiFi
PRODUCT_PACKAGES += \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.2.vendor 

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

PRODUCT_PACKAGES += \
    Gramophone \
    via \
    Omni \
    CameraGo \
    TrichromeLibrary64 \
    Chrome64

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/privapp-permissions-thirdparty.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-thirdparty.xml \
    $(DEVICE_PATH)/sysconfig/thirdparty-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/thirdparty-hiddenapi-package-whitelist.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-google-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-product.xml
    
# Wlan fix for stock kernel
ifeq ($(TARGET_USE_PREBUILT_KERNEL),true)
PRODUCT_PACKAGES += \
    firmware_qca6390_WCNSS_qcom_cfg.ini_symlink \
    firmware_qca6390_wlan_mac.bin_symlink
endif

# Wi-Fi Display
PRODUCT_PACKAGES += \
    libnl
    
# Xiaomi Bluetooth
PRODUCT_PACKAGES += \
    XiaomiBluetooth

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/elish/elish-vendor.mk)

# ViPER4Android FX
# $(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)
