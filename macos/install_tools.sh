#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# ------------------------------------------------------------------------------

print_in_purple "\n   Compression Tools\n\n"

brew_install "Zopfli" "zopfli"

# ---------------------------------------------------------------------

print_in_purple "\n   Video Tools\n\n"

brew_install "FFmpeg" "ffmpeg"

# ---------------------------------------------------------------------

print_in_purple "\n   Quick Look \n\n"

brew_install "JSON" "quicklook-json" "caskroom/cask" "cask"
brew_install "Markdown" "qlmarkdown" "caskroom/cask" "cask"
