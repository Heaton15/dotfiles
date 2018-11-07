

# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias ll='ls -la'
alias vi='vim'
alias webz='chromium &'
alias dirs='dirs -v'
archey3 -c red
alias emacs='emacs &'
eval $(dircolors ~/.dir_colors)
source ~/.colors
# Sets it so that creating more terminals in i3 down not cause text to weirdly rap around the window
shopt -s checkwinsize

# Setting local terminal variables used by neomutt
export EDITOR="/usr/bin/vim"

# Setting ranger environment variables
export RANGER_LOAD_DEFAULT_RC="FALSE"
# Changes colors for the use@machinename in bash

export PS1="\[\033[38;5;231m\][\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;231m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;231m\]\w]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
