#!/bin/zsh

export ZSH_CONFIG=$HOME/.local/share/zsh

# Custom date format
export DATE=$(date +%Y-%m-%d)

# Vim FTW!
export EDITOR=/usr/bin/vim

# Workspace
export ENV_SCRIPTS=$HOME/scripts

# Executables
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/sbin:$PATH

# Terminal history
export HISTFILE=$ZSH_CONFIG/.zsh_history
export HISTSIZE=100000
export HISTFILESIZE=2000000

# UI
export TERM=xterm-256color

# NPM user prefix
export npm_config_prefix=$HOME/.local
