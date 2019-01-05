

# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias vi='vim'
alias dirs='dirs -v'
alias top='htop'
archey3 -c cyan
alias emacs='emacs &'
eval $(dircolors ~/.dir_colors)
source ~/.colors
# Sets it so that creating more terminals in i3 down not cause text to weirdly rap around the window
shopt -s checkwinsize

# Set vtags creation
alias vtags='python ~/.vim/bundle/vtags/plugin/vtags.py'

# Setting local terminal variables used by neomutt
export EDITOR="/usr/bin/vim"

# Setting ranger environment variables
export RANGER_LOAD_DEFAULT_RC="FALSE"
# Changes colors for the use@machinename in bash

export PS1="\[\033[38;5;231m\][\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;231m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;231m\]\w]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Source hidden bash functionality
source ~/.functions

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"
