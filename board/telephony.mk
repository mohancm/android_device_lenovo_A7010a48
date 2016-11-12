# RIL
BOARD_RIL_ClASS := ../../../device/lenovo/A7010a48/ril
BOARD_CONNECTIVITY_MODULE := conn_soc

#Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml