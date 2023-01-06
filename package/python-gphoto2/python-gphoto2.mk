################################################################################
#
# python-gphoto2
#
################################################################################

PYTHON_GPHOTO2_VERSION = 2.3.4
PYTHON_GPHOTO2_SOURCE = gphoto2-$(PYTHON_GPHOTO2_VERSION).tar.gz
PYTHON_GPHOTO2_SITE = https://files.pythonhosted.org/packages/0a/ed/3f2a51de7a9d1bfa37308e938f5c68c076cbc31a57197da4d8ecca2dd4e7
PYTHON_GPHOTO2_LICENSE = GPLv3
PYTHON_GPHOTO2_LICENSE_FILES = LICENSE.txt
PYTHON_GPHOTO2_SETUP_TYPE = setuptools

$(eval $(python-package))

