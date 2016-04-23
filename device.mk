LOCAL_PATH := device/oppo/n3

# Audio config files
# MUST be before include common
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mixer_paths.xml:/system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/audio_platform_info.xml:system/etc/audio_platform_info.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.pcm.16bit.enable=false \
    audio.offload.disable=true \
    audio.offload.video=false \
    audio.offload.gapless.enabled=false \
    ro.sf.lcd_density=480

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Include common makefile
$(call inherit-product, device/oppo/msm8974-common/common.mk)

$(call inherit-product, frameworks/native-caf/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native-caf/build/phone-xxhdpi-2048-hwui-memory.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.n3.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/configs/fstab.n3:root/fstab.qcom \
    $(LOCAL_PATH)/configs/twrp.fstab:recovery/root/etc/twrp.fstab

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    nfc_nci.n3 \
    librmnetctl \
    OmniClick

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# Sensor configuration from Oppo
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensor/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

