{
  imports = [
    ./core

    ./hardware/graphics.nix
    # ./hardware/nvidia.nix
    ./hardware/bluetooth.nix
    ./networking/avahi.nix
    ./networking/default.nix
    ./networking/tailscale.nix
    ./networking/syncthing.nix
    ./services
    ./services/pipewire.nix
    ./services/location.nix
    ./services/printing.nix
    ./programs
  ];

  services.fwupd.enable = true;
}
