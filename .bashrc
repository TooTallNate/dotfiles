# Use a vi-style command line editing interface
set -o vi

# Colored `grep` output
export GREP_OPTIONS='--color=auto'

# Make locally installed npm modules' bin files be available in $PATH
export PATH="./node_modules/.bin:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH"

# Make gnu coreutils from Homebrew come first in the PATH on OS X
if type brew >/dev/null 2>&1; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  . `brew --prefix`/etc/profile.d/z.sh
fi

# Set the EDITOR after we set the PATH, in case of a locally compiled vim
export EDITOR=`which vim`

# Git tab completion
source ~/.git-completion

# command prompt
BOLD="$(tput bold 2>/dev/null || echo '')"
RED="$(tput setaf 1 2>/dev/null || echo '')"
GREEN="$(tput setaf 2 2>/dev/null || echo '')"
DARK_GREEN="\033[1;32m"
YELLOW="$(tput setaf 3 2>/dev/null || echo '')"
BLUE="$(tput setaf 4 2>/dev/null || echo '')"
MAGENTA="$(tput setaf 5 2>/dev/null || echo '')"
CYAN="$(tput setaf 6 2>/dev/null || echo '')"
NO_COLOR="$(tput sgr0 2>/dev/null || echo '')"

# the \001 and \002 escape sequences are the equivalent of \[ \] in the PS1,
# but are required when executing a "lazy function" in the prompt.
# See: https://stackoverflow.com/a/24840720/376773
function __ps1_colored_exit_code {
  local exit_code=$?
  local color=
  if [ $exit_code -eq 0 ]; then
    color="${GREEN}"
  else
    color="${RED}"
  fi
  printf "\001${color}\002%03d\001${NO_COLOR}\002" "$exit_code"
}

export PS1="\n\$(__ps1_colored_exit_code) ▲ \$(nightscout-ps1 2>/dev/null) \[$CYAN\]\w \[$MAGENTA\](\$(git name-rev --name-only HEAD 2>/dev/null))\[$NO_COLOR\] \[${BOLD}\]\$\[$NO_COLOR\] "

# for `ls` (BSD, OSX)
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# for `ls` (GNU coreutils, homebrew)
if type dircolors >/dev/null 2>&1; then
  export LS_OPTIONS='--color=auto --file-type'
  eval `dircolors ~/.dir_colors`
fi

alias ls='ls $LS_OPTIONS -F'
alias ll='ls $LS_OPTIONS -lF'
alias l='ls $LS_OPTIONS -lAF'
alias gits="git status"
alias gitd="git diff"

export NODE_ENV='development'
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

if type hub >/dev/null 2>&1; then
  alias git=hub
fi

if [ -f ~/.private.env ]; then
  source ~/.private.env
fi
