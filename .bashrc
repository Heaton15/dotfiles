# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

################Aliasing##################
alias ls='ls --color=auto'
alias vi='vim'
alias ll='ls -la'
alias la='ls -a'
alias dirs='dirs -v'
alias matlab='matlab -nosplash -nodesktop'
alias grep='grep --color=yes'
alias vimrc='vim $HOME/.vimrc'
alias bashrc='vim $HOME/.bashrc'
alias ..="cd ../"
alias ....="cd ../../"
alias ......="cd ../../../"
taskvim='vim -c "TW" -c "Calendar -view=year -split=horizontal -position=below -height=26"'
alias vimgit="vim -c \":Git\" -c \":only\""
alias vimlog="vim -c \":Git log\" -c \":only\""
#################PATH Updates##############

# Configures fuzzy finder 

export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border rounded --color fg:#00bfe5,fg+:#00bfe5,bg:#000000,preview-bg:#000000,border:#00bfe5 --preview "
                                                                 [[ $(file --mime {}) =~ binary ]] &&
                                                                    echo {} is a binary file ||
                                                                   (rougify highlight {} ||
                                                                     cat {}) 2> /dev/null | head -500"'




set -o vi
export TERM=xterm-256color
#export TERM=rxvt-unicode-256color
if [ ${USER} == "tim" ]; then
  archey3 --color=cyan
  export PATH="$HOME/AUR/matlab/bin:$PATH"
  export PATH="$HOME/.local/rouge/bin/:$PATH"
  source /home/tim/.fzf/shell/completion.bash
  export PATH="$HOME/.fzf/bin/:$PATH"
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
  eval $(dircolors ~/.dircolors)
  alias vtags='python $HOME/.vtags-3.01/vtags.py'
  export PATH="$HOME/.fzf/bin:$PATH"
  export PATH="$HOME/.linuxbrew/opt/perl/bin:$PATH"
  export PATH="$HOME/.linuxbrew/opt/texlive/texlive/bin/x86_64-linux:$PATH"
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export PATH="$HOME/.linuxbrew/sbin:$PATH"
  export PATH="$HOME/.rxvt-unicode-9.22/bin:$PATH"
  export PATH="$HOME/timh_chipyard/verilator/bin:$PATH"
  export RISCV="$HOME/rocket-tools"
  export PATH="$HOME/rocket-tools/bin:$PATH"
  export HOMEBREW_TEMP=$HOME/.linuxbrew_tmp
  export EDITOR="$HOME/.linuxbrew/bin/vim"
  export VISUAL="$HOME/.linuxbrew/bin/vim"
  export TMUX_TMPDIR=$HOME/.linuxbrew_tmp
  unset TMOUT
  export CDPATH="$HOME/timh_build3a/socta1_chipyard/generators:$CDPATH"
  # The order of these 2 commands matters
  [[ -r "/home/tim.heaton/.linuxbrew/etc/profile.d/bash_completion.sh" ]] && . "/home/tim.heaton/.linuxbrew/etc/profile.d/bash_completion.sh"
  source $HOME/.fzf/shell/completion.bash

  if [ -f "$HOME/Tim_Project_Temporary" ]
   then
    source ~/Tim_Project_Temporary/source_file/brew_riscv_install/path_update.sh
    export PATH="/home/tim.heaton/Tim_Project_Temporary/packages/rouge/bin:$PATH"
    export PATH="/home/tim.heaton/Tim_Project_Temporary/packages/binmake/bin:$PATH"
    export RISCV="/home/tim.heaton/Tim_Project_Temporary/source_file/brew_riscv_install/rocket-tools"
   fi
fi


# Sets it so that creating more terminals in i3 does not cause text to weirdly rap around the window
shopt -s checkwinsize

# Changes colors for the use@machinename in bash

export PS1="\[\033[38;5;231m\][\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;231m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;231m\]\w]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

if [ ${USER} == heaton.49 ]; then
    source $HOME/linuxbrew/all_proxy.sh
fi
