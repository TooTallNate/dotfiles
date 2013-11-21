
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

# For work...
export NODE_ENV='development'

export LB_APP_PORT=3000
export LB_DEBUG=1
export LB_EMAIL='nate@learnboost.com'
export LB_MONGOEXPORT_FLAGS='--db lb-dev'
export LB_NO_REPLICA=1
export LB_PROFILE=1
export LB_SEND_EMAIL=1

export CS_PROXY_PORT="3000"
export CS_APP_HOST="dev.codestre.am"
export CS_APP_PORT="3004"
export CS_GET_HOST="get.dev.codestre.am"
export CS_GET_PORT="3007"
export CS_STREAM_PORT="3005"
export CS_STREAM_HOST="stream.dev.codestre.am"
export CS_PLAY_PORT="3006"
export CS_PLAY_HOST="play.dev.codestre.am"
export CS_SSL=""
export CS_MONGODB_URI="mongodb://localhost/codestream"



# Create a GitHub pull request from the current git branch
# From: http://www.devthought.com/code/create-a-github-pull-request-from-the-terminal
function pr () {
  local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  local branch=`git name-rev --name-only HEAD`
  echo "... creating pull request for branch \"$branch\" in \"$repo\""
  open https://github.com/$repo/pull/new/$branch
}
export -f pr
