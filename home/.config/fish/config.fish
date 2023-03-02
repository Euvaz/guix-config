# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    set llt (last -1 -R $USER | head -1 | cut -c 23-38)
    set lls (last -1 -R $USER | head -1 | cut -c 10-13)
    echo "Last login [$llt on $lls]"
end

# Aliases
alias k='kubecolor'
alias kw='vdy kubectl get'
#abbr --add --global k 'kubectl'

# Direnv
direnv hook fish | source

# Setting environment variables
set -x EDITOR nvim
set -x GO111MODULE off

# Setting path variables
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOPATH/bin $HOME/.local/bin

function vdy --description 'modern watch'
    viddy -d -n 2 --shell fish $argv[1..-1]
end
