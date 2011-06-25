THEOS_DEVICE_IP = 192.168.1.111
SDKVERSION=5.0
include theos/makefiles/common.mk

BUNDLE_NAME = FaceBook
FaceBook_FILES = FaceBookController.m TouchFix.m
FaceBook_INSTALL_PATH = /System/Library/WeeAppPlugins/
FaceBook_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
