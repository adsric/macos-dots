#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# -----------------------------------------------------------------------

print_in_purple "\n • Install Packages\n\n"

ask_for_confirmation 'Do you want to install the commandline/application packages?'
printf '\n'

if answer_is_yes; then

	./packages/xcode.sh
	./packages/homebrew.sh
	./packages/bash.sh
	./packages/cli.sh
	./packages/applications.sh
	./packages/nvm.sh
	./packages/npm.sh

fi
