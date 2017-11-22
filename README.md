# .dot files

These are my terminal and .dot files that I start with when I set up a
new environment. For more specific needs I use the `.local` files
described in the [`Customize`](#customize) section.

## Setup

The setup is simple just run the appropriate snippet in the
terminal:

(Note: do not run the `setup` snippet if you don't fully
understand [what it does](macos/setup.sh))


| OS | Snippet |
|:---:|:---|
| `macOS` | `bash -c "$(curl -LsS https://raw.github.com/adsric/dotfiles/master/macos/setup.sh)"` |


The setup process will:

* Download the dotfiles on your computer (by default it will suggest
  `~/code/dotfiles`)
* Create some additional [directories](os/create_directories.sh)
* [Symlink](os/create_symbolic_links.sh) the
  [`git`](git),
  [`shell`](shell), and
  [`vim`](vim) files
* Install applications / command-line tools for
  [`macOS`](macos/install)
* Set custom
  [`macOS`](macos/preferences) preferences

(Note: To update the dotfiles you can either run the [`setup`
script](macos/setup.sh))


## Customize

I easily extend my .dot files with additional requirements by
using the following methods below:

#### Customize - Shell

The `~/.bash.local` is created during the setup and will be automatically
sourced after all the other [`bash` related files](shell), thus, allowing
amends or overwrites to the existing aliases, settings,
PATH, etc.

Below is a simple example of a `~/.bash.local` file:

```
#!/bin/bash

# -----------------------------------------------------------------------

# Set PATH additions.

PATH="$PATH:$HOME/code/dotfiles/bin"

export PATH

```

#### Customize - Git

The `~/.gitconfig.local` is created during the setup and will be automatically
included after the configurations from `~/.gitconfig`, thus, allowing
amends or overwrites to the existing configuration.

(Note: use to store sensitive information such as the `git` user credentials
, etc...)

Below is a simple example of a `~/.gitconfig.local` file:

```
[commit]

	# Sign commits using GPG.
	# https://help.github.com/articles/signing-commits-using-gpg/

	gpgsign = true

[user]

	name = yourname
	email = email@example.com
	signingkey = XXXXXXXX

```

#### Customize - ssh

I log in and out of a half dozen remote or local servers on a daily
basis. So to make remembering all of the various usernames and
addresses I let a `~/.ssh/config` file do it all.

(Note: this file stores sensitive information and so is not included)

Below is a simple example of a `~/.ssh/config` file:

```
#!/ssh/config

# -----------------------------------------------------------------------

Host example
	HostName example.com
	Port 22
	User exampleuser
	IdentityFile ~/.ssh/{{key}}

```
