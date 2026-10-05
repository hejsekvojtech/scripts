#!/bin/zsh

function _aur_helper() {
    if (( $+commands[paru] )); then
        echo paru
    elif (( $+commands[yay] )); then
        echo yay
    fi
}

function cleanup() {
    warning "Removing redundant packages"
    sudo paccache -rk2
    sudo paccache -ruk0
    pacman -Qtdq | sudo pacman -Rns --noconfirm  - 2>/dev/null

    local helper=$(_aur_helper)
    [[ -n $helper ]] && $helper -Sc --noconfirm

    return 0
}

function update-mirrorlist() {
    warning "Updating Pacman mirrorlist"
    if (( $+commands[cachyos-rate-mirrors] )); then
        sudo cachyos-rate-mirrors
        return
    fi
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
    sudo pacman -S --needed --noconfirm ${@}
}

function remove() {
    sudo pacman -Rns --noconfirm ${@}
}

function upgrade() {

    local helper=$(_aur_helper)
    if [[ -n $helper ]]; then
        $helper -Syu --noconfirm || return
    else
        sudo pacman -Syu --noconfirm || return
    fi
    _upgrade_extras
}
