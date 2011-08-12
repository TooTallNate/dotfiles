# Colored `grep` output
export GREP_OPTIONS='--color=always'

# Make locally installed npm modules' bin files be available in $PATH
export PATH="./node_modules/.bin:/usr/local/bin:$PATH"

# Set the EDITOR after we set the PATH, in case of a locally compiled vim
export EDITOR=`which vim`

# Git tab completion
source ~/.git-completion

# command prompt
export PS1='\[\033[32m\]∞\[\033[00m\] \w \[\033[90m\]`git name-rev HEAD 2>/dev/null|sed "s#HEAD\ \(.*\)#(\1)\ #"`\[\033[37m\]$\[\033[00m\] '

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
export LB_DEBUG=1
export LB_EMAIL='nate@learnboost.com'
export LB_SEND_EMAIL=1
export LB_NO_REPLICA=1
