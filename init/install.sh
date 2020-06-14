#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cd

cat << EOM
###############################################################################
# Brew                                                                        #
###############################################################################
EOM

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install \
  bluetoothconnector \
  git \
  nvm \
  pyenv \
  vim \
  yarn

# Upstart requirements
brew install \
  exiftool \
  libpq \
  postgresql@9.6
brew link --force postgresql@9.6

brew cask install \
  1password \
  alfred \
  appcleaner \
  bartender \
  discord \
  docker \
  epic-games \
  firefox \
  google-chrome \
  iterm2 \
  jetbrains-toolbox \
  keka \
  steam \
  tunnelblick \
  vlc

brew install docker-compose

source "${ZDOTDIR:-$HOME}/.zshrc"

cat << EOM
###############################################################################
# Git                                                                         #
###############################################################################
EOM

git config --global user.name "Ramiro Meares"
git config --global user.email "ramiro.314@gmail.com"
git config --global credential.helper osxkeychain
git config --global core.excludesfile "${ZDOTDIR:-$HOME}/.zprezto/dotfiles/.gitignore"

cat << EOM
###############################################################################
# Vim                                                                         #
###############################################################################
EOM

git clone https://github.com/square/maximum-awesome.git "${ZDOTDIR:-$HOME}/.maximum-awesome"
cd ~/.maximum-awesome
rake
cd

cat << EOM
###############################################################################
# RVM                                                                         #
###############################################################################
EOM

curl -sSL https://get.rvm.io | bash -s stable --ruby

cat << EOM
###############################################################################
# NVM                                                                         #
###############################################################################
EOM

nvm install 12.16.1
nvm alias default 12.16.1
