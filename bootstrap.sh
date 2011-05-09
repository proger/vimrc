#!/bin/sh
egrep 'set (backupdir|directory)' .vimrc | awk -F= '{print "mkdir -p", $2}' | sh
