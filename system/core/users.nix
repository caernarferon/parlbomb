{pkgs, ...}: {
  users.users.parliamentbomber = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "input"
      "libvirtd"
      "networkmanager"
      "video"
      "wheel"
    ];
  };
}
