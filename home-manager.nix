{ inputs, yazi, hyprpaper, home-manager, config, sops-nix, configModules, ... }:
{
  imports = configModules;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.username} = import ./home.nix;
    sharedModules = [
      sops-nix.homeManagerModules.sops
    ];
    extraSpecialArgs = { inherit inputs yazi sops-nix hyprpaper configModules; };
  };
  users.users.${config.username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
