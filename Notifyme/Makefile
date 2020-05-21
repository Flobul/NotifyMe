export GO_EASY_ON_ME = 1
SYSROOT=/Applications/Xcode.app/Contents//Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk
ARCHS = armv7 arm64 armv7s
TARGET = iphone:clang::9.2
SDKVERSION = 9.2

include $(THEOS)/makefiles/common.mk

TOOL_NAME = notifyme
notifyme_FILES = main.mm
notifyme_FRAMEWORKS = CoreFoundation
ADDITIONAL_OBJCFLAGS = -fno-objc-arc

include $(THEOS)/makefiles/tool.mk
include $(THEOS)/makefiles/aggregate.mk


