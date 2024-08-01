{ config, pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        ".." = "cd ..";
      };
    };
  };

  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
    };
  };
}
