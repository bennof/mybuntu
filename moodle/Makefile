# moodle makefile
#

DEPS=nginx postgresql php
WWWGROUP=www-data

deps: 
	

apt:
	sudo apt-get update
	
git:
	sudo mkdir -p /var/www/moodle
	sudo chown -R $$USER:$(WWWGROUP) /var/www/moodle
	cd /var/www/moodle
	git clone https://github.com/moodle/moodle.git .
