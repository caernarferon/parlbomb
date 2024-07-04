{
  config,
  pkgs,
  inputs,
  ...
}: let
  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10} - stolen from fufexan
  workspaces = builtins.concatLists (builtins.genList
    (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, split-workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, split-movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  wayland.windowManager.hyprland = {
    settings = let
      terminal = "${pkgs.alacritty}/bin/alacritty";
      applauncher = "${inputs.walker.packages.${pkgs.system}.walker}/bin/walker";
      shadower = "${inputs.shadower.packages.${pkgs.system}.shadower}/bin/shadower";
      screenshot = "watershot -s | ${shadower} | wl-copy";
      guifilebrowser = "${pkgs.gnome.nautilus}/bin/nautilus";
    in {
      "$mod" = "SUPER";
      bindm = [
        "$mod,mouse:272,movewindow"
        "$mod,mouse:273,resizewindow"
      ];

      # wm commands
      bind = 
        [
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod, R, togglesplit"
          "$mod, P, pseudo"
          "$mod SHIFT, F, fullscreen,1"
          "ALT, TAB, cyclenext"
          "$mod, P, pin"
          # programs
          "$mod, E, exec, ${guifilebrowser}"
          "$mod, N, exec, ${terminal}"
          "$mod, SPACE, exec, ${applauncher}"
          #special workspaces
          "$mod, grave, togglespecialworkspace, discord"
          "$mod, TAB, togglespecialworkspace, spotify"
          "$mod, M, togglespecialworkspace, dropdown"
          # screenshotting
          "$mod, S, exec, ${screenshot}"
          #volume
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioMute,exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle "
          ",XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
          #"SUPERSHIFT, SPACE, overview:toggle"
          #clipboard =
          #"$mod, V,
        ]
        ++ workspaces;
      binde = [
        ",XF86AudioRaiseVolume, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume raise"
        ",XF86AudioLowerVolume, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume lower"
      ];
    };
  };
}
