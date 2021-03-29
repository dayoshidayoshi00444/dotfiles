#!/bin/sh
# Vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/options.vim ~/.vim
ln -sf ~/dotfiles/keymap.vim ~/.vim

# NeoVim
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/options.vim ~/.config/nvim/options.vim
ln -sf ~/dotfiles/keymap.vim ~/.config/nvim/keymap.vim

ln -sf ~/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml

# plugin files
ln -sf ~/dotfiles/plugins ~/.config/nvim/plugins

# colorscheme files
ln -sf ~/dotfiles/colors ~/.config/nvim/colors

# Disable comment auto when start a new line
ln -sf ~/dotfiles/after ~/.config/nvim/after
