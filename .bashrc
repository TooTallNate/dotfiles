# Colored `grep` output
export GREP_OPTIONS='--color=auto'

# Make locally installed npm modules' bin files be available in $PATH
export PATH="./node_modules/.bin:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH"

# Set the EDITOR after we set the PATH, in case of a locally compiled vim
export EDITOR=`which vim`

# Git tab completion
source ~/.git-completion

# command prompt
export PS1='\[\033[32m\]☮\[\033[00m\] \w \[\033[90m\](`git name-rev --name-only HEAD 2>/dev/null`)\[\033[33m\] ⚡\[\033[00m\] '

# for `ls` (BSD, OSX)
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# for `ls` (GNU coreutils, homebrew)
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto --file-type'
    eval `dircolors ~/.dir_colors`
fi

alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias gits="git status"
alias gitd="git diff"

# For work...
# Be sure to add these vars to the '/etc/sudoers' file so that they
# are still used when we call 'sudo'
export DEBUG='up,lb:*'
export LB_APP_PORT=3000
export LB_DEBUG=1
export LB_EMAIL='nate@learnboost.com'
export LB_MONGOEXPORT_FLAGS='--db lb-dev'
export LB_NO_REPLICA=1
export LB_PROFILE=1
export LB_SEND_EMAIL=1

function pr () {
  local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  local branch=`git name-rev --name-only HEAD`
  echo "... creating pull request for branch \"$branch\" in \"$repo\""
  open https://github.com/$repo/pull/new/$branch
}

export -f pr
