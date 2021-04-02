function md() {
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
	echo -e "$fg[green]- warning: ${@}$reset_color"
	echo ""
}

# YAY FTW!
function cleanup() {
    sudo pacman -Sc --noconfirm
    pacman -Qtdq | sudo pacman -Rns - 2>/dev/null
        sudo reflector \
            --download-timeout 30 \
            --country France \
            --country Czech \
            --age 24 \
            --protocol https \
            --sort rate \
            --save /etc/pacman.d/mirrorlist
}

function install() {
    if [[ ${1} == '-p' ]]; then
        warning "Using pacman backend"
        shift
        sudo pacman -S ${@}
    else
        yay -S --noconfirm ${@}
    fi
}

function nuke() {
    sudo pacman -R --noconfirm ${@}
}

function upgrade() {
    yay -Syyu --noconfirm --nodiffmenu
}

# AOSP stuff
function find-blobs() {
    find ${OOS_MNT}/vendor -name ${*} | awk -F "OOS" '{print $2}' | tee -a '${ANDROID}/proprietary.txt'
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

# Git functions
function gc() {
    gcmsg=${*}
    if [[ -z ${gcmsg} ]]; then
            gcmsg="$(basename $(pwd)): Update"
    fi
    git commit -s -m "${gcmsg}"
}

function ga() {
    git add ${*}
}

function gac() {
    git add . && gc "${*}"
}

function greset() {
    git reset --hard origin/HEAD
}

# Housekeeping
function sync-rc() {
    warning "Syncing scripts and configs..."
    if [[ -d ${ENV_SCRIPTS} ]]; then
        \cp -urf $ZSH_CONFIG/* ${ENV_SCRIPTS}/dotfiles/zsh/
        git -C ${ENV_SCRIPTS} add .
        git -C ${ENV_SCRIPTS} commit -s -m "scripts: Sync config as of $DATE"
        git -C ${ENV_SCRIPTS} push origin master
    else
        git clone https://github.com/hejsekvojtech/scripts.git -b master ${ENV_SCRIPTS}
        sync-rc
    fi
}
