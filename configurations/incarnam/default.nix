{ config, ... }:
{
  config = {
    hostname = "incarnam";
    videoDrivers = [ "modsetting" ];
    git.signingKey = "C2671CD8BA3B9B3C";
   };
}
