#!/bin/zsh

function mdc() {
    mkdir ${1} && cd ${1}
}

# Print the error message, then exit
function error() {
	echo ""
	echo -e "$fg[red]- error: ${@}$reset_color"
	echo ""
	exit 1
}

# Print the warning message and continue
function warning() {
	echo ""
	echo -e "$fg[blue]- warning: ${@}$reset_color"
	echo ""
}

# YAY FTW!
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
        --age 24 \
        --protocol https \
        --sort rate 2>/dev/null
}

function install() {

    sudo pacman -S --noconfirm ${@}
}

function nuke() {
    sudo pacman -R --noconfirm ${@}
}

function nuke-common() {
    sudo pacman -R --noconfirm $(pacman -Qs $1 | cut -d " " -f1 | cut -d "/" -f2 | sed -e '/^$/d') || error "Unable to find packages containing '$1'"
}

function upgrade() {
    sudo pacman -Syu --noconfirm --nodiffmenu
}

function addSSHIdentity() {
	IDENTITY_NAME=$2
	EMAIL=$1
	[[ -z $EMAIL || -z $IDENTITY_NAME ]] && exit
	if [[ -f ~/.ssh/id_rsa_${IDENTITY_NAME}.pub ]]; then
		warning "SSH key found!"
	else
		warning "Generating a new SSH key"
		ssh-keygen -t rsa -b 4096 -C "${EMAIL}" -P "" -f ~/.ssh/id_rsa_${IDENTITY_NAME} -q
	fi
	warning "SSH key has been generated!"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa_$IDENTITY_NAME
}

# Extract it!
function extract () {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)
                tar xjf $1
                ;;
            *.tar.gz)
                tar xzf $1
                ;;
            *.bz2)
                bunzip2 $1
                ;;
            *.rar)
                rar x $1
                ;;
            *.gz)
                gunzip $1
                ;;
            *.tar|*.tar.xz)
                tar xf $1
                ;;
            *.tbz2)
                tar xjf $1
                ;;
            *.tgz)
                tar xzf $1
                ;;
            *.zip)
                unzip $1
                ;;
            *.Z)
                uncompress $1
                ;;
            *)
                echo "'$1' cannot be extracted via extract()"
                ;;
        esac
    fi
}
