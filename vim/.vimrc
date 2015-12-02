set nocompatible
filetype off

set background=dark
colorscheme jellybeans

" Make backspace behave in a sane manner.
set backspace=indent,eol,start
syntax on
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
set mouse=a
set clipboard=unnamed

" set indent
set shiftwidth=4
set cindent
set expandtab
set tabstop=4

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
