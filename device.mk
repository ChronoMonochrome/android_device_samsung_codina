#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 The CyanogenMod Project
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

# prebuilt kernel
PRODUCT_COPY_FILES += \
    device/samsung/codina/kernel/kernel:kernel


# ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/codina/ramdisk/init.recovery.samsungcodina.rc:root/init.recovery.samsungcodina.rc \
    device/samsung/codina/ramdisk/ueventd.rc:recovery/root/ueventd.rc \
    device/samsung/codina/ramdisk/ueventd.samsungcodina.rc:recovery/root/ueventd.samsungcodina.rc \
    device/samsung/codina/ramdisk/lpm.rc:recovery/root/lpm.rc

# recovery
PRODUCT_COPY_FILES += \
    device/samsung/codina/recovery/recovery.fstab:recovery/root/etc/recovery.fstab
