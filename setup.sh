#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install devenv as well
cd $HOME
if [ -d ./devenv/ ]; then
    mv devenv devenv.old
fi
git clone https://github.com/rickybhullar/devenv.git
# ln -sb devenv/.screenrc .
ln -sb devenv/.bash_profile .
ln -sb devenv/.bashrc .
ln -sb devenv/.bashrc_custom .
ln -sb devenv/.gitconfig .
ln -sb devenv/.jshintrc .
ln -sb devenv/.vimrc .
