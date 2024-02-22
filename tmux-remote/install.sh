#!/bin/bash

tool="tmux"
install_dir="$HOME/.config"

source ../helpers.sh

backup_config $install_dir $tool

install_config $install_dir $tool
