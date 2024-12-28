{ ... }:
let terminal = "alacritty";
    fileManager = "yazi";
    browser = "firefox-devedition";
in
{
  wayland.windowManager.hyprland.settings = {
    # General
    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 1;
      "col.active_border" = "0xeed8a657";
      "col.inactive_border" = "0xee928374";
      resize_on_border = false;
      allow_tearing = false;
      layout = "master";
      no_focus_fallback = true;
    };
    master = {
      mfact = 0.50;
      new_on_top = true;
    };
    
    # Group settings
    group = {
      "col.border_active" = "0xeed8a657";
      "col.border_inactive" = "0xee928374";
      "col.border_locked_active" = "0xeeea6962";
      "col.border_locked_inactive" = "0xee444444";
      groupbar = {
        font_size = 10;
        enabled = true;
        height = 20;
        "col.active" = "0xeed8a657";
        "col.inactive" = "0xee444444";
        "col.locked_active" = "0xeeea6962";
        "col.locked_inactive" = "0xee444444";
        text_color = "0xeefff4d2";
      };
    };

    # Workspaces
    workspace = [
      "1, monitor:eDP-1"
      "2, monitor:eDP-1"
      "3, monitor:eDP-1"
      "4, monitor:eDP-1"
      "5, monitor:eDP-1"
      "6, monitor:eDP-1"
      "7, monitor:eDP-1"
      "8, monitor:eDP-1"
    ];

    # Decoration
    decoration = {
      rounding = 5;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      shadow = {
        enabled = false;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
      blur = {
        enabled = false;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };

    # Animations
    animations = {
      enabled = true;
      first_launch_animation = true;
      bezier = "custom, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 3, custom"
        "windowsIn, 1, 2, default, slide top 1%"
        "windowsOut, 1, 3, default, slide top 100%"
        "windowsMove, 1, 3, default, slide"
        "border, 1, 3, default"
        "borderangle, 1, 3, default"
        "fade, 1, 3, default"
        "workspaces, 1, 3, default, slidevert"
      ];
    };

    misc = {
      new_window_takes_over_fullscreen = 2;
    };

    # Monitors
    monitor = "eDP-1, preferred, auto, 1";

    # Autostart
    exec-once = [
      "nm-applet &"
    ];
   # Environment variables
    env = [
      "XCURSOR_SIZE, 24"
      "HYPRCURSOR_SIZE, 24"
      "QT_QPA_PLATFORM, wayland"
      "QT_QPA_PLATFORMTHEME, gtk3"
    ];

    # Keybindings   
    "$mod" = "SUPER";
    bind = [
      # Apps
      "$mod, Return, exec, ${terminal}"
      "$mod, o, exec, zathura"
      "$mod, e, exec, alacritty -e ${fileManager}"
      "$mod, u, exec, swaync-client -t"
      "$mod, b, exec, blueman-manager"
      "$mod, f, exec, ${browser}"
      
      # Rofi
      "$mod, d, exec, rofi -show drun -disable-history -show-icons"
      "$mod, i, exec, rofi -modi emoji -show emoji"
      "$mod, r, exec, rofi -show run -disable-history -show-icons"
      "$mod, w, exec, rofi -show window -show-icons"
      
      # Screenshots
      ", PRINT, exec, grim ~/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S.png') && notify-send -e \"   Screenshot taken   \""
      "$mod, PRINT, exec, grim -g \"$(slurp)\" ~/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S.png') && notify-send -e \"   Screenshot taken   \""
      "SHIFT, PRINT, exec, grim - | wl-copy && notify-send -e \"   Screenshot copied to clipboard   \""
      "$mod SHIFT, PRINT, exec, grim -g \"$(slurp)\" - | wl-copy && notify-send -e \"   Screenshot copied to clipboard   \""

      # Shortcuts
      "$mod SHIFT, q, killactive,"
      "$mod SHIFT, x, exec, ~/.config/scripts/power.sh"
      "$mod, Space, togglefloating,"
      "$mod, m, fullscreen,"
      "$mod, l, exec, swaylock -i ~/images/lock.jpg"
      
      # Move focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Swap windows
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"
      
      # Resize windows
      "$mod Control_L, left, resizeactive, -30 0"
      "$mod Control_L, right, resizeactive, 30 0"
      "$mod Control_L, up, resizeactive, 0 -30"
      "$mod Control_L, down, resizeactive, 0 30"

      # Group layout
      "$mod, q, togglegroup"
      "$mod, n, lockactivegroup, toggle"
      "$mod SHIFT, b, changegroupactive, b"
      "$mod SHIFT, n, changegroupactive, f"
      "Control_L SHIFT, left, moveintogroup, l"
      "Control_L SHIFT, right, moveintogroup, r"
      "Control_L SHIFT, up, moveintogroup, u"
      "Control_L SHIFT, down, moveintogroup, d"
      "Control_L ALT, left, moveoutofgroup, l"
      "Control_L ALT, right, moveoutofgroup, r"
      "Control_L ALT, up, moveoutofgroup, u"
      "Control_L ALT, down, moveoutofgroup, d"

      # Workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"

      "$mod SHIFT, 1, movetoworkspacesilent, 1"
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"
      "$mod SHIFT, 6, movetoworkspacesilent, 6"
      "$mod SHIFT, 7, movetoworkspacesilent, 7"
      "$mod SHIFT, 8, movetoworkspacesilent, 8"
      
      "$mod, Tab, workspace, e+1"
      "$mod SHIFT, Tab, workspace, e-1"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bindel = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
    ];

    # Input
    input = {
      kb_layout = "fr";
      follow_mouse = 2;
      sensitivity = 0;
      touchpad = {
        natural_scroll = false;
      };
    };
    gestures = {
      workspace_swipe = false;
    };
    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };

    # Window rules
    windowrulev2 = [
      "float, class:(Diplay), title:^(pass:)(.*)$"
      "center, floating:1, class:(Display), title:^(pass:)(.*)$"
      "workspace 1, class:^(Alacritty)$"
      "workspace 2, class:^(${browser})$"
      "workspace 4, class:^(mpv)$"
      "workspace 5, class:^(discord)$"
      "workspace 7, class:^(org.pwmt.zathura)$"
      "workspace 8, class:^(blueman-manager)$"
      "workspace 8, class:^(org.pulseaudio.pavucontrol)$"
    ];
  };
}
