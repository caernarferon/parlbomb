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
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
    };
  };
  networking.hostName = "rigamortus";

  security.tpm2.enable = true;

  services = {
    fstrim.enable = true;
  };
}
