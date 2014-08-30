# up to you if you want to run this as a file or copy paste at your leisure

# https://rvm.io
# rvm for the rubiess
curl -sSL https://get.rvm.io | bash -s stable --ruby

# enable rvm for shell
source /Users/adsric/.rvm/scripts/rvm

# homebrew!
# you need the code CLI tools
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# sync dotfiles
source sync.sh

# install some common Homebrew formulae
source ./.brew

# install some node packages
source ./.node

# install some osx applications
source ./.brew-cask

# set some sensible OS X defaults
# source ./.osx
