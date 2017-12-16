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
BLUE="\033[0;34m"
CYAN="\033[0;36m"
GREEN="\033[0;32m"
DARK_GREEN="\033[1;32m"
RED="\033[0;31m"
MAGENTA="\033[0;35m"
NO_COLOR="\033[0m"

# the \001 and \002 escape sequences are the equivalent of \[ \] in the PS1,
# but are required when executing a "lazy function" in the prompt.
# See: https://stackoverflow.com/a/24840720/376773
function colored_exit_code {
  local EXIT=$(printf "%03d" $?)
  if [ $EXIT -eq 0 ]; then
    printf "\001$GREEN\002"
  else
    printf "\001$RED\002"
  fi
  printf "$EXIT"
  printf "\001$NO_COLOR\002"
}

export PS1="\n▲ \$(colored_exit_code) \[$CYAN\]\w \[$BLUE\](\$(git name-rev --name-only HEAD 2>/dev/null)) \[$DARK_GREEN\]\$\[$NO_COLOR\] "

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
