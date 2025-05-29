
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 348ff1db80b2a010c0e25d4024ae68acd3b4441a
LDD_SITE = https://github.com/cu-ecen-aeld/assignment-7-anurag3301.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define LDD_BUILD_CMDS
	$(MAKE) KERNELDIR=$(LINUX_DIR) ARCH="$(KERNEL_ARCH)" CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/misc-modules modules
	$(MAKE) KERNELDIR=$(LINUX_DIR) ARCH="$(KERNEL_ARCH)" CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/scull modules
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/ldd/misc-modules
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/ldd/scull
	$(INSTALL) -m 0644 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/etc/ldd/misc-modules
	$(INSTALL) -m 0644 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/etc/ldd/misc-modules
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/etc/ldd/misc-modules
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/ldd/misc-modules
	$(INSTALL) -m 0644 $(@D)/scull/scull.ko $(TARGET_DIR)/etc/ldd/scull
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/etc/ldd/scull
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/etc/ldd/scull

	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/S98lddmodules $(TARGET_DIR)/etc/init.d
endef

$(eval $(generic-package))
