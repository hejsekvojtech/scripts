#!/bin/zsh

function mdc() {
    mkdir ${1} && cd ${1}
}

function addSSHIdentity() {
    IDENTITY_NAME=$1
    [[ -z $IDENTITY_NAME ]] && error "No SSH identity name provided"
    
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
