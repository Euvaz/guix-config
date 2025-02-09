# Cross-Desktop Group
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Editor
export EDITOR="emacs"
export VISUAL="emacs"

# Go
export GO111MODULE="on"
export GOPATH="${HOME}/go"

# Path
export PATH="${PATH}:${GOPATH}/bin"

# History
export HISTFILE="${ZDOTDIR}/.histfile"
export HISTSIZE=1000
export SAVEHIST=1000
