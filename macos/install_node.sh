#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"
declare -r NVM_DIRECTORY="$HOME/.nvm"
declare -r NVM_GIT_REPO_URL="https://github.com/creationix/nvm.git"

# ---------------------------------------------------------------------

add_nvm_configs() {

	declare -r CONFIGS="

# Node Version Manager

export NVM_DIR=\"$NVM_DIRECTORY\"

[ -f \"\$NVM_DIR/nvm.sh\" ] \\
	&& . \"\$NVM_DIR/nvm.sh\"

"

	execute \
		"printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
			&& . $LOCAL_SHELL_CONFIG_FILE" \
		"nvm (update $LOCAL_SHELL_CONFIG_FILE)"

}

install_latest_stable_node() {

	# Install the latest stable version of Node
	# (this will also set it as the default).

	execute \
		". $LOCAL_SHELL_CONFIG_FILE \
			&& nvm install node" \
		"nvm (install latest Node)"
}

install_nvm() {

	# Install `nvm` and add the necessary
	# configs in the local shell config file.

	execute \
		"git clone --quiet $NVM_GIT_REPO_URL $NVM_DIRECTORY" \
		"nvm (install)" \
	&& add_nvm_configs

}

update_nvm() {

	execute \
		"cd $NVM_DIRECTORY \
			&& git fetch --quiet origin \
			&& git checkout --quiet \$(git describe --abbrev=0 --tags) \
			&& . $NVM_DIRECTORY/nvm.sh" \
		"nvm (upgrade)"

}

install_npm_completion() {

	execute \
		"npm completion > /usr/local/etc/bash_completion.d/npm" \
		"$1"

}

install_npm_package() {

	execute \
		". $HOME/.bash.local \
			&& npm install --global --silent $2" \
		"$1"

}

# ---------------------------------------------------------------------

main() {

	print_in_purple "\n  Node js\n\n"

	if [ ! -d "$NVM_DIRECTORY" ]; then
		install_nvm
	else
		update_nvm
	fi

	install_latest_stable_node

	install_npm_package "npm (update)" "npm"

	install_npm_completion "npm (tab-completion)"

	printf "\n"

	install_npm_package "Babel" "babel-cli"
	install_npm_package "SVGO" "svgo"

}

main
