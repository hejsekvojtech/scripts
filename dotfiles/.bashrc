source /etc/profile

# COLOURS!
# --------- REGULAR ---------
txtblk='\[\e[0;30m\]' # Black
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
# --------- BOLD ---------
bldblk='\[\e[1;30m\]' # Black
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
# --------- BACKGROUND ---------
bakblk='\[\e[40m\]'   # Black
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White

txtrst='\[\e[0m\]'    # Text Reset

# Colourful shell prompt
export PS1="${bldcyn}\u${bldwht}@${bldcyn}\h${bldwht}: ${txtblu}\w ${bldylw}\\$ \[$(tput sgr0)\]${txtrst}"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=2000000

# UI
export TERM=xterm-256color

# Vim FTW!
export EDITOR=/usr/bin/vim

# Aliases
alias mkdir='mkdir -p'
alias listall='ls -alF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias aurgrade='yay -Syu --nodiffmenu --noconfirm'
alias pacgrade='pacman -Syu --noconfirm'

# Functions
function md() {
	mkdir ${1} && cd ${1}
}

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
	else
		echo "'$1' is not a valid file"
	fi
}

# Git functions
function gc() {
	git commit -s -m "${*}"
}

function ga() {
	git add . && git commit -s -m "${*}"
}

function revert(){
	git reset --hard ${1}
}
