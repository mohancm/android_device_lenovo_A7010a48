# SELinux
BOARD_SEPOLICY_DIRS := \
       $(LOCAL_PATH)/sepolicy

# SECCOMP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy
