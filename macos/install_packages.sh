#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# -----------------------------------------------------------------------

print_in_purple "\n • Package installs\n\n"

ask_for_confirmation 'Do you want to install the application/command line tool packages?'
printf '\n'

if answer_is_yes; then

	./packages/xcode.sh
	./packages/homebrew.sh
	./packages/zsh.sh
	./packages/brew_packages.sh
	./packages/nvm.sh
	./packages/npm.sh

fi