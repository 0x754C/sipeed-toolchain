################################################################################
#
# aic8800-sdio-firmware
#
################################################################################

AIC8800_SDIO_FIRMWARE_VERSION = 34f6a9bd9693a419721ff69de11e0a2d0bc09bff
AIC8800_SDIO_FIRMWARE_SITE = $(call github,0x754C,aic8800-sdio-firmware,$(AIC8800_SDIO_FIRMWARE_VERSION))

define AIC8800_SDIO_FIRMWARE_INSTALL_TARGET_CMDS
	mkdir -pv $(TARGET_DIR)/usr/lib/firmware/aic8800_sdio/
	rsync -r --verbose --copy-dirlinks --copy-links --hard-links ${@D}/* $(TARGET_DIR)/usr/lib/firmware/aic8800_sdio/
endef

$(eval $(generic-package))
