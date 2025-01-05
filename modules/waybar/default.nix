{ config, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''${builtins.readFile ./style.css}'';
    settings = [{
      layer = "top";
      height = 28;
      spacing = 5;
      margin-top = 5;
      margin-right = 8;
      margin-left = 8;
      modules-left = [
        "custom/rofi"
        "sway/workspaces"
        "sway/window"
        "hyprland/workspaces"
        "tray"
        "hyprland/window"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "disk"
        "cpu"
        "temperature"
        "backlight"
        "custom/memory"
        "pulseaudio"
        "battery"
      ];
      
      # Modules
      "custom/rofi" = {
        format = "<span></span>";
        on-click = "rofi -show drun -disable-history -show-icons";
        escape = true;
        tooltip = false;
      };
      "sway/workspaces" = {
        disable-scroll = true;
        active-only = false;
        all-outputs = true;
        warp-on-scroll = false;
        format = "{icon}";
        format-icons = {
          "1" = "<span >󰧨</span>";
          "2" = "<span >󰈹</span>";
          "3" = "<span ></span>";
          "4" = "<span ></span>";
          "5" = "<span ></span>";
          "6" = "<span >󰭛</span>";
          "7" = "<span >󱓷</span>";
          "8" = "<span >󰚀</span>";
        };
      };
      "sway/window" = {
        format = "<span color='#202020' bgcolor='#d3869b' > 󰣆 </span> {app_id}";
        separate-outputs = true;
        icon = false;
      };
      "hyprland/workspaces" = {
        disable-scroll = true;
        active-only = false;
        all-outputs = true;
        warp-on-scroll = false;
        format = "{icon}";
        format-icons = {
          "1" = "<span >󰧨</span>";
          "2" = "<span >󰈹</span>";
          "3" = "<span ></span>";
          "4" = "<span ></span>";
          "5" = "<span ></span>";
          "6" = "<span >󰭛</span>";
          "7" = "<span >󱓷</span>";
          "8" = "<span >󰚀</span>";
        };
      };
      "hyprland/window" = {
        format = "<span color='#202020' bgcolor='#d3869b' > 󰣆 </span> {class}";
        separate-outputs = true;
        icon = false;
      };
      tray = {
        icon-size = 15;
        spacing = 8;
      };
      disk = {
        format = "<span color='#202020' bgcolor='#ea6962' >  </span> {free}";
        interval = 20;
      };
      cpu = {
        format = "<span color='#202020' bgcolor='#e78a4e' >  </span> {usage}%";
        tooltip = false;
        interval = 1;
      };
      temperature = {
        tooltip = false;
        thermal-zone = 2;
        hwmon-path = config.hardware.temperatureInputPath;
        critical_threshold = 70;
        format = "<span color='#202020' bgcolor='#d8a657' >  </span> {temperatureC}°C";
        format-critical = "<span color='#202020' bgcolor='#cc241d' >  </span> {temperatureC}°C";
      };
      backlight = {
        format = "<span color='#202020' bgcolor='#f6c657' > 󰞏 </span> {percent}%";
        tooltip = false;
      };
      "custom/memory" = {
        exec = "${config.homeDirectory}/.config/scripts/memory_usage.sh";
        interval = 2;
        return-type = "json";
        format = "<span color='#202020' bgcolor='#458588' >  </span> {}";
      };
      pulseaudio = {
        format = "<span color='#202020' bgcolor='#83a598' >  </span> {volume}%";
        format-muted = "<span color='#202020' bgcolor='#ea6962' >  </span> {volume}%";
        format-bluetooth = "<span color='#202020' bgcolor='#83a598' > 󰂰 </span> {volume}%";
        format-bluetooth-muted = "<span color='#202020' bgcolor='#ea6962' > 󰂲 </span> {volume}%";
        format-source = "{volume}% ";
        on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        tooltip = false;
        max-volume = 130;
      };
      battery = {
        interval = 1;
        states = {
          good = 99;
          warning = 30;
          critical = 20;
        };
        format-icons = ["󰂎" "󰁺" "󰁻" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        format = "<span color='#202020' bgcolor='#689d6a' > {icon} </span> {capacity}%";
        format-critical = "<span color='#202020' bgcolor='#cc241d' > {icon} </span> {capacity}%!!";
        format-warning = "<span color='#202020' bgcolor='#e78a4e' > {icon} </span> {capacity}%";
        format-full = "<span color='#202020' bgcolor='#689d6a' > {icon} </span> {capacity}%";
        format-charging = "<span color='#202020' bgcolor='#689d6a' > 󰂅 </span> {capacity}%";
        format-charging-warning = "<span color='#202020' bgcolor='#e78a4e' > 󰢝 </span> {capacity}%";
        format-charging-critical = "<span color='#202020' bgcolor='#cc241d' > 󰢜 </span> {capacity}%";
        format-plugged = "<span color='#202020' bgcolor='#689d6a' > 󰂅 </span> {capacity}%";
        format-alt = "<span color='#202020' bgcolor='#689d6a' > 󱧥 </span> {time}";
        tooltip = false;
      };
      clock = {
        format = "<span color='#202020' bgcolor='#8ec07c' >  </span> {:%a %d %b %H:%M:%S}";
        tooltip = false;
        interval = 1;
      };
    }];
  };
}
