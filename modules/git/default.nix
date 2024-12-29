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
      key = config.git.signingKey;
      signByDefault = true;
    };
    userEmail = config.git.email;
    userName = config.git.username;
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      credential.helper = "store";
    };
  };
}
