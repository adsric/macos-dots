#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

./xcode.sh
./homebrew.sh
./bash.sh
./apps.sh
./nvm.sh
./npm.sh
./vim.sh
