{ lib, config, ... }:
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
  };
}
