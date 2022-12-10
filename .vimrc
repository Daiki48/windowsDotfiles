set number
set backspace=2

set nobackup
set noswapfile
set noundofile

set encoding=UTF-8

set autoread

set hidden

set visualbell
set showmatch

" statusline
set statusline=%F
set statusline=%m
set statusline=%r
set statusline=%h

set statusline+=%w

set statusline+=[ENC=%{&fileencoding}]
set statusline+=[ROW=%l/%L]
set statusline+=[COL=%c]

set laststatus=2

syntax enable
