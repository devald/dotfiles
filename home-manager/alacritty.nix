{ config, pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        shell.program = "${pkgs.zsh}/bin/zsh";
        shell.args = [ "-l" ];
        font.size = 14.0;
        font.normal.family = "Fira Code";
        selection.save_to_clipboard = true;
        cursor.style.shape = "Beam";
        mouse.hide_when_typing = true;
      };
    };
  };
}
