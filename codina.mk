# Include common makefile
$(call inherit-product, device/samsung/u8500-common/common.mk)

# For better compatibility with ROMs (like Slim, PAC)
$(call inherit-product, vendor/samsung/u8500-common/codina/codina-vendor-blobs.mk)
LOCAL_PATH := device/samsung/codina

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/device_tunables.rc:root/device_tunables.rc \
    $(LOCAL_PATH)/rootdir/fstab.samsungcodina:root/fstab.samsungcodina \
    $(LOCAL_PATH)/rootdir/init.samsungcodina.rc:root/init.samsungcodina.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.samsungcodina.rc:root/init.recovery.samsungcodina.rc \
    $(LOCAL_PATH)/rootdir/ueventd.samsungcodina.rc:root/ueventd.samsungcodina.rc
    
# STE Modem
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ste_modem.sh:system/etc/ste_modem.sh

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/adm.sqlite-u8500:system/etc/adm.sqlite-u8500

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \

# APN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \

# Optional CM packages
PRODUCT_PACKAGES += \
    Calendar \
    CMFileManager \
    Apollo \
    SoundRecorder


# temporary hack
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ChronoKernelSettings-0991-beta.apk:system/app/ChronoKernelSettings-0991-beta.apk \
    $(LOCAL_PATH)/Nova_4.0.2.apk:system/app/Nova_4.0.2.apk


PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dalvik.multithread=true \
    ro.kernel.checkjni=0 \
    ro.kernel.android.checkjni=0 \
    debug.overlayui.enable=1 \
    dev.pm.dyn_samplingrate=1 \
    ro.config.hw_quickpoweron=true 

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0


# This device is hdpi.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Swype fix 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/system/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so \
    $(LOCAL_PATH)/system/app/LatinImeGoogle.apk:system/app/LatinImeGoogle.apk    
    $(LOCAL_PATH)/data/main%00003apl:data/data/com.android.inputmethod.latin/files/dicts/pl/main%00003apl

# WIFI fix
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/strace/strace:system/xbin/strace
