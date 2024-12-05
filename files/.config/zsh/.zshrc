# Define Aliases
alias ls="eza"
alias kubectl="kubecolor"
alias k="kubecolor"

# Direnv Hook
eval "$(direnv hook zsh)"

# Extended Pattern Matching
setopt autocd extendedglob nomatch

# Disable Error Beep
unsetopt beep

# Set "Vi mode"
bindkey -v

# History Searching
bindkey "^R" history-incremental-pattern-search-backward
bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward

# History Tweaks
setopt HIST_IGNORE_ALL_DUPS

# Enable Completion
zstyle ":completion:*" completer _complete _ignored
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
autoload -Uz compinit
compinit

# Customize Prompt
setopt PROMPT_SUBST
PROMPT="%F{green}%n@%m%f %F{blue}%-40<…<%~%<<%f %F{cyan}>%f "

# Kubectl Completion
source <(kubectl completion zsh)
compdef kubecolor=kubectl
