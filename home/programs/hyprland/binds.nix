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
    settings = {
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
          "$mod, L, exec, hyprlock"
          "$mod, O, togglefloating"
          "$mod, V, exec, alacritty --class clipse -e 'clipse'"
          "$mod SHIFT, F, fullscreen,1"
          "ALT, TAB, cyclenext"
          "$mod, P, pin"
          "$mod, left, movewindow,l"
          "$mod, right, movewindow,r"

          # programs
          "$mod, E, exec, nautilus"
          "$mod, N, exec, alacritty"
          "$mod, SPACE, exec, anyrun"
          #special workspaces
          "$mod, grave, togglespecialworkspace, discord"
          "$mod, TAB, togglespecialworkspace, spotify"
          "$mod, M, togglespecialworkspace, dropdown"
          # screenshotting
          "$mod, S, exec, grimblast copysave area"
          #volume
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioMute,exec, swayosd-client --output-volume mute-toggle "
          ",XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
          "SUPERSHIFT, A, hyprexpo:expo,toggle"
          #clipboard =
          #"$mod, V,
        ]
        ++ workspaces;
      binde = [
        ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ];
    };
  };
}
