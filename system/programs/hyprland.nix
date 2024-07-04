{inputs, pkgs, ...}: {
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # enable hyprland and required options
  programs.hyprland = {
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    enable = true;
  };
}
