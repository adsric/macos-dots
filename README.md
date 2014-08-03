# ~/.dotfiles

## Installation

### Using Git and the script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The sync script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/adsric/dotfiles.git && cd dotfiles && source sync.sh
```

Git free

```bash
cd; curl -#L https://github.com/adsric/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,sync.sh,install.sh}
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source sync.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source sync.sh
```

```bash

# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Adam Richardson"
GIT_AUTHOR_EMAIL="adam@example.com"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
# Set the credentials (modifies ~/.gitconfig)
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./.brew
```

### Install common applications

When setting up a new Mac, you may want to install some common applications (after installing Homebrew formulae, of course):

```bash
./.brew-cask
```

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Clean Install

To clean install for a new system, cd into your local dotfiles repository and then:

```bash
source install.sh
```
