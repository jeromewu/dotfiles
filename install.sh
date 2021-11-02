#!/bin/bash

set -e -o pipefail

check_deps() {
  echo "Check dependencies..."
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

install_fzf() {
  echo "Install fzf (for zsh)..."
  check_deps git
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

install_zsh() {
  echo "Install oh-my-zsh..."
  check_deps zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  mkdir ~/.bin
  cp ./.zshrc ~/.zshrc
}

install_zsh_syn_hl() {
  echo "Install zsh syntax highlighting..."
  check_deps zsh git
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

install_zsh_vi_mode() {
	echo "Install zsh vi mode"
	check_deps zsh git
	git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH/custom/plugins/zsh-vi-mode
}

install_tmux() {
  # fix battery issue: https://github.com/dracula/tmux/pull/26
  echo "Install oh-my-tmux..."
  check_deps tmux
  cp .tmux.conf.local ~
  cd
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
  cd -
}

install_nvm_and_node() {
  echo "Install nvm & node 16..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  sh ~/.nvm/nvm.sh
  nvm install v16
}

install_nvim_plugins() {
  echo "Install nvim plugins..."
  check_deps nvim git node cmake python go ctags ag
  cp -r ./.config/nvim ~/.config
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  nvim +PlugInstall +qall
}

main() {
	install_starship
  install_zsh
  install_zsh_syn_hl
	install_zsh_vi_mode
  install_fzf
  install_tmux
  install_nvm_and_node
  install_nvim_plugins
}

main "$@"
