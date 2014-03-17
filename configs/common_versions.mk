# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/dominus/tools/getdate)
DOMINUS_BRANCH=gzokp

# DOMINUS RELEASE VERSION
DOMINUS_VERSION_MAJOR = 3
DOMINUS_VERSION_MINOR = 5
DOMINUS_VERSION_MAINTENANCE =

VERSION := $(DOMINUS_VERSION_MAJOR).$(DOMINUS_VERSION_MINOR)$(DOMINUS_VERSION_MAINTENANCE)

ifndef DOMINUS_BUILD
    ifdef RELEASE_TYPE
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^DOMINUS_||g')
        DOMINUS_BUILD := $(RELEASE_TYPE)
    else
        DOMINUS_BUILD := UNOFFICIAL
    endif
endif

ifdef DOMINUS_BUILD
    ifeq ($(DOMINUS_BUILD), RELEASE)
       DOMINUS_VERSION := $(TARGET_PRODUCT)_$(DOMINUS_BRANCH)-$(VERSION)-RELEASE-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(DOMINUS_BUILD), NIGHTLY)
        DOMINUS_VERSION := $(TARGET_PRODUCT)_$(DOMINUS_BRANCH)-$(VERSION)-NIGHTLY-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(DOMINUS_BUILD), EXPERIMENTAL)
        DOMINUS_VERSION := $(TARGET_PRODUCT)_$(DOMINUS_BRANCH)-$(VERSION)-EXPERIMENTAL-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(DOMINUS_BUILD), UNOFFICIAL)
        DOMINUS_VERSION := $(TARGET_PRODUCT)_$(DOMINUS_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
    endif
else
#We reset back to UNOFFICIAL
        DOMINUS_VERSION := $(TARGET_PRODUCT)_$(DOMINUS_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
endif



PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(DOMINUS_VERSION) \
    ro.dominus.version=$(VERSION)-$(DOMINUS_BUILD)

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.dominus.branch=$(DOMINUS_BRANCH) \
    ro.dominus.device=$(DOMINUS_PRODUCT)

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1
