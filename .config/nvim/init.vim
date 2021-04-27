""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This init.vim is written by Jerome Wu(jeromewus@gmail.com)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""
"vim-plug"
""""""""""
call plug#begin()

" General
Plug 'dracula/vim', { 'as': 'dracula' }
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
" Plug 'machakann/vim-sandwich'           " `saiw(` to add, `sd(` to delete, `srb(` to replace
" Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform'
Plug 'AndrewRadev/splitjoin.vim'        " gS to split and gJ to join
Plug 'tpope/vim-fugitive' 
Plug 'gabrielelana/vim-markdown'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'uiiaoo/java-syntax.vim'
Plug 'christianrondeau/vim-base64'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'danchoi/ri.vim'                   " Use ,K to search

" Clojure
Plug 'tpope/vim-fireplace'              " `cpp` eval the innermost form/parenthesis under the cursor, `cmm` fully macroexpand
Plug 'bhurlow/vim-parinfer'             " use indent to match parenthesis
Plug 'luochen1990/rainbow'              " rainbow color for parenthesis
Plug 'clojure-vim/async-clj-omni'       " check https://github.com/neoclide/coc.nvim/wiki/Language-servers#clojure
Plug 'venantius/vim-cljfmt'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

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
set termguicolors

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

" Use backward slash to trigger ack grep
nnoremap \ :Ack!<SPACE>

" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

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
let g:dracula_italic = 0          " disable italic support
silent! colorscheme dracula

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
let g:ale_fixers = {'ruby': ['rubocop']}

" vim-go
let g:go_version_warning = 0
let g:go_list_type = "quickfix"

" YCM
" let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

" spellcheck for *.md files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" Use ag with ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-terraform
let g:terraform_fmt_on_save=1

" conjure
" let maplocalleader=","

" rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" coc

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" vim-notes
let g:notes_directories = ['~/.config/nvim/notes']
