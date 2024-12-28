{ config, lib, pkgs, inputs, yazi, hyprpaper, ... }:
{
  imports = [
    ./options.nix

    ./modules/hyprland
    ./modules/waybar
    ./modules/rofi
    ./modules/swaync
    ./modules/sops
    ./modules/git
  ];

  home.username = config.username;
  home.homeDirectory = config.homeDirectory;

  home.packages = with pkgs; [
    git
    zip
    unzip
    xz
    fzf
    jq
    ripgrep
    fd
    btop
    aria2
    which
    wget
    curl
    iotop
    iftop
    hyprpaper
    yazi.packages.${pkgs.system}.default
    eza
    cmus
    cava
    zoxide
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
    alacritty
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

    # Fonts
    roboto
  ];  

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
      preload = [ "~/images/wallpaper.png" ];
      wallpaper = [ ",~/images/wallpaper.png" ];
    };
  };

  home.file."${config.homeDirectory}/.config/alacritty/alacritty.toml".source = lib.mkForce ./modules/alacritty/alacritty.toml;
  home.file."${config.homeDirectory}/images/lock.jpg".source = lib.mkForce ./images/lock.jpg;
  home.file."${config.homeDirectory}/images/wallpaper.png".source = lib.mkForce ./images/wallpaper.png;
  home.file."${config.homeDirectory}/.config/scripts/memory_usage.sh".source = lib.mkForce ./scripts/memory_usage.sh;
  home.file."${config.homeDirectory}/.config/scripts/power.sh".source = lib.mkForce ./scripts/power.sh;
  home.file."${config.homeDirectory}/.config/rofi/powermenu.rasi".source = lib.mkForce ./modules/rofi/powermenu.rasi;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
