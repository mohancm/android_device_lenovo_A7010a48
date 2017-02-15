# FMRadio
MTK_FM_SUPPORT := true

PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/FM/lib64/libfmjniem.so:system/lib64/libfmjniem.so \
	$(LOCAL_PATH)/prebuilts/FM/lib64/libmtkplayer.so:system/lib64/libmtkplayer.so
