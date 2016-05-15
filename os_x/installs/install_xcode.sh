#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

# ------------------------------------------------------------------------------

main() {

    if ! xcode-select --print-path &> /dev/null; then

        # Prompt user to install the XCode Command Line Tools

        xcode-select --install &> /dev/null

        # ----------------------------------------------------------------------

        # Wait until the XCode Command Line Tools are installed

        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done

        print_result $? 'Install XCode Command Line Tools'

        # ----------------------------------------------------------------------

        # Automatically agree to the terms of the Xcode license

        sudo xcodebuild -license accept
        print_result $? "Agree to the terms of the XCode Command Line Tools licence"

    fi

    print_result $? 'XCode Command Line Tools'

}

main
