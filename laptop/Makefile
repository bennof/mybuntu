# Makfile laptop
#

all: 

install: install_ubuntu

clean:

include ../.mk/common.mk

ifeq ($(OS),Ubuntu) 
install_ubuntu:
	sudo apt install tlp tlp-rdw
	sudo tlp start
else
install_ubuntu:
	@echo "only for ubuntu os"
endif
