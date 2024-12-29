{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/Hyprpaper";
    yazi.url = "github:sxyazi/yazi";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, yazi, hyprpaper, sops-nix, ...}@inputs: {
    nixosConfigurations = 
      let
        inherit (nixpkgs.lib) genAttrs nixosSystem;
        subentries = builtins.readDir ./configurations;
        sublist = builtins.attrNames subentries;
        hostnames = builtins.filter (el: builtins.match "directory" subentries.${el} != null) sublist;
      in
      genAttrs hostnames (
        hostname:
        nixosSystem {
          system = "x86_64-linux";
          specialArgs = { 
            inherit self inputs sops-nix hyprpaper yazi;
            configModules = [
              ./options.nix
              ./configurations
              ./configurations/${hostname}
            ];
          };
          modules = [
            ./configuration.nix
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              imports = [ ./home-manager.nix ];
            }
          ];
        }
      );
  };
}
