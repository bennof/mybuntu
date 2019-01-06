# Makfile Erlang
#

all:

install: erlang-solutions_1.0_all.deb
	sudo dpkg -i erlang-solutions_1.0_all.deb
	sudo apt-get update
	sudo apt-get -y install esl-erlang

clean:
	rm -f erlang-solutions_1.0_all.deb
	rm -f rebar3

include ../.mk/common.mk

erlang-solutions_1.0_all.deb:
	wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb

rebar3:
	git clone https://github.com/erlang/rebar3
	cd rebar3; ./bootstrap
	mkdir -p ~/.bin
	install -m 755 rebar3/rebar3 ~/.bin/rebar3
