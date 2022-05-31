# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

################Aliasing##################
alias ls='ls --color=auto'
alias vi='vim'
alias ll='ls -la'
alias dirs='dirs -v'
alias clear='clear -x'
alias matlab='matlab -nosplash -nodesktop'
alias cgrep='grep --color=yes'
alias vimrc='vim $HOME/.vimrc'
alias bashrc='vim $HOME/.bashrc'
alias c='clear'
alias cls='clear && ls'
alias cla='clear && ls -a'
alias cll='clear && ls -l'
alias ..="cd ../"
alias ....="cd ../../"
alias ......="cd ../../../"
alias .1="cd ../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
#################PATH Updates##############

# Configures fuzzy finder 

export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border rounded --color fg:#00bfe5,fg+:#00bfe5,bg:#000000,preview-bg:#000000,border:#00bfe5 --preview "
                                                                 [[ $(file --mime {}) =~ binary ]] &&
                                                                    echo {} is a binary file ||
                                                                   (rougify highlight {} ||
                                                                     cat {}) 2> /dev/null | head -500"'

# All system paths
if [[ $USER == "tim" ]]; then
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
fi


export PATH="$HOME/.fzf/bin:$PATH"
source $HOME/.fzf/shell/completion.bash
export PATH=$HOME/.local/mybin:$PATH
alias vtags='python ~/.vtags-3.01/vtags.py'
export EDITOR="$HOME/.local/mybin/vim"
export VISUAL="$HOME/.local/mybin/vim"


export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

set -o vi
SYSTEM=$(uname -n)

if [[ $SYSTEM != "arch" ]]; then 
    source $HOME/.functions
fi

if [ $SYSTEM == "arch" ]; then
    archey3 --color=cyan
    export PATH="$HOME/.local/rouge/bin/:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
    export GOPATH="$HOME/.go" && export PATH="$HOME/.go/bin:$PATH"
    eval $(dircolors ~/.dircolors)
    #source ~/.colors
    source ~/.functions.sh
    export LESSOPEN="| $HOME/.local/rouge/bin/rougify %s 2> /dev/null"                        
    export LESS="-R"
    export EDITOR="/usr/bin/vim"
    export VISUAL="/usr/bin/vim"
fi

# Sets it so that creating more terminals in i3 does not cause text to weirdly rap around the window

shopt -s checkwinsize

if [[ -d $HOME/go ]]; then
    GOPATH=$HOME/go
fi
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export PS1="\[\033[38;5;50m\]\u\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;255m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]: \[$(tput sgr0)\]"

