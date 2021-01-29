#!/usr/bin/env zsh

################################################################################
# ERROR: Let the user know if the script fails
################################################################################

trap 'ret=$?; test $ret -ne 0 && printf "\n   \e[31m\033[0m  Setup failed  \e[31m\033[0m\n" >&2; exit $ret' EXIT

set -e

################################################################################
# FUNC: Check for required functions file
################################################################################

if [ -e functions.sh ]; then
	source functions.sh
else
	printf "\n ⚠️  ./functions.sh not found! \n"
	exit 1
fi

#git pull origin master;

function dotIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "functions.sh" \
		--exclude "install.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.md" \
		-avh --no-perms . ~;
	source ~/.zshrc;
}

if ask "This may overwrite existing files in your home directory. Are you sure? (y/n)" Y; then
	dotIt; printf "\n  Files updated. 🔥 \n";
else
	print_success_muted "Declined. Skipped.";
fi

unset dotIt;
