{ config, pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      sensibleOnTop = false;
      mouse = true;
      #      prefix = "C-a";
      keyMode = "emacs";
      baseIndex = 1;
      newSession = true;
      escapeTime = 0;
      historyLimit = 50000;
      aggressiveResize = true;
      terminal = "screen-256color";
      clock24 = true;
      extraConfig = ''
        set -as terminal-features ",xterm-256color:RGB"
      '';
    };
  };
}
