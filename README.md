# My dotfiles (WIP)

## Setup

To setup the dotfiles, run the following snippet in the terminal:

Snippet:
`bash -c "$(curl -LsS https://raw.github.com/adsric/dotfiles/master/dotfiles)"`

The snippet will:

* Download the dotfiles on your computer (by default it will suggest
  `~/Projects/dotfiles`)
* [Symlink](os/create_symbolic_links.sh) the
  [git](git),
  [shell](shell), and
  [vim](vim) files
* Install applications/command-line tools for [OS X](os_x/install_applications.sh)
* Set custom [OS X](os_x/set_preferences.sh) preferences
* Install [vim plugins](vim/vim/plugins)


## Customize

### Local Settings

The dotfiles can be easily extended to suit additional local
requirements by using the following files:

#### `~/.bash.local`

If the `~/.bash.local` file exists, it will be automatically sourced
after all the other [bash related
files](https://github.com/adsric/dotfiles/tree/master/shell), thus,
allowing its content to add to or overwrite the existing aliases,
settings, PATH, etc.

Here is a very simple example of a `~/.bash.local` file:

```bash

#!/bin/bash

# ------------------------------------------------------------------------------

# Set PATH additions

PATH="/usr/local/bin:$PATH"

export PATH

```

#### `~/.gitconfig.local`

If the `~/.gitconfig.local` file exists, it will be automatically
included after the configurations from `~/.gitconfig`, thus, allowing
its content to overwrite or add to the existing `git` configurations.

__Note:__ Use `~/.gitconfig.local` to store sensitive information such
as the `git` user credentials, e.g.:

```bash

[user]
    name = Adam Richardson
    email = adam@example.com

```

#### `~/.vimrc.local`

If the `~/.vimrc.local` file exists, it will be automatically sourced
after `~/.vimrc`, thus, allowing its content to add or overwrite the
settings from `~/.vimrc`.

#### `~/.gvimrc.local`

Same as `~/.vimrc.local` but for `~/.gvimrc`.

### Forks

If you decide to fork this project, don't forget to substitute my
username with your own in the [setup snippets](#setup) and in the
`dotfiles` script.


## Update

To update the dotfiles, just run the [`dotfiles`](dotfiles) script.

```bash

$ ./dotfiles

```

The update process will do basically the same things as setup,
but instead of downloading the dotfiles, it will just fetch the
latest changes.


## Acknowledgements

Inspiration and code was taken from many sources, including:

* [Mathias Bynens'](https://github.com/mathiasbynens)
  [dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Cătălin Mariș's](https://github.com/alrra)
  [dotfiles](https://github.com/alrra/dotfiles)


## License

The code is available under the [MIT license](LICENSE.md).
