################################################################################
#
# photobooth
#
################################################################################
# PHOTOBOOTH_VERSION = 4.3.1
# PHOTOBOOTH_SITE = $(call github,PhotoboothProject,photobooth,v$(PHOTOBOOTH_VERSION))

PHOTOBOOTH_VERSION = ee0e340cbbc05551d60be7b1982fcd44e721a1ba
PHOTOBOOTH_SITE_METHOD = git
PHOTOBOOTH_GIT_SUBMODULES = YES
PHOTOBOOTH_SITE = https://github.com/PhotoboothProject/photobooth.git
PHOTOBOOTH_DEPENDENCIES = host-nodejs python-gphoto2
PHOTOBOOTH_LICENSE = MIT
PHOTOBOOTH_INSTALL_STAGING = NO

define PHOTOBOOTH_YARN_COMMAND
    $(HOST_DIR)/bin/node output/host/lib/node_modules/corepack/dist/yarn.js --cwd $(@D) $(strip $(1))
endef

define PHOTOBOOTH_YARN_INSTALL
    ${NPM} install yarn
endef
PHOTOBOOTH_PRE_BUILD_HOOKS += PHOTOBOOTH_YARN_INSTALL

# sed -i '\%DocumentRoot "/usr/htdocs"%d' $(TARGET_DIR)/etc/apache2/httpd.conf

define PHOTOBOOTH_FIX_APACHE2_CONFIG
    sed -i '\%Include /etc/apache2/extra/photobooth.conf%d' $(TARGET_DIR)/etc/apache2/httpd.conf

    sed -i 's/User daemon/User www-data/g' $(TARGET_DIR)/etc/apache2/httpd.conf
    sed -i 's/Group daemon/Group www-data/g' $(TARGET_DIR)/etc/apache2/httpd.conf
    
    echo "Include /etc/apache2/extra/photobooth.conf" >> $(TARGET_DIR)/etc/apache2/httpd.conf
endef
PHOTOBOOTH_POST_INSTALL_TARGET_HOOKS  += PHOTOBOOTH_FIX_APACHE2_CONFIG

define PHOTOBOOTH_BUILD_CMDS
    rm -rfv $(@D)/archives/*
    $(call PHOTOBOOTH_YARN_COMMAND, install)
    $(call PHOTOBOOTH_YARN_COMMAND, build)
    $(call PHOTOBOOTH_YARN_COMMAND, pack:build)
endef

define PHOTOBOOTH_PERMISSIONS
    /var/www/photobooth/ r 755 www-data www-data -  -  -  -  -
endef

define PHOTOBOOTH_USERS
    www-data -1 www-data -1 * /var/www /bin/false plugdev,lp,lpadmin,video,audio -
endef

define PHOTOBOOTH_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D $(PHOTOBOOTH_PKGDIR)/S90gphoto2-webcam \
		$(TARGET_DIR)/etc/init.d/S90gphoto2-webcam
endef

#
# TODO create a systemd service
#
# define PHOTOBOOTH_INSTALL_INIT_SYSTEMD
# 	$(INSTALL) -D -m 644 $(PHOTOBOOTH_PKGDIR)/gphoto2-webcam.service \
# 		$(TARGET_DIR)/usr/lib/systemd/system/gphoto2-webcam.service
# endef

define PHOTOBOOTH_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/var/www/photobooth
    tar -xvpf $(@D)/archives/*.tar.gz -C $(TARGET_DIR)/var/www/photobooth
    find $(TARGET_DIR)/var/www/photobooth -xtype l -delete
    $(INSTALL) -D -m 0644 $(PHOTOBOOTH_PKGDIR)/photobooth.conf  $(TARGET_DIR)/etc/apache2/extra/photobooth.conf
    $(INSTALL) -D -m 0644 $(PHOTOBOOTH_PKGDIR)/90-libgphoto2.rules  $(TARGET_DIR)/etc/udev/rules.d/90-libgphoto2.rules
endef

$(eval $(generic-package))
