# Makfile Vim
#

all: 

install: plug.vim
	apt-get -y install vim tmux
	mkdir -p ~/.vim/autoload
	install plug.vim ~/.vim/autoload/plug.vim
	install vimrc ~/.vimrc

run:
	vim -c PlugInstall 

plug.vim: 
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

clean:
	rm -f plug.vim


include ../.mk/common.mk
