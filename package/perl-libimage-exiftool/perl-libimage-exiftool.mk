################################################################################
#
# perl-libimage-exiftool
#
################################################################################
PERL_LIBIMAGE_EXIFTOOL_VERSION = 12.50
PERL_LIBIMAGE_EXIFTOOL_SOURCE = Image-ExifTool-$(PERL_LIBIMAGE_EXIFTOOL_VERSION).tar.gz
PERL_LIBIMAGE_EXIFTOOL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/EX/EXIFTOOL
PERL_LIBIMAGE_EXIFTOOL_LICENSE = Artistic or GPL-1.0+
PERL_LIBIMAGE_EXIFTOOL_DISTNAME = Image-ExifTool

$(eval $(perl-package))
