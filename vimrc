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
Plugin 'Yggdroot/indentLine'
Plugin 'rking/ag.vim'
Plugin 'posva/vim-vue'
Plugin 'Konfekt/FastFold'
Plugin 'isRuslan/vim-es6'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'Shougo/neocomplete.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'swekaj/php-foldexpr.vim'
Plugin 'szw/vim-tags'
Plugin 'craigemery/vim-autotag'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-sensible'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/Align'

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
set noshowmode

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

" Performance
set ttyfast
set ttyscroll=3
set lazyredraw

" Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Multiple cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


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
nnoremap <Leader>cs :%!phpcbf --standard=/usr/local/Cellar/php-code-sniffer/2.3.3/CodeSniffer/Standards/Drupal/ --extensions=php,module,inc,install,test,profile,theme<enter><enter>
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>h :Dash<CR>
nnoremap <leader>a :Ag
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>e :VimFiler<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>T :CtrlPTag<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>
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
nnoremap ö [
nnoremap ä ]
nnoremap Ö {
nnoremap Ä }
nnoremap <Leader># :SemanticHighlightToggle<cr>

" Syntastic settings
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_phpcs_args="--standard=/usr/local/Cellar/php-code-sniffer/2.3.3/CodeSniffer/Standards/Drupal/ --extensions=php,module,inc,install,test,profile,theme"

" PHP
let php_folding = 1
let php_htmlInStrings = 1
let php_sql_query = 1
let php_noShortTags = 1
let b:phpfold_use = 1
let b:phpfold_doc_with_funcs = 1
:autocmd FileType php set foldmethod=expr

" Tags
set tags+=tags;$HOME

" CtrlpFunky
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" Markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


" cd to current file-dir on BufEnter
autocmd BufEnter * silent! lcd %:p:h

" backup and swp files
set backupdir=~/.backup//
set directory=~/.backup//
silent execute '!mkdir _backupdir'
