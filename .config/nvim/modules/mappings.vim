" map leader to comma
let mapleader=","

" treat long lines as break lines
nnoremap j gj
nnoremap k gk

" use ii as ESC
inoremap ii <ESC>

" use ii to back to normal mode in terminal
tnoremap ii <C-\><C-n>

" ,vr to reload vim config
nnoremap <leader>vr :source $MYVIMRC<cr>

" ,<cr> to remove highlighting
nnoremap <silent> <leader><cr> :nohlsearch<cr>

" ,pp to toggle and untoggle paste mode on and off"
nnoremap <silent> <leader>pp :setlocal paste!<cr>

" ,x to view in hex mode ,xx to return
nnoremap <silent> <leader>x :%!xxd<cr>
nnoremap <silent> <leader>xx :%!xxd -r<cr>

" ,jq to format json file
nnoremap <silent> <leader>jq :%!jq .<cr>

" ,qc to close quickfix window
nnoremap <silent> <leader>qc :cclose<cr>

" tab shortcuts
nnoremap <silent> <leader>tt :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <leader>tn :tabnext<cr>
nnoremap <silent> <leader>tp :tabprevious<cr>

" open terminal
nnoremap <silent> <leader>tm :term<cr>
