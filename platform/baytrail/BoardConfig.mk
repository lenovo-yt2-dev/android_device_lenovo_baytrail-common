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

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)

# Architecture
TARGET_ARCH_VARIANT := silvermont
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
TARGET_2ND_ARCH_VARIANT := silvermont
endif

#==============================================================================#
# kernel :
#==============================================================================#
KERNEL_LOGLEVEL ?= 5
BOARD_KERNEL_CMDLINE += loglevel=$(KERNEL_LOGLEVEL) androidboot.hardware=$(TARGET_DEVICE)

#==============================================================================#
# Hardware Accelerated Graphics :
#==============================================================================#
ENABLE_GEN_GRAPHICS := true

# Baytrail appends the path to EGL libraries.
PRODUCT_LIBRARY_PATH := $(PRODUCT_LIBRARY_PATH):/system/lib/egl

# EGL config
#BOARD_EGL_CFG ?= $(TARGET_DEVICE_DIR)/egl.cfg
BOARD_ALLOW_EGL_HIBERNATION := true

# Select ufo gen7 libs
UFO_ENABLE_GEN := gen7

# Defines Intel library for GPU accelerated Renderscript:
OVERRIDE_RS_DRIVER := libRSDriver_intel7.so

BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.vblankoffdelay=1 i915.fastboot=1
USE_OPENGL_RENDERER := true
USE_INTEL_UFO_DRIVER := true
USE_INTEL_UFO_OPENCL := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
INTEL_VA := true
BOARD_GRAPHIC_IS_GEN := true

INTEL_WIDI := ture
INTEL_WIDI_BAYTRAIL := ture

# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Allow HWC to perform a final CSC on virtual displays
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_INTEL_HWCOMPOSER_FORCE_ONLY_ONE_RGB_LAYER := true

#==============================================================================#
# File System :
#==============================================================================#
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 2684354560
BOARD_BOOTLOADER_PARTITION_SIZE ?= 62914560
BOARD_FLASH_BLOCK_SIZE := 512

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

#==============================================================================#
# Recovery / OTA :
#==============================================================================#
# By default recovery minui expects RGBA framebuffer
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
# Tell build system where to get the recovery.fstab.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

#==============================================================================#
# Audio :
#==============================================================================#
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_TINY_ALSA_AUDIO := true
BOARD_USES_AUDIO_HAL_XML := true

ifneq (,$(filter $(TARGET_BUILD_VARIANT),eng userdebug))
# Enable ALSA utils for eng and userdebug builds
BUILD_WITH_ALSA_UTILS := true
endif

BOARD_USES_GENERIC_AUDIO := false

#==============================================================================#
# Media :
#==============================================================================#
BUILD_WITH_FULL_STAGEFRIGHT := true
INTEL_STAGEFRIGHT := true

INTEL_INGREDIENTS_VERSIONS := true

# Settings for the Media SDK library and plug-ins:
# - USE_MEDIASDK: use Media SDK support or not
USE_MEDIASDK := true

# Settings for MPEG4-ASP:
# - USE_SW_MPEG4: use software MPEG4 decoder including ASP support
# - USE_INTEL_IPP: use IPP acceleration in decoders
# - BOARD_USES_WRS_OMXIL_CORE: load WRS omx-il core
# - BOARD_USES_MRST_OMX: load omx-component for MPEG4-ASP
USE_SW_MPEG4 := true
USE_INTEL_IPP := true
USE_INTEL_SECURE_AVC := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USES_MRST_OMX := true

BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
USE_INTEL_VA := true
INTEL_VA := true

#==============================================================================#

# Use dlmalloc
MALLOC_IMPL := dlmalloc

# customize the malloced address to be 16-byte aligned
BOARD_MALLOC_ALIGNMENT := 16

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Init
TARGET_PROVIDES_INIT_RC := true

# Define platform battery healthd library
#BOARD_HAL_STATIC_LIBRARIES += libhealthd.intel

# Security
BUILD_WITH_CHAABI_SUPPORT := true
BUILD_WITH_WATCHDOG_DAEMON_SUPPORT := true

# SELinux Policy : baytrail
-include device/intel/board/platform/baytrail/sepolicy.mk

# start kernel in permissive mode, this way we don't
# need 'setenforce 0' from init.rc files
BOARD_KERNEL_CMDLINE += enforcing=0 androidboot.selinux=permissive
