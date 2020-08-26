""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This init.vim is written by Jerome Wu(jeromewus@gmail.com)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""
"vim-plug"
""""""""""
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'heavenshell/vim-jsdoc'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ludovicchabant/vim-gutentags'     " tags file manager, <C-]> to jump to definition 
Plug 'mattn/emmet-vim'                  " improve HTML workflow using <C-y>, to expand tag
Plug 'airblade/vim-gitgutter'           " show git gutter, ]c jump to next change, [c jump to prev one
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer --go-completer' }
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform'
Plug 'AndrewRadev/splitjoin.vim'        " gS to split and gJ to join
Plug 'tpope/vim-fugitive' 
Plug 'gabrielelana/vim-markdown'
Plug 'mileszs/ack.vim'

call plug#end()

"""""""""
"General"
"""""""""
set nocompatible                        "enable features which are not vi compatible
filetype plugin indent on
set ls=2                                "always show status line + command-line
set autoread                            "auto read when a file is changed from outside
set viminfo^=%                          "Remember info about open buffers on close
set history=1000                        "set how many lines of history VIM has to remember

"map leader for extra key combinations
let mapleader=","
let g:mapleader=","

"auto completion and menu
set wildmode=longest:full:list
set wildmenu
set wildignore=*.o,*~,*.pyc             "ignore compiled files
set completeopt=longest,menuone


"""""""""""""
"Typesetting"
"""""""""""""
set tabstop=2                           "make a tab equal 2 space
set softtabstop=2                       "see multiple spaces as a tabstop
set shiftwidth=2                        "this allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set expandtab                           "insert spaces instead of tab character
set autoindent                          "indent of the new line will match the previous line
set cindent                             "c indent
set backspace=indent,eol,start          "Backspace for dummies

""""""""""""""""
"User Interface"
""""""""""""""""
syntax on                               "show syntax color 
set background=dark                     "set background dark
set title                               "show title
set cursorline                          "highlight current line
set cursorcolumn                        "highlight current column
"set mouse=a                             "mouse support (for highlighting etc.), press shift when you want to copy&paste
set encoding=utf8                       "encoding
set visualbell                          "chose visual bell rather than beeping
set t_Co=256                            "Support 256 color
set splitbelow                          "make all split happen below

"search
set incsearch                           "incremental search
set hlsearch                            "highlight searching
set ignorecase                          "ignore case when searching
set smartcase                           "try to be smart about cases

"""""""""""""
"Key mapping"
"""""""""""""
",<cr> to deactive highlighting
nmap <silent> <leader><cr> :nohlsearch<cr>

"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

",pp to toggle and untoggle paste mode on and off"
map <leader>pp :setlocal paste!<cr>

",x to view in hex mode ,xx to return
nmap <silent> <leader>x :%!xxd<cr>
nmap <silent> <leader>xx :%!xxd -r<cr>

" Quickfix window shortcuts
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" ,t to open a terminal
" To scroll the terminal, hit Ctrl+w N and go back with i or a
map <leader>t :term<cr>

" ,jd to insert jsDoc
autocmd FileType js nmap <leader>jd :JsDoc<cr>

" go shortcuts
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <leader>j :SplitjoinJoin<cr>
nmap <leader>s :SplitjoinSplit<cr>

" map ESC to ii
inoremap ii <ESC>

" nerd tree
nmap <leader>nt :NERDTreeFind<CR>

" bind K to grep word under cursor
nnoremap K :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>

" Use backward slash to trigger ack grep
nnoremap \ :Ack<SPACE>

"""""""""""""""""""
"Function, autocmd"
"""""""""""""""""""
"returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE   '
  en
  return ''
endfunction

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

""""""""""""""""
"Plugin Setting"
""""""""""""""""
" A nice color theme
silent! colorscheme gruvbox

" NerdTree
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" NerdCommenter
let g:NERDSpaceDelims = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-jsdoc
let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_access_descriptions = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_underscore_private = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-o>"

" vim-gutentags
" let g:gutentags_ctags_executable = '~/bin/ctags'
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px']
let g:gutentags_exclude_filetypes = ['yaml', 'yml', 'json', 'md']
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" vim-gitgutter
set updatetime=100

" vim-ale
let g:ale_linters = {'javascript': ['eslint', 'flow']}                                                                                                                         
" vim-go
let g:go_version_warning = 0
let g:go_list_type = "quickfix"

" YCM
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

" spellcheck for *.md files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" Use ag with ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
