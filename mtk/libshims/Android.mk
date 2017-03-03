LOCAL_PATH := $(call my-dir)

## libshim_asc
include $(CLEAR_VARS)

LOCAL_SRC_FILES := mtk_asc.cpp

LOCAL_SHARED_LIBRARIES := libbinder libgui
LOCAL_MODULE := libshim_asc
include $(BUILD_SHARED_LIBRARY)


## libshim_ui
include $(CLEAR_VARS)

LOCAL_SRC_FILES := mtk_ui.cpp

LOCAL_SHARED_LIBRARIES := libbinder libui
LOCAL_MODULE := libshim_ui
include $(BUILD_SHARED_LIBRARY)


## libshim_gui
include $(CLEAR_VARS)

LOCAL_SRC_FILES := mtk_gui.cpp

LOCAL_SHARED_LIBRARIES := libbinder libui libgui
LOCAL_MODULE := libshim_gui
include $(BUILD_SHARED_LIBRARY)


## libshim_cam
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    mtk_cam.cpp \
    mtk_omx.cpp

LOCAL_SHARED_LIBRARIES := libbinder libgui libui
LOCAL_MODULE := libshim_cam
include $(BUILD_SHARED_LIBRARY)


## libshim_audio
include $(CLEAR_VARS)

LOCAL_SRC_FILES := mtk_audio.cpp

LOCAL_SHARED_LIBRARIES := libbinder libmedia
LOCAL_MODULE := libshim_audio
include $(BUILD_SHARED_LIBRARY)


## libshim_audioCompat
include $(CLEAR_VARS)

LOCAL_SRC_FILES := mtk_audioCompat.c

LOCAL_SHARED_LIBRARIES := libbinder libmedia
LOCAL_MODULE := libshim_audioCompat
include $(BUILD_SHARED_LIBRARY)


## libshim_parcel
include $(CLEAR_VARS)

# only for 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp

LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE := libshim_parcel
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


## libshim_fence
include $(CLEAR_VARS)

LOCAL_SRC_FILES := mtk_fence.cpp

LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE := libshim_fence
include $(BUILD_SHARED_LIBRARY)
