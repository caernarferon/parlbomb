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
    font = let
      torus-font = inputs.self.packages.${pkgs.system}.torus {};
    in {
      name = "TorusPro";
      package = torus-font;
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
  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;
}
