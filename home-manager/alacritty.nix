{ config, pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        shell.program = "${pkgs.zsh}/bin/zsh";
        shell.args = [ "-l" ];
        font.size = 10.0;
        font.normal.family = "FiraCode Nerd Font Mono";
        font.normal.style = "Retina";
        selection.save_to_clipboard = true;
        cursor.style.shape = "Beam";
        mouse.hide_when_typing = true;
      };
    };
  };
}
