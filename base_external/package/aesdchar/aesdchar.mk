
##############################################################
#
# AESDCHAR
#
##############################################################

AESDCHAR_VERSION = 6174046d10fca21fefe3694e0aa24e80a9081181
AESDCHAR_SITE = https://github.com/cu-ecen-aeld/assignments-3-and-later-anurag3301.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES

define AESDCHAR_BUILD_CMDS
	$(MAKE) KERNELDIR=$(LINUX_DIR) ARCH="$(KERNEL_ARCH)" CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/aesd-char-driver
endef

define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/aesdchar
	$(INSTALL) -d 0755 $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	echo /lib/modules/$(LINUX_VERSION_PROBED)/extra

	$(INSTALL) -m 0644 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/etc/aesdchar
	$(INSTALL) -m 0644 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/etc/aesdchar
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/etc/aesdchar

	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/S98aesdcharmodules $(TARGET_DIR)/etc/init.d
endef

$(eval $(generic-package))
