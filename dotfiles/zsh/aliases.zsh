#!/bin/bash

# Files
alias md='mkdir -p'
alias ls='ls --sort=extension --color=auto'
alias ll='ls -lh'
alias lal='ls -alh'
alias la='ls -A'

# Make
alias cm='clear && make'
alias m='make'

# Git
alias gpo='git push origin'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gs='git status'
alias gd='git diff'
alias glf='git ls-files'
alias grh='git reset --hard origin/HEAD'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcud='docker-compose up -d'
alias dsa='docker stop $(docker ps -a -q)'

# Misc
alias yearofdesktoplinux='echo "$(( $(date +%Y)+1 )) will be the year of desktop Linux"'
alias clc='clear'
alias nukehist='echo "" > $HISTFILE'
alias fixencoding='iconv -f WINDOWS-1250 -t UTF-8'