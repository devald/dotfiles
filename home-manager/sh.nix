{ config, pkgs, ... }:
let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
  };
in
{
  programs = {
    bash.enable = true;
    bash.shellAliases = myAliases;
    zsh.enable = true;
    zsh.shellAliases = myAliases;
    zsh.autosuggestion.enable = true;
    starship.enable = true;
  };
}
