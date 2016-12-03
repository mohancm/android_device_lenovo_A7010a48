# Kernel informations
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --board 1465391499 --ramdisk_offset 0x03f88000 --second_offset 0x40f0000 --tags_offset 0x0df88000 --board mohan

# Kernel properties
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilts/kernel

# Hack for building without kernel sources
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
