#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# -----------------------------------------------------------------------

print_in_purple "\n • Preferences\n\n"

ask_for_confirmation 'Do you want to set the macOS preferences?'
printf '\n'

if answer_is_yes; then

	./preferences/app_store.sh
	./preferences/dashboard.sh
	./preferences/dock.sh
	./preferences/finder.sh
	./preferences/keyboard.sh
	./preferences/language_and_region.sh
	./preferences/maps.sh
	./preferences/photos.sh
	./preferences/safari.sh
	./preferences/terminal.sh
	./preferences/textedit.sh
	./preferences/trackpad.sh
	./preferences/ui_and_ux.sh

fi
