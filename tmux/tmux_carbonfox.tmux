# CarbonFox tmux setup
set -g status-format[1] '#[align=centre] #(gitmux "#{pane_current_path}")'
set -gaF status-format[1] "#[align=left]#{@theme-status-left}"
set -ga status-format[1] "#[align=right]#S #[fg=green,bg=black]#(tmux-mem-cpu-load --colors --interval 2)#[default]"

set -g mode-style "fg=#78a9ff,bg=#b6b8bb"
set -g message-style "fg=#78a9ff,bg=#b6b8bb"
set -g message-command-style "fg=#78a9ff,bg=#b6b8bb"
set -g pane-border-style "fg=#b6b8bb"
set -g pane-active-border-style "fg=#78a9ff"
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#78a9ff,bg=#0c0c0c"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
set -g status-left "#[fg=#282828,bg=#78a9ff,bold] #S #[fg=#78a9ff,bg=#0c0c0c,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#0c0c0c,bg=#0c0c0c,nobold,nounderscore,noitalics]#[fg=#78a9ff,bg=#0c0c0c] #{prefix_highlight} #[fg=#b6b8bb,bg=#0c0c0c,nobold,nounderscore,noitalics]#[fg=#78a9ff,bg=#b6b8bb] %Y-%m-%d  %I:%M %p #[fg=#78a9ff,bg=#b6b8bb,nobold,nounderscore,noitalics]#[fg=#282828,bg=#78a9ff,bold] #h "
setw -g window-status-activity-style "underscore,fg=#7b7c7e,bg=#0c0c0c"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#7b7c7e,bg=#0c0c0c"
setw -g window-status-format "#[fg=#0c0c0c,bg=#0c0c0c,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#0c0c0c,bg=#0c0c0c,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#0c0c0c,bg=#b6b8bb,nobold,nounderscore,noitalics]#[fg=#78a9ff,bg=#b6b8bb,bold] #I  #W #F #[fg=#b6b8bb,bg=#0c0c0c,nobold,nounderscore,noitalics]"
