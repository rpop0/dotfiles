#!/bin/bash

tool="tmux"
install_dir="$HOME/.config"

source ../helpers.sh

backup_config $install_dir $tool

install_config $install_dir $tool

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
    echo "Tmux Plugin Manager installed in $HOME/.tmux/plugins/tpm"
fi
