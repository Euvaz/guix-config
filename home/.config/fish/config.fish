# Start X at Login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

if status is-interactive
    # Commands to Run in Interactive Sessions
end

function fish_greeting
    set llt (last -1 -R $USER | head -1 | cut -c 23-38)
    set lls (last -1 -R $USER | head -1 | cut -c 10-13)
    echo "Last login [$llt on $lls]"
end

function fish_right_prompt
    # Intentionally Left Blank
end

# Aliases
abbr --add --global k "kubecolor"

# Direnv
direnv hook fish | source

# Setting Environment Variables
set -x EDITOR nvim
set -x GO111MODULE on

# Setting Path Variables
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOPATH/bin $HOME/.local/bin

