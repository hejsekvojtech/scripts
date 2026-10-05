#!/bin/zsh

function mdc() {
    mkdir -p -- "${1}" && cd -- "${1}"
}

function warning() {
    echo -e "\033[33m⚠️  WARNING: $1\033[0m" >&2
}

function error() {
    echo -e "\033[31m❌ ERROR: $1\033[0m" >&2
    return 1
}

function addSSHIdentity() {
    IDENTITY_NAME=$1
    [[ -n $IDENTITY_NAME ]] || { error "No SSH identity name provided"; return 1; }

    mkdir -p $HOME/.ssh

    if [[ -f ~/.ssh/id_${IDENTITY_NAME}.pub ]]; then
        warning "SSH key found!"
    else
        warning "Generating a new SSH key"
        ssh-keygen -t ed25519 -C "$2" -f ~/.ssh/id_${IDENTITY_NAME} -q
    fi

    warning "SSH key has been generated!"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_${IDENTITY_NAME}
}

# Upgrades shared by all distros, called from upgrade()
function _upgrade_extras() {
    if command -v flatpak &>/dev/null; then
        warning "Updating Flatpak apps"
        flatpak update -y
    fi
    if command -v rustup &>/dev/null; then
        warning "Updating Rust toolchains"
        rustup update
    fi
    return 0
}

# Extract it!
function extract () {
    if [[ ! -f "$1" ]]; then
        error "'$1' is not a file"
        return 1
    fi

    case "$1" in
        *.tar.bz2|*.tbz2)
            tar xjf "$1"
        ;;
        *.tar.gz|*.tgz)
            tar xzf "$1"
        ;;
        *.tar.xz|*.txz|*.tar)
            tar xf "$1"
        ;;
        *.tar.zst|*.tzst)
            tar --zstd -xf "$1"
        ;;
        *.bz2)
            bunzip2 "$1"
        ;;
        *.gz)
            gunzip "$1"
        ;;
        *.xz)
            unxz "$1"
        ;;
        *.zst)
            unzstd "$1"
        ;;
        *.rar)
            rar x "$1"
        ;;
        *.zip)
            unzip "$1"
        ;;
        *.7z)
            7z x "$1"
        ;;
        *.Z)
            uncompress "$1"
        ;;
        *)
            if command -v bsdtar &>/dev/null; then
                bsdtar -xf "$1"
            else
                echo "'$1' cannot be extracted via extract()"
            fi
        ;;
    esac
}
