

# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
#alias web='i3-msg workspace web'
PS1='[\u@\h \W]\$ '
alias ll='ls -la'
alias vi='vim'
alias webz='chromium &'
alias fontz='fc-list | cut -f2 -d: | sort -u'
alias dirs='dirs -v'
archey3 -c red
alias emacs='emacs &'
eval $(dircolors ~/.dir_colors)
source ~/.colors


# Setting local terminal variables 
export EDITOR="/usr/bin/vim"
