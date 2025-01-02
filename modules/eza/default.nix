{ pkgs, config, ... }:
let configDir = "${config.homeDirectory}/.config/eza";
in
{
  programs.eza = {
    enable = true;
    package = pkgs.eza;
    colors = "always";
    enableZshIntegration = true;
    git = true;
    icons = "always";
  };
  home = {
    sessionVariables = {
      EZA_CONFIG_DIR = configDir;
    };
    file."${configDir}/theme.yml".source = ./theme.yml;
  };
}
