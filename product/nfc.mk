# Nfc
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    Nfc \
    Tag
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc.cfg:system/etc/nfc.cfg \
    $(LOCAL_PATH)/configs/nfcse.cfg:system/etc/nfcse.cfg \
    $(LOCAL_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml
