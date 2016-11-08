# FMRadio
PRODUCT_PACKAGES += \
	FMRadio

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/fmr/mt6627_fm_cust.cfg:system/etc/fmr/mt6627_fm_cust.cfg \
	$(LOCAL_PATH)/prebuilts/FM/lib/libfmcust.so:system/lib/libfmcust.so \
	$(LOCAL_PATH)/prebuilts/FM/lib/libfmjni.so:system/lib/libfmjni.so \
	$(LOCAL_PATH)/prebuilts/FM/lib64/libfmcust.so:system/lib64/libfmcust.so \
	$(LOCAL_PATH)/prebuilts/FM/lib64/libfmjni.so:system/lib64/libfmjni.so \
	$(LOCAL_PATH)/prebuilts/FM/lib64/libfmjniem.so:system/lib64/libfmjniem.so \
	$(LOCAL_PATH)/prebuilts/FM/lib64/libmtkplayer.so:system/lib64/libmtkplayer.so

