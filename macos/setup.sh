#!/bin/bash

declare -r GITHUB_REPOSITORY="adsric/dotfiles"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/master"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/macos/utils.sh"

declare dotfilesDirectory="$HOME/dev/dotfiles"

# ------------------------------------------------------------------------------

# Helper Functions

download() {

	local url="$1"
	local output="$2"

	if command -v 'curl' &> /dev/null; then

		curl -LsSo "$output" "$url" &> /dev/null
		# [L] follow redirects
		# [s] don't show the progress meter
		# [S] show error messages
		# [o] write output to file

		return $?

	elif command -v 'wget' &> /dev/null; then

		wget -qO "$output" "$url" &> /dev/null
		# [q] don't show output
		# [0] write output to file

		return $?
	fi

	return 1

}

download_dotfiles() {

	local tmpFile="$(mktemp /tmp/XXXXX)"

	download "$DOTFILES_TARBALL_URL" "$tmpFile"
	print_result $? 'Download archive' 'true'
	printf '\n'

	ask_for_confirmation "Do you want to store the dotfiles in '$dotfilesDirectory'?"

	if ! answer_is_yes; then
		dotfilesDirectory=''
		while [ -z "$dotfilesDirectory" ]; do
			ask 'Please specify another location for the dotfiles (path): '
			dotfilesDirectory="$(get_answer)"
		done
	fi

	# Ensure the `dotfiles` directory is available

	while [ -e "$dotfilesDirectory" ]; do
		ask_for_confirmation "'$dotfilesDirectory' already exists, do you want to overwrite it?"
		if answer_is_yes; then
			rm -rf "$dotfilesDirectory"
			break
		else
			dotfilesDirectory=''
			while [ -z "$dotfilesDirectory" ]; do
				ask 'Please specify another location for the dotfiles (path): '
				dotfilesDirectory="$(get_answer)"
			done
		fi
	done

	printf '\n'

	mkdir -p "$dotfilesDirectory"
	print_result $? "Create '$dotfilesDirectory'" 'true'

	# -----------------------------------------------------------------

	# Extract archive in the `dotfiles` directory
	extract "$tmpFile" "$dotfilesDirectory"
	print_result $? 'Extract archive' 'true'

	# -----------------------------------------------------------------

	# Remove archive
	rm -rf "$tmpFile"
	print_result $? 'Remove archive'

	# -----------------------------------------------------------------

	 cd "$dotfilesDirectory/macos" \
        || return 1

}

download_utils() {

	local tmpFile="$(mktemp /tmp/XXXXX)"

	download "$DOTFILES_UTILS_URL" "$tmpFile" \
		&& source "$tmpFile" \
		&& rm -rf "$tmpFile" \
		&& return 0

	return 1

}

extract() {

	local archive="$1"
	local outputDir="$2"

	if command -v 'tar' &> /dev/null; then
		tar -zxf "$archive" --strip-components 1 -C "$outputDir"
		return $?
	fi

	return 1

}

is_supported_version() {

	declare -a v1=(${1//./ })
	declare -a v2=(${2//./ })
	local i=''

	# Fill empty positions in v1 with zeros
	for (( i=${#v1[@]}; i<${#v2[@]}; i++ )); do
		v1[i]=0
	done

	for (( i=0; i<${#v1[@]}; i++ )); do

		# Fill empty positions in v2 with zeros
		if [[ -z ${v2[i]} ]]; then
			v2[i]=0
		fi

		if (( 10#${v1[i]} < 10#${v2[i]} )); then
			return 1
		fi

	done

}

verify_os() {

	declare -r MINIMUM_MACOS_VERSION='10.10'
	declare -r OS_NAME="$(uname -s)"

	declare OS_VERSION=''

	# --------------------------------------------------------------------------

	# Check if the OS is `OS X` and
	# it's above the required version

	if [ "$OS_NAME" == "Darwin" ]; then

		OS_VERSION="$(sw_vers -productVersion)"

		is_supported_version "$OS_VERSION" "$MINIMUM_MACOS_VERSION" \
			&& return 0 \
			|| printf "Sorry, this script is intended only for OS X $MINIMUM_MACOS_VERSION+"

	else
		printf 'Sorry, this script is intended only for macOS'
	fi

	return 1

}

# ------------------------------------------------------------------------------

main() {

	# Ensure the OS is supported and
	# it's above the required version

	verify_os || exit 1

	# Ensure that the following actions
	# are made relative to this file's path
	#
	# http://mywiki.wooledge.org/BashFAQ/028

	cd "$(dirname "$BASH_SOURCE")"

	# Load utils

	if [ -x 'macos/utils.sh' ]; then
		source 'macos/utils.sh' || exit 1
	else
		download_utils || exit 1
	fi

	ask_for_sudo

	# Setup the `dotfiles` if needed

	if ! cmd_exists 'git' \
		|| [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then

		print_info 'Download and extract archive'
		download_dotfiles

	fi

	./create_symbolic_links.sh
	./create_local_configs.sh
	./install.sh
	./preferences.sh

	if cmd_exists 'git'; then

		if [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then

			print_in_purple "\n • Initialize Git repository\n\n"

			if [ -z "$DOTFILES_ORIGIN" ]; then
				print_error "Please provide a URL for the Git origin"
				exit 1
			fi

			if ! is_git_repository; then

				# Run the following Git commands in the root of
				# the dotfiles directory, not in the `os/` directory

				cd ../ \
					|| print_error "Failed to 'cd ../'"

				execute \
					"git init && git remote add origin $DOTFILES_ORIGIN" \
					"Initialize the Git repository"

			fi

		fi

		# ----------------------------------------------------------------------

		ssh -T git@github.com &> /dev/null

		if [ $? -ne 1 ]; then
			./create_github_ssh_key.sh \
				|| return 1
		fi

		print_in_purple "\n • Update content\n\n"

		ask_for_confirmation "Do you want to update the content from the 'dotfiles' directory?"

		if answer_is_yes; then

			git fetch --all 1> /dev/null \
				&& git reset --hard origin/master 1> /dev/null \
				&& git clean -fd 1> /dev/null

			print_result $? "Update content"

		fi

	fi

	# --------------------------------------------------------------------------

	print_in_purple "\n • Restart\n\n"

	ask_for_confirmation "Do you want to restart?"
	printf "\n"

	if answer_is_yes; then
		sudo shutdown -r now &> /dev/null
	fi

}

main
