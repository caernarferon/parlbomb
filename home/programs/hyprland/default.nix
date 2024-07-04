{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./env.nix
    ./binds.nix
    ./execonce.nix
    ./rules.nix
    ./settings.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
    systemd = {
      enable = true;
    };
  };
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
