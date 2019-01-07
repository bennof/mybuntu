# Makfile Vim
#

all: 

install: 
	sudo DEBIAN_PRIORITY=low apt-get -y install postfix
	sudo postconf -e 'home_mailbox= Maildir/'
	sudo postconf -e 'virtual_alias_maps= hash:/etc/postfix/virtual'
	sudo vi /etc/postfix/virtual
	sudo postmap /etc/postfix/virtual
	sudo systemctl restart postfix
	sudo ufw allow Postfix
	echo 'export MAIL=~/Maildir' | sudo tee -a /etc/bash.bashrc | sudo tee -a /etc/profile.d/mail.sh
	echo "use <source /etc/profile.d/mail.sh> to enable postfix "

client:
	sudo apt-get install s-nail
	echo -e "set emptystart\nset folder=Maildir\nset record=+sent\n" | sudo tee -a /etc/s-nail.rc
	echo "alias mail='s-nail'" | sudo tee -a /etc/bash.bashrc | sudo tee -a /etc/profile.d/mail.sh
	echo 'init' | s-nail -s 'init' -Snorecord $(USER)

clean:


include ../.mk/common.mk
