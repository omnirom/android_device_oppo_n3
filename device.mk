LOCAL_PATH := device/oppo/n3

# Audio config files
# MUST be before include common
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mixer_paths.xml:/system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.pcm.16bit.enable=false \
    audio.offload.disable=true

# must be before common one since we want to 
# overlay same files in vendor
$(call inherit-product, vendor/oppo/n3/n3-vendor.mk)

# Include common makefile
$(call inherit-product, device/oppo/msm8974-common/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.n3.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/configs/fstab.n3:root/fstab.qcom \
    $(LOCAL_PATH)/configs/twrp.fstab:recovery/root/etc/twrp.fstab

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    nfc_nci.pn54x.default \
    Tag \
    OmniClick

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# Sensor configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensor/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480
    
    #persist.radio.multisim.config=dsds \


