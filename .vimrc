" set UTF-8 encoding
" set enc=utf-8
" set fenc=utf-8
" set termencoding=utf-8

set nocompatible     " disable vi compatibility (emulation of old bugs)
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" ctrlp config
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](bin|lib|\.git)$',
  \ 'file': '\v\.(so.*|o|lo|la|swp|swo|bak|pyc|pickle)$',
  \ 'link': '',
  \ }

" airline config
let g:airline_powerline_fonts = 1

set encoding=utf-8
set laststatus=2

filetype on

let mapleader = ","

map <leader>/ /\c
map <leader>tn :NumbersToggle<CR>

set wildmode=list:longest,full
set wildmenu

set nobackup
set autoread         " automatically reread changed files
set autoindent       " use indentation of previous line
set expandtab        " expand tabs to spaces
set hidden
set showmatch           " highlight matching braces

" set undofile

set t_Co=256              " number of colors
colorscheme wombat256mod

syntax on
filetype plugin on

autocmd BufNewFile,BufRead,BufEnter *.cpp,*.h call SetupCPP()
autocmd BufNewFile,BufRead,BufEnter *.py call SetupPython()
autocmd BufNewFile,BufRead,BufEnter *.xml call SetupXML()

function SetupCPP()
  set smartindent      " use intelligent indentation for C
  set tabstop=2        " tab width is 2 spaces
  set shiftwidth=2     " indent with 2 spaces
  set expandtab
  set comments=sl:/*,mb:\ *,elx:\ */      " intelligent comments

  map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
  " recreate tags file with F5
  map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
endfunction

function SetupPython()
  set tabstop=2        " tab width is 2 spaces
  set shiftwidth=2     " indent with 2 spaces
endfunction

function SetupXML()
  set tabstop=2        " tab width is 2 spaces
  set shiftwidth=2     " indent with 2 spaces
endfunction

set number       " turn line numbers on
set nowrap
set incsearch
set hlsearch

set list!
set listchars=tab:>-,trail:~   " show tabs and trailing whitespace
