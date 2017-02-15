#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    // Framebuffer
    "/sys/devices/bus/7f000000.MTKFB/graphics/fb0",
    "/sys/devices/bus/7f000000.MTKFB",

    // MTK stuff
    "/sys/devices/mtk-msdc.0",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p1",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p2",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p3",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p4",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p5",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p6",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p7",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p8",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p9",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p10",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p11",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p12",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p13",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p14",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p15",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p16",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p17",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p18",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p19",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p20",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p21",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p22",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p23",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p24",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p25",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p26",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0rpmb",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0boot0",
    "/sys/devices/mtk-msdc.0/11230000.msdc0/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0boot1",
    

    // sdcard
    "/sys/devices/mtk-msdc.0/11240000.msdc1",
    "/sys/devices/mtk-msdc.0/11240000.msdc1/mmc_host/mmc1",
    "/sys/devices/mtk-msdc.0/11240000.msdc1/mmc_host/mmc1/mmc1:aaaa",
    "/sys/devices/mtk-msdc.0/11240000.msdc1/mmc_host/mmc1/mmc1:aaaa/block/mmcblk1/mmcblk1p1", 
    "/sys/devices/mtk-msdc.0/11240000.msdc1/mmc_host/mmc1/mmc1:aaaa/block/mmcblk1/mmcblk1",
    

    "/sys/bus/mmc",
    "/sys/bus/mmc/drivers/mmcblk",
    "/sys/bus/sdio",

    "/sys/devices/virtual/input/*",
    "/sys/devices/virtual/misc/uinput",
    "/sys/bus/platform/drivers/mtk-tpd",
    "/sys/bus/platform/drivers/mtk-kpd",
    "/sys/bus/platform/drivers/mtk-kpd/10003000.keypad/input/input0",
    "/sys/bus/platform/drivers/mtk-kpd/10003000.keypad/input/input0/event0",
    "/sys/bus/platform/drivers/mtk-kpd/10003000.keypad/misc/mtk-kpd",

    // adb

    "/sys/devices/virtual/tty/ptmx",
    "/sys/devices/virtual/misc/android_adb",
    "/sys/devices/virtual/android_usb/android0/f_adb",
    "/sys/bus/usb",

 NULL
};
