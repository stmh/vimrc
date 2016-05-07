set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'rizzatti/dash.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'vim-scripts/phpfolding.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'rking/ag.vim'
Plugin 'posva/vim-vue'
Plugin 'Konfekt/FastFold'
Plugin 'isRuslan/vim-es6'
Plugin 'craigemery/vim-autotag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
" Other stuff
filetype plugin indent on
syntax on

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" UI
colorscheme lucius
let g:airline_theme='lucius'
set guifont=Suisse\ Int\'l\ Mono\ for\ Powerline:h14
set guifont=Fira\ Code:h14
if has('gui_running')
  set macligatures
endif
set lines=35 columns=120
set colorcolumn=90
set number
set formatoptions=qrn1
set colorcolumn=85
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:▼
set visualbell
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar="·"
set cursorline
set relativenumber

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
set showmatch

" Mappings
map <Leader>s :syntax sync fromstart<CR>
nnoremap <Leader><F10> :%!phpcbf --standard=/usr/local/Cellar/php-code-sniffer/2.3.3/CodeSniffer/Standards/Drupal/ --extensions=php,module,inc,install,test,profile,theme<enter><enter>
nnoremap <Leader><F9> <Esc>:EnablePHPFolds<Cr>
nnoremap <Leader>h :Dash<CR>
nnoremap <leader>a :Ag
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>e :VimFiler<CR>
" Disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap ü <C-]>
nnoremap Ü <C-O>
nnoremap <Leader># :SemanticHighlightToggle<cr>

" Syntastic settings
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_phpcs_args="--standard=/usr/local/Cellar/php-code-sniffer/2.3.3/CodeSniffer/Standards/Drupal/ --extensions=php,module,inc,install,test,profile,theme"

