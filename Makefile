install: 
	ln -s ${.CURDIR}/vimrc ${HOME}/.vimrc
	(cd ${HOME}; egrep 'set (backupdir|directory)' .vimrc | awk -F= '{print "mkdir -p", $$2}' | sh)

bundlelist:
	find bundle -path '*/.git/config' | \
		xargs awk -F= '/url =/ { split(FILENAME, path, "/"); print path[2], $$2 }' > bundle.list

bundleclone:
	[ ! -d bundle ] && mkdir bundle || true
	(cd bundle; cat ../bundle.list | awk '{printf "%s %s\n", $$2, $$1}' | xargs -P 2 -t -n2 git clone)
