{ config, pkgs, ... }:

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
          contents.user.email = "tari@devald.pro";
        }
        {
          condition = "gitdir:~/git/work/";
          contents.user.email = "devald.tari@example.com";
        }
      ];
    };
  };
}
