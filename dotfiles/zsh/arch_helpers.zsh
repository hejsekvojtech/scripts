#!/bin/zsh

function cleanup() {
    warning "Removing redundant packages"
    sudo pacman -Sc --noconfirm
    pacman -Qtdq | sudo pacman -Rns --noconfirm  - 2>/dev/null
    # The command above returns 1 if there are no packages to purge, always return 0
    return 0
}

function update-mirrorlist() {
    warning "Updating Pacman mirrorlist"
    sudo reflector \
    --save /etc/pacman.d/mirrorlist \
    --country France \
    --country Czech \
    --country Germany \
    --country Netherlands \
    --age 24 \
    --protocol https \
    --sort rate 2>/dev/null
}

function install() {
    sudo pacman -S --noconfirm ${@}
}

function remove() {
    sudo pacman -R --noconfirm ${@}
}

function upgrade() {
    sudo pacman -Syu --noconfirm
}