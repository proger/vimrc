install: 
	ln -s vimrc ${HOME}/.vimrc
	(cd ${HOME}; egrep 'set (backupdir|directory)' .vimrc | awk -F= '{print "mkdir -p", $2}' | sh)

bundlelist:
	find bundle -path '*/.git/config' | \
		xargs awk -F= '/url =/ { split(FILENAME, path, "/"); print path[2], $$2 }' > bundle.list
