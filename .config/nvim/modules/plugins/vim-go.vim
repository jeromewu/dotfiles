let g:go_maps_enabled = 0
let g:go_version_warning = 0
let g:go_list_type = "locationlist"
let g:go_debug_windows = {
      \ 'vars':       'leftabove 30vnew',
      "\ 'stack':      'leftabove 20new',
      \ 'stack':      'botright 5new',
      "\ 'goroutines': 'botright 10new',
      "\ 'out':        'botright 5new',
      \ }
let g:go_gopls_gofumpt = 1
let g:go_term_enabled = 1
let g:go_term_reuse = 1
let g:go_term_mode = 'split'
let g:go_term_height = 10

"" Mappings
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  :GoTest -v<cr>
autocmd FileType go nmap <leader>gc  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>rf :GoReferrers<cr>
autocmd FileType go nmap <leader>ga  :GoAlternate<cr>
