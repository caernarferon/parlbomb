{
  imports = [
    ./core/bootloader.nix
    ./core/default.nix

    ./hardware/graphics.nix
    ./hardware/nvidia.nix
    ./networking/avahi.nix
    ./networking/default.nix
    ./networking/tailscale.nix
    ./services/pipewire.nix
    ./services/location.nix
    ./programs
  ];

  services.fwupd.enable = true;
}
