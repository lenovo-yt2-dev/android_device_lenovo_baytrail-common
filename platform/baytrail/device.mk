#
# Copyright (C) 2016 The Android Open Source Project
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

#==============================================================================#
# Kernel
#==============================================================================#

#==============================================================================#
# Audio
#==============================================================================#
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    audio.policy.default

PRODUCT_PACKAGES += \
    libtinyalsa \
    libtinycompress \
    libtinyxml

PRODUCT_PACKAGES += \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

#==============================================================================#
# Camera
#==============================================================================#
PRODUCT_PACKAGES += Camera2

#==============================================================================#
# Charger
#==============================================================================#
PRODUCT_PACKAGES += charger charger_res_images

#==============================================================================#
# Filesystem management tools
#==============================================================================#
PRODUCT_PACKAGES += \
    e2fsck \
    resize2fs \
    setup_fs \
    tune2fs

#==============================================================================#
# Libraries
#==============================================================================#
PRODUCT_PACKAGES += \
    minizip \
    openssl

#==============================================================================#
# Hardware Accelerated Graphics
#==============================================================================#
PRODUCT_PACKAGES += \
    libdrm \
    libdrm_intel \
    libpciaccess

# Color conversion library
PRODUCT_PACKAGES += libI420colorconvert

# fixme : UFO prebuilts from android-ia
PRODUCT_PACKAGES += ufo_prebuilts
ifneq ($(TARGET_2ND_ARCH),)
PRODUCT_PACKAGES += ufo_prebuilts_32
endif

# fixme : UFO prebuilts from Intel BSP
PRODUCT_PACKAGES += ufo libivp libpavp

PRODUCT_PROPERTY_OVERRIDES += ro.opengles.version = 196609

#==============================================================================#
# Media
#==============================================================================#
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# libstagefrighthw
BUILD_WITH_FULL_STAGEFRIGHT := true
PRODUCT_PACKAGES += libstagefrighthw

# Media SDK and OMX IL components
PRODUCT_PACKAGES += \
    libmfxhw32 \
    libmfxsw32 \
    libmfx_omx_core \
    libmfx_omx_components_hw \
    libmfx_omx_components_sw \
    libgabi++-mfx \
    libstlport-mfx

#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

# omx components
PRODUCT_PACKAGES += \
    libwrs_omxil_base \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderAVCSecure \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoDecoderVP8 \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4 \
    libOMXVideoEncoderAVC

# libmix
PRODUCT_PACKAGES += \
    libmixvbp \
    libmixvbp_mpeg4 \
    libmixvbp_h264 \
    libmixvbp_vc1 \
    libmixvbp_vp8 \
    libmixvbp_h264secure \
    libva_videodecoder \
    libva_videoencoder

PRODUCT_PACKAGES += libasfparser

# libva
PRODUCT_PACKAGES += \
    libva \
    libva-android \
    libva-tpi.so \
    vainfo


# Decoding MPEG4-ASP/H263
PRODUCT_PACKAGES += libintelmetadatabuffer

# Media libISV
PRODUCT_PACKAGES += libisv_omx_core

# psb video
PRODUCT_PACKAGES += pvr_drv_video

# stlport
PRODUCT_PACKAGES += libstlport

#==============================================================================#
# Ramdisk
#==============================================================================#
PRODUCT_COPY_FILES += \

ADDITIONAL_DEFAULT_PROPERTIES += ro.sys.powerctl.no.shutdown=1


#==============================================================================#
# Thermal itux
#==============================================================================#
#ENABLE_ITUXD := true
#PRODUCT_PACKAGES += ituxd

#==============================================================================#
# Touch
#==============================================================================#
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml

#==============================================================================#
# usb accessory
#==============================================================================#
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_PACKAGES += com.android.future.usb.accessory

#==============================================================================#
#
#==============================================================================#
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

#==============================================================================#
# This is needed to enable silver art optimizer.
# This will build the plugins/libart-extension.so library, which is dynamically loaded by
# AOSP and contains Intel optimizations to the compiler.
#==============================================================================#
#PRODUCT_PACKAGES += libart-extension
