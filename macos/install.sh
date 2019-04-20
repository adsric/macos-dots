#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# ------------------------------------------------------------------------------

print_in_purple "\n • Installs\n\n"

ask_for_confirmation 'Do you want to install the commandline packages?'
printf '\n'

if answer_is_yes; then

	./install_xcode_tools.sh
	./install_homebrew.sh
	./install_bash.sh
	./install_git.sh
	./install_nvm.sh
	./install_npm.sh
	./install_tools.sh

fi

ask_for_confirmation 'Do you want to install the application packages?'
printf '\n'

if answer_is_yes; then

	./install_applications.sh

fi
