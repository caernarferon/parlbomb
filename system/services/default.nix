{pkgs, ...}: {
  services = {
    gnome.gnome-keyring = {
      enable = true;
    };
    dbus = {
      packages = with pkgs; [dconf gcr gnome.gnome-settings-daemon udisks2];
      implementation = "broker";
      enable = true;
    };
    irqbalance.enable = true;
    psd = {
      enable = true;
      resyncTimer = "10m";
    };
    gvfs.enable = true;
  };
}
