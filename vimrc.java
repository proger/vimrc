"Bundle "vim-scripts/javacomplete.git"

" java class unzipping
"let g:zip_unzipcmd="unzipq" " make sure you have it in $PATH

function! Classdump()
	let file = bufname('%')
	let jar = matchstr(file, 'zipfile:\zs.*.jar\ze::.*')
	let class = substitute(matchstr(file, 'zipfile:.*.jar::\zs.*\ze.class'), '/', '.', '')
	let comm = 'javap -classpath ' . jar . ' ' . class

	silent! execute 'silent! %!'. comm
	silent! setlocal filetype=java
endfunction

au FileType stata call Classdump()

