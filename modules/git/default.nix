{ config, ... }:
{
  programs.git = {
    enable = true;
    delta = {
      enable = true;
      options = {
        dark = true;
        line-numbers = true;
        hyperlinks = true;
        side-by-side = true;
      };
    };
    lfs.enable = true;
    maintenance.enable = true;
    signing = {
      gpgPath = "gpg";
      key = "C2671CD8BA3B9B3C";
      signByDefault = true;
    };
    userEmail = config.git.email;
    userName = config.git.username;
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
