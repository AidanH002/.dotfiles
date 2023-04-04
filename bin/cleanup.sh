#!/bin/bash -x
# This script removes the .vimrc file and the .trash directory from the home directory.
rm -rf ~/.vimrc

# remove the line 'source ~/.dotfiles/bashrc_custom
sed -i '/source ~\/.dotfiles\/bashrc_custom/d' ~/.bashrc

# Remove the .TRASH directory in the home directory.
rm -rf ~/.TRASH
