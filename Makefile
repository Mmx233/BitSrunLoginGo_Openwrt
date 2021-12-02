#
# Copyright (C) 2021 Mmx
#
# This is free software, licensed under the GNU Affero General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=BitSrunLoginGo
PKG_VERSION:=2.7
PKG_RELEASE:=$(AUTORELESE)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Mmx233/BitSrunLoginGo/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=77a8a6eccdb7fb91b2837ae1226ea304646ca83763808b2e710600222c375f1d

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Mmx

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/Mmx233/BitSrunLoginGo

GO_PKG_LDFLAGS:=-s -w

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define BitSrunLoginGo/templates
  define Package/$(1)
    TITLE:=An auto login tool
    URL:=https://github.com/Mmx233/BitSrunLoginGo
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=$$(GO_ARCH_DEPENDS)
  endef

  define Package/$(1)/description
  There is no description.
  endef

  define Package/$(1)/install
	$$(call GoPackage/Package/Install/Bin,$$(PKG_INSTALL_DIR))

	$$(INSTALL_DIR) $$(1)/usr/bin
	$$(INSTALL_BIN) $$(PKG_INSTALL_DIR)/usr/bin/$(1) $$(1)/usr/bin/
	$$(INSTALL_DIR) $$(1)/etc/init.d
	$$(INSTALL_BIN) ./BitSrunLogin $$(1)/etc/init.d/

	$(STAGING_DIR_HOST)/bin/upx --lzma --best $$(1)/usr/bin/$(1) || true
  endef
endef

 $(eval $(call BitSrunLoginGo/templates,BitSrunLoginGo)) \
 $(eval $(call GoBinPackage,BitSrunLoginGo)) \
 $(eval $(call BuildPackage,BitSrunLoginGo)) \
