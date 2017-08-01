set nocompatible
"syntax enable
set encoding=utf8
set showcmd						" Show incomplete commands on the bottom
set showmode					" Show current mode on the bottom
set number	   					" Line numbers
set backspace=indent,eol,start	" Allow backspace in insert mode			
set nowrap						" Dont wrap lines
set virtualedit=all				" Move courser everywhere
set nomodeline					" Disable magic "vim: .." lines in files for security reasons

" ===== Indentation =====
set autoindent
set smartindent
set smarttab
set tabstop=4					" show existing tab with 4 spaces width
set shiftwidth=4                " when indenting with '>', use 4 spaces width
set expandtab                   " On pressing tab, insert 4 spaces

" ===== Scrolling =======
set scrolloff=8					" Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ===== Search =========
set ignorecase                  " Ignore case in search
set smartcase                   " Only ignore case if the search term is all lower case
set incsearch					" Incremental search

set showmatch					" Highlight matching braces, brackets etc.
set ruler
set incsearch
set paste
