{ inputs, pkgs, yazi, hyprpaper, home-manager, config, sops-nix, configModules, ... }:
{
  imports = configModules;
  programs.zsh.enable = true;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.username} = import ./home.nix;
    sharedModules = [
      sops-nix.homeManagerModules.sops
    ];
    extraSpecialArgs = { inherit inputs yazi sops-nix hyprpaper configModules; };
  };
  sops.secrets.hashed_user_password.neededForUsers = true;
  users.users.${config.username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets.hashed_user_password.path;
  };
}
