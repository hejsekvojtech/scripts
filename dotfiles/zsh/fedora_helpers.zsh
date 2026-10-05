#!/bin/zsh

function cleanup() {
    warning "Removing redundant packages"
    sudo dnf autoremove --assumeyes
    sudo dnf clean packages
}

function install() {
    sudo dnf install --assumeyes ${@}
}

function remove() {
    sudo dnf remove --assumeyes ${@}
}

function upgrade() {
    sudo dnf upgrade --refresh --assumeyes || return
    _upgrade_extras
}
