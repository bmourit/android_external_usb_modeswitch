LOCAL_PATH:= $(call my-dir)
LINUX_KERNEL_INCLUDE = external/libusb-compat/libusb/
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	usb_modeswitch.c

LOCAL_CFLAGS := -O2 -g
LOCAL_CFLAGS += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))"

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH) \
	$(LINUX_KERNEL_INCLUDE)

LOCAL_SHARED_LIBRARIES += libssl libcrypto libusb libusb-compat

LOCAL_STATIC_LIBRARIES += libpcap

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

LOCAL_MODULE_TAGS := eng optional

LOCAL_MODULE := usb_modeswitch

LOCAL_POST_PROCESS_COMMAND := $(shell cp -rf $(LOCAL_PATH)/usb_modeswitch.d  $(TARGET_OUT)/etc/)

include $(BUILD_EXECUTABLE)
