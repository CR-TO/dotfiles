#!/usr/bin/env bash

HOST_NAME=auvana

source ~/.nvm/nvm.sh
nvm use stable
shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=gxfxcxdxbxegedabagacad

txtred='\e[0;31m' # Red
txtgrn='\e[1;32m' # Green
blue='\e[0;94m'   # Blue
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;36m' # Bold Purple
txtrst='\e[0m'    # Text Reset

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    
    pregit=
    git=""
    unc=""
    if [ "$(vcprompt -f "%m")" != "" ]; then unc="($(vcprompt -f "%m"))"; fi
    if [ -d "./.git" ]; then git="[git:$(vcprompt -f "%b")${unc}]"; fi
    printf "\n$txtred%s: $bldpur%s $txtgrn%s \n$txtrst" "$HOST_NAME" "$dir" "$git"
}

_emojis=("🌵" "🌳" "💞" "💾" "🤘")
EMOJI=${_emojis[ $RANDOM % ${#_emojis[@]} ]}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI> "

# Sets title of hyper terminal to be the current path
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"

fortune | cowsay -f tux

function mkcd()
{
	mkdir $1 && cd $1
}

# -------
# Aliases
# -------
alias open='explorer.exe'
alias ���="git checkout -b drunk"
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias l="ls" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias reload="clear && source ~/.bash_profile"

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git clone'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"'
