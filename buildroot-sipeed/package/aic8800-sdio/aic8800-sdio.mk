################################################################################
#
# aic8800-sdio
#
################################################################################

AIC8800_SDIO_VERSION = b49af456f8f461cff5ce66baf9e677b1c76e8184
AIC8800_SDIO_SITE = $(call github,0x754C,aic8800-sdio-linux,$(AIC8800_SDIO_VERSION))

AIC8800_SDIO_MODULE_MAKE_OPTS = \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

define AIC8800_SDIO_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
