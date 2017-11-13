/*
 * Copyright (C) 2016 CyanogenMod
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define LOG_TAG "MTK PowerHAL"
#include <utils/Log.h>

#include <hardware/hardware.h>
#include <hardware/power.h>

#define MT_RUSH_BOOST_PATH "/proc/hps/rush_boost_enabled"
#define MT_FPS_UPPER_BOUND_PATH "/d/ged/hal/fps_upper_bound"
#define MT_DYNAMIC_BOOST "/sys/devices/platform/dynamic_boost/dynamic_boost"


#define POWER_HINT_POWER_SAVING 0x00000101
#define POWER_HINT_PERFORMANCE_BOOST 0x00000102
#define POWER_HINT_BALANCE  0x00000103

static void power_init(struct power_module *module)
{
}

static void power_set_interactive(struct power_module *module, int on)
{
}

static void power_fwrite(const char *path, char *s)
{
    char buf[64];
    int len;
    int fd = open(path, O_WRONLY);

    if (fd < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
        return;
    }

    len = write(fd, s, strlen(s));
    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);
    }

    close(fd);
}

static void power_hint(struct power_module *module, power_hint_t hint,
                       void *data) {
    int32_t dataint = -1;
    switch (hint) {
        case POWER_HINT_LOW_POWER:
            dataint = *(int32_t *)data;
            if (dataint) {
                power_fwrite(MT_FPS_UPPER_BOUND_PATH, "30");
                power_fwrite(MT_RUSH_BOOST_PATH, "0");
            } else {
                power_fwrite(MT_FPS_UPPER_BOUND_PATH, "60");
                power_fwrite(MT_RUSH_BOOST_PATH, "1");
            }
            ALOGI("POWER_HINT_LOW_POWER");
            break;
        case POWER_HINT_LAUNCH:
            power_fwrite(MT_DYNAMIC_BOOST, "9 2000");
        case POWER_HINT_VSYNC:
        case POWER_HINT_INTERACTION:
        case POWER_HINT_CPU_BOOST:
        case POWER_HINT_AUDIO:
        case POWER_HINT_SET_PROFILE:
        case POWER_HINT_VIDEO_ENCODE:
        case POWER_HINT_VIDEO_DECODE:
        break;
    default:
        break;
    }
}

void set_feature(struct power_module *module, feature_t feature, int state)
{
#ifdef TAP_TO_WAKE_NODE
    char tmp_str[64];
    if (feature == POWER_FEATURE_DOUBLE_TAP_TO_WAKE) {
        snprintf(tmp_str, 64, "%d", state);
        power_fwrite(TAP_TO_WAKE_NODE, tmp_str);
        return;
    }
#endif
}

static int power_open(const hw_module_t* __unused module, const char* name,
                    hw_device_t** device)
{
    int retval = 0; /* 0 is ok; -1 is error */
    ALOGD("%s: enter; name=%s", __FUNCTION__, name);

    if (strcmp(name, POWER_HARDWARE_MODULE_ID) == 0) {
        power_module_t *dev = (power_module_t *)calloc(1,
                sizeof(power_module_t));

        if (dev) {
            /* Common hw_device_t fields */
            dev->common.tag = HARDWARE_DEVICE_TAG;
            dev->common.module_api_version = POWER_MODULE_API_VERSION_0_3;
            dev->common.hal_api_version = HARDWARE_HAL_API_VERSION;

            dev->init = power_init;
            dev->powerHint = power_hint;
            dev->setInteractive = power_set_interactive;
            dev->setFeature = set_feature;

            *device = (hw_device_t*)dev;
        } else
            retval = -ENOMEM;
    } else {
        retval = -EINVAL;
    }

    ALOGD("%s: exit %d", __FUNCTION__, retval);
    return retval;
}

static struct hw_module_methods_t power_module_methods = {
    .open = power_open,
};

struct power_module HAL_MODULE_INFO_SYM = {
    .common = {
        .tag = HARDWARE_MODULE_TAG,
        .module_api_version = POWER_MODULE_API_VERSION_0_2,
        .hal_api_version = HARDWARE_HAL_API_VERSION,
        .id = POWER_HARDWARE_MODULE_ID,
        .name = "MTK Power HAL",
        .author = "Cyanogen",
        .methods = &power_module_methods,
    },

    .init = power_init,
    .setInteractive = power_set_interactive,
    .powerHint = power_hint,
    .setFeature = set_feature,
};
