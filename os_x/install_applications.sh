#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source 'utils.sh'

# ------------------------------------------------------------------------------

main() {

  # XCode Command Line Tools

  ./os_x/installs/install_xcode.sh
  print_in_green '\n  ---\n\n'

  # Homebrew

  ./os_x/installs/install_homebrew.sh
  print_in_green '\n  ---\n\n'

  # Homebrew Formulae

  ./os_x/installs/install_homebrew_formulae.sh
  print_in_green '\n  ---\n\n'

  # Homebrew Casks

  ./os_x/installs/install_homebrew_casks.sh
  print_in_green '\n  ---\n\n'

  # Homebrew Updates

  if cmd_exists 'brew'; then

      execute 'brew update' 'brew (update)'
      execute 'brew upgrade --all' 'brew (upgrade)'

  fi

  # By default Homebrew does not uninstall older versions
  # of formulas, so in order to remove them, `brew cleanup`
  # needs to be used
  #
  # https://github.com/Homebrew/homebrew/blob/b311d1483fa434f6692ab8dddb0bfd876d01a668/share/doc/homebrew/FAQ.md#how-do-i-uninstall-old-versions-of-a-formula

  if cmd_exists 'brew'; then

      execute 'brew cleanup' 'brew (cleanup)'
      execute 'brew cask cleanup' 'brew cask (cleanup)'

  fi

}

main
