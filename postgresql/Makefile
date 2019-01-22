# Makfile Vim
#

all: 

install: 
	sudo apt update
	sudo apt install postgresql postgresql-contrib
	for i in /etc/postgresql/*/main/ ; do sudo install --backup=t -m 644 -g postgres -o postgres pg_hba.conf $${i}pg_hba.conf ; done

new_user:
	sudo -u postgres createuser -P --interactive

new_db:
	@read -p "DB Name: " dbname; \
	read -p "Owner: " owner; \
	sudo -u postgres createdb -O $${owner} $${dbname}

clean:


include ../.mk/common.mk
