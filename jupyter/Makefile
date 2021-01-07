#Makefile Jupyter

HOME:=$(shell echo $$HOME)

all: 





setup: 
	jupyter notebook --generate-config
	mkdir -p ~/jupyter/notebooks
	PASS=$$(python3 -c "from notebook.auth import passwd; print(passwd())"); \
	  cat ~/.jupyter/jupyter_notebook_config.py | \
	  sed -e "s|.*c.NotebookApp.notebook_dir =.*|c.NotebookApp.notebook_dir = '$(HOME)/jupyter/notebooks'|" | \
	  sed -e "s|.*c.NotebookApp.base_url =.*|c.NotebookApp.base_url = '/'|" | \
	  sed -e "s|.*c.NotebookApp.password =.*|c.NotebookApp.password = '$$PASS'|" | \
	  sed -e 's|.*c.NotebookApp.allow_remote_access =.*|c.NotebookApp.allow_remote_access = True |' | \
	  sed -e 's|.*c.NotebookApp.port =.*|c.NotebookApp.port = 8888|' | \
	  sed -e 's|.*c.NotebookApp.port_retries =.*|c.NotebookApp.port_retries = 50|' > c.py; \
	  echo password: $$PASS
	install -b c.py ~/.jupyter/jupyter_notebook_config.py

nginx: setup
	./page.sh $(page)
	sudo install -m 644 $(page).conf /etc/nginx/sites-available/$(page)
	sudo ln -s /etc/nginx/sites-available/$(page) /etc/nginx/sites-enabled/
	sudo nginx -t
	sudo systemctl restart nginx



apt: 
	sudo apt-get update
	sudo apt-get install python3 python3-pip python3-dev
	sudo apt-get install python3-numpy python3-matplotlib

pip:   
	sudo pip3 install --upgrade pip
	sudo pip3 install jupyter
