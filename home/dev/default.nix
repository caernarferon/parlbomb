{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains.pycharm-professional
    jetbrains.rust-rover
  ];
}
