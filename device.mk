LOCAL_PATH := device/oppo/n3

# Audio config files
# MUST be before include common
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mixer_paths.xml:/system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.pcm.16bit.enable=false \
    audio.offload.disable=true \
    audio.offload.video=false \
    audio.offload.gapless.enabled=false \
    ro.sf.lcd_density=480 \
    persist.radio.multisim.config=dsds \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.data.netmgrd.qos.enable=true \
    ro.use_data_netmgrd=true

# Include common makefile
$(call inherit-product, device/oppo/msm8974-common/common.mk)

$(call inherit-product, frameworks/native-caf/build/phone-xxxhdpi-3072-dalvik-heap.mk)
$(call inherit-product, frameworks/native-caf/build/phone-xxhdpi-2048-hwui-memory.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.n3.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/configs/fstab.n3:root/fstab.qcom \
    $(LOCAL_PATH)/configs/twrp.fstab:recovery/root/etc/twrp.fstab

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    nfc_nci.n3 \
    Tag \
    OmniClick \
    librmnetctl

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# Sensor configuration from Oppo
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensor/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

