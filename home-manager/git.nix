{ config, lib, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      aliases = {
        br = "branch";
        ci = "commit";
        co = "checkout";
        lg = "log --graph --all --decorate --oneline";
        st = "status";
      };
      userName = "Dévald Tari";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        push.default = "current";
      };
      includes = [
        {
          condition = "gitdir:~/git/github/";
          contents = {
            commit.gpgsign = true;
            user = {
              email = "tari@devald.pro";
              signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFsa1b39A3IhJpnvib8Xu8Zkzb94eDIe99yS89YY+OW5";
            };
            gpg = {
              format = "ssh";
              ssh.program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
            };
          };
        }
        {
          condition = "gitdir:~/git/work/";
          contents.user.email = "devald.tari@example.com";
        }
      ];
    };
  };
}
