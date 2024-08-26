## Environment Variables

set -gx KUBECONFIG $HOME/.kube/config

set -gx TERM xterm-256color


set -L TE hx
set -gx VISUAL $TE
set -gx EDITOR $TE

set -gx SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# ---------------------------------------------------------
# PATH
# ---------------------------------------------------------

# Add nix to PATH if not already there
if not contains /nix/var/nix/profiles/default/bin $PATH
    set PATH /nix/var/nix/profiles/default/bin $PATH
end

if not contains /etc/profiles/per-user/$USER/bin $PATH
    set PATH /etc/profiles/per-user/$USER/bin $PATH
end

# Add asdf binaries if asdf is installed
if test -d "$HOME/.asdf"
    set -x PATH $HOME/.asdf/bin $HOME/.asdf/shims $PATH
end

# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------
alias e $TE

# Git
alias ga "git add"
alias gc "git commit"
alias gp "git push"
alias gl "git log"
alias gs "git status"
alias gb "git branch"
alias gd "git diff"
alias gco "git checkout"
alias gcb "git checkout -b"

# Nix
alias nixre "darwin-rebuild switch"
alias nixgc "nix-collect-garbage -d"
alias nixq "nix-env -qaP"
alias nixcfg "e ~/.nixpkgs/darwin-configuration.nix"

# Docker
alias dcu "docker-compose up"
alias dcd "docker-compose down"

## Work tools
alias tf terraform
alias k kubectl
alias gw "./gradlew"

## vi mode

fish_vi_key_bindings 2>/dev/null

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

function fish_default_mode_prompt
    # NOOP to disable mode indicator
end

## fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -gx FZF_DEFAULT_OPTS '--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'

## direnv integration
direnv hook fish | source

## zoxide integration
zoxide init fish --cmd g | source


## Prompt

set fish_greeting
set pure_username_color $fish_color_user
set pure_host_color $fish_color_host
set pure_user_host_location 1
