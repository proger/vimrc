map ; :
set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
if filereadable(expand("~/.vim/vimrc.bundles"))
	source ~/.vim/vimrc.bundles
endif
filetype plugin indent on

set backup
set backupdir=$HOME/.vimruntime/backups
set directory=$HOME/.vimruntime/tmp

"set background=dark
set background=light
set backspace=indent,eol,start

syntax on
"set autochdir
set ttyfast
set lazyredraw
set clipboard=unnamed
set mouse=n
set novisualbell

set history=1000
set undolevels=1000
set modeline
set modelines=5

set hidden	" allow to switch buffers without saving

" basic ui
set shortmess=asI
set report=0
set showcmd
set showmode
set wildignore=*.o,*.so,*.pico,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*.beam,tags,*.class,*.hi,*.chi
set wildmenu
set wildmode=list:full
set cursorline
set ruler

set hlsearch
nmap \q :nohlsearch<CR>

" matching parenthesis
set showmatch
set matchtime=5

" movement
set iskeyword+=_,$,@,%,#
set nostartofline
set scrolloff=5
set sidescrolloff=18
set nowrap

" editing
"set keymap=russian-jcukenwin	" ^6 to change
set keymap=ukrainian-jcuken	" ^6 to change
set iminsert=0 			" latin by default
set imsearch=0 

" completion
set complete+=.		" current buffer
set complete+=k		" dictionary
set complete+=b 	" other bufs
set complete+=t		" tags

set completeopt+=menuone	" always show the completion menu
set completeopt+=preview	" sometimes annoying window on the top 
set completeopt+=longest	" do not select the first variant by default

" autoclose preview after menu hides
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" mappings
nmap :W :w
nmap :Q :q
nmap :WQ :wq
nmap :Wq :wq

map <Leader>ZZ :qa<CR>
map <Leader>ll :set list<CR>
map <Leader>l; :set nolist<CR>
nmap <Leader><space> :nohl<CR>
" close window
nmap <C-c> :close<CR>
" close buffer
map <Leader>d :bd<CR>
"map <Leader>tl :TlistToggle<CR>
map <Leader>tl :TagbarToggle<CR>

map <F12> :NERDTreeToggle<CR>

" window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" window movement + size adjustment
map <C-H> <C-W>h<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_

" wrapped lines movement by row
nnoremap j gj
nnoremap k gk

" buffer movement
nnoremap ;[ :bp<CR>
nnoremap ;] :bn<CR>

" yank till \n
nnoremap Y y$

" visual shift (do not leave visual mode)
vnoremap < <gv
vnoremap > >gv

" paste
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi
set pastetoggle=<Leader>p

map <C-\> :tjump<CR>
map <M-Left> :pop<CR>
map <M-Right> <C-\>

command! Spaces :%s/\s*$//g
command! Untab4 :%s/\t/    /g
command! Untab8 :%s/\t/        /g
command! Unspace4 :%s/    /\t/g
command! Unspace8 :%s/        /\t/g

vmap ;' <Plug>PComment

command! Gentags :!exctags -R --c-kinds=+p --fields=+iaS --extra=+q .

" commandline mode
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

set modeline

if filereadable(expand("~/.vim/vimrc.ui"))
	source ~/.vim/vimrc.ui
endif

if filereadable(expand("~/.vim/vimrc.filetypes"))
	source ~/.vim/vimrc.filetypes
endif

if filereadable(expand("~/.vim/vimrc.functions"))
	source ~/.vim/vimrc.functions
endif

if filereadable(expand("~/.vim/vimrc.plugins"))
	source ~/.vim/vimrc.plugins
endif

if filereadable(expand("~/.vim/vimrc.emacs"))
	source ~/.vim/vimrc.emacs
endif

