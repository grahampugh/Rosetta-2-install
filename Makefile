CURDIR := $(shell pwd)
MUNKIPKG := /usr/local/bin/munkipkg
PKG_SIGN := $(CURDIR)/../jamf-upload/sign_pkg.py
PYTHON_PATH := /usr/local/autopkg/python
SCRIPTS := $(CURDIR)/pkg/Rosetta-2-install/scripts
PKG_BUILD := $(CURDIR)/pkg/Rosetta-2-install/build
PKG_VERSION := $(shell defaults read $(CURDIR)/pkg/Rosetta-2-install/build-info.plist version)

objects = $(SCRIPTS)/postinstall


default : $(PKG_BUILD)/Rosetta-2-install-$(PKG_VERSION).pkg
	@echo "Building Rosetta-2-install pkg"


$(PKG_BUILD)/Rosetta-2-install-$(PKG_VERSION).pkg: $(objects)
	cd $(CURDIR)/pkg && $(MUNKIPKG) Rosetta-2-install


$(SCRIPTS)/postinstall:
	@echo "Copying Rosetta-2-install.sh into scripts directory as postinstall"
	mkdir -p "$(SCRIPTS)"
	cp "$(CURDIR)/Rosetta-2-install.sh" "$(SCRIPTS)/postinstall"
	chmod 755 "$(SCRIPTS)/postinstall"


.PHONY : clean
clean :
	@echo "Cleaning up package build folders"
	rm "$(SCRIPTS)/postinstall" ||:
	rm $(CURDIR)/pkg/Rosetta-2-install/build/*.pkg ||:

sign:
	@echo "Signing the package"
	rm $(CURDIR)/pkg/Rosetta-2-install/build/*.signed.pkg ||:
	${PYTHON_PATH} ${PKG_SIGN} -v $(CURDIR)/pkg/Rosetta-2-install/build/*.pkg