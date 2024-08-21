{pkgs, ...}: {
  boot = {
    extraModprobeConfig = ''
      options iwlwifi 11n_disable=8
    '';
    kernelParams = [
      "nvidia-drm.fbdev=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
    supportedFilesystems = ["ntfs"];
    loader = {
      systemd-boot.enable = false;
      efi.efiSysMountPoint = "/boot";
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
      };
    };
  };
}
