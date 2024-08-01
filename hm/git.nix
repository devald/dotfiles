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
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        push.default = "current";
        user.name = "Dévald Tari";
      };
      includes = [
        {
          condition = "gitdir:~/git/github/";
          contents.user.email = "tari@devald.pro";
        }
        {
          condition = "gitdir:~/git/work/";
          contents.user.email = "devald.tari@iu.org";
        }
      ];
    };
  };
}
