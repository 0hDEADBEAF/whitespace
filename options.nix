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
    username = lib.mkOption {
      type = lib.types.str;
      description = "Your username";
      default = "cat";
    };
    hostname = lib.mkOption {
      type = lib.types.str;
      description = "Your hostname";
      default = "catland";
    };
    homeDirectory = lib.mkOption {
      type = lib.types.str;
      description = "Your home directory path";
      default = "/home/${config.username}";
    };
    
    # Git options
    git = {
      email = lib.mkOption {
        type = lib.types.str;
        description = "Your Git email";
        default = "";
      };
      username = lib.mkOption {
        type = lib.types.str;
        description = "Your Git username";
        default = "";
      };
      signingKey = lib.mkOption {
        type = lib.types.str;
        description = "Your signing key for commit authentification";
        default = "";
      };
    };

    videoDrivers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "List of video drivers to install.";
      default = [];
    };
    
    hardware = {
      monitors = lib.mkOption {
        type = lib.types.listOf MonitorConfiguration;
        description = "Description of your monitors configuration";
        default = [];
        apply = value:
          let primaryDisplays = lib.filter (monitor: monitor.primaryDisplay) value;
          in
          if builtins.length value == 0 then
            throw "You must configure at least one monitor."
          else if builtins.length primaryDisplays != 1 then
            throw "You must have one and only one primary display."
          else
           value;
      };
      temperatureInputPath = lib.mkOption {
        type = lib.types.str;
        description = "Path to 'temp1_input' file corresponding for the temperature for your computer";
        default = "/sys/class/hwmon/hwmon1/temp1_input";
      };
    };
  };
}
