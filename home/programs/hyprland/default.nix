{
  inputs,
  pkgs,
  ...
}: {
  imports = [
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
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
    systemd = {
      enable = true;
    };
  };
  home.packages = with pkgs; [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    #inputs.self.packages.${pkgs.system}.wl-ocr
  ];
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
