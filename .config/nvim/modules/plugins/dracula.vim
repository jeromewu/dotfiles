" disable italic support, this line must before colorscheme
let g:dracula_italic = 0
" use dracula scheme
silent! colorscheme dracula
" use underline instead of background color
augroup CustomCursorLine
  au!    
  au VimEnter * :hi! CursorLine gui=underline guibg=NONE
augroup END
