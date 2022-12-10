set number
set backspace=2

set nobackup
set noswapfile
set noundofile

set encoding=UTF-8

set autoread

set hidden

set noet ts=4 sts=-1 sw=0

set visualbell
set showmatch

" statusline
function! SetStatusLine()
  if mode() =~ 'i'
    let c = 1
    let mode_name = 'Insert'
  elseif mode() =~ 'n'
    let c = 2
    let mode_name = 'Normal'
  elseif mode() =~ 'R'
    let c = 3
    let mode_name = 'Replace'
  else
    let c = 4
    let mode_name = 'Visual'
  endif
  return '%' . c . '*[' . mode_name . ']%* %<%t%=%m%r %18([%{toupper(&ft)}][%l/%L][%c][%p]%)'
endfunction
 
set statusline=%!SetStatusLine()

" set statusline=%t%=[%{&fileencoding}][%l/%L][%c][%p]
set laststatus=2

" buffer moving
nnoremap <C-l> <cmd>bnext<CR>
nnoremap <C-h> <cmd>bprev<CR>
nnoremap <C-q> <cmd>bd<CR>

syntax enable
