install: 
	-ln -s $(CURDIR)/vimrc $(HOME)/.vimrc
	(cd $(HOME); egrep 'set (backupdir|directory)' .vimrc | awk -F= '{print "mkdir -p", $$2}' | sh)
	vim +BundleInstall +qall
