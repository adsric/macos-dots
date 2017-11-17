#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "../utils.sh" \
	&& . "./utils.sh"

# -----------------------------------------------------------------------

change_shell() {

	declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"

	local configs=""
	local pathConfig=""

	local newShellPath=""
	local brewPrefix=""

	# Try to get the path of the `ZSH`
	# version installed through `Homebrew`.

	brewPrefix="$(brew_prefix)" \
		|| return 1

	pathConfig="PATH=\"$brewPrefix/bin:\$PATH\""
	configs="
# -----------------------------------------------------------------------

$pathConfig

export PATH
"

	newShellPath="$brewPrefix/bin/zsh" \

	# Add the path of the `ZSH` version installed through `Homebrew`
	# to the list of login shells from the `/etc/shells` file.
	#
	# This needs to be done because applications use this file to
	# determine whether a shell is valid (e.g.: `chsh` consults the
	# `/etc/shells` to determine whether an unprivileged user may
	# change the login shell for her own account).
	#
	# http://www.linuxfromscratch.org/blfs/view/7.4/postlfs/etcshells.html

	if ! grep "$newShellPath" < /etc/shells &> /dev/null; then
		execute \
			"printf '%s\n' '$newShellPath' | sudo tee -a /etc/shells" \
			"ZSH (add '$newShellPath' in '/etc/shells')" \
		|| return 1
	fi

	# Set latest version of `Zsh` as the default

	chsh -s "$newShellPath" &> /dev/null
	print_result $? "Change shell to ZSH"

	# If needed, add the necessary configs in the
	# local shell configuration file.

	if ! grep "^$pathConfig" < "$LOCAL_SHELL_CONFIG_FILE" &> /dev/null; then
		execute \
			"printf '%s' '$configs' >> $LOCAL_SHELL_CONFIG_FILE \
				&& . $LOCAL_SHELL_CONFIG_FILE" \
			"ZSH (update $LOCAL_SHELL_CONFIG_FILE)"
	fi

}

# -----------------------------------------------------------------------

main() {

	print_in_purple "\n   ZSH Shell\n\n"

	brew_install "ZSH" "zsh" \
		&& change_shell

	brew_install "ZSH Completions" "zsh-completions"

	execute \
		'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"' \
		"Oh My ZSH!"

}

main
