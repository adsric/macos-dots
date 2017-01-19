#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Preferences\n"

./app_store.sh
./dashboard.sh
./dock.sh
./finder.sh
./keyboard.sh
./language_and_region.sh
./maps.sh
./photos.sh
./safari.sh
./terminal.sh
./textedit.sh
./trackpad.sh
./ui_and_ux.sh
