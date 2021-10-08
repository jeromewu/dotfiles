let g:airline_theme='dracula'
" use powerline fonts
let g:airline_powerline_fonts = 1

"" Extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#windowswap#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1

"" Tabline
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
" remove X button
let g:airline#extensions#tabline#show_close_button = 0
