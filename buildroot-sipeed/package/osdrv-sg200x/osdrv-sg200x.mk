################################################################################
#
# osdrv-sg200x
#
################################################################################

OSDRV_SG200X_VERSION = 7919c9e4fce8e4a9ffd09a06c7078bc0c8aa73c1
OSDRV_SG200X_SITE = $(call github,0x754C,osdrv,$(OSDRV_SG200X_VERSION))
OSDRV_SG200X_DEPENDENCIES += linux

# if you develop this package, you can put it in local:
#OSDRV_SG200X_VERSION = 9999-rev1
#OSDRV_SG200X_SITE = "$(BR2_EXTERNAL_SIPEED_PATH)/package/osdrv-sg200x/src"
#OSDRV_SG200X_SITE_METHOD = local

define OSDRV_SG200X_BUILD_CMDS
	cd $(@D) && $(MAKE) \
		-j1 \
		ARCH=riscv \
		CROSS_COMPILE=riscv64-unknown-linux-gnu- \
		KERNEL_DIR=$(LINUX_DIR) \
		INSTALL_DIR=$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0644 -D $(BR2_EXTERNAL_SIPEED_PATH)/package/osdrv-sg200x/etc/modules-load.d/soph.conf \
                        $(TARGET_DIR)/etc/modules-load.d/soph.conf
	$(INSTALL) -m 0644 -D $(BR2_EXTERNAL_SIPEED_PATH)/package/osdrv-sg200x/etc/modules-load.d/aic.conf \
                        $(TARGET_DIR)/etc/modules-load.d/aic.conf
	$(INSTALL) -m 0644 -D $(BR2_EXTERNAL_SIPEED_PATH)/package/osdrv-sg200x/etc/modprobe.d/soph.conf \
                        $(TARGET_DIR)/etc/modprobe.d/soph.conf

endef

$(eval $(kernel-module))
$(eval $(generic-package))
