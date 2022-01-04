"" Core
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'AndrewRadev/splitjoin.vim', { 'as': 'splitjoin' }
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'MattesGroeger/vim-bookmarks'

"" UI - Theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'

"" UI - Syntax highlight
" java
Plug 'uiiaoo/java-syntax.vim'
" javascript / typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" clojure
Plug 'tpope/vim-fireplace'
Plug 'bhurlow/vim-parinfer'
Plug 'luochen1990/rainbow'
" check https://github.com/neoclide/coc.nvim/wiki/Language-servers#clojure
Plug 'clojure-vim/async-clj-omni'       
Plug 'venantius/vim-cljfmt'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" terraform
Plug 'hashivim/vim-terraform'
" markdown
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
" rust
Plug 'rust-lang/rust.vim', { 'as': 'rust' }
" others
Plug 'MTDL9/vim-log-highlighting'

"" Coding
Plug 'ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'as': 'coc'}
Plug 'dense-analysis/ale'
Plug 'puremourning/vimspector'

"" Utils
" ,m to maximize window
Plug 'szw/vim-maximizer'
" ,ww to copy/paste window
Plug 'wesQ3/vim-windowswap'
" ,atob to convert from b64 to string, ,btoa for the opposite
Plug 'christianrondeau/vim-base64'
