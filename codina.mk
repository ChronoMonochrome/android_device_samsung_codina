#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/codina

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Our devices are HDPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.zygote.disable_gl_preload=1 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.sf.hw=1 \
    debug.hwui.render_dirty_regions=false

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/omxloaders:system/etc/omxloaders \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    libnetcmdiface \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Wi-Fi firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# Wi-Fi test 
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    hostapd_default.conf \
    dhcpcd.conf

# APN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml

# init.d
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/init.d,system/etc/init.d)

# Viper4Android
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/data,data)

# Updater-script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/update-binary:update-binary \
    $(LOCAL_PATH)/configs/updater-script-codina:META-INF/com/google/android/updater-script-codina \
    $(LOCAL_PATH)/configs/wipe.sh:install/wipe.sh

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# STE
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/cspsa.conf:system/etc/cspsa.conf \
    $(LOCAL_PATH)/configs/usbid_init.sh:system/bin/usbid_init.sh

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.telephony.ril_class=SamsungU8500RIL \
    ro.telephony.sends_barcount=1 \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/asound.conf:system/etc/asound.conf

PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.a2dp.default \
    libaudioutils \
    libtinyalsa

# U8500 Hardware
$(call inherit-product, hardware/u8500/u8500.mk)

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1

#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.sys.usb.config=mtp,adb

# Charger
#PRODUCT_PACKAGES += \
#    charger \
#    charger_res_images

# Charger
# Charger Prebuilt (temporary solution for lollipop)
# Use prebuilt charger and images from KitKat
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/charger/charger:root/sbin/charger \
    $(LOCAL_PATH)/prebuilt/charger/images/battery_0.png:root/res/images/charger/battery_0.png \
    $(LOCAL_PATH)/prebuilt/charger/images/battery_1.png:root/res/images/charger/battery_1.png \
    $(LOCAL_PATH)/prebuilt/charger/images/battery_2.png:root/res/images/charger/battery_2.png \
    $(LOCAL_PATH)/prebuilt/charger/images/battery_3.png:root/res/images/charger/battery_3.png \
    $(LOCAL_PATH)/prebuilt/charger/images/battery_4.png:root/res/images/charger/battery_4.png \
    $(LOCAL_PATH)/prebuilt/charger/images/battery_5.png:root/res/images/charger/battery_5.png \
    $(LOCAL_PATH)/prebuilt/charger/images/battery_charge.png:root/res/images/charger/battery_charge.png \
    $(LOCAL_PATH)/prebuilt/charger/images/battery_fail.png:root/res/images/charger/battery_fail.png

# Misc Packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    SamsungServiceMode \
    Stk \
    Torch

# Filesystem management
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# F2FS
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# mtools
PRODUCT_PACKAGES += \
    mtools

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/configs/keylayout/simple_remote.kl:system/usr/keylayout/simple_remote.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

# Live Wallpapers
PRODUCT_PACKAGES += \
    librs_jni

# Libstport
PRODUCT_PACKAGES += \
    libstlport

# Gralloc := \
    gralloc.montblanc

# Power HAL := \
    power.montblanc \
    profile

# Snap Camera
PRODUCT_PACKAGES += \
    Snap \
    LockClock

# Disable error Checking
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

# Storage switch
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.vold.switchablepair=sdcard0,sdcard1

# Dalvik VM config for 768MB RAM devices
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=128m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=4m
PRODUCT_TAGS += dalvik.gc.type-precise

# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Use the non-open-source parts, if they're present
include vendor/samsung/u8500-common/vendor-common.mk

# == BEGIN LOCAL CONFIG ==

# For better compatibility with ROMs (like Slim, PAC)
$(call inherit-product, vendor/samsung/u8500-common/codina/codina-vendor-blobs.mk)

# STE Modem
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ste_modem.sh:system/etc/ste_modem.sh

# UMS config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ums_init.sh:system/bin/ums_init.sh

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/adm.sqlite-u8500:system/etc/adm.sqlite-u8500

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf
