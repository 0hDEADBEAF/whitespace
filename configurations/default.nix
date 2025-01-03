{ config, lib, ... }:
{
  config = {
    username = "deadbeaf";
    homeDirectory = "/home/${config.username}";
    git = {
      email = "0xdeadbeaf@tutamail.com";
      username = "0hDEADBEAF";
    };
    localization = {
      timeZone = "Europe/Paris";
      defaultLocale = "en_US";
      extraLocale = "fr_FR";
    };
    networks = [
      "tmp_royan"
      "my_phone_share"
      "home"
    ];
    hardware = {
      keyboardLayout = "fr";
    };
  };
}
