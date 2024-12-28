{ lib, config, ... }:
{
  imports = [
    ./configurations/default.nix
  ];

  options = {
    defaultValues = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };

    username = lib.mkOption {
      type = lib.types.str;
      description = "Your username";
      default = config.defaultValues.username;
    };
    hostname = lib.mkOption {
      type = lib.types.str;
      description = "Your hostname";
      default = config.defaultValues.hostname;
    };
    homeDirectory = lib.mkOption {
      type = lib.types.str;
      description = "Your home directory path";
      default = config.defaultValues.homeDirectory;
    };
    
    # Git options
    git = {
      email = lib.mkOption {
        type = lib.types.str;
        description = "Your Git email";
        default = config.defaultValues.git.email;
      };
      username = lib.mkOption {
        type = lib.types.str;
        description = "Your Git username";
        default = config.defaultValues.git.username;
      };
    };

    videoDrivers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "List of video drivers to install.";
      default = config.defaultValues.videoDrivers;
    };
  };
}
