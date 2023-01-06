################################################################################
#
# gphoto2
#
################################################################################

GPHOTO2_VERSION = 2.5.27
GPHOTO2_SOURCE = gphoto2-$(GPHOTO2_VERSION).tar.xz
GPHOTO2_SITE = https://github.com/gphoto/gphoto2/releases/download/v$(GPHOTO2_VERSION)
GPHOTO2_LICENSE = GPL-2.0
GPHOTO2_LICENSE_FILES = COPYING
GPHOTO2_INSTALL_STAGING = YES
GPHOTO2_AUTORECONF = YES

# auto detection og lib popt fails on buildroot
GPHOTO2_DEPENDENCIES = libgphoto2 libtool host-pkgconf popt

GPHOTO2_CONF_ENV += POPT_CFLAGS="-I${STAGING_DIR}/usr/include/" POPT_LIBS="-L${STAGING_DIR}/usr/lib/ -lpopt"

GPHOTO2_CONF_OPTS += --without-rpmbuild --disable-gp2ddb --disable-internal-docs --disable-popt

$(eval $(autotools-package))
