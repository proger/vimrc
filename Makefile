install: 
	-ln -s $(CURDIR)/vimrc $(HOME)/.vimrc
	(cd $(HOME); egrep 'set (backupdir|directory)' .vimrc | awk -F= '{print "mkdir -p", $$2}' | sh)
	-git clone https://github.com/gmarik/vundle.git bundle/vundle
	vim +BundleInstall +qall
