if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

# PATH
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.bun/bin
fish_add_path /opt/homebrew/bin

starship init fish | source

# ENV
set -x EDITOR nvim
set -x DOTS $HOME/dev/dotfiles
set -x UV_PYTHON 3.13

# ABBR
abbr -a vi nvim
abbr -a less "less --mouse"
abbr -a dots "cd $DOTS"
abbr -a t "tmux attach -t base || tmux new -s base"
