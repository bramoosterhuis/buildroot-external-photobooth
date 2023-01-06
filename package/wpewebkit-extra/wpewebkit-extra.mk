################################################################################
#
# wpewebkit-extra
#
################################################################################
WPEWEBKIT_DEPENDENCIES := $(filter-out libsoup,$(WPEWEBKIT_DEPENDENCIES))
WPEWEBKIT_DEPENDENCIES += libsoup3

WPEWEBKIT_CONF_OPTS += \
			-DUSE_SOUP2=OFF \
			-DENABLE_RELEASE_LOG=ON \
			-DLOG_DISABLED=0 \
			-DRELEASE_LOG_DISABLED=0 \
			-DUSE_GSTREAMER_WEBRTC=ON \
			-DENABLE_WEB_RTC=ON \
			-DENABLE_THUNDER=OFF \
			-DENABLE_EXPERIMENTAL_FEATURES=ON \
			-DENABLE_DOCUMENTATION=OFF \
			-DUSE_JPEGXL=OFF \
			-DUSE_OPENXR=OFF \
			-DENABLE_WEBXR=OFF \
			-DUSE_AVIF=OFF \
			-DENABLE_CURSOR_VISIBILITY=ON \
			-DENABLE_MOUSE_CURSOR_SCALE=ON \
			-DENABLE_MEDIA_CAPTURE=ON \
			


$(eval $(virtual-package))