#!/bin/zsh

function install() {
    sudo dnf install --assumeyes ${@}
}

function remove() {
    sudo dnf remove --assumeyes ${@}
}

function upgrade() {
    sudo dnf update --assumeyes
}