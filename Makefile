# Global Makefile
#
#


all:
	@echo "all"

clean:
	@echo "clean"

install: 
	@echo "install"

setup: 
	@echo "setup"


test: 
	cat <<- EOF > test.hh
		some test
		some more
	EOF	


include .mk/common.mk
