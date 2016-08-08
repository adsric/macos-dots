#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_xcode() {

    # Prompt user to install the XCode Command Line Tools.

    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed.

    until is_xcode_installed; do
        sleep 5
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_result $? "XCode Command Line Tools"

}

is_xcode_installed() {
    xcode-select --print-path &> /dev/null
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "  XCode\n\n"

    install_xcode

}

main
