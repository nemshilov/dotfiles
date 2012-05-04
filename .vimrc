set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'bufexplorer.zip'

filetype plugin on
filetype indent on
syntax enable

scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

set wrap
set linebreak
set number
set ruler
set showcmd
set laststatus=2
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

set scrolljump=7
set scrolloff=7

if has("gui")
	set guioptions-=T " toolbar
	set guioptions+=c " gui boxes
	set guioptions-=r " scrollbar
	set guioptions-=e " tabs
	set guioptions-=m " menu
	set guifont=DejaVu\ Sans\ Mono\ 10
	set cursorline
	colorscheme desert
endif

set nobackup
set noswapfile
set nowb
set hidden

set hlsearch
set incsearch
set ignorecase

set backspace=indent,eol,start

set formatoptions-=ro
set fo+=cr

set fileencodings=utf-8,cp1251,koi8-r,cp866
set fileformats=unix,dos,mac

" Common code for encodings
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

" .NFO specific
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" options for invisible symbols like space at the end of line
" or tabs
setlocal list
setlocal listchars=tab:·\ ,trail:·
:au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)
