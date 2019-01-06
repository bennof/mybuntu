# Makfile plan9
#


all: install

install: apt ~/plan9port bin

run:

bin: 
	mkdir -p ~/.bin 
	for i in bin/*; do install -m 755 $$i ~/.bin/$$i; done

~/plan9port: apt
	git clone https://github.com/9fans/plan9port ~/plan9port
	cd ~/plan9port; ./INSTALL
	@cat profile >> ~/.profile
	

apt: 
	sudo apt-get install xorg-dev fonts-lato fonts-open-sans

clean:
	


include ../.mk/common.mk
