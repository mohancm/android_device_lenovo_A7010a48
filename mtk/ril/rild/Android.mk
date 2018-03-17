# Copyright 2017 The Android Open Source Project
#
# Oreo RIL daemon for MTK devices - Version (0.9).
# by: daniel_hk(https://github.com/danielhk)
#
# start with the AOSP rild
#
# 2017/7/29: Initial Oero port for MT6752	- by:daniel_hk
#

ifeq ($(BOARD_PROVIDES_RILD),true)
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	rild.c

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libcutils \
	libril \
	libdl

LOCAL_STATIC_LIBRARIES := \
	rild-prop-md1

# temporary hack for broken vendor rils
LOCAL_WHOLE_STATIC_LIBRARIES := \
	librilutils_static

LOCAL_CFLAGS := -DRIL_SHLIB

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE:= rild
#LOCAL_INIT_RC := rild.rc

include $(BUILD_EXECUTABLE)
endif
