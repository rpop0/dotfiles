#!/bin/bash

backup_config () {
    local install_dir=$1
    local tool=$2
    local backup_location="$install_dir/${tool}_$(date +%Y-%m-%d_%H:%M:%S).bak"

    if [ -L "$install_dir/$tool" ]; then
        echo "$tool config already installed in $install_dir/$tool (Symlink exists)"
        exit 1
    fi

    if [ -d "$install_dir/$tool" ]; then
        mv "$install_dir/$tool" $backup_location
        echo "Existing $tool config backed up to $backup_location."
    fi
}


install_config (){
    local install_dir=$1
    local tool=$2
    local current_path="$(dirname "$(realpath "$0")")"

    ln -s "$current_path/$tool/" "$install_dir/$tool"
    echo "$tool configuration installed to $install_dir/$tool"
}
