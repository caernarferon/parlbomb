{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [font-manager];
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      lexend
      torus
      ipafont
      source-code-pro

      #inputs.self.packages.${pkgs.system}.torus-pro

      (nerdfonts.override {fonts = ["Meslo"];})
    ];
    fontconfig = {
      enable = true;
      cache32Bit = true;
      hinting.enable = true;
      antialias = true;
      defaultFonts = {
        monospace = ["Meslo LG M Regular Nerd Font Complete Mono"];
        serif = ["Torus Pro"];
        sansSerif = ["Torus Pro"];
      };
    };
  };
}
