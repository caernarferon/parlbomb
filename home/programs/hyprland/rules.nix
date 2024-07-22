{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "float, class:^(imv)$"
      "workspace special:discord silent,class:^(WebCord)$"
      "workspace special:discord silent,class:^(discord)$"
      "workspace special:spotify silent,title:^(Spotify Free)$"
      "stayfocused, title:^()$,class:^(steam)$"
      "minsize 1 1, title:^()$,class:^(steam)$"
      "float,class:(clipse)" # ensure you have a floating window class set if you want this behaviour
      "size 622 652,class:(clipse)" # set the size of the window as necessary
    ];
    layerrule = let
      layers = "^(anyrun|gtk-layer-shell)$";
    in [
      "blur, ${layers}"
      "ignorealpha 0.2, ${layers}"
    ];
  };
}
