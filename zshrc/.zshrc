#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

# Setup keys
# export BRAVE_API_KEY=$(pass api_keys/brave_api_key)
export OPENAI_API_KEY=$(pass openai/api_key) 

# Install Zap plugin manager
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] & source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"


# Load and initialize completion system
autoload -Uz compinit
compinit

# Connect to third party
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"
# Atuin Configs
eval "$(atuin init zsh)"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "junegunn/fzf-git.sh"
plug "wintermi/zsh-starship"

# Carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
# Setup FZF
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

export PNPM_HOME="/Users/ez/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Added by Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH"

# aliases
alias cd=z
alias c="clear"
alias e="exit"
alias ls="eza --no-filesize --no-time --no-permissions"

# tree
alias tree="tree -L 3 -a -I '.git' --charset X "
alias dtree="tree -L 3 -a -d -I '.git' --charset X "

# Git aliases
alias gt="git"
alias ga="git add ."
alias gs="git status -s"
alias gc="git commit -m"
alias glog="git log --oneline --graph --all"
alias lg="lazygit"

# unbind ctrl g in terminal
bindkey -r "^G"

PATH=~/.console-ninja/.bin:$PATH

# Added by Windsurf
export PATH="/Users/ez/.codeium/windsurf/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/ez/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/ez/.bun/_bun" ] && source "/Users/ez/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
