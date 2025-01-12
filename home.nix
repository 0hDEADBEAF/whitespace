{ lib, pkgs, config, inputs, yazi, hyprpaper, configModules, ... }:
{
  imports = [
    ./modules/hyprland
    ./modules/waybar
    ./modules/rofi
    ./modules/swaync
    ./modules/sops
    ./modules/git
    ./modules/kitty
    ./modules/zsh
    ./modules/eza
    ./modules/btop
    ./modules/fd
    ./modules/zoxide
    ./modules/bibata
    ./modules/neovim
  ] ++ configModules;

  home = {
    username = config.username;
    homeDirectory = config.homeDirectory;
    packages = with pkgs; [
      git
      zip
      unzip
      xz
      jq
      ripgrep
      fzf
      aria2
      which
      wget
      curl
      iotop
      iftop
      hyprpaper
      yazi.packages.${pkgs.system}.default
      cmus
      cava
      ffmpeg 
      p7zip
      poppler
      imagemagick
      wl-clipboard
      file
      bat
      sops
      age 
      gnupg

      # Hyprland prerequisites
      networkmanagerapplet
      waybar
      polkit
      zathura
      blueman    
      hyprpaper.packages.${pkgs.system}.default
      grim
      slurp
      libnotify
      swaylock
      wireplumber
      brightnessctl
      playerctl

      # Personal apps
      firefox-devedition
      mpv
    ];

    file = {
      "${config.homeDirectory}/Images/lock.jpg".source = lib.mkForce ./images/lock.jpg;
      "${config.homeDirectory}/Images/wallpaper.png".source = lib.mkForce ./images/wallpaper.png;
      "${config.homeDirectory}/.config/scripts/memory_usage.sh".source = lib.mkForce ./scripts/memory_usage.sh;
      "${config.homeDirectory}/.config/scripts/power.sh".source = lib.mkForce ./scripts/power.sh;
      "${config.homeDirectory}/.config/rofi/powermenu.rasi".source = lib.mkForce ./modules/rofi/powermenu.rasi;
    };
    stateVersion = "25.05";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };

  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      ipc = true;
      splash = false;
      preload = [ "~/Images/wallpaper.png" ];
      wallpaper = [ ",~/Images/wallpaper.png" ];
    };
  };

  programs.home-manager.enable = true;
}
