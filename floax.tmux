#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/utils.sh"

tmux bind-key "$(tmux_option_or_fallback "@floax-bind" "p")" run-shell "$CURRENT_DIR/scripts/floax.sh"
tmux bind-key "$(tmux_option_or_fallback "@floax-bind-menu" "P")" run-shell "$CURRENT_DIR/scripts/menu.sh"

tmux setenv -g FLOAX_WIDTH "$(tmux_option_or_fallback '@floax-width' '80%')" 
tmux setenv -g FLOAX_HEIGHT "$(tmux_option_or_fallback '@floax-height' '80%')" 

# Options: black, red, green, yellow, blue, magenta, cyan, white
tmux setenv -g FLOAX_BORDER_COLOR "$(tmux_option_or_fallback '@floax-border-color' 'magenta')" 
tmux setenv -g FLOAX_TEXT_COLOR "$(tmux_option_or_fallback '@floax-text-color' 'blue')" 
tmux setenv -g FLOAX_TITLE "$(tmux_option_or_fallback '@floax-title' 'FloaX')" 

eval "$(tmux showenv -s)"
