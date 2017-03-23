ARCHS = armv7 arm64
SDK = iPhoneOS8.1
TARGET = iphone:clang:latest
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

TWEAK_NAME = Envoy
Envoy_FILES = Tweak.xm
Envoy_FRAMEWORKS = UIKit Foundation
Envoy_LIBRARIES += cephei
Envoy_CFLAGS = -Wno-error
Envoy_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard; killall -9 Messenger"
SUBPROJECTS += envoyprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
