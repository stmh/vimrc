set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
" Other stuff
filetype plugin indent on
syntax on

" UI
colorscheme Tomorrow
set guifont=Suisse\ Int\'l\ Mono\ for\ Powerline:h14
set guifont=Fira\ Code:h14
set lines=35 columns=120
set colorcolumn=90
set number

" Leader-key
let mapleader=","
set hidden
set history=2000

" tab-settings
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Cleanup whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Search
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

set showmatch
