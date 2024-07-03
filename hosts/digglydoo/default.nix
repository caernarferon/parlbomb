{
  pkgs,
  self,
  # inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  environment.systemPackages = with pkgs; [];
  services = {
  xserver.enable = true;
  desktopManager.plasma6.enable = true;
  displayManager.sddm = {
    enable = true;
  };
  };
  networking.hostName = "digglydoo";

  security.tpm2.enable = true;

  services = {
    fstrim.enable = true;
  };
}
