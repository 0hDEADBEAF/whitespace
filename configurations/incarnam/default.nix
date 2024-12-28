{ config, ... }:
{
  config.defaultValues = {
    hostname = "incarnam";
    videoDrivers = [ "modsetting" ];
  };
}
