# Colored `grep` output
export GREP_OPTIONS='--color=always'

# Make locally installed npm modules' bin files be available in $PATH
export PATH="./node_modules/.bin:/usr/local/bin:$PATH"

# Git tab completion
source ~/.git-completion

# command prompt
export PS1='\[\033[32m\]∞\[\033[00m\] \w \[\033[90m\]`git name-rev HEAD 2>/dev/null|sed "s#HEAD\ \(.*\)#(\1)\ #"`\[\033[37m\]$\[\033[00m\] '

# for `ls`
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
