export ZSH_CONFIG=$HOME/.config/zsh
export ZSH_CACHE=$ZSH_CONFIG/.zshhist

# Custom date format
export DATE=$(date +%Y-%m-%d)

# Vim FTW!
export EDITOR=/usr/bin/vim

# Workspace
export ENV_SCRIPTS=$HOME/scripts
export ENV_ANDROID=$HOME/android
export ENV_OOS_MNT=${ENV_ANDROID}/OOS
export ENV_MISC=${ENV_ANDROID}/misc

# Executables
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/sbin:$PATH