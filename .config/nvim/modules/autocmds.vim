" return to last edit position
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" spellcheck for *.md files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
