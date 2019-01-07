# Makfile Erlang
#

all:

install: apt setup_ufw status_ufw status 

clean:
	rm -rf *.conf *.html

apt:
	sudo apt-get update
	sudo apt-get -y install nginx 
	sed -e 's/.*server_names_hash_bucket_size/\tserver_names_hash_bucket_size/'  /etc/nginx/nginx.conf > nginx.conf
	sudo install -b nginx.conf /etc/nginx/nginx.conf

status: 
	sudo systemctl status nginx

setup_ufw:
	sudo ufw allow OpenSSH
	sudo ufw allow 'Nginx Full'
	sudo ufw disable
	sudo ufw enable

status_ufw:
	sudo ufw status

start:
	sudo systemctl start nginx

stop:
	sudo systemctl stop nginx

restart: 
	sudo systemctl reload nginx


page: 
	sudo mkdir -p /var/www/$(page)
	sudo chown -R $(USER):$(USER) /var/www/$(page)
	sudo chmod -R 755 /var/www/$(page)
	./page.sh $(page)
	install -m 644 $(page).html /var/www/$(page)/index.html
	sudo install -m 644 $(page).conf /etc/nginx/sites-available/$(page)
	sudo ln -s /etc/nginx/sites-available/$(page) /etc/nginx/sites-enabled/
	sudo nginx -t
	sudo systemctl restart nginx



include ../.mk/common.mk

