#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "../utils.sh"

# -----------------------------------------------------------------------

install_commandline_packages() {

	brew_install "Ack!" "ack"
	brew_install "FFmpeg" "ffmpeg"
	brew_install "Git" "git"
	brew_install "GPG" "gpg"
	brew_install "GPG Agent" "gpg-agent"
	brew_install "Pinentry" "pinentry-mac"
	brew_install "tmux" "tmux"
	brew_install "tmux (pasteboard)" "reattach-to-user-namespace"
	brew_install "Vim" "vim --with-override-system-vi"
	brew_install "Zopfli" "zopfli"

}

# -----------------------------------------------------------------------

main() {

	print_in_purple "\n  CLI packages \n\n"

	install_commandline_packages

	printf "\n"
	brew_cleanup

}

main
