{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/sops
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    networkmanager = {
      enable = true;
      ensureProfiles = {
        environmentFiles = [
          "${config.sops.secrets."wireless.conf".path}"
        ];
        profiles = builtins.listToAttrs (map (network_name: {
          name = network_name;
          value = {
            connection = {
              id = network_name;
              type = "wifi";
              interface-name = "wlp2s0";
            };
            wifi = {
              ssid = "$" + "${network_name}_ssid";
            };
            wifi-security = {
              auth-alg = "open";
              key-mgmt = "$" + "${network_name}_key_mgmt";
              psk = "$" + "${network_name}_password";
            };
          };  
        }) config.networks);
      };
    };
    hostName = config.hostname;
  };
  
  programs = {
    nm-applet.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
      enableSSHSupport = true;
    };
  };
  
  time.timeZone = config.localization.timeZone;

  i18n = {
    defaultLocale = "${config.localization.defaultLocale}.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "${config.localization.extraLocale}.UTF-8";
      LC_IDENTIFICATION = "${config.localization.extraLocale}.UTF-8";
      LC_MEASUREMENT = "${config.localization.extraLocale}.UTF-8";
      LC_MONETARY = "${config.localization.extraLocale}.UTF-8";
      LC_NAME = "${config.localization.extraLocale}.UTF-8";
      LC_NUMERIC = "${config.localization.extraLocale}.UTF-8";
      LC_PAPER = "${config.localization.extraLocale}.UTF-8";
      LC_TELEPHONE = "${config.localization.extraLocale}.UTF-8";
      LC_TIME = "${config.localization.extraLocale}.UTF-8";
    };
  };

  services = {
    xserver = {
      xkb = {
        layout = config.hardware.keyboardLayout;
        variant = "";
      };
      videoDrivers = config.videoDrivers;
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    pcscd.enable = true;
  };

  console.keyMap = config.hardware.keyboardLayout;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [
      btop
    ];
    pathsToLink = [
      "/share/zsh"
    ];
  };

  security = {
    rtkit.enable = true;
    wrappers.btop = {
      owner = "root";
      group = "root";
      capabilities = "cap_perfmon+ep";
      source = "${pkgs.btop}/bin/btop";
    };
  };

  hardware = {
    bluetooth.enable = true;
    graphics.enable = true;
  };

  system.stateVersion = "25.05";
}
