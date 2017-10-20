#!/bin/sh
ln -snfv ~/dotfiles/.vimrc ~/.vimrc
ln -snfv ~/dotfiles/.gvimrc ~/.gvimrc
ln -snfv ~/dotfiles/.gitconfig ~/.gitconfig
ln -snfv ~/dotfiles/.gitignore ~/.gitignore
ln -snfv ~/dotfiles/.bash_profile ~/.bash_profile
ln -snfv ~/dotfiles/.bashrc ~/.bashrc
ln -snfv ~/dotfiles/.tigrc ~/.tigrc

mkdir -p ~/.vim/after/ftplugin
ln -snfv ~/dotfiles/ruby.vim ~/.vim/after/ftplugin/ruby.vim

ln -snfv ~/.vim ~/.config/nvim/
ln -snfv ~/.vimrc ~/.config/nvim/init.vim
