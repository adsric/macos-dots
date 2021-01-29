#!/usr/bin/env zsh

# ---------------------------------------------------------------------

# PATH

export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$HOME/.bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.

[[ -f .path ]] && source .path
[[ -f .aliase ]] && source .aliases
[[ -f .functions ]] && source .functions

# ---------------------------------------------------------------------

# PROMPT

[[ -f .git-prompt.sh ]] && source .git-prompt.sh

PROMPT='%F{6}%m %F{13}${PWD/#$HOME/~}%F{5}$(git_super_status)%F{gray} → '

# ---------------------------------------------------------------------

# SHELL OPTIONS

# enable extended globbing features
setopt EXTENDED_GLOB
# case insensitive globbing
setopt NO_CASE_GLOB
# sort extensions with numbers numerically
setopt NUMERIC_GLOB_SORT

# Enable Auto cd
setopt AUTO_CD

# ---------------------------------------------------------------------

# HISTORY

# history file
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=20000
HISTSIZE=50000
# store more information (timestamp)
#setopt EXTENDED_HISTORY

# shares history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
#setopt APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications, keep newest
setopt HIST_IGNORE_ALL_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# when using history substitution (!!, !$, etc.), present for confirmation/editing
setopt HIST_VERIFY

# ---------------------------------------------------------------------

## CORRECTION

# Correct commands
setopt CORRECT
# Correct all arguments
setopt CORRECT_ALL

# correction prompt
SPROMPT="Correct %F{red}%R%f to %F{green}%r%f [nyae]?"

# KEY BINDINGS

bindkey $'^[[A' up-line-or-search    # up arrow
bindkey $'^[[B' down-line-or-search  # down arrow

# ---------------------------------------------------------------------

# ENVIRONMENT VARIABLES

export CLICOLOR=1

# GPG
export GPG_TTY=$(tty)

# ---------------------------------------------------------------------

# PLUGINS

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
# [[ -f $repo_dir/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $repo_dir/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH_AUTOSUGGEST_STRATEGY=( completion history )

# zsh-syntax-highlighting
# (note, according to their docs, this must be loaded _LAST_)
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
# [[ -f $repo_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $repo_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# always return true
# true

# ---------------------------------------------------------------------

# print a message on SSH connection:
# if [[ -n "$SSH_CLIENT" ]]; then
# 	# ssh connection, print hostname and os version
# 	echo "Welcome to $(scutil --get ComputerName) ($(sw_vers -productVersion))"
# fi
