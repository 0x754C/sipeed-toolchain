################################################################################
#
# middleware-sg200x
#
################################################################################

MIDDLEWARE_SG200X_VERSION = d4b11f57edbef34e2e994af1da53dfd6beb05527
MIDDLEWARE_SG200X_SITE = $(call github,0x754C,middleware,$(MIDDLEWARE_SG200X_VERSION))

# if you develop this package, you can put it in local:
#MIDDLEWARE_SG200X_VERSION = 9999-rev1
#MIDDLEWARE_SG200X_SITE = "$(BR2_EXTERNAL_SIPEED_PATH)/package/middleware-sg200x/src"
#MIDDLEWARE_SG200X_SITE_METHOD = local


MIDDLEWARE_SG200X_DEPENDENCIES += linux

define MIDDLEWARE_SG200X_BUILD_CMDS
	cd $(@D)/v2 && $(MAKE) \
		PROJECT_FULLNAME=SG200X \
		CHIP_ARCH=SG200X \
		BUILD_PATH=$(@D)/v2/build \
		SDK_VER=musl_riscv64 \
		MW_VER=v2 \
		ARCH=riscv \
		CROSS_COMPILE=riscv64-unknown-linux-musl- \
		KERNEL_DIR=$(LINUX_DIR) \
		OSS_TARBALL_PATH=$(@D)/v2/oss/oss_release_tarball/musl_riscv64 \
		OSS_BUILD_SRCIPT=$(@D)/v2/oss/run_build.sh \
		OUTPUT_DIR=$(@D)/v2/output \
		sensor-y=gcore_gc4653
endef

define MIDDLEWARE_SG200X_INSTALL_TARGET_CMDS
	mkdir -pv $(TARGET_DIR)/mnt/system/usr/bin/
	cp -rvf $(@D)/v2/sample/*/sample* $(TARGET_DIR)/mnt/system/usr/bin/
	cp -rvf $(@D)/v2/sample/sensor_test/sensor_test $(TARGET_DIR)/mnt/system/usr/bin/
	cp -rvf $(@D)/v2/sample/ir_auto/ir_auto $(TARGET_DIR)/mnt/system/usr/bin/
	cp -rvf $(@D)/v2/sample/ive/ive_stress $(TARGET_DIR)/mnt/system/usr/bin/
	find $(TARGET_DIR)/mnt/system/usr/bin -name '*.template' -delete
	find $(TARGET_DIR)/mnt/system -name '*.cpp' -delete
	find $(TARGET_DIR)/mnt/system -name '*.h' -delete
	find $(TARGET_DIR)/mnt/system -name '*.c' -delete
	find $(TARGET_DIR)/mnt/system -name '*.o' -delete
	find $(TARGET_DIR)/mnt/system -name '*.d' -delete
	mkdir -pv $(TARGET_DIR)/mnt/system/usr/lib/
	cp -rvf $(@D)/v2/lib/* $(TARGET_DIR)/mnt/system/usr/lib/
	find $(TARGET_DIR)/mnt/system -name '*.a' -delete
	cp -rvf $(BR2_EXTERNAL_SIPEED_PATH)/package/middleware-sg200x/mnt $(TARGET_DIR)/
endef


$(eval $(generic-package))
