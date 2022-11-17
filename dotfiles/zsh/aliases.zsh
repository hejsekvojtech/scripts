#!/bin/zsh

# Files
alias md='mkdir -p'
alias ls='ls --sort=extension --color=auto'
alias ll='ls -lh'
alias lal='ls -alh'
alias la='ls -A'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Make
alias make='clear && make'
alias m='make'

# Life improvements
alias yearofdesktoplinux='echo "$(( $(date +%Y)+1 )) will be the year of desktop Linux"'
alias cls='clear'
alias nukehist='echo "" > $HISTFILE'

# Git
alias gpo='git push origin'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gs='git status'
alias gd='git diff'
alias glf='git ls-files'
alias grh='git reset --hard origin/HEAD'