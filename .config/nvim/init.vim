""
" Maintainer:
"     Jerome Wu - @jeromewu
"
" Reference:
"     https://github.com/Olical/dotfiles/tree/b3cb90cc9e73667d32ada9818ea4c221186648fa/neovim/.config/nvim

function! Dot(path)
  return "~/.config/nvim/" . a:path
endfunction

" load all configs in modules/
for file in split(glob(Dot("modules/*.vim")), "\n")
  execute "source" file
endfor

" load customized config
if filereadable("~/.nvim.local.vim")
  source ~/.nvim.local.vim
endif
