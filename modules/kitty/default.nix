{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      # Fonts
      font_family = "JetBrainsMono Nerd Font Mono";
      bold_font = "JetBrainsMono Nerd Font Mono ExtraBold";
      italic_font = "JetBrainsMono Nerd Font Mono Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Mono ExtraBold Italic";
      font_size = 16;
      force_ltr = "no";
      disable_ligatures = "never";
      font_features = "none";

      # Cursor
      cursor = "#665c54";
      cursor_text_color = "#bdae93";
      cursor_shape = "block";
      cursor_shape_unfocused = "hollow";
      cursor_blink_interval = 1;
      cursor_stop_blinking_after = 0;
      cursor_trail = 200; # I'm edgy so I like this kind of stuff :3
      cursor_trail_decay = "0.1 0.6";
      cursor_trail_start_threshold = 2;
      
      # Scrollback
      scrollback_lines = 10000; # Have you ever experienced C++ recursing templates error messages? :^)
      scrollback_indicator_opacity = 1.0;
      wheel_scroll_multiplier = 3.0;
      wheel_scroll_min_lines = 1;
      touch_scroll_multiplier = 3.0;

      # Mouse
      mouse_hide_wait = 3.0;
      url_color = "#0087bd";
      url_style = "curly";
      open_url_with = "default";
      detect_urls = "yes";
      show_hyperlink_targets = "no";
      underline_hyperlinks = "hover";
      copy_on_select = "no";
      strip_trailing_spaces = "never";
      click_interval = -1.0;
      focus_follows_mouse = "no";
      pointer_shape_when_grabbed = "arrow";
      default_pointer_shape = "beam";
      pointer_shape_when_dragging = "beam";

      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";

      # Terminal bell
      enable_audio_bell = "no";

      # Window
      window_border_width = "0pt";
      draw_minimal_borders = "yes";
      window_margin_width = 0;
      single_window_margin_width = -1;
      window_padding_width = 0;
      single_window_padding_width = -1;
      placement_strategy = "center";
      active_border_color = "#d79921";
      inactive_border_color = "#cccccc";
      inactive_text_alpha = 1.0;
      hide_window_decorations = "yes";
      window_logo_path = "none";
      resize_debounce_time = "0.1 0.5";
      confirm_os_window_close = 0;

      # Color scheme
      foreground = "#fff4d2";
      background = "#222222";
      background_opacity = 1.0;
      background_blur = 0;
      background_image = "none";
      selection_foreground = "#000000";
      selection_background = "#fffacd";
      
      color0  = "#1d2021"; # Normal black
      color8  = "#a89984"; # Bright black
      color1  = "#cc241d"; # Normal red
      color9  = "#fb4934"; # Bright red
      color2  = "#98971a"; # Normal green
      color10 = "#b8bb26"; # Bright green
      color3  = "#d79921"; # Normal yellow
      color11 = "#fabd2f"; # Bright yellow
      color4  = "#458588"; # Normal blue
      color12 = "#83a598"; # Bright blue
      color5  = "#b16286"; # Normal magenta
      color13 = "#d3869b"; # Bright magenta
      color6  = "#689d6a"; # Normal cyan
      color14 = "#8ec07c"; # Bright cyan
      color7  = "#a89984"; # Normal white
      color15 = "#fff4d2"; # Bright white
      
      mark1_foreground = "black";
      mark1_background = "cyan";
      mark2_foreground = "black";
      mark2_background = "yellow";
      mark3_foreground = "black";
      mark3_background = "magenta";

      # Advanced
      shell = ".";
      editor = ".";
      term = "xterm-256color";
    };
  };
}
