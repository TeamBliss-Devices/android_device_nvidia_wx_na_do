#
# Copyright (C) 2014 The CyanogenMod Project
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

$(call inherit-product-if-exists, vendor/nvidia/wx_na_do/wx_na_do-vendor.mk)

## overlay
DEVICE_PACKAGE_OVERLAYS += device/nvidia/wx_na_do/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    init.icera.common.rc \
    init.icera.rc \
    init.icera.tablet.rc

# Radio Interface
PRODUCT_PACKAGES += rild

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modem.do=1 \
    ril.icera-config-args=notifier:ON,datastall:ON,lwaactivate

#SELinux
BOARD_SEPOLICY_DIRS += device/nvidia/wx_na_do/sepolicy/
BOARD_SEPOLICY_UNION += \
	agpsd.te \
	fild.te \
	file_contexts \
	file.te \
	gpsd.te \
	icera-crashlogs.te \
	icera-feedback.te \
	icera-loader.te \
	icera-switcherd.te \
	init.te \
	mediaserver.te \
	mock_modem.te \
	system_app.te

# Inherit from shieldtablet
$(call inherit-product, device/nvidia/shieldtablet/shieldtablet.mk)
