#!/bin/bash

set -eou pipefail

check_deps() {
  echo "Check dependencies"
  for cmd in $@
  do
    command -v $cmd > /dev/null 2>&1 || \
      { echo >&2 "$cmd is required for this script. Aborting"; exit 1; }
  done
}

install_starship() {
	echo "Install starship"
	sh -c "$(curl -fsSL https://starship.rs/install.sh)"
}

install_zsh() {
  echo "Install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  mkdir ~/.bin
  cp ./.zshrc ~/.zshrc
  touch ~/.zshrc.local
}

install_zsh_syn_hl() {
  echo "Install zsh syntax highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

install_fzf() {
  echo "Install fzf (for zsh)"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

install_dot_tmux() {
  echo "Install oh-my-tmux"
  cp .tmux.conf.local ~
  cd
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
  cd -
}

setup_neovim() {
  echo "Setup neovim"
  cp -r ./.config/nvim ~/.config
  nvim --headless "+Lazy! sync" +qa
}

main() {
  check_deps git zsh tmux nvim
	install_starship
  install_zsh
  install_zsh_syn_hl
  install_fzf
  install_dot_tmux
  setup_neovim
}

main "$@"
