# If not running interactively, don't do anything
[[ $- != *i* ]] && return


################Aliasing##################
alias ls='ls --color=auto'
alias vi='vim'
alias ll='ls -la'
alias clear='clear -x'
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

if [[ -e "$HOME/.niobium_setup.sh" ]]; then
  source "$HOME/.niobium_setup.sh"
fi

# Configures fuzzy finder 

export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border rounded --preview "cat {}"'
export PATH="$HOME/.fzf/bin:$PATH"
source $HOME/.fzf/shell/completion.bash

alias vtags='/usr/bin/python2 ~/.vtags-3.01/vtags-3.01/vtags.py'

export EDITOR="$HOME/.local/bin/nvim"
export VISUAL="$HOME/.local/bin/nvim"

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

set -o vi
SYSTEM=$(uname -n)

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

if [[ -d $HOME/go ]]; then
    GOPATH=$HOME/go
fi

export PS1="\[\033[38;5;50m\]\u\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;255m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]: \[$(tput sgr0)\]"

if [[ -e "/home/tim/.sdkman/bin/sdkman-init.sh" ]]; then
  source "/home/tim/.sdkman/bin/sdkman-init.sh"
fi

PATH="/home/users/tim/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/users/tim/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/users/tim/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/users/tim/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/users/tim/perl5"; export PERL_MM_OPT;

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.miniforge3/bin:$PATH
export TMUX_TMPDIR=$HOME/.tmux/
