# inherit common device tree
-include device/oppo/msm8974-common/BoardConfigCommon.mk

LOCAL_PATH := device/oppo/n3

TARGET_NO_BOOTLOADER := true
TARGET_OTA_ASSERT_DEVICE := n3,N5206,N5207

# Partition info
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00F00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00F00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1388314624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# NFC
BOARD_NFC_CHIPSET := pn547

TARGET_INIT_VENDOR_LIB := libinit_n3

AUDIO_FEATURE_I2S_SPEAKER_ENABLED := true
#AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true


# MUST NOT USE LOCAL_PATH
BOARD_SEPOLICY_DIRS += \
    device/oppo/n3/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    mediaserver.te

# Recovery:Start

TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/configs/fstab.n3
RECOVERY_SDCARD_ON_DATA := true
