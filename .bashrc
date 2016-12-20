# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

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

# I have gcc-4.7.1 manually compiled into /usr/gcc-4.7.1
if [ -d "/usr/gcc-4.7.1/" ]; then
  export PATH="$PATH:/usr/gcc-4.7.1/bin"
fi

# Set the EDITOR after we set the PATH, in case of a locally compiled vim
export EDITOR=`which vim`

# Git tab completion
source ~/.git-completion

# command prompt
export PS1='\[\033[32m\]㋛\[\033[00m\] \w \[\033[90m\](`git name-rev --name-only HEAD 2>/dev/null`)\[\033[36m\] ❯\[\033[00m\] '

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
export GOPATH="$HOME/work"
export PATH="$PATH:$GOPATH/bin"
