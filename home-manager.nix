{ inputs, yazi, hyprpaper, home-manager, config, sops-nix, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.username} = import ./home.nix;
    sharedModules = [
      sops-nix.homeManagerModules.sops
    ];
    extraSpecialArgs = { inherit inputs yazi hyprpaper sops-nix; };
  };
  users.users.${config.username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
