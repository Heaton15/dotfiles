# # Ghostty shell integration for Bash. This should be at the top of your bashrc!
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ $(uname) == "Darwin" ]]; then
  eval "$(/usr/libexec/path_helper)"
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
  export PATH="/opt/homebrew/opt/scala@2.13/bin:$PATH"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export RISCV="/opt/homebrew/bin/"
  export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
  export SHELL="/opt/homebrew/bin/bash"

fi


################Aliasing##################
alias ls='ls --color=auto'
alias vi='vim'
alias ll='ls -la'
alias clear='clear -x'
alias ..="cd ../"
alias ....="cd ../../"
alias ......="cd ../../../"
alias .1="cd ../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias kb-mac="make -C $HOME/dotfiles/ ghostty"
alias kb-ext="make -C $HOME/dotfiles/ ghostty-ext-keyboard"
#################PATH Updates##############

if [[ -e "$HOME/.niobium_setup.sh" ]]; then
  source "$HOME/.niobium_setup.sh"
fi

# Configures fuzzy finder 

export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border rounded --preview "cat {}"'

alias vtags='/usr/bin/python2 ~/.vtags-3.01/vtags-3.01/vtags.py'

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

set -o vi

export PS1="\[\033[38;5;50m\]\u\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;255m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]: \[$(tput sgr0)\]"

if [[ -e "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.miniforge3/bin:$PATH
export TMUX_TMPDIR=$HOME/.tmux/
