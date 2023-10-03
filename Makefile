include $(TOPDIR)/rules.mk

PKG_NAME:=go-example
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_MAINTAINER:=Lukas Vögl <lukas@voegl.org>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/lvoegl/go-example
GO_PKG_LDFLAGS:=-s -w

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/go-example
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Go Example
	DEPENDS:=$(GO_ARCH_DEPENDS)
	PKGARCH:=all
endef

define Package/go-example/description
	An example package in Golang.
endef

define Build/Prepare
	$(CP) ./* $(PKG_BUILD_DIR)
endef

define Package/go-example/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/go-example $(1)/usr/sbin
endef

$(eval $(call BuildPackage,go-example))
