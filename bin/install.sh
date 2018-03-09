#!/bin/sh

set -e

echo "Configuring the new computer...."

# First let's create the symbolic links
# ln -s [source] [target]

ln -s .ackrc ~/.ackrc
ln -s .gemrc ~/.gemrc
ln -s .ghci ~/.ghci
ln -s .gitconfig ~/.gitconfig
ln -s .githelpers ~/.githelpers
ln -s .hyper.js ~/.hyper.js
ln -s .iterm2_shell_integration.fish ~/.iterm2_shell_integration.fish
ln -s .screenrc ~/.screenrc
ln -s .tmux.conf ~/.tmux.conf
ln -s .vimrc ~/.vimrc
ln -s .zprofile ~/.zprofile
ln -s .zsh-update ~/.zsh-update
ln -s .zshenv ~/.zshenv
ln -s .zshrc ~/.zshrc

ln -s .vim ~/.vim
ln -s .zsh ~/.zsh
ln -s bin ~/.bin

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Update git version
sudo mv /usr/bin/git /usr/bin/git-apple
brew install git

# Make ZSH the default shell environment
xhsh -s $(which zsh)

# Install Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


