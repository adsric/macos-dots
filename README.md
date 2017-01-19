# dotfiles

These are the base dotfiles that I start with when I set up a
new environment. For more specific local needs I use the `.local`
files described in the [`Local Settings`](#local-settings) section.


## Setup

To set up the `dotfiles` just run the appropriate snippet in the
terminal:

(:warning: **DO NOT** run the `setup` snippet if you don't fully
understand [what it does](os/setup.sh). Seriously, **DON'T**!)

| OS | Snippet |
|:---:|:---|
| `macOS` | `bash -c "$(curl -LsS https://raw.github.com/adsric/dotfiles/master/os/setup.sh)"` |

That's it! :sparkles:

The setup process will:

* Download the dotfiles on your computer (by default it will suggest
  `~/projects/dotfiles`)
* Create some additional [directories](os/create_directories.sh)
* [Symlink](os/create_symbolic_links.sh) the
  [`git`](git),
  [`shell`](shell), and
  [`vim`](vim) files
* Install applications / command-line tools for
  [`macOS`](os/install/macos)
* Set custom
  [`macOS`](os/preferences/macos)  preferences
* Install [`vim` plugins](vim/vim/plugins)


## Customize

### Local Settings

The `dotfiles` can be easily extended to suit additional local
requirements by using the following files:

#### `~/.bash.local`

If the `~/.bash.local` file exists, it will be automatically sourced
after all the other [`bash` related files](src/shell), thus, allowing
its content to add to or overwrite the existing aliases, settings,
PATH, etc.

Here is a very simple example of a `~/.bash.local` file:

```bash

#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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
    signingkey = XXXXXXXX

```

#### `~/.ssh/config`

If you're anything like me, you probably log in and out of a half dozen
remote or local servers on a daily basis. And if you're even more like 
me, you have trouble remembering all of the various usernames and 
addresses then the ssh_config will make life easy.

__Note:__ Because `~/.ssh/config` stores sensitive information it is not
included in the repository e.g.:

```bash

# contents of ~/.ssh/config

Host example
    HostName example.com
    Port 22
    User exampleuser

```

#### `~/.vimrc.local`

If the `~/.vimrc.local` file exists, it will be automatically sourced
after `~/.vimrc`, thus, allowing its content to add or overwrite the
settings from `~/.vimrc`.

### Forks

If you decide to fork this project, don't forget to substitute my
username with your own in the [setup snippets](#setup) and [in the
`setup` script](https://github.com/adsric/dotfiles/blob/master/os/setup.sh#L3).


## Update

To update the dotfiles you can either run the [`setup`
script](os/setup.sh) or, if you want to just update one particular
part, run the appropriate [`os` script](os).

```bash

$ ./os/setup.sh

```


## Acknowledgements

Inspiration and code was taken from many sources, including:

* [Mathias Bynens'](https://github.com/mathiasbynens)
  [dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Cătălin Mariș's](https://github.com/alrra)
  [dotfiles](https://github.com/alrra/dotfiles)


## License

The code is available under the [MIT license](LICENSE.md).
