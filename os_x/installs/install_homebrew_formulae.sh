#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

# ------------------------------------------------------------------------------

main() {

    # Homebrew Formulae
    # https://github.com/Homebrew/homebrew

    if cmd_exists 'brew'; then

        brew_install 'Bash 4.x' 'bash'
        brew_install 'FFmpeg' 'ffmpeg'
        brew_install 'Git' 'git'
        brew_install 'ImageMagick' 'imagemagick --with-webp'
        brew_install 'node' 'node'
        brew_install 'tmux' 'tmux'
        brew_install 'tree' 'tree'
        brew_install 'Vim' 'vim --override-system-vi'
        brew_install 'Zopfli' 'zopfli'

    fi

    # Homebrew Versions Formulae
    # https://github.com/Homebrew/homebrew-versions

    if cmd_exists 'brew' \
        && brew_tap 'homebrew/versions'; then

        brew_install 'Bash Completion 2' 'bash-completion2'

    fi

    # Webfont tools
    # https://github.com/bramstein/homebrew-webfonttools

    if cmd_exists 'brew' \
        && brew_tap 'bramstein/webfonttools'; then

        brew_install 'TTF/OTF → WOFF' 'sfnt2woff'
        brew_install 'TTF/OTF → WOFF (Zopfli)' 'sfnt2woff-zopfli'
        brew_install 'WOFF2' 'woff2'

    fi

}

main
