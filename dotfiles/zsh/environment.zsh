#!/bin/zsh

export ZSH_CONFIG=$HOME/.local/share/zsh

# Vim FTW!
export EDITOR=vim

# Workspace
export ENV_SCRIPTS=$HOME/scripts

# Executables
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/sbin:$PATH

# Rust (rustup)
[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env

# Terminal history
export HISTFILE=$ZSH_CONFIG/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# NPM user prefix
export npm_config_prefix=$HOME/.local
