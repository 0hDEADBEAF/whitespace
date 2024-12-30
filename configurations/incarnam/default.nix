{ config, ... }:
{
  config = {
    hostname = "incarnam";
    videoDrivers = [ "modsetting" ];
    git.signingKey = "C2671CD8BA3B9B3C";
    hardware = {
      temperatureInputPath = "/sys/class/hwmon/hwmon4/temp1_input";
      monitors = [
        {
          name = "eDP-1";
          resolution = "preferred";
          position = "auto";
          scale = 1;
          primaryDisplay = true;
        }
      ];
    };
  };
}
