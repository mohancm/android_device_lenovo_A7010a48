# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril_class=MT6753 \
    ro.telephony.ril.config=fakeiccid

# RIL Proprietary
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/RIL/bin/gsm0710muxd:system/bin/gsm0710muxd \
    $(LOCAL_PATH)/prebuilts/RIL/bin/gsm0710muxdmd2:system/bin/gsm0710muxdmd2 \
    $(LOCAL_PATH)/prebuilts/RIL/bin/mtkrild:system/bin/mtkrild \
    $(LOCAL_PATH)/prebuilts/RIL/bin/mtkrildmd2:system/bin/mtkrildmd2 \
    $(LOCAL_PATH)/prebuilts/RIL/lib/libmal.so:system/lib/libmal.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib/libmdfx.so:system/lib/libmdfx.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib/librilmtk.so:system/lib/librilmtk.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib/librilmtkmd2.so:system/lib/librilmtkmd2.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib/mtk-ril.so:system/lib/mtk-ril.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib/mtk-rilmd2.so:system/lib/mtk-rilmd2.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib64/libmal.so:system/lib64/libmal.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib64/libmdfx.so:system/lib64/libmdfx.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib64/librilmtk.so:system/lib64/librilmtk.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib64/librilmtkmd2.so:system/lib64/librilmtkmd2.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib64/mtk-ril.so:system/lib64/mtk-ril.so \
    $(LOCAL_PATH)/prebuilts/RIL/lib64/mtk-rilmd2.so:system/lib64/mtk-rilmd2.so