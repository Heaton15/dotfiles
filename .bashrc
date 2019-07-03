# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
archey3 -c cyan

################Aliasing##################
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias vi='vim'
alias dirs='dirs -v'
alias top='htop'
alias matlab='matlab -nosplash -nodesktop'
alias ..="cd ../"
alias ....="../../"
alias ......="../../../"
#################PATH Updates##############

# Configures fuzzy finder 
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border --preview "
                                                                [[ $(file --mime {}) =~ binary ]] &&
                                                                   echo {} is a binary file ||
                                                                  (rougify highlight {} ||
                                                                    cat {}) 2> /dev/null | head -500"'
set -o vi

if [ ${USER} == "tim" ]
 then
  export PATH="$HOME/AUR/matlab/bin:$PATH"
  export PATH="$HOME/.local/rouge/bin/:$PATH"
  source /usr/share/fzf/completion.bash 
  alias vtags='python ~/.vim/vtags-3.00/vtags.py'
  eval $(dircolors ~/.dir_colors)
  source ~/.colors
  source ~/.functions.sh
  export LESSOPEN="| $HOME/.local/rouge/bin/rougify %s 2> /dev/null"                        
  export LESS="-R"
fi

# TSS Only
if [ ${USER} == "tim.heaton" ]
 then
  alias vtags='python ~/Tim_Project_Temporary/packages/vtags-3.00/vtags_vim_api.vim'
  export PATH="/home/tim.heaton/Tim_Project_Temporary/local/bin/bin:$PATH"
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tim.heaton/Tim_Project_Temporary/local/lib
  export PATH="/home/tim.heaton/Tim_Project_Temporary/local/bin:$PATH"
  export PATH="/home/tim.heaton/Tim_Project_Temporary/packages/fzf/bin:$PATH"
  export PATH="/home/tim.heaton/Tim_Project_Temporary/packages/rouge/bin:$PATH"
  export PERL5LIB=$HOME/Tim_Project_Temporary/local/usr/local/lib64/perl5/
  source /home/tim.heaton/Tim_Project_Temporary/packages/fzf/shell/completion.bash

  export LESSOPEN="| $HOME/Tim_Project_Temporary/packages/rouge/bin/rougify %s 2> /dev/null"                        
  export LESS="-R"
fi


# Sets it so that creating more terminals in i3 does not cause text to weirdly rap around the window
shopt -s checkwinsize

# Set vtags creation

# Setting local terminal variables used by neomutt
export EDITOR="/usr/bin/vim"

# Setting ranger environment variables
export RANGER_LOAD_DEFAULT_RC="FALSE"
# Changes colors for the use@machinename in bash

export PS1="\[\033[38;5;231m\][\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;231m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;231m\]\w]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"


