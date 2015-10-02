#!/bin/bash

cd "$(dirname "$BASH_SOURCE")"

# ------------------------------------------------------------------------------

main() {

    declare -a PROCESSES_TO_TERMINATE=(
        'SystemUIServer'
        'cfprefsd'
    )

    ./preferences/set_chrome_canary_preferences.sh
    ./preferences/set_chrome_preferences.sh
    ./preferences/set_dashboard_preferences.sh
    ./preferences/set_dock_preferences.sh
    ./preferences/set_finder_preferences.sh
    ./preferences/set_keyboard_preferences.sh
    ./preferences/set_safari_preferences.sh
    ./preferences/set_terminal_preferences.sh
    ./preferences/set_textedit_preferences.sh
    ./preferences/set_trackpad_preferences.sh
    ./preferences/set_transmission_preferences.sh
    ./preferences/set_ui_and_ux_preferences.sh

    for i in ${PROCESSES_TO_TERMINATE[*]}; do
        killall "$i" &> /dev/null
    done

}

main
