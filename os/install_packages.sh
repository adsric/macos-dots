#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# -----------------------------------------------------------------------

print_in_purple "\n • Package installs\n\n"

./packages/xcode.sh
./packages/homebrew.sh
./packages/bash.sh
./packages/brew_packages.sh
./packages/nvm.sh
./packages/npm.sh
./packages/vim.sh
