{ inputs, config, ... }:
{  
  sops = {
    age.keyFile = "${config.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets.yaml;
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";

    secrets = {
      github-password.path = "${config.sops.defaultSymlinkPath}/github-password";
    };
  };
}
