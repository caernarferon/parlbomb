{pkgs, ...}: {
  services.ratbagd.enable = true;
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
    settings = {
      General = {
        Class = "0x000100";
        FastConnectable = true;
        JustWorksRepairing = "always";
        Privacy = "device";
        Experimental = true;
      };
    };
  };

  systemd.user.services.telephony_client.enable = false;
}
