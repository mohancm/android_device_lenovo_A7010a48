# SELinux
BOARD_SEPOLICY_DIRS := \
       $(LOCAL_PATH)/sepolicy/basic
       $(LOCAL_PATH)/sepolicy/bsp
       $(LOCAL_PATH)/sepolicy/full
       
# Seccomp Filter
BOARD_SECCOMP_POLICY := \
       $(LOCAL_PATH)/seccomp
