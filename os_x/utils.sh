#!/bin/bash

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

ask() {
    print_question "$1"
    read -r
}

ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -r -n 1
    printf "\n"
}

ask_for_sudo() {

    # Ask for the administrator password upfront
    sudo -v &> /dev/null

    # Update existing `sudo` time stamp until this script has finished
    # https://gist.github.com/cowboy/3118588
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &

}

brew_install() {

    declare -r CMD="$4"
    declare -r FORMULA="$2"
    declare -r FORMULA_READABLE_NAME="$1"
    declare -r TAP_VALUE="$3"

    # --------------------------------------------------------------------------

    # Check if `Homebrew` is installed

    if ! cmd_exists 'brew'; then
        print_error "$FORMULA_READABLE_NAME (\`brew\` is not installed)"
        return 1
    fi

    # --------------------------------------------------------------------------

    # If `brew tap` needs to be executed, check if it executed correctly

    if [ -n "$TAP_VALUE" ]; then
        if ! brew_tap "$TAP_VALUE"; then
            print_error "$FORMULA_READABLE_NAME (\`brew tap $TAP_VALUE\` failed)"
            return 1
        fi
    fi

    # --------------------------------------------------------------------------

    # Install the specified formula

    execute "brew $CMD install $FORMULA" "$FORMULA_READABLE_NAME"

}

brew_tap() {
    brew tap "$1" &> /dev/null
}

cmd_exists() {
    command -v "$1" &> /dev/null
}

execute() {

    local tmpFile="$(mktemp /tmp/XXXXX)"
    local exitCode=0
    local spinnerPID

    # --------------------------------------------------------------------------

    # Start spinner

    print_spinner "${2:-$1}" &
    spinnerPID=$!
    trap 'kill $spinnerPID' SIGINT

    # --------------------------------------------------------------------------

    # Execute commands

    eval "$1" \
        &> /dev/null \
        2> "$tmpFile"
    exitCode=$?

    # --------------------------------------------------------------------------

    # Stop spinner

    kill $spinnerPID
    wait $spinnerPID &> /dev/null
    printf "\r"

    # --------------------------------------------------------------------------

    # Log output

    print_result $exitCode "${2:-$1}"

    if [ $exitCode -ne 0 ]; then
        print_error_stream "↳ ERROR:" < "$tmpFile"
    fi

    rm -rf "$tmpFile"

    # --------------------------------------------------------------------------

    return $exitCode

}

get_answer() {
    printf "%s" "$REPLY"
}

get_os() {

    local os=""
    local kernelName=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    kernelName="$(uname -s)"

    if [ "$kernelName" == "Darwin" ]; then
        os="osx"
    else
        os="$kernelName"
    fi

    printf "%s" "$os"

}

is_git_repository() {
    git rev-parse &> /dev/null
    return $?
}

mkd() {
    if [ -n "$1" ]; then
        if [ -e "$1" ]; then
            if [ ! -d "$1" ]; then
                print_error "$1 - a file with the same name already exists!"
            else
                print_success "$1"
            fi
        else
            execute "mkdir -p $1" "$1"
        fi
    fi
}

print_error() {
    print_in_red "  [✖] $1 $2\n"
}

print_error_stream() {
    while read -r line; do
        print_error "$1 $line"
    done
}

print_in_green() {
    printf "\e[0;32m$1\e[0m"
}

print_in_purple() {
    printf "\e[0;35m$1\e[0m"
}

print_in_red() {
    printf "\e[0;31m$1\e[0m"
}

print_in_yellow() {
    printf "\e[0;33m$1\e[0m"
}

print_info() {
    print_in_purple "\n $1\n\n"
}

print_question() {
    print_in_yellow "  [?] $1"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    return $1
}

print_spinner() {

    declare -a -r FRAMES=(
        "-"
        "\\"
        "|"
        "/"
    )

    declare -r NUMBER_OR_FRAMES=${#FRAMES[@]}

    local i=0

    # --------------------------------------------------------------------------

    while true; do
        i=$(( (i + 1) % NUMBER_OR_FRAMES ))
        printf "\r"
        print_in_yellow "  [${FRAMES[$i]}] $1"
        sleep 0.3
    done

}

print_success() {
    print_in_green "  [✔] $1\n"
}

print_warning() {
    print_in_yellow "  [!] $1\n"
}
