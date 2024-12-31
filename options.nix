{ lib, config, ... }:
  with lib;  
  let MonitorConfiguration = types.submodule {
    options = {
      name = mkOption {
        type = types.str;
        description = "Name of the monitor (as used by Hyprland)";
        default = "DP-1";
      };
      resolution = mkOption {
        type = types.str;
        description = "Resolution (as used by Hyprland)";
        default = "preferred";
      };
      position = mkOption {
        type = types.str;
        description = "Offset from the top left corner (as used by Hyprland)";
        default = "auto";
      };
      scale = mkOption {
        type = types.int;
        description = "Scale factor (as used by Hyprland)";
        default = 1;
      };
      primaryDisplay = mkOption {
        type = types.bool;
        description = "Specifies whether the monitor should be used as the primary display";
        default = false;
      };
    };
  };
in
{
  options = {
    username = mkOption {
      type = types.str;
      description = "Your username";
      default = "cat";
    };
    hostname = mkOption {
      type = types.str;
      description = "Your hostname";
      default = "catland";
    };
    homeDirectory = mkOption {
      type = types.str;
      description = "Your home directory path";
      default = "/home/${config.username}";
    };
    
    # Git options
    git = {
      email = mkOption {
        type = types.str;
        description = "Your Git email";
      };
      username = mkOption {
        type = types.str;
        description = "Your Git username";
      };
      signingKey = mkOption {
        type = types.str;
        description = "Your signing key for commit authentification";
      };
    };

    localization = {
      timeZone = mkOption {
        type = types.str;
        description = "Time zone for clock";
      };
      defaultLocale = mkOption {
        type = types.str;
        description = "The default locale";
        default = "en_US";
      };
      extraLocale = mkOption {
        type = types.str;
        description = "Extra locale set for LC_ADDRESS, LC_IDENTIFICATION, LC_MEASUREMENT, LC_MONETARY, LC_NAME, LC_NUMERIC, LC_PAPER, LC_TELEPHONE and LC_TIME";
        default = "en_US";
      };
    };

    videoDrivers = mkOption {
      type = types.listOf types.str;
      description = "List of video drivers to install.";
      default = [];
    };

    networks = mkOption {
      type = types.listOf types.str;
      description = "List of the different networks configured in the secret 'wireless.conf'";
      default = [];
    };
    
    hardware = {
      monitors = mkOption {
        type = types.listOf MonitorConfiguration;
        description = "Description of your monitors configuration";
        default = [];
        apply = value:
          let primaryDisplays = filter (monitor: monitor.primaryDisplay) value;
          in
          if builtins.length value == 0 then
            throw "You must configure at least one monitor."
          else if builtins.length primaryDisplays != 1 then
            throw "You must have one and only one primary display."
          else
           value;
      };
      temperatureInputPath = mkOption {
        type = types.str;
        description = "Path to 'temp1_input' file corresponding for the temperature for your computer";
        default = "/sys/class/hwmon/hwmon1/temp1_input";
      };
      keyboardLayout = mkOption {
        type = types.str;
        description = "Keyboard layout";
        default = "en";
      };
    };
  };
}
