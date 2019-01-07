# Makfile Vim
#

all: 

install: 
	sudo apt-get -y install strongswan strongswan-pki libcharon-extra-plugins libcharon-standard-plugins
	sudo cat ipsec.conf > /etc/ipsec.conf
	sudo echo ": RSA \"server-key.pem\" " > /etc/ipsec.secrets
	sudo echo "your_username : EAP \"your_password\"" >> /etc/ipsec.secrets
	sudo systemctl restart strongswan



setup_ufw:
	sudo ufw allow OpenSSH
	sudo ufw enable
	sudo ufw allow 500,4500/udp
	ip route | grep default
	sudo vi -O /etc/ufw/before.rules /etc/ufw/before.rules.add
	sudo vi -O /etc/ufw/sysctl.conf /etc/ufw/sysctl.conf.add
	sudo ufw disable
	sudo ufw enable
	



clean:


include ../.mk/common.mk
