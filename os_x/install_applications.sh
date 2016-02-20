#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source 'utils.sh'

# ------------------------------------------------------------------------------

main() {

    # XCode Command Line Tools

    ./install_xcode.sh
    print_in_green '\n  ---\n\n'

    # --------------------------------------------------------------------------

    # Homebrew

    ./install_homebrew.sh
    print_in_green '\n  ---\n\n'

    # --------------------------------------------------------------------------

    # Bash

    brew_install 'Bash' 'bash'
    ./change_default_bash_version.sh
    brew_install 'Bash Completion 2' 'bash-completion2' 'homebrew/versions'

    print_in_green '\n  ---\n\n'

    # --------------------------------------------------------------------------

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
    brew_install 'Google Drive' 'google-drive' 'caskroom/cask' 'cask'
    brew_install 'Firefox' 'firefox' 'caskroom/cask' 'cask'
    brew_install 'Firefox Developer' 'firefoxdeveloperedition' 'caskroom/versions' 'cask'
    brew_install 'Firefox Nightly' 'firefox-nightly' 'caskroom/cask' 'cask'
    # brew_install 'Opera' 'opera' 'caskroom/cask' 'cask'
    # brew_install 'Opera Beta' 'opera-beta' 'caskroom/cask' 'cask'
    # brew_install 'Opera Developer' 'opera-developer' 'caskroom/cask' 'cask'
    brew_install 'Unarchiver' 'the-unarchiver' 'caskroom/cask' 'cask'
    brew_install 'VirtualBox' 'virtualbox' 'caskroom/cask' 'cask'
    # brew_install 'WebKit' 'webkit-nightly' 'caskroom/cask' 'cask'

    print_in_green '\n  ---\n\n'

    # --------------------------------------------------------------------------

    # Homebrew Updates

    if cmd_exists 'brew'; then

        execute 'brew update' 'brew (update)'
        execute 'brew upgrade --all' 'brew (upgrade)'

    fi

    # --------------------------------------------------------------------------

    # Homebrew Cleanup

    # By default Homebrew does not uninstall older versions
    # of formulas, so in order to remove them, `brew cleanup`
    # needs to be used
    #
    # https://github.com/Homebrew/homebrew/blob/b311d1483fa434f6692ab8dddb0bfd876d01a668/share/doc/homebrew/FAQ.md#how-do-i-uninstall-old-versions-of-a-formula

    if cmd_exists 'brew'; then

        execute 'brew cleanup' 'brew (cleanup)'
        execute 'brew cask cleanup' 'brew cask (cleanup)'

    fi

    print_in_green '\n  ---\n\n'

    # --------------------------------------------------------------------------

    # NPM Packages

    ./install_npm_packages.sh

}

main
