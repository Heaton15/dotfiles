# Toss shell configuration inside of the is-interactive section
if status is-interactive
    function fish_mode_prompt
        switch $fish_bind_mode
            case default
                echo '[N] '
            case insert
                echo '[I] '
            case replace_one
                echo '[R] '
            case visual
                echo '[V] '
        end
    end
    fish_vi_key_bindings
    #enable_transience
    # Ghostty configuration 
    if test -n "$GHOSTTY_RESOURCES_DIR"
        builtin source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    end

    if test -f "$HOME/.local/bin/uv_bash_complete.sh"
        source "$HOME/.local/bin/uv_bash_complete.sh"
    end

    # MAC Settings
    if string match -q Darwin (uname)
        eval "$(/opt/homebrew/bin/brew shellenv)"
        fish_add_path -a /opt/homebrew/opt/openjdk/bin
        fish_add_path -a "/opt/homebrew/opt/scala@2.13/bin:$PATH"
        fish_add_path "/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
        set -gx RISCV /opt/homebrew/
        #set -gx SHELL "/opt/homebrew/bin/bash"
    end

    if test -n WSLENV
        #export JAVA_HOME="/usr/lib/jvm/java-25-openjdk-amd64/"
        #export RISCV="$HOME/.local/bin/software/riscv-tools/latest-cy/chipyard/riscv-tools-chipyard-el8-291733d8"
        #export PATH="$RISCV/bin:$PATH"
        #export PATH="$PATH:/home/tim/.local/share/coursier/bin"
        #export EDITOR=$(which nvim)
    end

    # Use GNU ls over BSD when possible
    if type -q gls
        alias ls='gls --color=auto'
    else
        alias ls='ls --color=auto'
    end

    # Aliases
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
    alias zj="zellij"
    alias spooky-claude="claude --allow-dangerously-skip-permissions --dangerously-skip-permissions"
    alias chisel-example="curl -O -L https://github.com/chipsalliance/chisel/releases/latest/download/chisel-example.scala"

    if test -e "$HOME/.battelle_setup.sh"
        #source "$HOME/.battelle_setup.sh"
    end

    if type -q fzf
        eval $(fzf --fish)
    end
    set -gx FZF_DEFAULT_OPTS "--height 60% --layout=reverse --border rounded"

    if test -d "$HOME/.cargo/"
        source "$HOME/.cargo/env.fish"
    end

    fish_add_path "$HOME/.local/bin"
    set -gx TMUX_TMPDIR "$HOME/.tmux"

    if type -q starship
        starship init fish | source
        enable_transience
    end
end
