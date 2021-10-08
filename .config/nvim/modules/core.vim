"" Generaal
" enable non vim compatible features
set nocompatible
" detect file type
filetype plugin indent on
" always show status line + command line
set ls=2
" auto read when file is updated
set autoread
" lines of history kept
set history=1024
" use wildmenu
set wildmenu
" use longest wildmode
set wildmode=longest:full,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" insert mode completion options
set completeopt=menuone,longest
" reduce update time
set updatetime=100

"" Typesetting
" 1 tab = 2 spaces
set tabstop=2
" 2 spaces as a tab
set softtabstop=2
" < > with 2 spaces
set shiftwidth=2
" insert spaces instead of tab
set expandtab
" auto indent of the new line
set autoindent
" c indent
set cindent
" enable backspace
set backspace=indent,eol,start

"" User Interface
" show syntax color
syntax on
" dark background
set background=dark
" show title
set title
" highlight current line
set cursorline
" utf8 encoding
set encoding=utf8
" use visual bell
set visualbell
" split locate below
set splitbelow
" ensure to use 256 colors in tmux
set t_Co=256
" enables 24-bit RGB in TUI
set termguicolors
" incremental search
set incsearch
" highlight search term
set hlsearch
