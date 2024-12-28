{ config, ... }:
{
  defaultValues = {
    username = "deadbeaf";
    homeDirectory = "/home/${config.username}";
    git = {
      email = "0xdeadbeaf@tutamail.com";
      username = "0hDEADBEAF";
    };
  };
}
