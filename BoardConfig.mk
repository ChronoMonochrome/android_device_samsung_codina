-include device/samsung/u8500-common/BoardCommonConfig.mk

TARGET_OTA_ASSERT_DEVICE := codina,i8160,GT-I8160

# Kernel
TARGET_KERNEL_CONFIG := codina_defconfig

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/codina/bluetooth

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/codina/rootdir/fstab.samsungcodina

