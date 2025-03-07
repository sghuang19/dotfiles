# omz configurations
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

COMPLETION_WAITING_DOTS="true"

plugins=(
	git tmux python vi-mode history colorize colored-man-pages
	zsh-autosuggestions zsh-syntax-highlighting
	1password zsh-navigation-tools
	python vscode
)

# User configuration
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH" # pipx managed
export LESS="-R --mouse"
export EDITOR="nvim"
export DOTS="$HOME/dev/dotfiles"
# Powerline configuration
UV_TOOL_DIR=$(uv tool dir)
export POWERLINE_ROOT=$UV_TOOL_DIR/powerline-status/lib/python3.13/site-packages
source $POWERLINE_ROOT/powerline/bindings/zsh/powerline.zsh
#
# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export UV_PYTHON=3.13
#
# Aliases
alias vi="nvim"
alias dots="cd $DOTS"
alias bash="/opt/homebrew/bin/bash"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# bun completions
[ -s "/Users/sghuang/.bun/_bun" ] && source "/Users/sghuang/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/sghuang/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
