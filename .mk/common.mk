# Common Makefile 
#

VERSION := $(shell uname -v)
ifneq (,$(findstring Microsoft,$(VERSION)))
	OS := "Windows"
else
	ifneq (,$(findstring Ubuntu,$(VERSION)))
		OS := "Ubuntu"
	else 
		OS := "Linux"
	endif
endif

MAKEFILES := $(wildcard */Makefile)
MAKES     := $(subst Makefile,.make,$(MAKEFILES))
CLEAN     := $(subst Makefile,.clean,$(MAKEFILES))
INSTALL   := $(subst Makefile,.install,$(MAKEFILES))
DIRS      := $(subst /Makefile,,$(MAKEFILES))

sysinfo: 
	@echo "System Info:"	
	@echo "Version:   $(VERSION)"
	@echo "OS:        $(OS)"
	@echo "Makefiles: $(MAKEFILES)"
	@echo "Makes:     $(MAKES)"

request_install: $(INSTALL) 
	@echo Install: $(DIRS) 
	@echo "Proceed? (y/n)"
	@read line; case $$line in y*) return 0;; *) return 1;; esac 

update:
	sudo apt-get -y update
	sudo apt-get -y upgrade


%.make: %
	@echo $(CURR_PATH)
	make -C $<
	touch $@

%.clean: %
	make -C $< clean
	$(RM) $<.make

%.install: %
	make -C $< install


