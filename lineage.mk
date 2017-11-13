#
# Copyright (C) 2015-2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit some common dotOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device_k5fpr.mk)

# Device display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# GMS Base
PRODUCT_GMS_CLIENTID_BASE := android-lenovo

# Device identifier
PRODUCT_BRAND := lenovo
PRODUCT_DEVICE := k5fpr
PRODUCT_MANUFACTURER := LENOVO
PRODUCT_MODEL := Lenovo K4 Note
PRODUCT_NAME := lineage_k5fpr
PRODUCT_RELEASE_NAME := k5fpr
PRODUCT_RESTRICT_VENDOR_FILES := false

# Fingerprints
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Lenovo/k5fpr/A7010a48:6.0/MRA58K/RA7010a48_S232_161227_ROW.12271429:user/release-keys \
    PRIVATE_BUILD_DESC="k5fpr-user 6.0 MRA58K A7010a48_S232_161227_ROW release-keys"
