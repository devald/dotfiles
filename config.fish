set fish_greeting
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/*"'
set -gx BAT_THEME base16
set -gx TF_PLUGIN_CACHE_DIR "$HOME/.terraform.d"

fish_add_path /usr/local/sbin (go env GOPATH)/bin

alias v    nvim
alias vi   nvim
alias g    git
alias bubu "brew update; and brew upgrade; and brew cleanup; and brew doctor"

starship init fish | source
