#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'
# ------------------------------------------------------------------------------

# Homebrew Packages

brew_install 'Dark Mode' 'dark-mode'
brew_install 'FFmpeg' 'ffmpeg --with-fdk-aac --with-libvpx --with-x265'
brew_install 'Git' 'git'
brew_install 'ImageMagick' 'imagemagick --with-webp'
brew_install 'node' 'node'
brew_install 'ssh copy id' 'ssh-copy-id'
brew_install 'tmux' 'tmux'
brew_install 'tree' 'tree'
brew_install 'TTF/OTF → WOFF (Zopfli)' 'sfnt2woff-zopfli' 'bramstein/webfonttools'
brew_install 'TTF/OTF → WOFF' 'sfnt2woff' 'bramstein/webfonttools'
brew_install 'WOFF2' 'woff2' 'bramstein/webfonttools'
brew_install 'Vim' 'vim --override-system-vi'
brew_install 'Zopfli' 'zopfli'

brew_install 'Atom' 'atom' 'caskroom/cask' 'cask'
brew_install 'Chrome' 'google-chrome' 'caskroom/cask' 'cask'
brew_install 'Chrome Canary' 'google-chrome-canary' 'caskroom/cask' 'cask'
brew_install 'Firefox' 'firefox' 'caskroom/cask' 'cask'
brew_install 'Firefox Developer' 'firefoxdeveloperedition' 'caskroom/versions' 'cask'
brew_install 'Firefox Nightly' 'firefox-nightly' 'caskroom/cask' 'cask'
brew_install 'Google Drive' 'google-drive' 'caskroom/cask' 'cask'
# brew_install 'Opera' 'opera' 'caskroom/cask' 'cask'
# brew_install 'Opera Beta' 'opera-beta' 'caskroom/cask' 'cask'
# brew_install 'Opera Developer' 'opera-developer' 'caskroom/cask' 'cask'
brew_install 'Sequel Pro' 'sequel-pro' 'caskroom/cask' 'cask'
brew_install 'Unarchiver' 'the-unarchiver' 'caskroom/cask' 'cask'
brew_install 'VirtualBox' 'virtualbox' 'caskroom/cask' 'cask'
# brew_install 'WebKit' 'webkit-nightly' 'caskroom/cask' 'cask'

