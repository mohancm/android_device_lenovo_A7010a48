# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc.cfg:system/etc/nfc.cfg \
    $(LOCAL_PATH)/configs/nfcse.cfg:system/etc/nfcse.cfg \
    $(LOCAL_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/prebuilts/NFC/lib/libmtknfc.so:system/lib/libmtknfc.so \
    $(LOCAL_PATH)/prebuilts/NFC/lib/libnfc_ndef.so:system/lib/libnfc_ndef.so \
    $(LOCAL_PATH)/prebuilts/NFC/lib/hw/nfc_nci.mt6605.default.so:system/lib/hw/nfc_nci.mt6605.default.so \
    $(LOCAL_PATH)/prebuilts/NFC/lib64/hw/nfc_nci.mt6605.default.so:system/lib64/hw/nfc_nci.mt6605.default.so \
    $(LOCAL_PATH)/prebuilts/NFC/lib64/libnfc_ndef.so:system/lib64/libnfc_ndef.so \
    $(LOCAL_PATH)/prebuilts/NFC/lib64/libmtknfc.so:system/lib64/libmtknfc.so \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml
