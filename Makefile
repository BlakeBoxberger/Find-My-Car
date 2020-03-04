INSTALL_TARGET_PROCESSES = com.apple.Maps

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FindMyCar

FindMyCar_FILES = Tweak.x FindMyParkedCarViewController.m
FindMyCar_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
