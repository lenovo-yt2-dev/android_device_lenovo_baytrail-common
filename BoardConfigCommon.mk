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
# Architecture
#==============================================================================#
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)

ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
  TARGET_ARCH := x86_64
  TARGET_ARCH_VARIANT := x86_64
  TARGET_CPU_ABI := x86_64
  TARGET_2ND_ARCH := x86
  TARGET_2ND_ARCH_VARIANT := x86
  TARGET_2ND_CPU_ABI := x86
  TARGET_CPU_ABI_LIST_64_BIT := x86_64 arm64-v8a
  TARGET_CPU_ABI_LIST_32_BIT := x86 armeabi-v7a armeabi
  TARGET_CPU_ABI_LIST := x86_64 x86 armeabi-v7a armeabi arm64-v8a
  ADDITIONAL_BUILD_PROPERTIES += ro.dalvik.vm.isa.arm64=x86_64 ro.enable.native.bridge.exec64=1
else
  TARGET_ARCH := x86
  TARGET_ARCH_VARIANT := x86
  TARGET_CPU_ABI := x86
  TARGET_CPU_ABI_LIST_32_BIT := x86 armeabi-v7a armeabi
  TARGET_CPU_ABI_LIST := x86 armeabi-v7a armeabi
endif
TARGET_CPU_SMP := true
ADDITIONAL_BUILD_PROPERTIES += ro.dalvik.vm.isa.arm=x86 ro.enable.native.bridge.exec=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.dalvik.vm.native.bridge=libhoudini.so

# Binder API version
TARGET_USES_64_BIT_BINDER := $(if $(filter x86_64,$(TARGET_ARCH) $(TARGET_KERNEL_ARCH)),true)
# Nativebridge / Houdini: enable ARM codegen for x86
BUILD_ARM_FOR_X86 := true

#==============================================================================#

# Skip some proccess to speed up build
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_EMULATOR := false

# Enable dex-preoptimization to speed up the first boot sequence
# Note that this operation only works on Linux for now
# Enable for non-eng builds
ifneq ($(TARGET_BUILD_VARIANT),eng)
WITH_DEXPREOPT := true
endif
DONT_DEXPREOPT_PREBUILTS := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Adb
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# SELinux Policy : Intel
-include device/intel/board/sepolicy.mk

include device/intel/board/platform/$(TARGET_BOARD_PLATFORM)/BoardConfig.mk
