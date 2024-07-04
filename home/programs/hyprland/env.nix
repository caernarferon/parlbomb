{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKENV,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        #         "WLR_DRM_NO_ATOMIC,1"
      ];
    };
  };
}
