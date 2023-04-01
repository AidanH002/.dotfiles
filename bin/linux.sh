#!/bin/bash -x

# This script sets up a Linux system for the user's preferences.

# Check if the operating system is Linux
if [[ $(uname) != "Linux" ]]; then
  echo "Error: This script is meant for Linux only." >> linuxsetup.log
  exit 1
fi

# Create .TRASH directory if it doesn't exist
if [ ! -d "$HOME/.TRASH" ]; then
  echo "creating .TRASH directory"
  mkdir "$HOME/.TRASH"
fi

# Rename .vimrc if it exists
if [ -f "$HOME/.vimrc" ]; then
  echo "copying contents of /etc/vimrc to ~/.vimrc"
  mv "$HOME/.vimrc" "$HOME/.bup vimrc"
  echo "The existing .vimrc file was changed to .bupvimrc." >> linuxsetup.log
fi

# Redirect the contents of /etc/vimrc to ~/.vimrc
cat ~/.dotfiles/etc/vimrc > "$HOME/.vimrc"

# Add 'source ~/.dotfiles/etc/bashrc custom' to the end of .bashrc
echo "source ~/.dotfiles/etc/bashrc_custom" >> "$HOME/.bashrc"
