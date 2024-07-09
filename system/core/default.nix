{lib, ...}: {
  imports = [
    ./security.nix
    ./users.nix
    ../nix
  ];
  programs.zsh.enable = true;
  documentation.dev.enable = true;

  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";
  # don't touch this
  system.stateVersion = lib.mkDefault "23.11";

  # compresses half the ram for use as swap
  zramSwap.enable = true;
}
