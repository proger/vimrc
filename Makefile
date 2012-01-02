install: 
	ln -s ${CURDIR}/vimrc ${HOME}/.vimrc
	(cd ${HOME}; egrep 'set (backupdir|directory)' .vimrc | awk -F= '{print "mkdir -p", $$2}' | sh)

bundlelist:
	find bundle -path '*/.git/config' | \
		xargs awk -F= '/url =/ { split(FILENAME, path, "/"); print path[2], $$2 }' > bundle.list

bundleclone:
	mkdir -p bundle
	(cd bundle; cat ../bundle.list | awk '{printf "%s %s\n", $$2, $$1}' | xargs -P 2 -t -n2 git clone)

DIFF=	${CURDIR}/diffs

bundlediff:
	mkdir -p ${DIFF}
	(cd bundle; for dir in *; do \
		(cd $$dir; git diff > ${DIFF}/$$dir; git diff --cached >> ${DIFF}/$$dir) \
	done)
	find ${DIFF} -empty | xargs rm -f

BLOB=		bundleblob.tar.gz
BLOBTARGET=	eva:share/${BLOB}
BLOBSOURCE=	http://share.darkproger.net/${BLOB}

blob:
	tar cvzf ${BLOB} bundle
	scp ${BLOB} ${BLOBTARGET}

bundleblob:
	curl ${BLOBSOURCE} | tar xvzf -

bootstrap: install bundleblob
