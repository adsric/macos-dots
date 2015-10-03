#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

# ------------------------------------------------------------------------------

main() {

    # Homebrew Casks
    # https://github.com/caskroom/homebrew-cask

    if cmd_exists 'brew' \
        && brew_tap 'caskroom/cask'; then

        brew_install 'Homebrew Cask' 'caskroom/cask/brew-cask'
        printf '\n'

        brew_install 'Atom' 'atom' 'cask'
        brew_install 'Chrome' 'google-chrome' 'cask'
        brew_install 'Google Drive' 'google-drive' 'cask'
        brew_install 'Firefox' 'firefox' 'cask'
        brew_install 'Opera' 'opera' 'cask'
        brew_install 'Unarchiver' 'the-unarchiver' 'cask'
        brew_install 'VirtualBox' 'virtualbox' 'cask'

    fi

    print_in_green '\n  ---\n\n'

    # Homebrew Alternate Casks
    # https://github.com/caskroom/homebrew-versions

    if cmd_exists 'brew' \
        && brew_tap 'caskroom/versions'; then

        brew_install 'Chrome Canary' 'google-chrome-canary' 'cask'
        brew_install 'Firefox Developer Edition' 'firefoxdeveloperedition' 'cask'
        brew_install 'Firefox Nightly' 'firefox-nightly' 'cask'
        brew_install 'Opera Beta' 'opera-beta' 'cask'
        brew_install 'Opera Developer' 'opera-developer' 'cask'
        brew_install 'WebKit' 'webkit-nightly' 'cask'

    fi

}

main
