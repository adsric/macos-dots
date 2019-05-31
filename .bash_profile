#!/bin/bash

# ------------------------------------------------------------------------------

source_bash_files() {

	# Load the shell dotfiles, and then some:
	# * ~/.path can be used to extend `$PATH`.
	# * ~/.extra can be used for other settings you don’t want to commit.
	for file in ~/.{path,bash_prompt,bash_exports,bash_options,aliases,functions,extra}; do
		[ -r "$file" ] && [ -f "$file" ] && source "$file";
	done;
	unset file;

}

bash_autocomplete() {

	# Add tab completion for many Bash commands
	if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
		# Ensure existing Homebrew v1 completions continue to work
		export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
		source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
	elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion;
	fi;


	# Enable tab completion for `g` by marking it as an alias for `git`
	if type _git &> /dev/null; then
		complete -o default -o nospace -F _git g;
	fi;

	# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
	[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

}

# ------------------------------------------------------------------------------

# Add `~/bin` to the `$PATH`
export PATH="$HOME/.bin:$PATH";

source_bash_files
bash_autocomplete
unset -f source_bash_files
unset -f bash_autocomplete

# ------------------------------------------------------------------------------

# Clear system messages (system copyright notice, the date
# and time of the last login, the message of the day, etc.).

clear
