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
    ../../system/hardware/nvidia.nix
    ../../system/core/lanzaboote.nix
  ];
  environment.systemPackages = with pkgs; [];
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
    };
  };
  networking.hostName = "digglydoo";

  security.tpm2.enable = true;

  services = {
    fstrim.enable = true;
  };
}
