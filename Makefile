install: 
	ln -s vimrc ${HOME}/.vimrc

bundlelist:
	find bundle -path '*/.git/config' | \
		xargs awk -F= '/url =/ { split(FILENAME, path, "/"); print path[2], $$2 }' > bundle.list
