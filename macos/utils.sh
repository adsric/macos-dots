#!/bin/bash

answer_is_yes() {
	[[ "$REPLY" =~ ^[Yy]$ ]] \
		&& return 0 \
		|| return 1
}

ask() {
	print_question "$1"
	read
}

ask_for_confirmation() {
	print_question "$1 (y/n) "
	read -n 1
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

cmd_exists() {
	command -v "$1" &> /dev/null
	return $?
}

execute() {
	eval "$1" &> /dev/null
	print_result $? "${2:-$1}"
}

get_answer() {
	printf "$REPLY"
}

is_git_repository() {
	git rev-parse &> /dev/null
	return $?
}

print_error() {
	print_in_red "  [✖] $1 $2\n"
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

print_success() {
	print_in_green "  [✔] $1\n"
}

brew_install() {

	declare -r CMD="$4"
	declare -r FORMULA="$2"
	declare -r FORMULA_READABLE_NAME="$1"
	declare -r TAP_VALUE="$3"

	# Check if `Homebrew` is installed.
	if ! cmd_exists "brew"; then
		print_error "$FORMULA_READABLE_NAME ('Homebrew' is not installed)"
		return 1
	fi

	# If `brew tap` needs to be executed,
	# check if it executed correctly.
	if [ -n "$TAP_VALUE" ]; then
		if ! brew_tap "$TAP_VALUE"; then
			print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
			return 1
		fi
	fi

	# Install the specified formula.
	if brew $CMD list "$FORMULA" &> /dev/null; then
		print_success "$FORMULA_READABLE_NAME"
	else
		execute \
			"brew $CMD install $FORMULA" \
			"$FORMULA_READABLE_NAME"
	fi

}

brew_prefix() {

	local path=""

	if path="$(brew --prefix 2> /dev/null)"; then
		printf "%s" "$path"
		return 0
	else
		print_error "Homebrew (get prefix)"
		return 1
	fi

}

brew_tap() {
	brew tap "$1" &> /dev/null
}

brew_update() {

	execute \
		"brew update" \
		"Homebrew (update)"

}

brew_upgrade() {

	execute \
		"brew upgrade" \
		"Homebrew (upgrade)"

}
