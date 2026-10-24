#!/bin/zsh

function cleanup() {
    warning "Removing redundant packages"
    sudo apt autoremove --assume-yes
    sudo apt clean
}

function install() {
    sudo apt install --assume-yes ${@}
}

function remove() {
    sudo apt remove --autoremove --assume-yes ${@}
}

function upgrade() {
    sudo apt update || return
    sudo apt full-upgrade --assume-yes || return
    if (( $+commands[snap] )); then
        warning "Updating Snap packages"
        sudo snap refresh
    fi
    _upgrade_extras
}
