. "$(which import)"
import "tootallnate/nexec@1.2.0"
import "tootallnate/t1"
import "vercel/rcurl@2.0.2"

# Use a vi-style command line editing interface
set -o vi

# Colored `grep` output
export GREP_OPTIONS='--color=auto'

# Make locally installed npm modules' bin files be available in $PATH
export PATH="./node_modules/.bin:/opt/local/libexec/gnubin:/opt/homebrew/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH"

# Make gnu coreutils from Homebrew come first in the PATH on OS X
if type brew >/dev/null 2>&1; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  . `brew --prefix`/etc/profile.d/z.sh
fi

# Golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Set the EDITOR after we set the PATH, in case of a locally compiled vim
export EDITOR=`which vim`

# Git tab completion
source ~/.git-completion

# command prompt
BOLD="$(tput bold 2>/dev/null || echo '')"
RED="$(tput setaf 1 2>/dev/null || echo '')"
GREEN="$(tput setaf 2 2>/dev/null || echo '')"
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

export PS1="\n\$(__ps1_colored_exit_code) ▲ \$(t1_ps1) \[$CYAN\]\w \[$MAGENTA\](\$(git rev-parse --abbrev-ref HEAD 2>/dev/null))\[$NO_COLOR\] \[${BOLD}\]\$\[$NO_COLOR\] "

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
alias install-node="curl -sfLS https://install-node.now.sh | sh -s --"
alias install-npm="curl -sfLS https://npmjs.org/install.sh | sh -s --"

export NODE_ENV='development'

if type hub >/dev/null 2>&1; then
  alias git=hub
fi

if [ -f ~/.private.env ]; then
  source ~/.private.env
fi
