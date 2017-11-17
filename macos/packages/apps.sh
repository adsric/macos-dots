#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "../utils.sh" \
	&& . "./utils.sh"

# -----------------------------------------------------------------------

install_app_packages() {

	brew_install "Docker" "docker" "caskroom/cask" "cask"
	brew_install "Visual Studio Code" "visual-studio-code" "caskroom/cask" "cask"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

	print_in_purple "\n  Homebrew cask packages \n\n"

	install_app_packages

	printf "\n"
	brew_cleanup

}

main
