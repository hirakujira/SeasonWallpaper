ARCHS = armv7 arm64
TARGET = :clang::6.0
include theos/makefiles/common.mk
BUNDLE_NAME = SeasonWallpaper
SeasonWallpaper_FILES = SeasonWallpaper.mm
SeasonWallpaper_INSTALL_PATH = /Library/PreferenceBundles
SeasonWallpaper_FRAMEWORKS = UIKit
SeasonWallpaper_PRIVATE_FRAMEWORKS = Preferences
IP_ADDRESS=10.0.1.13
include $(THEOS_MAKE_PATH)/bundle.mk


internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SeasonWallpaper.plist$(ECHO_END)
	rsync -z _/Library/PreferenceBundles/SeasonWallpaper.bundle/* root@$(IP_ADDRESS):/Library/PreferenceBundles/SeasonWallpaper.bundle/
	
	ssh root@$(IP_ADDRESS) killall Preferences
	
sync: stage
	rsync -r -z _/Library/PreferenceBundles/SeasonWallpaper.bundle/* root@$(IP_ADDRESS):/Library/PreferenceBundles/SeasonWallpaper.bundle/
	rsync -z _/Library/PreferenceLoader/Preferences/SeasonWallpaper.plist root@$(IP_ADDRESS):/Library/PreferenceLoader/Preferences/SeasonWallpaper.plist
	ssh root@$(IP_ADDRESS) killall Preferences