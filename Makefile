install: 
	-ln -s $(CURDIR)/vimrc $(HOME)/.vimrc
	(cd $(HOME); egrep 'set (backupdir|directory)' .vimrc | awk -F= '{print "mkdir -p", $$2}' | sh)
	-git clone https://github.com/gmarik/vundle.git bundle/vundle
	vim +BundleInstall +qall

misc: vimproc
	-gem install redcarpet pygments.rb
	npm -g install instant-markdown-d


ifeq ($(shell uname),Darwin)
vimproc:
	cd bundle/vimproc.vim; make -f make_mac.mak
else
vimproc:
	cd bundle/vimproc.vim; make -f make_unix.mak
endif
