{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./xdg.nix
    ./qt.nix
    ./steam.nix
  ];

  programs = {
    dconf.enable = true;

    kdeconnect.enable = true;

    # seahorse.enable = true;
  };
}