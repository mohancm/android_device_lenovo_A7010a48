LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    icu55.c \
    mtk_asc.cpp \
    mtk_audio.cpp \
    mtk_audioCompat.c \
    mtk_cam.cpp \
    mtk_fence.cpp \
	mtk_gps.cpp \
    mtk_omx.cpp \
    mtk_ui.cpp \
    mtk_xlog.cpp

# only for 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp

LOCAL_SHARED_LIBRARIES := libbinder liblog libgui libui libicuuc libicui18n libmedia
LOCAL_MODULE := libmtk_symbols
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
