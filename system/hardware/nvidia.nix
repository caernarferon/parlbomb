{pkgs, config, ...}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };
}
