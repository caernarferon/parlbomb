{
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    dconf
    monaspace
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
  home.pointerCursor = {
    name = "macOS-Monterey";
    size = 22;
    package = pkgs.apple-cursor;
    gtk.enable = true;
  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    font = {
      name = "Inter";
      package = pkgs.google-fonts.override {fonts = ["Inter"];};
      size = 9;
    };
    theme = {
      name = "Graphite-pink-Dark";
      package = pkgs.graphite-gtk-theme.override {
        themeVariants = ["pink"];
        colorVariants = ["dark"];
        #sizeVariants = [ "compact" ];
        tweaks = [
          "normal"
          "rimless"
          "darker"
        ];
      };
    };
  };
}
