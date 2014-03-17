# Inherit AOSP device configuration for Moto X Unified
$(call inherit-product, device/motorola/moto_8960dt/moto_msm8960dt.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/dominus/configs/cdma.mk)

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/dominus/configs/vzw.mk)

# Inherit common product files.
$(call inherit-product, vendor/dominus/configs/common.mk)

# Inherit common jf overlays
DEVICE_PACKAGE_OVERLAYS += vendor/dominus/overlay/ghost

# Setup device specific product configuration.
PRODUCT_NAME := dominus_moto_msm8960dt
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := moto_msm8960dt
PRODUCT_MODEL := MOTOROLA MSM8960DT
PRODUCT_MANUFACTURER := motorola
PRODUCT_RELEASE_NAME := Moto X

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ghost TARGET_DEVICE=MOTOROLA MSM8960DT BUILD_FINGERPRINT="motorola/ghost_verizon/ghost:4.2.2/13.9.0Q2.X-116-MX-17-53/5:user/release-keys" PRIVATE_BUILD_DESC="ghost-user 4.2.2 13.9.0Q2.X-116-MX-17-53 release-keys"

# boot animation
PRODUCT_COPY_FILES += \
    vendor/dominus/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
