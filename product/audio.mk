# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio_policy.default \
    libaudio-resampler \
    libtinycompress \
    libtinyxml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/audio/audio_em.xml:system/etc/audio_em.xml
