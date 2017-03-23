ARCHS = armv7 arm64
SDK = iPhoneOS8.1
TARGET = iphone:clang:latest

include theos/makefiles/common.mk

BUNDLE_NAME = EnvoyPrefs
EnvoyPrefs_FILES = EnvoyPrefs.mm
EnvoyPrefs_INSTALL_PATH = /Library/PreferenceBundles
EnvoyPrefs_FRAMEWORKS = UIKit MessageUI CoreGraphics
EnvoyPrefs_PRIVATE_FRAMEWORKS = Preferences
EnvoyPrefs_LIBRARIES += cepheiprefs MobileGestalt
CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/EnvoyPrefs.plist$(ECHO_END)
