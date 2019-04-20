#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# ------------------------------------------------------------------------------

print_in_purple "\n   Applications\n\n"

brew_install "Docker" "docker" "caskroom/cask" "cask"
brew_install "Hyper" "hyper" "caskroom/cask" "cask"
brew_install "Visual Studio Code" "visual-studio-code" "caskroom/cask" "cask"
