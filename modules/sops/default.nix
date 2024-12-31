{ inputs, config, ... }:
{
  sops = {
    age = {
      keyFile = "${config.homeDirectory}/.config/sops/age/keys.txt";
      generateKey = true;
    };
    defaultSopsFile = ../../secrets.yaml; 

    secrets = {
      "wireless.conf" = {};
    };
  };
}
