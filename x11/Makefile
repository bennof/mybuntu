# Makfile x11
#

all: 

install: install_ubuntu	

clean:

include ../.mk/common.mk

ifeq ($(OS),Ubuntu) 
install_ubuntu:
	sudo apt-get -y install chromium-browser vlc ubuntu-restricted-extras zathura
else
install_ubuntu:
	@echo "only for ubuntu os"
endif
