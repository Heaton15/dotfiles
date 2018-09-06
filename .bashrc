#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias web='i3-msg workspace web'
PS1='[\u@\h \W]\$ '
alias ll='ls -la'
alias vi='vim'
alias webz='chromium &'
alias fontz='fc-list | cut -f2 -d: | sort -u'
archey3 -c red
export PATH=$PATH:/usr/share/vim/vimfiles
