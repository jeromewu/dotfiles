#!/bin/bash

set -eou pipefail

source ./util.sh

# Install neovim in Ubuntu
# sudo apt-get install software-properties-common
# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt-get update
# sudo apt-get install neovim
# sudo apt-get install python-dev python-pip python3-dev python3-pip

check_deps nvim git node cmake python go ctags rg
cp -r ./.config/nvim ~/.config
nvim --headless "+Lazy! sync" +qa
