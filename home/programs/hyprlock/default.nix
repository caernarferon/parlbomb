{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 2;
      };

      background = {
        color = "rgb(1C1430)";
        # blur_passes = 2;
        brightness = 0.5;
      };
      label = {
        text = "$TIME";
        color = "rgba(222, 222, 222, 1.0)";
        font_size = 50;
        font_family = "Torus Pro";
        position = "0, 50";
        halign = "center";
        valign = "center";
      };
      input-field = {
        size = "50, 50";
        dots_size = 0.33;
        dots_spacing = 0.15;
        outer_color = "rgba(25, 20, 20, 0)";
        inner_color = "rgba(25, 20, 20, 0)";
        font_color = "rgba(222, 222, 222, 1.0)";
        placeholder_text = "wqdcywqdmcgwqgdymcqw";
        hide_input = false;
        fail_color = "rgba(255, 0, 0, 1.0)";
        capslock_color = "rgba(0, 255, 255, 1.0)";
        halign = "center";
        fade_on_empty = false;
        valign = "center";
        position = "0,-50";
      };
    };
  };
}
