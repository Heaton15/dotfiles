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




set -o vi
#export TERM=xterm-256color
export TERM=rxvt-unicode-256color
if [ ${USER} == "tim" ]; then
  archey3 --color=cyan
  export PATH="$HOME/.local/rouge/bin/:$PATH"
  export PATH="$HOME/.local/bin:$PATH"
  source /home/tim/.fzf/shell/completion.bash
  export PATH="$HOME/.fzf/bin/:$PATH"
  export GOPATH="$HOME/.go" && export PATH="$HOME/.go/bin:$PATH"
  eval $(dircolors ~/.dircolors)
  #source ~/.colors
  source ~/.functions.sh
  export LESSOPEN="| $HOME/.local/rouge/bin/rougify %s 2> /dev/null"                        
  export LESS="-R"
  export EDITOR="/usr/bin/vim"
  export VISUAL="/usr/bin/vim"
fi

# TSS Only
if [[ ${USER} == "tim.heaton" || ${USER} == "heaton.49" ]]
 then
  eval $(dircolors --sh ~/.dircolors)
  alias vtags='python $HOME/.vtags-3.01/vtags.py'
  export PATH="$HOME/.fzf/bin:$PATH"
  export PATH="$HOME/.linuxbrew/opt/perl/bin:$PATH"
  export PATH="$HOME/.linuxbrew/opt/texlive/texlive/bin/x86_64-linux:$PATH"
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export PATH="$HOME/.linuxbrew/sbin:$PATH"
  export FONTCONFIG_PATH=$HOME/.linuxbrew/etc/fonts
  export RISCV="/home/heaton.48/rocket-tools"
  export PATH="/home/heaton.48/.sdkman/candidates/sbt/current/bin:$PATH"
  export PATH="/home/heaton.48/rocket-tools/bin:$PATH"
  export PATH="/home/heaton.48/tools/verilator_bin/bin:$PATH"
  export HOMEBREW_TEMP=$HOME/.linuxbrew_tmp
  export EDITOR="$HOME/.linuxbrew/bin/vim"
  export VISUAL="$HOME/.linuxbrew/bin/vim"
  export TMUX_TMPDIR=$HOME/.linuxbrew_tmp
  unset TMOUT
  # The order of these 2 commands matters
  [[ -r "/home/tim.heaton/.linuxbrew/etc/profile.d/bash_completion.sh" ]] && . "/home/tim.heaton/.linuxbrew/etc/profile.d/bash_completion.sh"
  source $HOME/.fzf/shell/completion.bash
  #export PATH="$HOME/.linuxbrew/Cellar/openjdk@8/1.8.0+282/bin:$PATH"
  export GOPATH="$HOME/.go" && export PATH="$HOME/.go/bin:$PATH"
fi


# Sets it so that creating more terminals in i3 does not cause text to weirdly rap around the window
shopt -s checkwinsize

# Changes colors for the use@machinename in bash

export PS1="\[\033[38;5;50m\]\u\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;255m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]: \[$(tput sgr0)\]"



#if [ ${USER} == heaton.49 ]; then
#    source $HOME/linuxbrew/all_proxy.sh
#fi
