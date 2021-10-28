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

"" Mappings
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gc  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>rf :GoReferrers<cr>
autocmd FileType go nmap <leader>ga  :GoAlternate<cr>
