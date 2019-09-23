set -gx VISUAL nvim
set -gx GOPATH (go env GOPATH)
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/*"'

alias v    nvim
alias vi   nvim
alias g    git
alias bubu "brew update;
            brew upgrade;
            brew cleanup;
            brew doctor"

function exit
  if test -n "$VIM"
    builtin exit
    return
  else if test -z "$TMUX"
    builtin exit
    return
  end

  set -l panes (tmux list-panes | wc -l)
  set -l windows (tmux list-windows | wc -l)
  set -l count (math "$panes + $windows - 1")

  if test $count -eq 1
    command tmux detach
  else
    builtin exit
  end
end

function tmux
  if test -z $argv[1]
    command tmux attach-session -t "$USER" || tmux new -s "$USER"
  else
    command tmux $argv
  end
end

eval (starship init fish)
