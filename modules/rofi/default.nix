{ config, pkgs, ... }:
let inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    cycle = true;
    location = "center";
    plugins = [ 
      pkgs.rofi-emoji
    ];
    theme = {
      "*" = {
        dark = mkLiteral "#0f0f0f";
        red = mkLiteral "#ea6962";
        red-alt = mkLiteral "#ca3433";
        orange = mkLiteral "#e78a4e";
        yellow = mkLiteral "#d8a657";
        blue = mkLiteral "#7daea3";
        green = mkLiteral "#a9a665";
        aqua = mkLiteral "#89b482";
        cream = mkLiteral "#d4be98";
        grey = mkLiteral "#504945";
        dark-grey = mkLiteral "#202020";
        transparent = mkLiteral "#00000000";
        highlight = mkLiteral "underline bold #ca3433";

        padding = 0;
        margin = 0;
        border = 0;
        border-radius = 0;
        spacing = 0;
        vertical-align = mkLiteral "0.5";

        text-color = mkLiteral "@orange";
        border-color = mkLiteral "@cream";
        background-color = mkLiteral "@transparent";

        font = "Roboto Condensed Bold 11";
      };
      configuration = {
        display-drun = " Apps ";
        display-run = " Cmd: ";
        display-window = " Win: ";
      };
      window = {
        width = mkLiteral "25%";
        location = mkLiteral "center";
        background-color = mkLiteral "@dark-grey";
        orientation = mkLiteral "horizontal";
      };
      mainbox = {
        children = map mkLiteral [ "inputbar" "message" "listview" ];
      };
      inputbar = {
        margin = mkLiteral "8px 8px 3px 8px";
        background-color = mkLiteral "@yellow";
        children = map mkLiteral [ "prompt" "entry" ];
      };
      prompt = {
        padding = mkLiteral "5px";
        margin = mkLiteral "2px";
        background-color = mkLiteral "@dark-grey";
        text-color = mkLiteral "@aqua";
        font = "Roboto Condensed Bold 13";
      };
      entry = {
        padding = mkLiteral "5px";
        margin = mkLiteral "2px";
        border-color = mkLiteral "@grey";
        background-color = mkLiteral "@dark-grey";
        text-color = mkLiteral "@red";
        font = "Roboto Condensed Bold 13";
      };
      listview = {
        lines = 10;
        padding = mkLiteral "8px";
        border = mkLiteral "2px";
        margin = mkLiteral "8px";
        background-color = mkLiteral "@dark-grey";
        children = map mkLiteral [ "element" ];
      };
      element = {
        padding = mkLiteral "2px";
      };
      element-text = {
        size = mkLiteral "1em";
        padding = mkLiteral "4px";
        margin = mkLiteral "0px";
        text-color = mkLiteral "inherit";
      };
      element-icon = {
        padding = mkLiteral "4px";
        margin = mkLiteral "1px";
        size = mkLiteral "1em";
      };
      "element selected" = {
        background-color = mkLiteral "@yellow";
        text-color = mkLiteral "@dark";
      };
      "element selected active" = {
        background-color = mkLiteral "@red-alt";
      };
      message = {
        expand = true;
        background-color = mkLiteral "@dark-grey";
        children = map mkLiteral [ "textbox" ];
      };
      textbox = {
        expand = true;
        padding = mkLiteral "3px";
        background-color = mkLiteral "@red-alt";
        text-color = mkLiteral "@dark-grey";
      };
      error-message = {
        expand = true;
        border = mkLiteral "2px";
        padding = mkLiteral "5px";
        background-color = mkLiteral "@dark-grey";
        text-color = mkLiteral "@dark";
      };
    };
  };
}
