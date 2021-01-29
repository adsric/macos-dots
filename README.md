# .files

My .files that I maintain for my macOS environment. (It requires at least macOS 11.1)
For any private configurations I use `.extra` described in the [`Extend`](#extend) section.

## Install

**Warning:** If you want to give these .files a try, you should first fork this
repository, review the code, and remove things you don’t want or need. Don’t
blindly use my settings unless you know what that entails. Use at your own risk!

### Install with Git and the install script

You can clone the repository wherever you want. (I like to keep it in ~/repos/macos-dots,
with ~/macos-dots as a symlink.) The install script will pull in the latest version
and copy the files to your home folder.

`git clone https://github.com/adsric/macos-dots.git && cd macos-dots && zsh install.sh`

To update, cd into your local macos-dots repository and then:

`zsh install.sh`

### Install Git-free

To install these .files without Git:

`cd; curl -#L https://github.com/adsric/macos-dots/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE.md,functions.sh,install.sh}`

To update later on, just run that command again.


## Extend

I easily extend my .files with additional requirements by
using the following methods below:

#### Extend the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```zsh
export PATH="/usr/local/bin:$PATH"
```

#### Extend without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from my .files repository. It’s probably better to [fork this repository](https://github.com/adsric/macos-dots/fork) instead, though.


#### Extend Git

If `~/.gitconfig.local` exists it will be automatically included after
the configurations from `~/.gitconfig`, thus, allowing amends or
overwrites to the existing configuration.

(Note: use to store sensitive information such as the `git` user credentials
, etc...)

My `~/.gitconfig.local` looks something like this:

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
