" set UTF-8 encoding
" set enc=utf-8
" set fenc=utf-8
" set termencoding=utf-8

set nocompatible     " disable vi compatibility (emulation of old bugs)
filetype off

set rtp+=~/.vim/bundle/vundle

call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'powerline'

set encoding=utf-8
set laststatus=2

filetype on

let mapleader = ","

set wildmode=list:longest,full
set wildmenu

set nobackup
set autoread         " automatically reread changed files
set autoindent       " use indentation of previous line
set expandtab        " expand tabs to spaces
set hidden
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
"  set omnifunc=omni#cpp#complete#Main
"  set formatprg=astyle\ --style=ansi\ --indent=spaces=2\ --pad-oper\ --pad-header\ --delete-empty-lines\ --keep-one-line-blocks\ --convert-tabs\ --align-pointer=type\ --indent-namespaces
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

" set grepprg=ack

set number       " turn line numbers on
set nowrap
set incsearch
set hlsearch

set list!
set listchars=tab:>-,trail:~   " show tabs and trailing whitespace

set showmatch           " highlight matching braces

set tags+=~/.vim/tags/cpp

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

map <leader>/ /\c

"
" Fuzzy Finder
let g:fuf_coveragefile_exclude = '\v\~$|\.so.*|\.o|\.lo|\.la|\.swp|bin|lib'
map <leader>ff :FufCoverageFile<CR>
map <leader>fb :FufBuffer<CR>
map <leader>tn :NumbersToggle<CR>

noremap <F8> :call Svndiff("prev")<CR>
noremap <F9> :call Svndiff("next")<CR>
noremap <F10> :call Svndiff("clear")<CR>

" goto definition with F12
map <F12> <C-]>

