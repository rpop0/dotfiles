# Introduction
This repository contains all of my custom dotfile configurations.

# Structure
The dotfiles are structured in the following way:
```
dotfiles
|-- nvim
|   |-- .config
|       |- nvim
|-- tmux
|   |-- .config
|       |- tmux
|
...
```
The `dotfiles` directory essentially contains a directory for each 'tool'. That directory then contains the same structure
of the install path for the configurations, relative to them $HOME directory.

For example, since Neovim configurations are stored in `$HOME/.config/nvim`, the path here is `dotfiles/nvim/.config/nvim`.

# Installation
[GNU Stow](https://www.gnu.org/software/stow/) is the recommended install method, which is available in all package managers.

Simply `cd` into the dotfiles repository and stow the configuration to apply:
```
stow nvim
```
