set fish_greeting ""

if test -z $TMUX
  set -gx PATH /usr/local/opt/findutils/libexec/gnubin \
               /usr/local/opt/gnu-sed/libexec/gnubin \
               /usr/local/opt/mongodb@3.6/bin \
               /usr/local/sbin \
               (go env GOPATH)/bin \
               $PATH
end

set -gx GOPATH (go env GOPATH)
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/*"'

alias g="git"
alias gp="git pull"
alias gd="git diff"
alias gst="git status"
alias gco="git checkout"
alias bubu="brew update; \
            brew upgrade; \
            brew cleanup; \
            brew doctor"
alias docker-cleanup="docker rm -f (docker ps -aq); \
                      docker volume rm -f (docker volume ls -qf dangling=true); \
                      docker rmi -f (docker images -qf dangling=true)"
