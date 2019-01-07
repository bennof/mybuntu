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






%.sysinfo: 
	@echo "System Info:"	
	@echo "Version:   $(VERSION)"
	@echo "OS:        $(OS)"
	@echo "Makefiles: $(MAKEFILES)"
	@echo "Makes:     $(MAKES)"

%.request_install: $(INSTALL) 
	@echo Install: $(DIRS) 
	@echo "Proceed? (y/n)"
	@read line; case $$line in y*) return 0;; *) return 1;; esac 

%.update:
	sudo apt-get -y update
	sudo apt-get -y upgrade


url ?= localhost 
ca  ?= localhost
gen_cert:
	sudo apt-get -y install openssl
	mkdir -p ~/pki/$(url)/{cacerts,certs,private} 
	chmod 700 ~/pki 
	chmod 700 ~/pki/$(url) 
	openssl genrsa -out ~/pki/$(url)/private/ca-key.pem 4096	
	ipsec pki --self --ca --lifetime 3650 --in ~/pki/$(url)/private/ca-key.pem \
		--type rsa --dn "CN=$(ca) CA" --outform pem > ~/pki/$(url)/cacerts/ca-cert.pem
	openssl genrsa -out ~/pki/$(url)/private/server-key.pem 4096
	ipsec pki --pub --in ~/pki/$(url)/private/server-key.pem --type rsa \
		| ipsec pki --issue --lifetime 1825 \
		--cacert ~/pki/$(url)/cacerts/ca-cert.pem \
		--cakey ~/pki/$(url)/private/ca-key.pem \
		--dn "CN=$(url)" --san "$(url)" \
		--flag serverAuth --flag ikeIntermediate --outform pem \
		>  ~/pki/$(url)/certs/server-cert.pem






%.make: %
	@echo $(CURR_PATH)
	make -C $<
	touch $@

%.clean: %
	make -C $< clean
	$(RM) $<.make

%.install: %
	make -C $< install


