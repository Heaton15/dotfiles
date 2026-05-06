# Toss shell configuration inside of the is-interactive section
function carbonfox_colors
    # Nightfox Color Palette
    # Style: carbonfox
    # Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/carbonfox.fish
    set -l foreground f2f4f8
    set -l selection 2a2a2a
    set -l comment 6e6f70
    set -l red ee5396
    set -l orange 3ddbd9
    set -l yellow 08bdba
    set -l green 25be6a
    set -l purple be95ff
    set -l cyan 33b1ff
    set -l pink ff7eb6

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
end

function set_vi_binds
    fish_vi_key_bindings
end

if status is-interactive
    carbonfox_colors
    set_vi_binds
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
        fish_add_path -a "/opt/homebrew/opt/openjdk/bin"
        fish_add_path -a "/opt/homebrew/opt/scala@2.13/bin/"
        fish_add_path "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
        set -gx RISCV /opt/homebrew/
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
        bass source "$HOME/.battelle_setup.sh"
    end

    if type -q fzf
        fzf --fish | source
    end
    set -gx FZF_DEFAULT_OPTS "--height 60% --layout=reverse --border rounded"

    if test -d "$HOME/.cargo/"
        source "$HOME/.cargo/env.fish"
    end

    fish_add_path "$HOME/.local/bin"
    set -gx TMUX_TMPDIR "$HOME/.tmux"
end
