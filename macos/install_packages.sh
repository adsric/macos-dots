#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# ------------------------------------------------------------------------------

print_in_purple "\n • Install Packages\n\n"

ask_for_confirmation 'Do you want to install the commandline/application packages?'
printf '\n'

if answer_is_yes; then

	./install_xcode_tools.sh
	./install_homebrew.sh
	./install_bash.sh

	print_in_purple "\n  Brew Packages \n\n"

	brew_install "Ack!" "ack"
	brew_install "FFmpeg" "ffmpeg"
	brew_install "Git" "git"
	brew_install "GPG" "gpg"
	brew_install "Pinentry" "pinentry-mac"
	brew_install "Zopfli" "zopfli"

	print_in_purple "\n  Brew Cask Packages \n\n"

	brew_install "Docker" "docker" "caskroom/cask" "cask"
	brew_install "Hyper" "hyper" "caskroom/cask" "cask"
	brew_install "Visual Studio Code" "visual-studio-code" "caskroom/cask" "cask"

	print_in_purple "\n  Brew Cask Quick Look Packages \n\n"

	brew_install "JSON" "quicklook-json" "caskroom/cask" "cask"
	brew_install "Markdown" "qlmarkdown" "caskroom/cask" "cask"

	printf '\n'

	./install_node.sh

fi
