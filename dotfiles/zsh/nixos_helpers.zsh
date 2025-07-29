#!/bin/zsh

function rebuild-switch() {
    sudo nixos-rebuild switch
}

function rebuild-boot() {
    sudo nixos-rebuild boot
}

function rebuild-upgrade() {
    sudo nixos-rebuild switch --upgrade
}

function collect-garbage() {
    sudo nix-collect-garbage -d
}